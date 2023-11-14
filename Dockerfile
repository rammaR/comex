# Use the official Ruby image from the Docker Hub
FROM ruby

# Install dependencies for PostgreSQL and other system libraries
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev nodejs \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Create a volume for the gem directory
#VOLUME /usr/local/bundle

# Copy the Gemfile and Gemfile.lock into the image
COPY Gemfile* ./

# Install dependencies using bundler
RUN bundle install

# Copy the rest of the application code into the image
COPY . .

# Expose port 3000 to the outside world (adjust as needed)
EXPOSE 3000

# Command to run the application
CMD ["rails", "s", "-b", "0.0.0.0"]
