# Build Jekyll
FROM jekyll/jekyll:4.2.2 AS jekyll-build

WORKDIR /website

COPY ./src /website

RUN chmod 777 /website

RUN bundle install

RUN jekyll build --future

# Serve with nginx
FROM nginx

COPY --from=jekyll-build /website/_site /etc/nginx/html