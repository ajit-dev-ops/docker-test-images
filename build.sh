docker build . -t ajitchahal/nginx-3:latest
docker push ajitchahal/nginx-3:latest
docker stop nginx
docker rm nginx
docker run -d --name=nginx ajitchahal/nginx-3:latest  
docker logs nginx