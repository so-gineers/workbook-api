# The ruby version is dynamically set with docker build args. In order to use it that way
# to define the base ruby version, it has to precede the FROM clause !
ARG RUBY_VERSION

FROM ruby:$RUBY_VERSION

# The below list of arguments needs to be positionned after the FROM
# statement, if not they will be ignored and docker build will fail.
ARG PG_CLI_VERSION
ARG BUNDLER_VERSION

LABEL version="1.0.0"

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=20 \
  BUNDLE_RETRY=3 \
  BUNDLE_PATH=/opt/workbook/gems \
  RAILS_ROOT=/opt/workbook/workbook

RUN groupadd -r worbooker -g 1000 && \
    useradd -u 1000 -r -g worbooker -s /sbin/nologin -c "Workbook user" worbooker \
    && apt-get update --no-install-recommends -qq  \
    && apt-get install -y postgresql-client=$PG_CLI_VERSION cmake --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && echo "gem: --no-ri --no-rdoc --no-document" > ~/.gemrc \
    && gem install bundler:$BUNDLER_VERSION

WORKDIR $RAILS_ROOT 

COPY ./CommonGemfile \
     ./Gemfile \
     ./Gemfile.lock \
     ./NextGemfile \
     ./NextGemfile.lock $RAILS_ROOT

RUN bundle update --bundler \
    && bundle check || bundle install --verbose --full-index \
    && gem cleanup all \
    && bundle clean 

COPY . $RAILS_ROOT 

EXPOSE 3000

ENV PATH="/opt/workbook/workbook/entrypoints:${PATH}"
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle exec rails server -b 0.0.0.0 -p 3000"]
