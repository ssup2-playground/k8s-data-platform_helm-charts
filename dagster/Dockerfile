FROM python:3.11-slim

ARG DAGSTER_VERSION=1.10.5
ARG DAGSTER_MODULES_VERSION=0.26.5

# All packages are hard-pinned to `dagster`, so setting the version on just `DAGSTER` will ensure
# compatible versions.
RUN pip install \
    dagster==${DAGSTER_VERSION} \
    dagster-k8s==${DAGSTER_MODULES_VERSION} \
    dagster-graphql==${DAGSTER_VERSION} \
    dagster-webserver==${DAGSTER_VERSION} \
    dagster-postgres==${DAGSTER_MODULES_VERSION} \
    dagster-celery[flower,redis,kubernetes]==${DAGSTER_MODULES_VERSION} \
    dagster-celery-k8s==${DAGSTER_MODULES_VERSION} \
    redis
