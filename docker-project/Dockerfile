FROM ubuntu
RUN apt update && apt install -y iputils-ping
WORKDIR /app
COPY app.sh .
RUN chmod +x app.sh
CMD ["./app.sh"]

