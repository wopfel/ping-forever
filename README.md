ping-forever
============

Pings some hosts in a loop and gives only information when the state changes

The traditional ping command is a great tool, but maybe sometimes you only want
to be informed when the state of a host changes. For this specific purpose,
you can use this script.

This script pings several hosts and prints information when 
a host is reachable that was not reachable before
and when a host is not reachable that was reachable before.
There is no output if the states didn't change compared to the previous ping.

This perl script uses Net::Ping.

For Windows, you have to run with elevated administrative rights.
Otherwise, you will see following error message: `icmp socket error`.

Example output:
> Checking 3 hosts.
> Ping succeeded for host 192.168.2.111
> Ping succeeded for host 192.168.2.105
> Ping failed for host 192.168.2.105
> Ping succeeded for host 192.168.2.105
> Ping failed for host 192.168.2.111
> Ping succeeded for host 192.168.2.111
