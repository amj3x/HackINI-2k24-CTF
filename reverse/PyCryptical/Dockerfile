FROM python:2-alpine

WORKDIR /app

COPY . /app

EXPOSE 1337

CMD ["nc", "-lk", "-np", "1337", "-e", "python", "chall.py"]
