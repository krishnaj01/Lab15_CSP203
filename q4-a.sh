read male female <<< $(awk -F, 'NR>1 {if ($8 == 1 && $2 == 1) male+=1; else if ($8 == 1 && $2 == 0) female+=1}  END {print male, female}' heart.csv)


cat<<EOF > 'temp.txt'
Female $female
Male $male
EOF

cat<<EOF > 'q4-a.p'
set terminal pdf
set output 'q4-a.pdf'

set title 'Sex vs Heart Disease'
set xlabel 'Sex'
set ylabel 'Number of People'
set style data histogram
set key out top box
set xtics ('Female' 0, 'Male' 1)
set style fill solid

plot 'temp.txt' using 2 title 'With Heart Disease' lc rgb 'red'
EOF

gnuplot 'q4-a.p'

rm 'temp.txt' 'q4-a.p'
