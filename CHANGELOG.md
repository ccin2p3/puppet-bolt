# Changelog

## Release 0.2.0

**Features**

* Simplify GSS-API patch based on Josh Cooper suggestion. No need to specify the `auth_methods` if you specify `PreferredAuthentications` in your ssh_config file.

**Bug fix**

* Fixes a double match in the patch script. `awk` was matching the `USER INSTALLATION DIRECTORY` line also.

## Release 0.1.0

**Features**

* Install ̀`bolt`
* Execute (if requested) a dirty hack to enable SSH GSS-API authentication scheme

**Known Issues**

* This module is intented to be **temporary**. We're waiting for [this bolt issue](https://tickets.puppetlabs.com/browse/BOLT-168) to evolve and we'll drop this module
