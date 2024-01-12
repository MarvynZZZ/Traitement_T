#!/bin/bash

gcc -o trips_program trips_program.c

./trips_program < data.csv > output.txt

awk '{print $1, $3, $5}' output.txt > data.txt

echo 'set terminal png' > script.gp
echo 'set output "trips_histogram.png"' >> script.gp
echo 'set boxwidth 0.5' >> script.gp
echo 'set style fill solid' >> script.gp
echo 'set ytics 1' >> script.gp
echo 'set xlabel "Towns"' >> script.gp
echo 'set ylabel "Number of Trips"' >> script.gp
echo 'set title "Top 10 Towns with the Most Trips"' >> script.gp
echo 'plot "data.txt" using 2:xtic(1) title "Total Trips" with boxes, "" using 3 title "Depart Trips" with boxes' >> script.gp

gnuplot script.gp

rm output.txt data.txt script.gp trips_program
