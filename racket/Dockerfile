# Use a Racket base image
FROM racket/racket:8.18-full AS build

# Set environment variables for Java installation
ENV JAVA_HOME /opt/java/openjdk-8
ENV PATH $JAVA_HOME/bin:$PATH

# Install dependencies, download and install OpenJDK 8, and clean up
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    && mkdir -p /opt/java \
    && wget -qO- "https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u422-b05/OpenJDK8U-jdk_x64_linux_hotspot_8u422b05.tar.gz" | tar -zx -C /opt/java \
    && mv /opt/java/jdk8u422-b05 $JAVA_HOME \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the Racket application code into the container
COPY app.rkt /app/

# Set the working directory inside the container
WORKDIR /app

RUN raco pkg install --auto --scope installation web-server
RUN raco pkg install --auto margrave

# Expose the port the Racket app listens on
EXPOSE 8000

# Command to run the Racket application
CMD ["racket", "app.rkt"]