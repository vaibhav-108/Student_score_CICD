# FROM python:3.8-slim-buster
# WORKDIR /app
# COPY . /app 

# RUN apt update -y && apt install awscli -y

# RUN apt-get update && apt-get install ffmpeg libsm6 libxext6 unzip -y && pip install -r requirements.txt

# CMD [ "python3","app.py" ]

FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app 

RUN apt-get update -y \
    && apt-get install -y awscli ffmpeg libsm6 libxext6 unzip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

CMD ["python3", "app.py"]
