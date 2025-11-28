FROM ubuntu:latest

LABEL maintainer="Esteban BARRACHO"
LABEL org.opencontainers.image.source="https://github.com/SmoosArthur/Infom114-Genie-Logiciel_DB_partenaire"

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN if [ -s "/app/requirements.txt" ]; then \
      pip3 install --no-cache-dir --break-system-packages -r requirements.txt; \
    else \
      echo "requirements.txt vide, aucune dépendance à installer"; \
    fi

COPY code/ /app/code/

RUN if [ ! -f "/app/code/main.py" ]; then \
      echo 'print("MarieYourJob placeholder backend running inside Docker")' > /app/code/main.py; \
    fi

EXPOSE 8000

ENTRYPOINT ["python3", "code/main.py"]
