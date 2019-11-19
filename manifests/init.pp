# BIND9 class, created because no suitable and up-to-date version for BIND could be found on the forge.
# This class can be used by simply including it in Hiera
# example:
# ---
# classes:
#  - bind
#
# Currently the module is only tested for Debian 9.
class bind ( 
 $dnssecvalidation = hiera(bind::dnssecvalidation, 'auto'),
 $allowrecursion   = hiera(bind::allowrecursion, ['localhost', ]),
 $zones            = hiera(bind::zones, {}),
 $axfrdefault	   = hiera(bind::axfrdefault, false),
){

 contain bind::install
 contain bind::service
 contain bind::config
 contain bind::zone

 Class['bind::install']
 -> Class['bind::config']
 -> Class['bind::zone']
 -> Class['bind::service']
}
