# Benchmarks 

_Fast, Faster, Fasterer, Fastest_


Simple benchmarks.
Use 

    $ ruby ./benchmark.rb 

to run. Resulting in:


```
n = 1000

                   user     system      total        real
std:           2.391000   0.828000   3.219000 (  3.209641)
split:         0.578000   0.672000   1.250000 (  1.250251)
split(tab):    0.578000   0.672000   1.250000 (  1.264393)
split(table):  4.000000   0.703000   4.703000 (  4.696019)
reader:       26.391000   0.891000  27.282000 ( 27.585585)
reader(tab):   0.593000   0.687000   1.280000 (  1.273694)
```

