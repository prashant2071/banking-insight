from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from airflow.utils.dates import days_ago
from datetime import datetime,timedelta
from airflow.utils.email import send_email
import requests
import json


DBT_PROJECT_DIR = "/usr/local/airflow/dbt/"
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'retries': 2, 
    'retry_delay': timedelta(minutes=1),
    'email': 'pbt9840@gmail.com',
    'email_on_failure':True,
    'email_on_retry':False,
}

def send_success_email():
    subject  = f"Task is complete!"
    body = f"Banking insight has successfully completed."
    send_email(to='pbt9840@gmail.com',subject = subject,html_content = body
    
     )


def print_welcome():
    print('Welcome to Airflow!')



dag = DAG(
    dag_id='banking_insight',
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

dbt_raw_stage = BashOperator(
    task_id='dbt_run_raw_stage',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt run -s raw',
    dag=dag
)
dbt_staging_stage = BashOperator(
    task_id='dbt_run_staging_stage',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt run -s staging',
    dag=dag
)
dbt_mart_stage = BashOperator(
    task_id='dbt_run_mart_stage',
    bash_command=f'cd {DBT_PROJECT_DIR} && dbt run -s marts',
    dag=dag
)
task_complete_mail = PythonOperator(
    task_id = 'task_complete_send_mail',
    python_callable = send_success_email,
    dag= dag
)
print_welcome_task >> dbt_raw_stage >>dbt_staging_stage >> dbt_mart_stage >> task_complete_mail
