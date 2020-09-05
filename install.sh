#!/bin/sh -l

INSTALL_SHELL=https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh
mkdir -p $HOME/bin && curl -sfL $INSTALL_SHELL| sh -s -- -b $HOME/bin
echo ::add-path::$HOME/bin
echo ::add-path::$(go env GOPATH)/bin # for Go projects
