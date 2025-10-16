# Короткий отчет по лабораторной работе №2.

## 1) Вывод команды  docker history michaelkon/image-lab:b8faaba6 :
| IMAGE         | CREATED         | CREATED BY                                     | SIZE     | COMMENT |
### 185938a5bd39   34 minutes ago   LABEL org.lab.login=michaelkon org.lab.token…   0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   CMD ["python" "app/app.py"]                     0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   VOLUME [/tmp]                                   0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   HEALTHCHECK &{["CMD-SHELL" "wget --no-verbos…   0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   EXPOSE &{[{{19 0} {19 0}}] 0xc002192b40}        0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   ENV ROCKET_SIZE=Big                             0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   USER flaskuser                                  0B        buildkit.dockerfile.v0
### <missing>      34 minutes ago   RUN /bin/sh -c adduser -D flaskuser && chown…   53.2kB    buildkit.dockerfile.v0
### <missing>      34 minutes ago   COPY app /app/app # buildkit                    16.4kB    buildkit.dockerfile.v0
### <missing>      34 minutes ago   COPY /usr/local/lib/python3.11/site-packages…   13.9MB    buildkit.dockerfile.v0
### <missing>      37 minutes ago   WORKDIR /app                                    8.19kB    buildkit.dockerfile.v0
### <missing>      6 days ago       CMD ["python3"]                                 0B        buildkit.dockerfile.v0
### <missing>      6 days ago       RUN /bin/sh -c set -eux;  for src in idle3 p…   16.4kB    buildkit.dockerfile.v0
### <missing>      6 days ago       RUN /bin/sh -c set -eux;   apk add --no-cach…   51MB      buildkit.dockerfile.v0
### <missing>      6 days ago       ENV PYTHON_SHA256=8d3ed8ec5c88c1c95f5e558612…   0B        buildkit.dockerfile.v0
### <missing>      6 days ago       ENV PYTHON_VERSION=3.11.14                      0B        buildkit.dockerfile.v0
### <missing>      6 days ago       ENV GPG_KEY=A035C8C19219BA821ECEA86B64E628F8…   0B        buildkit.dockerfile.v0
### <missing>      6 days ago       RUN /bin/sh -c set -eux;  apk add --no-cache…   3.02MB    buildkit.dockerfile.v0
### <missing>      6 days ago       ENV LANG=C.UTF-8                                0B        buildkit.dockerfile.v0
### <missing>      6 days ago       ENV PATH=/usr/local/bin:/usr/local/sbin:/usr…   0B        buildkit.dockerfile.v0
### <missing>      8 days ago       CMD ["/bin/sh"]                                 0B        buildkit.dockerfile.v0
### <missing>      8 days ago       ADD alpine-minirootfs-3.22.2-x86_64.tar.gz /…   8.99MB    buildkit.dockerfile.v0

# 2) Мой образ лучше "наивной" сборки по ряду причин:
     a) использование multi-stage (в образ попадают только нужные зависимости);
     b) сокращение размера более чем вдвое (использование python:3.11-alpine);
     c) запуск не под root'ом (повышение уровня безопасности);
     d) поддержка режима только для чтения;
     e) автоматическое отслеживание состояния (HEALTHCHECK);
     f) использование переменной окружения (ROCKET_SIZE) и, 
        как следствие, изменение поведения приложения без пересборки образа.
