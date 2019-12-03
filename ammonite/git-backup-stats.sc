import $ivy.`org.eclipse.jgit:org.eclipse.jgit:5.5.1.201910021850-r`,
org.eclipse.jgit.storage.file.FileRepositoryBuilder
import java.io.File
import collection.JavaConverters._
import scala.util.Try

class CheckedRepo(dir: File, bare: Boolean = false) {
  import CheckedRepo._
  val repo = {
    val builder = new FileRepositoryBuilder()
      .setGitDir(dir)
    if (bare) {
      builder.setBare()
    }
    builder.setMustExist(true).readEnvironment.findGitDir
    builder.build()
  }

  import org.eclipse.jgit.api._
  val git = new Git(repo)

  def toBackup: Seq[ResultItem] = {
    // working dir status
    val workingDirChanges = if (bare) {
      Nil
    } else {
      val status = git.status.call()
      val untracked = status.getUntracked.asScala
        .map(path => MissedFile(new File(repo.getWorkTree, path)))
        .toVector

      val changed = status.getUncommittedChanges.asScala
        .map(path => MissedFile(new File(repo.getWorkTree, path)))
        .toVector

      untracked ++ changed
    }

    //branch status
    val (remoteBranches, localBranches) = repo.getAllRefs.asScala.values
      .partition(_.getName.startsWith("refs/remotes/"))

    val backedupIds = remoteBranches.map(_.getObjectId).toSet
    val localById   = localBranches.groupBy(_.getObjectId)
    val missedBranches = localById
      .filterKeys(backedupIds.apply)
      .map {
        case (id, items) =>
          MissedBranch(dir, id.getName, items.map(_.getName).toSeq)
      }
    //TODO stash/shelf

    workingDirChanges ++ missedBranches
  }
}

object CheckedRepo {
  sealed trait ResultItem
  case class MissedFile(f: File) extends ResultItem
  case class MissedBranch(repoDir: File, sha1: String, names: Seq[String])
      extends ResultItem
}

val homeDir = new File("/home/valdis/")
val excludes = Set(
  new File(homeDir, ".cache"),
  new File(homeDir, ".sbt"),
  new File(homeDir, ".npm"),
  new File(homeDir, ".java"),
  new File(homeDir, ".gradle"),
  new File(homeDir, ".android"),
  new File(homeDir, ".coursier"),
  new File(homeDir, ".rustup"),
  new File(homeDir, ".multirust"),
  new File(homeDir, ".ssh"),
  new File(homeDir, ".steam"),
  new File(homeDir, ".m2"),
  new File(homeDir, ".ivy2"),
  new File(homeDir, ".ammonite"),
  new File(homeDir, ".idea-build"),
  new File(homeDir, ".gnome"),
  new File(homeDir, ".local"),
  new File(homeDir, ".config"),
  new File(homeDir, ".mozilla"),
  new File(homeDir, ".thunderbird"),
  new File(homeDir, "albiononline"),
  new File(homeDir, "snap"),
  new File(homeDir, "Downloads")
)

val excludedPrefixes = Seq(
  ".IdeaIC",
  "idea-IC-",
  ".gimp-"
)

def excluded(dir: File) =
  excludes(dir) || (
    dir.getParentFile == homeDir && excludedPrefixes.exists(
      dir.getName.startsWith)
  )

def check(dir: File): Seq[CheckedRepo.ResultItem] = {
  if (excluded(dir)) {
    Nil
  } else {
    Try(new CheckedRepo(dir, bare = true))
      .orElse(Try(new CheckedRepo(new File(dir, ".git"))))
      .map(_.toBackup)
      .getOrElse {
        println(s"looking into $dir")
        val filesAndDirs =
          Option(dir.listFiles()).fold[Seq[File]](Nil)(_.toSeq)
        val (dirs, files) = filesAndDirs.partition(_.isDirectory)
        files.map(CheckedRepo.MissedFile.apply) ++
          dirs.flatMap(check)
      }
  }
}

def bytesToHumanReadable(bytes: Long) = {
  if (bytes > 1024) {
    val kilobytes = bytes / 1024
    if (kilobytes > 1024) {
      val megabytes = kilobytes / 1024
      if (megabytes > 1024) {
        val gigabytes = megabytes / 1024.0
        s"$gigabytes GB"
      } else {
        s"$megabytes MB"
      }
    } else {
      s"$kilobytes KB"
    }
  } else {
    s"$bytes B"
  }
}

@scala.annotation.tailrec
def toHomeSubdir(file: File): File = {
  val parent = file.getParentFile
  if(parent == homeDir) {
    file
  } else {
    toHomeSubdir(parent)
  }
}

val toBackup = check(homeDir)
if (toBackup.isEmpty) {
  println("all backed up")
} else {
  println(toBackup.mkString("\n"))
  println("subdirs:")
  val subDirs = toBackup.map {
    case CheckedRepo.MissedFile(file) => toHomeSubdir(file)
    case CheckedRepo.MissedBranch(dir,_,_) => toHomeSubdir(dir)
  }.distinct
  println(subDirs.mkString("\n"))
  val totalSizeLowerBound = toBackup.collect {
    case CheckedRepo.MissedFile(file) => file.length()
  }.sum
  val humanReadable = bytesToHumanReadable(totalSizeLowerBound);
  println(s" total numbers of items to backup ${toBackup.size} size >= $humanReadable")
}
