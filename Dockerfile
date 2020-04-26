FROM bitwalker/alpine-elixir-phoenix:latest

EXPOSE 8000

ADD . .

RUN mix do deps.get, deps.compile

ADD assets/package.json assets/
RUN cd assets && \
    npm install

RUN cd assets/ && \
    npm run deploy && \
    cd - && \
    mix do compile, phx.digest

USER root

ENTRYPOINT ["/opt/app/run.sh"]
