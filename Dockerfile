FROM python:3



# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /code
WORKDIR /code
ADD . /code



COPY requirements.txt /code/

COPY ./docker-entrypoint.sh /

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . /code/

ENTRYPOINT ["sh","/docker-entrypoint.sh"]