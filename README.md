# Just-in-time Performance Analysis

This program currently is able to create a docker instance capable of 
executing benchmarks using Java Microbenchmarking Harness. 

#### Software requirements : 
- [Docker installation](https://docs.docker.com/engine/install/)
- *Only if you are on a Windows device* : [Bash](https://gitforwindows.org/)

#### Changing the script paths :
The following paths are included by default, but should be change to reflect your own : 


```docker cp $container_id:/app/java_slices_directory.txt /YOUR/PATH/java_slices_directory.txt```

```docker cp $container_id:/app/benchmark/jmh-result.json /YOUR/PATH/jmh-result.json```



### To run the program :
1. Give permissions to execute the bash script : ```chmod +x run_benchmarks.sh```

2. Run the script : ```./run_benchmarks.sh ```

