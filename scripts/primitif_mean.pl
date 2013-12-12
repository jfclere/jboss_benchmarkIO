#!/usr/bin/perl

use POSIX;

# all delay values
$T = 0;
$max = 0;
$min = 3000;

while(<STDIN>)
{
	# split the input into X rows
	@A = split " ", $_;
	# compute the delay: time of completion - time of issuance
	$B = $A[3] - $A[1];
	# delay in milliseconds
	$C = $B / 1000000;
	# round the delay to milliseconds
	$D = ceil($C);
        $T = $T + $D;
        $max = $D if $max < $D;
        $min = $D if $min > $D;
	# increase the total number of packets
	$i++;
}

$mean = $T / $i;
print "item: $i max: $max min: $min total: $T mean: $mean ";
