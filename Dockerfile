FROM linaro/compass-tasks:latest

COPY ./run.sh ./etcd-arm64.patch ./thunderx1.patch ./docker-pkg.patch /root/
RUN chmod +x /root/run.sh
RUN /root/run.sh
