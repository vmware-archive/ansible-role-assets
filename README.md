# ansible-role-assets

Ansible playbook to automate downloading assets (OVAs, ISOs, zips, or
any file, really).  This role is used as part of the
[Chaperone](https://github.com/vmware/chaperone) project to download
installation media one time only, but can be used in others by
overriding the role variables appropriately.

Urls of assets are downloaded once and saved to a local file.  The
asset will not be downloaded again unless the sha1 checksum changes or
the file is lost.

## Requirements

- downloads_dir that is creatable and writable by the ansible_ssh_user
- A valid dict of assets


## Role Variables

```yaml
# True to download, False to skip downloading all assets (default)
download_files: False

# The directory into which to place the downloaded assets.
downloads_dir: /var/www/html/downloads

# The timeout on downloads before giving up.
downloads_timeout: 10

# validate certificates of the remote server?
assetes_validate_certs: True|False

# a dict of assets to download
# The keys of assets are what we will name the file downloaded from url.
# Checksum is the sha1 sum of the asset.
# Url is a valid, reachable url to the asset.
assets:
  google-image.png:
    description: google image
    checksum: 26f471f6ebe3b11557506f6ae96156e0a3852e5b
    url: https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png
  index.html:
    description: "descriptive use only, not mandatory"
    checksum: "3af37af6ebe3b11557506f6ae96156e0a381211e"
    url: "http://some.url/to/a/file"

# or an example for no assets
assets: {}

```
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
