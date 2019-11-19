# PRIVATE CLASS
# NOT TO BE INVOKED DIRECTLY
class bind::zone inherits ::bind {

 $zones.each |$name, $keys| {
  #notify { "hallo ${keys['type']}": } 
  if $keys['type'] == 'master' {
    file { "/etc/bind/db.${name}.conf":
      ensure => file,
      source => "puppet:///modules/bind/db.${name}.conf",
      owner  => 'root',
      group  => 'bind',
      notify => Service['bind9']
    }
  }
 }


 file { '/etc/bind/named.conf.local':
  content => template('bind/named.conf.local.erb'),
  owner   => 'root',
  group   => 'bind',
  notify  => Service['bind9']
 }


 #$zones.each |$name, $keys| {
 # notify{ "Test ${name}[0]": }
 #}

}
