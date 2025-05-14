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
    'retry_delay': timedelta(minutes=1)
}
def print_welcome():
    print('Welcome to Airflow!')

def print_date():
    print('Today is {}'.format(datetime.today().date()))


def print_random_quote():
    response = requests.get('https://fakeapi.net/products/1')
    quote = response.json()['title']
    print('Product name is : "{}"'.format(quote))
    print(quote)


dag = DAG(
    dag_id='capstone_projct',
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

print_random_quote = PythonOperator(
    task_id='print_product_name',
    python_callable=print_random_quote,
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

print_welcome_task >>  print_random_quote >> dbt_raw_stage >>dbt_staging_stage
