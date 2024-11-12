$(awk -F, 'NR>1 {if ($8 == 0) print $1" "$5}' heart.csv | sort -k1 > temp.txt)

cat<<EOF > 'q4-c.p'
set terminal pdf
set output 'q4-c.pdf'

set title 'Age vs Cholesterol'
set xlabel 'Age'
set ylabel 'Cholesterol'
set style data linespoints

plot 'temp.txt' using 1:2 title 'No Heart Disease' lc rgb 'blue'
EOF

gnuplot 'q4-c.p'

rm 'temp.txt' 'q4-c.p'
