FROM alpine:3.2

ENV BUILD_PACKAGES ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-bundler

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

#copy everything from left to right and make right dir
ADD /usr/src/app /app

#switch to dir
WORKDIR /app

COPY . /app
RUN bundle install --without development test

#run any commands in braces
ENTRYPOINT ["ruby", "execute_template_with_ids.rb"]
