# Use an Ubuntu base image
FROM ubuntu:latest

# Update package lists
RUN apt-get update

RUN apt-get install -y wget

RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
    dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb && \
    rm libssl1.1_1.1.0g-2ubuntu4_amd64.deb 

#jdk version is important !!!
RUN apt-get update && apt-get install -y openjdk-11-jdk \
                       libarchive-tools \
                       maven \
                       git \
                       build-essential \
                       libcurl4

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

# Install srcML
RUN wget http://131.123.42.38/lmcrs/v1.0.0/srcml_1.0.0-1_ubuntu20.04.deb && \
    dpkg -i srcml_1.0.0-1_ubuntu20.04.deb && \
    rm srcml_1.0.0-1_ubuntu20.04.deb

# Install sliceML
RUN wget http://www.sdml.cs.kent.edu/lmcrs/srcSlice/srcslice-ubuntu-14.04.tar.gz && \
    tar -xzf srcslice-ubuntu-14.04.tar.gz && \
    rm srcslice-ubuntu-14.04.tar.gz

# Set the working directory
WORKDIR /app

# Copy the program files from the host machine to the Docker container
COPY sample.java ./

# Generate AST for Java file with srcML
RUN srcml sample.java -o sample.xml --position

# Create slices for Java file with srcSlice
RUN ../srcslice-ubuntu-14 sample.xml >> java_slices_directory.txt

# Setting up the benchmarking project
RUN mvn archetype:generate \
    -DinteractiveMode=false \
    -DarchetypeGroupId=org.openjdk.jmh \
    -DarchetypeArtifactId=jmh-java-benchmark-archetype \
    -DgroupId=test \
    -DartifactId=benchmark \
    -Dversion=1.0

# Change directory to the generated project
WORKDIR /app/benchmark

# Build the benchmarks
RUN mvn clean install

# Run JMH benchmarks
CMD ["java", "-jar", "target/benchmarks.jar", "-rf", "json"]
