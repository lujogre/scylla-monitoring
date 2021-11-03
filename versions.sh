unset SUPPORTED_VERSIONS
unset MANAGER_SUPPORTED_VERSIONS
unset DEFAULT_VERSION
unset MANAGER_DEFAULT_VERSION
unset DEFAULT_ENTERPRISE_VERSION
unset DOCKER_LIMITS
unset DOCKER_PARAMS
declare -A SUPPORTED_VERSIONS
declare -A MANAGER_SUPPORTED_VERSIONS
declare -A DEFAULT_VERSION
declare -A MANAGER_DEFAULT_VERSION
declare -A DEFAULT_ENTERPRISE_VERSION
declare -A DOCKER_LIMITS
declare -A DOCKER_PARAMS
SUPPORTED_VERSIONS["3.8"]="4.3,4.4,4.5,2020.1,2021.1,master"
MANAGER_SUPPORTED_VERSIONS["3.8"]="2.3,2.4,2.5"
DEFAULT_VERSION["3.8"]="4.4"
DEFAULT_ENTERPRISE_VERSION["3.8"]="2020.1"
MANAGER_DEFAULT_VERSION["3.8"]="2.4"
MANAGER_DEFAULT_VERSION["master"]="2.4"
SUPPORTED_VERSIONS["3.9"]="4.3,4.4,4.5,4.6,2020.1,2021.1,master"
MANAGER_SUPPORTED_VERSIONS["3.9"]="2.3,2.4,2.5"
DEFAULT_VERSION["3.9"]="4.4"
DEFAULT_ENTERPRISE_VERSION["3.9"]="2020.1"
MANAGER_DEFAULT_VERSION["3.9"]="2.4"
MANAGER_DEFAULT_VERSION["master"]="2.4"
PROMETHEUS_VERSION=v2.29.1
ALERT_MANAGER_VERSION="v0.22.2"
GRAFANA_VERSION=8.2.3
LOKI_VERSION="2.3.0"
GRAFANA_RENDERER_VERSION="3.0.1"
THANOS_VERSION="v0.23.0"
