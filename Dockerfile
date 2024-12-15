FROM debian:bookworm

USER root

ENV FLUTTER_HOME=/root/sdks/flutter
ENV FLUTTER_ROOT=$FLUTTER_HOME
ENV PATH=${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

RUN apt update && apt install -y wget tar curl git unzip xz-utils zip libglu1-mesa

RUN mkdir -p ${FLUTTER_HOME}

RUN git clone --depth 1 --branch 3.27.0 https://github.com/flutter/flutter.git ${FLUTTER_HOME}
RUN flutter precache --web

RUN chown -R root:root ${FLUTTER_HOME}
