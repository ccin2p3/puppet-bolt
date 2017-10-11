# PuppetLabs bolt

## What this module do

Install puppetlabs bolt with ruby gems.

It also supports a hack that allows to use GSS-API with SSH in bolt.

This is currently required and the bug can be followed in [this issue](https://tickets.puppetlabs.com/browse/BOLT-168).

## Usage

### Install bolt without any hack

```puppet
include bolt
```

### Install bolt and activate the ugly SSH GSS-API hack

```puppet
class { '::bolt':
  hack_bolt_to_allow_ssh_gssapi => true
}
```

If you know what you're doing, you can also modify the `auth_methods` passed to `Net::SSH` like this:

```puppet
class { '::bolt':
  hack_bolt_to_allow_ssh_gssapi => true,
  bolt_ssh_auth_methods         => ['gssapi-with-mic', 'publickey', 'password', 'keyboard-interactive']
}
```

## Support / Limitations

This module is not intended to be supported on a long term. We know that this is an ugly hack and we plan to drop this module
as soon as we can.

You can still fill an issue or submit pull requests if you'd like to share !

## Contributor

* Remi Ferrand for IN2P3 Computing Centre, CNRS
