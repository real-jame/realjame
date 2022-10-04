# Build Jekyll blog
FROM jekyll/jekyll:4.2.2 AS jekyll-build

WORKDIR /blog

COPY ./jameblog /blog

# RUN bundle install
# RUN bundle update

# RUN chown -R $(whoami):$(whoami) /blog && \
# chmod +w /blog/

RUN chmod 777 /blog

RUN jekyll build

# Serve core site and blog with nginx
FROM nginx

COPY ./src /usr/share/nginx/html
COPY --from=jekyll-build /blog/_site /usr/share/nginx/html/blog