# PRIVATE CLASS
# NOT TO BE INVOKED DIRECTLY
class bind::service {
 service { 'bind9':
   ensure => 'running'
 }
}
