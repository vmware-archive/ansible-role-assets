# ansible-role-assets

[![Build Status](https://travis-ci.org/vmware/ansible-role-assets.svg?branch=master)](https://travis-ci.org/vmware/ansible-role-assets)

Ansible playbook to automate downloading file assets, and optionally
hosting them locally via http.

This role is used as part of the
[Chaperone](https://github.com/vmware/chaperone) project.

Urls of assets are downloaded once and saved to a local file.  The
asset will not be downloaded again unless the sha1 checksum changes or
the file is lost.

## Requirements

- downloads\_dir that is creatable and writable by the ansible\_ssh\_user
- A valid dict of assets
- if needing to host the assets via http, ensure ansible role jdauphant.nginx
  is available and set `assets_http_hosted` to True

## Role Variables

```yaml
# True to download, False to skip downloading all assets (default)
download_files: False


# The directory into which downloaded assets are placed.
downloads_dir: /var/www/html/downloads

# Timeout in seconds for URL request
downloads_timeout: 10

# False means SSL certificates will not be validated.
# This should only be used on personally controlled sites using self-signed certificates.
assets_validate_certs: True

# a dict of assets to download
# The keys of assets are what we will name the file downloaded from url.
# Checksum is the sha1 sum of the asset.
# Url is a valid, reachable url of the asset.
# Example:
#assets:
#  google-image.png:
#    description: google image
#    checksum: 26f471f6ebe3b11557506f6ae96156e0a3852e5b
#    url: https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png
#  index.html:
#    description: "descriptive use only, not mandatory"
#    checksum: "3af37af6ebe3b11557506f6ae96156e0a381211e"
#    url: "http://some.url/to/a/file"
assets: {}

# Boolean, should we raise a web server to host the assets for
# future download?
assets_http_hosted: False

# port to host the http server on
assets_http_port: 8484

```

## Example playbook


```yaml

---
- hosts: apache_servers
  sudo: True
  roles:
    - assets
  vars:
    download_files: True
    assets:
      Notice.txt:
        description: notice.txt
        checksum: e6b8bfe20303703e30acf9e67d012060
        url: "https://github.com/vmware/photon-controller/releases/download/v1.1.1/Notice.txt"
        validate_certs: False
      logo.png:
        description: google logo
        checksum: 80fa4bcab0351fdccb69c66fb55dcd00
        url: "https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"
        validate_certs: False
```

# License and Copyright

Copyright 2015-2017 VMware, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
