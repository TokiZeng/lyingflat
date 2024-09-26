 #!/usr/bin/env bash

 # Execute this file to install the ftm cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%FTM-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/FTM-Qt.app/Contents/MacOS/ftmd /usr/local/bin/ftmd
 sudo ln -s ${LOCATION}/FTM-Qt.app/Contents/MacOS/ftm-cli /usr/local/bin/ftm-cli
