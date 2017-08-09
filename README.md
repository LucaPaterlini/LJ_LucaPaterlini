## Test Usage

```
 python3 weather_test.py
```

## Description

Python 3 function to retrive
the summary of the weather forecast
of a City.

## Extra

weather.so is a module comiled with cython
this is a small example on how easy could be
it usage to convert python code to c code to 
improve the performances.

to install it
```
 sudo pip install cython3
```
to compile the code run
```
 python3 setup.py build_ext --inplace
```
In this specific case due to dependancy to the
latency of the net,the improvements are minimum
but, in functions that are affected by large computations, 
the improvement can easily be perceived.