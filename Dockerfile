FROM linaro/compass-tasks:latest

COPY ./run.sh ./etcd-arm64.patch /root/
RUN chmod +x /root/run.sh
RUN /root/run.sh
