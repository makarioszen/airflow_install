@echo off
REM Create directory structure
mkdir C:\inovage_srv\airflow
cd C:\inovage_srv\airflow

REM Set Airflow home directory
set AIRFLOW_HOME=C:\inovage_srv\airflow

REM Create a virtual environment inside the directory
python -m venv venv

REM Activate the virtual environment
call .\venv\Scripts\activate

REM Upgrade pip
python -m pip install --upgrade pip

REM Install Apache Airflow
pip install "apache-airflow==2.9.2" --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-2.9.2/constraints-3.7.txt"

REM Initialize the database
airflow db init

REM Create an admin user
airflow users create --username admin --firstname Admin --lastname User --role Admin --email admin@example.com

REM Deactivate the virtual environment
deactivate

@echo Installation complete. To start Airflow, activate the virtual environment and run the web server and scheduler.
pause
