FROM ruby:2.6.5

ENV LANG C.UTF-8
ENV APP_HOME /rails_app

RUN apt-get update -qq && apt-get install -y build-essential nodejs 

# もしyarnでエラーが発生した場合
# RUN apt-get update -qq && apt-get install -y curl && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update && apt-get install -y yarn

ENV ENTRYKIT_VERSION 0.4.0
RUN wget https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VERSION}/entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
&& tar -xvzf entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
&& rm entrykit_${ENTRYKIT_VERSION}_Linux_x86_64.tgz \
&& mv entrykit /bin/entrykit \
&& chmod +x /bin/entrykit \
&& entrykit --symlink

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY ./Gemfile $APP_HOME/Gemfile
COPY ./Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install
COPY . $APP_HOME

ENTRYPOINT ["prehook", "bundle install", "--"]

EXPOSE  3000

# author: hosoda
