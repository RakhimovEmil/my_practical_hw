FROM alpine
MAINTAINER Rakhimov Emil <sinbad116@gmail.com>
RUN apk add --no-cache curl jq python3 py3-pip
COPY . /app 
WORKDIR /app
EXPOSE 8080
RUN pip install -r requirements.txt
CMD python3 server.py
