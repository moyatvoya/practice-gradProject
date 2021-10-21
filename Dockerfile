FROM ubuntu:18.04

RUN apt-get -yqq update
RUN apt-get -yqq install python3-pip python3-dev curl 

ADD dist /var/www/dist
WORKDIR /var/www

RUN pip3 install dist/Flaskex-1.0.0-py3-none-any.whl && \
    tar -zxvf dist/Flaskex-1.0.0.tar.gz --directory . && \
    rm -r dist && \
    chmod a+x ./Flaskex-1.0.0
WORKDIR /var/www/Flaskex-1.0.0

EXPOSE 5000

CMD [ "python3", "./app.py"]
