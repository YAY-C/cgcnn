#!/home/calvino/.local/bin/gnuplot
# set term svg enhanced
# set output 'lc.svg'

set key outside right
set key reverse Left
set key width 6

set multiplot layout 2,1
set xlabel 'Training set size'
set ylabel 'MAE, eV'
set logscale x
set logscale y
set grid y
f(x)=0.28
g(x)=0.22
h(x)=0.237
siz=20393
set xrange [:1.5E4]
set ytics 2

plot './lc.dat' u ($1*siz):2 w l ls 3 dashtype 2 ti 'Train', \
	'' u ($1*siz):3 w l ls -1 ti 'Validation' ,\
	''u ($1*siz):4 w lp ls 1 pt 7 ti 'Test'


set boxwidth 1.0
set style data histogram
set style histogram cluster gap 2.5
set style fill solid border -1

unset logscale

set ylabel 'Time, hour'
set xrange [-0.5:5]
set yrange [:6]
set grid y

plot './timing.dat' using 2:xtic(1)  ls 2 ti 'QMOF (20K)'
pause -1 
