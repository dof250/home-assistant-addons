FROM alpine:latest

RUN apk add --no-cache ffmpeg nginx bash jq

COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]