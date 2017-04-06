#!/bin/bash
# Copyright © 2017 VMware, Inc. All Rights Reserved.

set -e

for test in tests/*playbook.yml ; do
    echo $test
    MOLECULE_PLAYBOOK=$test molecule test
done
