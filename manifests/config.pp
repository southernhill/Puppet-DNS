# PRIVATE CLASS
# NOT TO BE INVOKED DIRECTLY
class bind::config inherits ::bind{

 file{ '/etc/bind/named.conf.options':
   content => template('bind/named.conf.options.erb'),
   owner   => 'root',
   group   => 'bind',
   notify  => Service['bind9']
 }
}
