#
class bolt(
  String $package_name = 'bolt',
  String $package_ensure = 'latest',
  String $package_provider = 'gem',
  String $hack_script_path = '/var/tmp/hack_bolt_script.sh',
  Array[String] $bolt_ssh_auth_methods = ['gssapi-with-mic', 'publickey', 'password', 'keyboard-interactive'],
  Boolean $hack_bolt_to_allow_ssh_gssapi = false
)
{
  package { $package_name:
    ensure   => $package_ensure,
    provider => $package_provider
  }

  if ($hack_bolt_to_allow_ssh_gssapi == true) {
    package { 'net-ssh-krb':
      ensure   => 'latest',
      provider => 'gem'
    }

    file { $hack_script_path:
      ensure  => file,
      owner   => 'root',
      group   => '0',
      mode    => '0700',
      content => template("${module_name}/bolt_support_gssapi_hack.erb")
    }

    ->

    exec { "hack bolt to add ssh gss-api support":
      command      => $hack_script_path,
      refreshonly  => true,
      subscribe    => Package[$package_name]
    }
  }
  
}

# vim: tabstop=2 shiftwidth=2 softtabstop=2

