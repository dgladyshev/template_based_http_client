FROM ubuntu:14.04

# Install Ruby dependencies
RUN apt-get update && apt-get install -y \
  ruby \
  ruby-dev \
  build-essential

RUN gem install json
RUN gem install rest-client

#copy everything from left to right and make right dir
ADD /usr/src/app /app

#switch to dir
WORKDIR /app

#run any commands in braces

ENTRYPOINT ["ruby", "execute_template_with_ids.rb"]