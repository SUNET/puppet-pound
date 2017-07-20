# = Class: pound::debian
# Special debian class - inherits from pound::base
#
# You should not include this class - please refer to Class["pound"]
#
class pound::debian inherits pound::base {

  if $::operatingsystem == 'Ubuntu' and (versioncmp($::operatingsystemrelease, '12.04') == 0 or versioncmp($::operatingsystemrelease, '14.04') == 0) {
     apt::ppa {'ppa:unleashedtech/pound-2.7': }
  }

  Service['pound'] {
    pattern => '/usr/sbin/pound',
    restart => '/etc/init.d/pound restart',
    hasrestart => true
  }

}
