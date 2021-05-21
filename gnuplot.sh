set terminal png
set output "graph1.png"
set xlabel "steps"
set ylabel "E"
set xrange [1:7]
set yrange [-70:30]
plot "res1.txt" with lines