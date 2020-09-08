FROM kubedb/postgres:11.2-v1
WORKDIR /pg

RUN set -exo pipefail \
  && apk add --no-cache --virtual .build-deps \ 
   build-base \
   git\
   postgresql-dev  \
   && git clone https://gitlab.com/dalibo/postgresql_anonymizer.git  \
   && cd postgresql_anonymizer  \
   && make extension  \
   && make install \
   && apk del .build-deps \
   && rm -rf /pg

