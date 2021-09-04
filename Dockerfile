FROM python:3.8.3-buster

RUN apt-get update && apt-get install -y bash git 

RUN pip install flake8 autopep8 pymysql uwsgi mysqlclient pyyaml \ 
    && pip install Django==3.2.* djangorestframework==3.12.* django-environ drf-yasg dj-database-url

WORKDIR /home/python/app
RUN useradd -u 1000 -o python && \
    chown -R python:python /home/python

COPY . .
EXPOSE 8000/tcp

CMD [ "python","/home/python/app/manage.py","runserver","0:8000"]