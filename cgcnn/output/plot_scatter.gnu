#!/bin/gnuplot
set term qt

set ls 1 lc 'blue' pt 7 ps 0.5

unset xrange
unset yrange

f(x)=x

set title 'Fidelity plot'
set xlabel 'DFT values'
set xrange [0:6]
set yrange [0:6]
set ylabel 'ML values'

plot './test_results.csv' u 2:3 w p ls 1 ti 'Test Set' ,\
	f(x) w l lt -1 lw 3 noti

pause -1
