FROM elixir:latest

RUN apt-get update && \
    apt-get upgrade -yq && \
    apt-get install -yq postgresql-client

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force
RUN mix deps.get
RUN mix do compile
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

