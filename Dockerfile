# Use ruby image to build our own image
FROM ruby:2.7
# We specify everything will happen within the /app folder inside the container
WORKDIR /app
# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./
# We install all the dependencies
RUN bundle install
# We copy all the files from our current application to the /app container
COPY . .
# We expose the port
EXPOSE 3000
# Start the main process.
RUN apt-get update && apt-get install sudo nodejs -y
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN apt-get update && apt-get install sudo nodejs yarn -y
RUN yarn install
RUN rails db:migrate RAILS_ENV=development
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
