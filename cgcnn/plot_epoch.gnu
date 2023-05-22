#!/home/calvino/.local/bin/gnuplot

set title 'Validation set'
set xlabel 'Epochs'
set ylabel 'MAE'
set xrange [0:300] 
f(x)=0.28
g(x)=0.22
h(x)=0.237

plot './epochs.dat' u 1:2 w lp ls 3 pt 6 ti 'current state', \
	f(x) w l ls -1 ti 'Original paper', \
	g(x) w l lt 1 dt 2 lc 'red' ti 'Best reported' ,\
	h(x) w l lt 1 lc 'red' ti 'Our Final Best'

pause -1 
