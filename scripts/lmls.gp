# set terminal pslatex -> latex + psfile
set term pslatex color

# output goes to lmls.tex
set output "lmls.tex"

# y axis is logarithmic
set logscale y
# xrange from 0 to 3800 reqs/s
set xrange [0:8000]
# xlabel 
set xlabel "rate [req/s]"
# ylabel
set ylabel "delay [ms]"

# set legend in a left-top box, symbol is on the left, try to estimate the width of the text, adjust the width by 1 
set key box left reverse Left width 1

# tics on the x-axis from 0 to 8000 spaced by 500
set xtics 0,1000,8000 nomirror

# plot "datasource"
# using -> columns yerrorlines accept 4 columns x:y:-error:+error, so we plot x:y:y-std dev:y+std dev 
# ti -> title in the legend box
# ps -> point size
# lw -> linewidth
# lc -> line color, we use rgb "#RRGGBB"
# with -> style of a line, it accepts dots, points, linespoints, yerrorbars, xyerrorbars, etc.

plot "undertow.dat" using 1:2:($2-$3):($2+$4) ti "undertow" ps 1.5 lw 7 lc rgb "#000000" with yerrorlines, "ngnix.dat" using 1:2:($2-$3):($2+$4) ti "ngnix" ps 1.5 lw 7 lc rgb "#900000" with yerrorlines, "httpd.dat" using 1:2:($2-$3):($2+$4)  ti "htttpd" ps 1.5 lw 7 lc rgb "#000090" with yerrorlines;


