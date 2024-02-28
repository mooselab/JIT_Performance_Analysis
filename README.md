## Run the following bash command to automatically execute all the commands below :
```./run_benchmarks.sh ```

## Building the docker image:

```docker build --platform linux/amd64 -t [YOUR_IMG_NAME] ```

If you do not include the ```platform linux/amd64``` you may have issues if your architecture differs from the packages.


## Running a container from the image:
```docker run -it --rm [YOUR_IMG_NAME]```

