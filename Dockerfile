FROM linaro/compass-tasks:latest

ADD ./run.sh /root/
RUN chmod +x /root/run.sh
RUN /root/run.sh
