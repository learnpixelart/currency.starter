# CSV Reader (and Type Inference and Data Conversion) Benchmarks


_Fast, Faster, Fasterer, Fastest_


Simple benchmarks.
Use

    $ ruby ./benchmark.rb

to run.



**"Raw" Read Benchmark.**  Returns all strings - no type inference or data conversion (*).


```
n = 1000

                      user     system      total        real
std:              9.203000   0.469000   9.672000 ( 10.237637)
split:            1.797000   0.312000   2.109000 (  2.147582)
split(tab):       1.843000   0.266000   2.109000 (  2.195966)
split(table)*:    4.172000   0.141000   4.313000 (  4.312704)
split(table):     4.141000   0.296000   4.437000 (  4.456251)
reader:         100.047000   0.375000 100.422000 (100.625725)
reader(tab):      1.969000   0.204000   2.173000 (  2.161369)
reader(table)*:   5.578000   0.171000   5.749000 (  5.755868)
reader(table):    5.609000   0.282000   5.891000 (  5.905285)
reader(json):     5.922000   0.328000   6.250000 (  6.252215)
reader(yaml):   120.250000  54.485000 174.735000 (174.893803)

hippie:          13.906000   0.484000  14.390000 ( 14.434999)
wtf:             29.234000   0.250000  29.484000 ( 29.506184)
lenient:          5.391000   0.266000   5.657000 (  5.648916)
```



**Numerics Benchmark.**  Returns all numbers - simple type inference or data conversion(*) - it's all numbers - all the time (except for the header row).



```
n = 100
                      user     system      total        real
std:             20.781000   0.234000  21.015000 ( 21.039186)
split:            1.531000   0.063000   1.594000 (  1.582496)
split(table):     2.000000   0.015000   2.015000 (  2.016913)
reader:          63.500000   0.203000  63.703000 ( 63.691851)
reader(table):   37.407000   0.188000  37.595000 ( 37.601160)
reader(numeric): 40.421000   0.141000  40.562000 ( 40.595467)
reader(json):     1.125000   0.062000   1.187000 (  1.191145)
reader(yaml):    38.485000  15.672000  54.157000 ( 54.229705)
```


(*): Note: YAML and JSON - of course - always use YAML and JSON encoding (and data conversion) rules :-).




## Conclusion

And the winner is...


Of course - nothing is faster than "plain" `String#split` (with "simple csv", that is, no escape rules and edge cases):


``` ruby
def read_faster_csv( path, sep: ',' )
  recs = []
  File.open( path, 'r:utf-8' ) do |f|
     f.each_line do |line|
       line   = line.chomp( '' )
       values = line.split( sep )
       recs << values
     end
  end
  recs
end
```
