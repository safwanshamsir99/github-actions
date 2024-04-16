FROM python:3.10-slim-bullseye

RUN echo "### --- Ubuntu dependencies --- ###"
RUN apt-get update && \
    apt-get install -y \
    g++ \
    cmake \
    unzip \
    curl \
    poppler-utils 

# SETUP DIRECTORY
RUN echo "### --- Directory setup --- ###"
RUN mkdir /app
WORKDIR /app
COPY ./app .

# PACKAGES 
RUN pip install --no-cache-dir -r requirements.txt

# CHANGE DIRECTORY TO ROOT 
WORKDIR /

CMD ["uvicorn", "app.model_endpoint:app", "--reload", \
    "--host", "0.0.0.0" ,\
    "--port", "80"]
EXPOSE 80

# SET THE MAINTAINER LABEL
LABEL maintainer="safwanshamsir <safwanshamsir7177@gmail.com>"
