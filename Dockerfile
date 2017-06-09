FROM elixir:onbuild
MAINTAINER Peter Hastie <phastie@bleacherreport.com>
ADD . /app
RUN mix local.hex --force
WORKDIR /app
EXPOSE 4000
CMD ["mix", "phoenix.server"]

