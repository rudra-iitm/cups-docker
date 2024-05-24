FROM ubuntu:latest as base

WORKDIR /src

COPY scripts/build.sh .

RUN sh build.sh

FROM ubuntu:latest AS final

WORKDIR /src

COPY --from=base /etc /etc
COPY --from=base /usr /usr
COPY --from=base /var /var

COPY scripts/entrypoint.sh .

ENTRYPOINT [ "sh", "/src/entrypoint.sh" ]

EXPOSE 631
