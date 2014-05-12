################################################################
#
#  Copyright (C) 2014 Bernd Arnold
#  https://github.com/wopfel/ping-forever
#
#  Pings some hosts forever, but gives information only about changes
#
#  See file LICENSE for license information
#
################################################################


use strict;
use Net::Ping;

my @hosts = qw/ 192.168.2.111 192.168.2.105 192.168.2.222 /;
my %results;

print "ping-forever (C) 2014 Bernd Arnold - MIT license\n";
printf "Checking %d hosts.\n", scalar @hosts;

my $runloop = 1;
my $p = Net::Ping->new( "icmp" );

while ( $runloop ) {

    for my $host ( @hosts ) {
        
        my $result = $p->ping( $host );
        
        if ( ! defined $results{$host}  or  $result != $results{$host} ) {
            print scalar localtime;
            print ": ";
            print "Ping ";
            print ( $result ? "succeeded "  :"failed " );
            print "for host $host";
            print "\n";
        }

        # Store result
        $results{$host} = $result;
        
    }

    # Wait 1 second
    sleep 1;

}
