FROM python:3.8 as base
# Base image to be reused
LABEL maintainer "team4devx"
ARG ACCESS_KEY
ARG SECRET_KEY
ARG REGION
ARG PROFILE
RUN apt-get update
RUN mkdir /app
WORKDIR /app
COPY ./requirements.txt ./requirements.txt
RUN apt install libsystemd-dev build-essential libpython3-dev libdbus-1-dev libgirepository1.0-dev awscli  -y

RUN aws configure set aws_access_key_id $ACCESS_KEY --profile $PROFILE
RUN aws configure set aws_secret_access_key $SECRET_KEY --profile $PROFILE
RUN aws configure set aws_region $REGION --profile $PROFILE

RUN python -m pip install --upgrade pip
RUN pip install freezer
RUN pip install -r requirements.txt

EXPOSE 5000
COPY . .
#CMD ["python", "app.py"]
