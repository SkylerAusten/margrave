# Use a Racket base image
FROM racket/racket:8.18-full AS build

# Copy the Racket application code into the container
COPY app.rkt /app/

# Set the working directory inside the container
WORKDIR /app

RUN raco pkg install --auto --scope installation web-server

# Expose the port the Racket app listens on
EXPOSE 8000

# Command to run the Racket application
CMD ["racket", "app.rkt"]