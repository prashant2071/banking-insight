FROM apache/airflow:2.10.5



USER root

RUN apt-get update && \
apt-get install -y ant && \
apt-get clean;

# Set JAVA_HOME

USER airflow
RUN pip install --no-cache-dir dbt-core dbt-postgres pandas

