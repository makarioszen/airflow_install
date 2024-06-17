@echo off
echo Creating directory structure
mkdir C:\inovage_srv\airflow
cd C:\inovage_srv\airflow

echo Setting Airflow home directory
set AIRFLOW_HOME=C:\inovage_srv\airflow

echo Creating a virtual environment inside the directory
python -m venv venv

echo Activating the virtual environment
call .\venv\Scripts\activate

echo Upgrading pip
python -m pip install --upgrade pip

echo Installing Apache Airflow
pip install "apache-airflow[celery]==2.9.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.9.2/constraints-3.8.txt"

echo Initializing the database
airflow db init

echo Creating an admin user
airflow users create --username admin --firstname Admin --lastname User --role Admin --email admin@example.com

echo Deactivating the virtual environment
deactivate

echo Installation complete. To start Airflow, activate the virtual environment and run the web server and scheduler.
pause
