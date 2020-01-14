FROM google/cloud-sdk:265.0.0-alpine

EXPOSE 8085

VOLUME /data

RUN apk update && apk add openjdk8-jre

RUN gcloud components install beta

RUN gcloud components install pubsub-emulator --quiet

ENTRYPOINT ["gcloud", "beta", "emulators", "pubsub"]
CMD ["start", "--data-dir=/data", "--host-port", "0.0.0.0:8085"]