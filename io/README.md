# Benchmarks (and Tests) for I/O   (Just Input for Reading, Really)


Simple input reader benchmarks.
Use

    $ ruby ./io/benchmark.rb

to run.


```
n = 10_000

                                 user     system      total        real
line (each_line):            5.375000   6.141000  11.516000 ( 11.522474)
line (each_line+chomp!):     4.375000   6.109000  10.484000 ( 10.496063)
line (each_line+scanner):   13.984000   5.656000  19.640000 ( 19.644859)
line (each_line+each_char): 43.188000   8.141000  51.329000 ( 51.325110)
line (parse+getch):        116.921000   7.312000 124.233000 (124.293261)
line (parse+gets+slice):   188.032000   8.500000 196.532000 (196.711467)
line (parse+gets+pos):     141.375000  13.485000 154.860000 (154.922206)
line (parse+nobuf):         63.718000   7.047000  70.765000 ( 70.774960)
line (parse+getch+num):    127.750000   8.156000 135.906000 (136.168328)
line (parse+gets+scanner): 127.875000   8.140000 136.015000 (136.358474)
line (parse+gets+scanner*): 26.516000   7.375000  33.891000 ( 33.912854)
```


## Conclusion

And the winner is...  C.

Of course - nothing is faster than ye good old' C code  - building string (buffers)
in ruby is 10x to 100x times slower.
