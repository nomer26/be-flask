FROM python:3.8 as base
# Base image to be reused
LABEL maintainer "team4devx"
RUN apt-get update
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt ./requirements.txt
RUN apt install libsystemd-dev build-essential libpython3-dev libdbus-1-dev libgirepository1.0-dev awscli  -y
RUN python -m pip install --upgrade pip
RUN pip install freezer
RUN pip install -r requirements.txt

EXPOSE 5000
COPY . .
# CMD ["python", "app.py"]
