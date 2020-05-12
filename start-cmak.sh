#!/bin/sh

if [[ $CMAK_USERNAME != ''  && $CMAK_PASSWORD != '' ]]; then
    sed -i.bak '/^basicAuthentication/d' /kafka-manager-${CMAK_VERSION}/conf/application.conf
    echo 'basicAuthentication.enabled=true' >> /kafka-manager-${CMAK_VERSION}/conf/application.conf
    echo "basicAuthentication.username=${CMAK_USERNAME}" >> /kafka-manager-${CMAK_VERSION}/conf/application.conf
    echo "basicAuthentication.password=${CMAK_PASSWORD}" >> /kafka-manager-${CMAK_VERSION}/conf/application.conf
    echo 'basicAuthentication.realm="CMAK"' >> /kafka-manager-${CMAK_VERSION}/conf/application.conf
fi

exec ./bin/kafka-manager -Dpidfile.path=/dev/null -Dconfig.file=${CMAK_CONFIGFILE} "${CMAK_ARGS}" "${@}"
