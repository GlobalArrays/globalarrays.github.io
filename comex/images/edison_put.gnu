#set data style lp
set  style data  lp
set xlabel "Message Size(Bytes)"
#set xtics rotate
#set xtics ("4" 4,"64" 64,"1K" 1024,"16K" 16384,"256K" 262144,"1M" 1048576, "4M" 4194304)
set xrange [16:1048576]
#set xtics ("4K" 4096,"16K" 16384,"64K" 65536,"256K" 262144,"1M" 1048576,"4M" 4194304)
#set xrange [4096:4194304]
set xtics ("16" 16,"64" 64,"256" 256,"1K" 1024,"4K" 4096,"16K" 16384,"64K" 65536,"256K" 262144)
#set xrange [16:262144]
#set yrange [0:8600]
set ylabel "Bandwidth (MB/s)"
set logscale x 2
set key left
#set terminal postscript eps enhanced monochrome dashed defaultplex "Helvetica" 28
set term postscript color eps enhanced dashed defaultplex "Helvetica" 28
#set term postscript eps defaultplex "Helvetica" 28

set title "DMAPP (Aries, Cray XC) Put Bandwidth"
set output 'edison_put.eps'
plot 'edison_perf_native.txt' index 0 using 1:($3) title "" lw 10 
