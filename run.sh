#!/bin/bash
##############################################################################
# Copyright (c) 2016-2017 HUAWEI TECHNOLOGIES CO.,LTD and others.
#
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################
set -ex
COMPASS_DIR=${BASH_SOURCE[0]%/*}

rm -rf  /opt/kargo_k8s
git clone https://github.com/kubernetes-incubator/kubespray.git /opt/kargo_k8s

cd /opt/kargo_k8s
git checkout v2.2.1

# bugfix: https://github.com/kubernetes-incubator/kubespray/pull/1727
git format-patch -1 dae9f6d3 --stdout | git apply
# support etcd on arm64
git apply /root/etcd-arm64.patch
# thunderx is way too slow...
git apply /root/thunderx1.patch
# fix docker package
git apply /root/docker-pkg.patch

pip uninstall  ansible -y

pip install ansible==2.3.1.0

# create /opt/compass/bin/switch_virtualenv.py
mkdir -p /opt/compass/bin
touch /opt/compass/bin/switch_virtualenv.py
