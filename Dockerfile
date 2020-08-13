FROM python:3.8-slim
RUN apt update && apt upgrade -y
RUN apt install -y curl gcc python3-dev

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
ENV PATH=$PATH:/root/.poetry/bin
RUN ls -al /root

COPY . /src/wolf
WORKDIR /src/wolf

RUN poetry export -f requirements.txt > requirements.txt
RUN pip install -r requirements.txt

ENV FLASK_APP=flaskr
ENV FLASK_ENV=development
EXPOSE 5000

CMD flask run --host=0.0.0.0


