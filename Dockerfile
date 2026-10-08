FROM --platform=$BUILDPLATFORM ubuntu:26.04 AS build

RUN apt-get update && apt-get install -y --no-install-recommends binutils-aarch64-linux-gnu

WORKDIR /src

COPY src/ ./

RUN for f in *.s; do aarch64-linux-gnu-as -o "${f%.s}.o" "$f"; done \
    && aarch64-linux-gnu-ld -s -o hello *.o

RUN ls -ltra /src

FROM scratch

COPY --from=build /src/hello /hello

ENTRYPOINT ["/hello"]
