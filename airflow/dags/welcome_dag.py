from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago
from datetime import datetime,timedelta
import requests
import json


DBT_PROJECT_DIR = "/usr/local/airflow/dbt/"
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 2, 
    'retry_delay': timedelta(minutes=1),
    'email': 'pbt133393@gmail.com',
    'email_on_failure':True
    # 'email_on_retry':True
}
def print_welcome():
    # print("welcome")
    print(f"dsfda{sdfa}")

dag = DAG(
    dag_id='welcome_dag',
    default_args=default_args,
    description='DAG with retry logic and logging',
    schedule_interval='0 1 * * *', 
    start_date=datetime(2023, 1, 1),
    catchup=False
)

print_welcome_task = PythonOperator(
    task_id='print_welcome',
    python_callable=print_welcome,
    dag=dag
)
print_welcome_task