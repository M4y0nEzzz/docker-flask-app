FROM python:3.11-alpine AS build

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

FROM python:3.11-alpine

WORKDIR /app

COPY --from=build /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

COPY app /app/app

RUN adduser -D flaskuserM && chown -R flaskuserM /app
USER flaskuserM

# Правильный вариант
Docker --read-only \ 
    --tmpfs /testDir:rw /app/testDir

# Старый вариант
RUN mkdir -p /app/testDir && \
    chown flaskuserM:flaskuserM /app/testDir && \
    chmod 666 /app/testDir
    
ENV ROCKET_SIZE=Big
EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8000/health || exit 1

VOLUME /tmp

CMD ["python", "app/app.py"]

LABEL org.lab.login="michaelkon" \
      org.lab.token="b8faaba600da8bd92cffd037859fe877" \
      org.lab.prefix="b8faaba6"
