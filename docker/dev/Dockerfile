ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION

# The below list of arguments needs to be positionned after the FROM
# statement, if not they will be ignored and docker build will fail.
ARG PG_CLI_VERSION
ARG BUNDLER_VERSION

LABEL version="1.0.0"

RUN groupadd -r worbooker -g 1000 && \
    useradd -u 1000 -r -g worbooker -s /sbin/nologin -c "Workbook user" worbooker \
    && apt-get update --no-install-recommends -qq  \
    && apt-get install -y postgresql-client=$PG_CLI_VERSION --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3 \
  BUNDLE_PATH=/opt/gems \
  GEM_PATH=/opt/gems \
  GEM_HOME=/opt/gems

WORKDIR /opt/workbook

COPY CommonGemfile Gemfile Gemfile.lock /opt/workbook/

COPY entrypoints/* /usr/local/bin/

RUN chmod -R 755 /usr/local/bin/entrypoint.sh

WORKDIR /opt/workbook/

RUN echo "gem: --no-ri --no-rdoc --no-document" > ~/.gemrc \
    && gem install bundler:$BUNDLER_VERSION \
    && bundle install --verbose \
    && gem cleanup all

COPY . /opt/workbook

EXPOSE 3000

CMD [ "/bin/baash" ]
ENTRYPOINT ["entrypoint.sh"]
