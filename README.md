# docker-shiny-server
Shiny Server open source running in docker

docker build . -t shinyserver

docker run -d -p 3838:3838 shinyserver
