for t in `ls 1500-*-1000000-*.com | sed 's/^1500-//g' | sed 's/-.*$//g' | sort | uniq`
do
  #echo "Processing 1500-${t}-1000000-*.com"
  cat 1500-${t}-1000000-*.com | ./primitif_mean.pl
done
