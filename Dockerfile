FROM ruby:2.2.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app
RUN bundle install
RUN gem build *.gemspec && gem install *.gem --no-document
RUN mkdir -p /opt/resource && \
    ln -s $(which bdr_check) /opt/resource/check && \
    ln -s $(which bdr_in) /opt/resource/in && \
    cp out /opt/resource/out && \
    chmod a+x /opt/resource/out
