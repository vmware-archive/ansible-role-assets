# ansible-role-assets

Ansible playbook to automate downloading VMware assets (OVAs, et al) for use
in installing products. Generally this role is used as part of the
[Chaperone](https://github.com/vmware/chaperone) project, but can be used
in others by overriding the role variables appropriately.

## Requirements

A valid site (or sites) from which to download the binary build assets.

## Role Variables

```yaml
# Whether to download the files (can take a very long time).
download_files: False

# The directory into which to place the downloaded assets.
downloads_dir: /var/www/html/downloads

# The timeout on downloads before giving up.
downloads_timeout: 10
```

In addition, see defaults/main.yml for a list of the various assets
because they are not listed above (there are many).

## Example playbook

```yaml
---
- hosts: apache_servers
  sudo: True
  roles:
    - assets
  vars_files:
    - vars/assets.yml
```

# License and Copyright
 
Copyright 2015 VMware, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

