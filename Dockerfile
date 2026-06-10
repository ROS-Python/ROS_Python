FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p /app/staticfiles /app/media

RUN DATABASE_URL=sqlite:////tmp/build.db SECRET_KEY=build-only DEBUG=True python manage.py collectstatic --noinput --clear

RUN chmod +x start.sh

EXPOSE 8000

CMD ["./start.sh"]
