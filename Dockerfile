FROM python:3.12-alpine

ENV PYTHONUNBEFFERD=1

WORKDIR /mysite

COPY poetry.lock pyproject.toml ./

RUN pip install --upgrade pip && \
    pip install "poetry==2.1.1"

RUN poetry config virtualenvs.create false --local

COPY mysite ./

RUN poetry install

EXPOSE 8000