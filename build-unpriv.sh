docker build -f Dockerfile.unpriv -t ajitchahal/nginx-unprivileged:latest .



docker push ajitchahal/nginx-unprivileged:latest
docker stop nginx
docker rm nginx
docker run -d --name=nginx ajitchahal/nginx-unprivileged:latest  
docker logs nginx