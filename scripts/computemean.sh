for t in `ls 1500-*-1000000-*.com | sed 's/^1500-//g' | sed 's/-.*$//g' | sort | uniq`
do
  echo "Processing 1500-${t}-1000000-*.com"
  # beginning
  X=`cat 1500-${t}-1000000-*.com| sort -n -k 2 | tail -1 | awk '{ print $2 }'`
  # end
  Y=`cat 1500-${t}-1000000-*.com| sort -n -k 2 | head -1 | awk '{ print $2 }'`
  # duration in nanoseconds
  Z=`expr $X - $Y`
  # duration in seconds
  T=`perl -le "print $Z/1000000000"`
  # total number of pkts
  PKTS=`wc -l 1500-${t}-1000000-*.com | grep total | awk '{ print $1 }'`
  # load in pkts/s
  FREQ=`perl -le "print $PKTS/$T"`

  cat 1500-${t}-1000000-*.com | ./primitif_mean.pl
  echo "request: ${FREQ}"
  # > 1500-$t-1000000.dat
done
