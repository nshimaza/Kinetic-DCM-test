FROM ubuntu

ADD https://devnetsupport.cisco.com/hc/en-us/article_attachments/360000206628/amqp.py /
ADD https://devnetsupport.cisco.com/hc/en-us/article_attachments/360000206648/cert.crt /
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get install -y mosquitto-clients && \
    apt-get install -y python-pika && \
    mkdir -p /root/.config && \
    echo '--cafile /etc/ssl/certs/ca-certificates.crt\n-h us.ciscokinetic.io\n-p 8883' > /root/.config/mosquitto_pub
