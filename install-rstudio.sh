#!/bin/bash
THIS_VERSION="1.0"

R_VERSION=4.0.3
RSTUDIO_VERSION=1.3.1093
R=/opt/R/${R_VERSION}/bin/R

SUDO=
if [[ $(id -u) != "0" ]]; then
  SUDO=sudo
fi

${SUDO} yum update
${SUDO} ARCH=$( /bin/arch )
${SUDO} subscription-manager repos --enable "codeready-builder-for-rhel-8-${ARCH}-rpms"
${SUDO} wget https://download2.rstudio.org/server/centos8/x86_64/rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm
${SUDO} yum install rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm
