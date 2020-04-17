FROM python:3.6

RUN mkdir /grabwack
WORKDIR /grabwack

COPY . .

HEALTHCHECK --interval=5s \
          --timeout=5s \
          CMD curl -f http://127.0.0.1:8000 || exit 1

CMD ["/bin/bash", "initialization-script.sh"]

EXPOSE 8000
