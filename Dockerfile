# Copyright (c) 2018 Cisco and/or its affiliates.
#
# This software is licensed to you under the terms of the Cisco Sample
# Code License, Version 1.0 (the "License"). You may obtain a copy of the
# License at
#
#                https://developer.cisco.com/docs/licenses
#
# All use of the material herein must be in accordance with the terms of
# the License. All rights not expressly granted by the License are
# reserved. Unless required by applicable law or agreed to separately in
# writing, software distributed under the License is distributed on an "AS
# IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
# or implied.

FROM ubuntu

ADD https://devnetsupport.cisco.com/hc/en-us/article_attachments/360000206628/amqp.py /
ADD https://devnetsupport.cisco.com/hc/en-us/article_attachments/360000206648/cert.crt /
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get install -y mosquitto-clients && \
    apt-get install -y python-pika && \
    mkdir -p /root/.config && \
    echo '--cafile /etc/ssl/certs/ca-certificates.crt\n-h us.ciscokinetic.io\n-p 8883' > /root/.config/mosquitto_pub
