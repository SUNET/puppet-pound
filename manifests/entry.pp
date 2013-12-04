# Create an entry in the pound config
define pound::entry ($listen_ip,
    $listen_port,
    $listen_protocol,
    $head_require,
    $backend_ips,
    $backend_port,
    $server_cert = '/etc/ssl/private/ssl-cert-snakeoil.key',
    $ssl_ciphers = '',

    $session_type = 'IP',
    $session_ttl  = '300',
    $session_id   = '',
) {
    concat::fragment {
        "pound_entry-${name}" :
            target => '/etc/pound/pound.cfg',
            content => template('pound/entry.cfg.erb'),
            order => 30,
            notify  => Service['pound'],
    }
}
