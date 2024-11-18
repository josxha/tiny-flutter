FROM debian:bookworm

USER root

ENV FLUTTER_HOME=/root/sdks/flutter
ENV FLUTTER_ROOT=$FLUTTER_HOME
ENV PATH=${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN apt update && apt install -y wget tar curl git unzip xz-utils zip libglu1-mesa

RUN mkdir -p ${FLUTTER_HOME}

RUN wget -q https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz
RUN tar -xf ./flutter_linux_3.24.5-stable.tar.xz -C ${FLUTTER_HOME}
RUN rm flutter_linux_3.24.5-stable.tar.xz

RUN chown -R root:root ${FLUTTER_HOME}
