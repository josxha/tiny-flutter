FROM debian:bookworm

USER root

# Define FLUTTER_HOME and FLUTTER_ROOT environment variables
ENV FLUTTER_HOME=/root/sdks/flutter
ENV FLUTTER_ROOT=$FLUTTER_HOME
ENV PATH=${PATH}:${FLUTTER_HOME}/bin:${FLUTTER_HOME}/bin/cache/dart-sdk/bin

# Install required dependencies
RUN apt update && apt install -y wget tar

# Create the FLUTTER_HOME directory
RUN mkdir -p ${FLUTTER_HOME}

# Download and extract Flutter SDK
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.24.5-stable.tar.xz
RUN tar -xf flutter_linux_3.24.5-stable.tar.xz -C ${FLUTTER_HOME} --strip-components=1
RUN rm flutter_linux_3.24.5-stable.tar.xz

# Set correct permissions for Flutter SDK
RUN chown -R root:root ${FLUTTER_HOME}
