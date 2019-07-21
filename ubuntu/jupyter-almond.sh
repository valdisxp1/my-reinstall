#! /bin/sh
# FROM https://jupyter.readthedocs.io/en/latest/install.html
pip3 install --upgrade pip &&
pip3 install jupyter
# FROM https://almond.sh/docs/quick-start-install (modified)
SCALA_VERSION=2.12.8 ALMOND_VERSION=0.6.0
curl -Lo /tmp/coursier https://git.io/coursier-cli &&
chmod +x /tmp/coursier &&
/tmp/coursier bootstrap \
    -r jitpack \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    -o /tmp/almond-install &&
/tmp/almond-install --install
# @cleanup
rm /tmp/coursier /tmp/almond-install
# @test
