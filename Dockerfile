FROM debian:stretch AS builder

RUN apt update && apt install -y build-essential qtcreator qtbase5-dev libusb-1.0-0-dev libhidapi-dev pkgconf wget git file debhelper libmbedtls-dev qt5-default

RUN git clone https://gitlab.com/CalcProgrammer1/OpenRGB /usr/app
WORKDIR /usr/app

# Check out latest tag
ARG OPENRGB_VERSION
RUN echo $OPENRGB_VERSION
RUN git checkout $OPENRGB_VERSION

RUN qmake OpenRGB.pro
RUN make -j8

FROM debian:stretch-slim

RUN apt update
RUN apt install -y libusb-1.0.0 libhidapi-dev libmbedtls-dev libqt5gui5

WORKDIR /usr/app

COPY --from=builder /usr/app/openrgb .

ENTRYPOINT [ "/usr/app/openrgb" ]
CMD [ "--server" ]
