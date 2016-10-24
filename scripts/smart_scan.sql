select
    decode(name,
            'cell physical IO bytes saved by storage index',
            'SI Savings',
            'cell physical IO interconnect bytes returned by smart scan',
            'Smart Scan'
            ) as stat_name,
            value/1024/1024 as stat_value
        from v$mystat s, v$statname n
        where
            s.statistic# = n.statistic#
        and
            n.name in (
                    'cell physical IO bytes saved by storage index',
                    'cell physical IO interconnect bytes returned by smart scan'
                    )
/
