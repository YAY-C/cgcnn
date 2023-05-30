#!/home/calvino/.local/bin/gnuplot

set xlabel 'Epochs'
set ylabel 'MAE'
set xrange [0:160] 
f(x)=0.28
g(x)=0.22
h(x)=0.237

LIST='0.005 0.1 0.14 0.3 0.4'
plot for [p=0:5] word(LIST, p)."/epochs.dat" u 1:2 w lp ls p+5 pt 6 ti word(LIST, p), \
	f(x) w l ls -1 ti 'Original paper', \
	g(x) w l lt 1 dt 2 lc 'red' ti 'Best reported' ,\
	h(x) w l lt 1 lc 'red' ti 'Our Final Best'

pause -1 
