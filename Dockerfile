FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /polls
WORKDIR /polls

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

HEALTHCHECK --interval=5s \
          --timeout=5s \
          CMD curl -f http://127.0.0.1:8000 || exit 1

CMD ["/bin/bash", "initialization-script.sh"]

EXPOSE 8000
