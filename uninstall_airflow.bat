@echo off
echo Deactivating virtual environment if active
if defined VIRTUAL_ENV (
    call .\venv\Scripts\deactivate
)

echo Uninstalling Apache Airflow and its dependencies
call .\venv\Scripts\activate
pip uninstall -y apache-airflow
deactivate

echo Removing Airflow home directory
rmdir /S /Q C:\inovage_srv\airflow

echo Airflow has been successfully uninstalled and the directory has been removed.
pause
