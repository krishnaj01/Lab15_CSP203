set terminal pdf
set output 'q4-b.pdf'

set title 'Age vs Blood Pressure'
set xlabel 'Age'
set ylabel 'Blood Pressure'
set style data points
set key box
set datafile separator ','

plot 'heart.csv' using 1:4 title 'Age vs Blood Pressure' lc rgb 'red'
