#!/usr/bin/env bash
# Configures application version

# workaround for repository having https:// prefix
export CONTAINER_REGISTRY="$(echo "${CONTAINER_REGISTRY}" | sed -E 's_^http(s)?://__')"

cat <<EOF

image:
  repository: ${CONTAINER_REGISTRY}cloudera/yunikorn-scheduler
  tag: ${APP_VERSION}
  pullPolicy: Always

pluginImage:
  repository: ${CONTAINER_REGISTRY}cloudera/yunikorn-scheduler-plugin
  tag: ${APP_VERSION}
  pullPolicy: Always

admissionController:
  image:
    repository: ${CONTAINER_REGISTRY}cloudera/yunikorn-admission
    tag: ${APP_VERSION}
    pullPolicy: Always

web:
  image:
    repository: ${CONTAINER_REGISTRY}cloudera/yunikorn-web
    tag: ${APP_VERSION}
    pullPolicy: Always

EOF
