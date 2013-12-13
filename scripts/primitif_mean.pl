#!/usr/bin/perl

use POSIX;

# all delay values
$T = 0;
$max = 0;
$min = 3000;
$fist = 0;
$last = 0;

# all delay values
@numbers;

while(<STDIN>)
{
	# split the input into X rows
	@A = split " ", $_;
	# compute the delay: time of completion - time of issuance
	$B = $A[3] - $A[1];
	# delay in milliseconds
	$C = $B / 1000000;
        if ($first == 0) {
          $first = $A[1];
        }
        $first = $A[1] if $first > $A[1];
        $last = $A[1] if $last < $A[1];
	# round the delay to milliseconds
	$D = ceil($C);
        $T = $T + $D;
        $max = $D if $max < $D;
        $min = $D if $min > $D;
        # store it for standard-deviation
        $numbers[$i] = $D;
	# increase the total number of packets
	$i++;
}

$mean = $T / $i;

$sum = 0;
# calculate standard deviation:
for($j = 1; $j < $i; $j++) {
  $S = $numbers[$j] - $mean;
  $sum = $sum + ($S * $S);
}
$std = sqrt($sum / $i);

# duration in nanoseconds
$Z = $last - $first;
# duration in seconds
$Time = $Z / 1000000000;
$FREQ = $i / $Time;

#print "item: $i max: $max min: $min total: $T mean: $mean std: $std request: $FREQ \n";

print "$FREQ $mean $std $std\n";
