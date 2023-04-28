set terminal png tiny size 800,800
set output "/domus/h1/bonitavw/GenomeAnalysis/analysis/03_assembly_evaluation/mummerplot/mummerplot_output_canu.png"
set xtics rotate ( \
 "" 0 \
)
set ytics ( \
 "tig00000001" 1, \
 "tig00000002" 2762476, \
 "tig00000003" 2961858, \
 "tig00000004" 2984630, \
 "tig00000005" 2999364, \
 "tig00000006" 3039377, \
 "tig00000007" 3054390, \
 "tig00000008" 3070434, \
 "tig00000009" 3085862, \
 "tig00000012" 3110810, \
 "" 3115044 \
)
set size 1,1
set grid
unset key
set border 0
set tics scale 0
set xlabel "REF"
set ylabel "QRY"
set format "%.0f"
set mouse format "%.0f"
set mouse mouseformat "[%.0f, %.0f]"
set mouse clipboardformat "[%.0f, %.0f]"
set xrange [1:*]
set yrange [1:3115044]
set style line 1  lt 1 lw 3 pt 6 ps 1
set style line 2  lt 3 lw 3 pt 6 ps 1
set style line 3  lt 2 lw 3 pt 6 ps 1
plot \
 "/domus/h1/bonitavw/GenomeAnalysis/analysis/03_assembly_evaluation/mummerplot/mummerplot_output_canu.fplot" title "FWD" w lp ls 1, \
 "/domus/h1/bonitavw/GenomeAnalysis/analysis/03_assembly_evaluation/mummerplot/mummerplot_output_canu.rplot" title "REV" w lp ls 2
