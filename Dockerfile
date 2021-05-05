# Stage 1
FROM python:3.9-buster AS builder

WORKDIR /flask-app

RUN python3 -m venv venv
ENV VIRTUAL_ENV=/flask-app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY requirements.txt .
RUN pip install -r requirements.txt

# Stage 2
FROM python:3.9-slim-buster AS runner

WORKDIR /flask-app

COPY --from=builder /flask-app/venv venv
COPY app app

ENV VIRTUAL_ENV=/flask-app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


CMD python app/app.py
