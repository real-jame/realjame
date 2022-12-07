# Build Jekyll
FROM jekyll/jekyll:4.2.2 AS jekyll-build

WORKDIR /website

RUN chmod 777 /website

RUN jekyll build

# Serve with nginx
FROM nginx:stable-alpine

COPY --from=jekyll-build /website/_site /usr/share/nginx/html