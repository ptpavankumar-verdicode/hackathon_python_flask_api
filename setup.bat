@echo off
SETLOCAL

REM Create virtual environment if it doesn't exist
IF NOT EXIST venv (
    python -m venv venv
)

REM Activate virtual environment
CALL venv\Scripts\activate

REM Upgrade pip
python -m pip install --upgrade pip

REM Install required packages
pip install -r requirements.txt

REM Set FLASK_APP environment variable
SET FLASK_APP=app.py

REM Initialize database if it doesn't exist
IF NOT EXIST migrations (
    flask db init
    flask db migrate -m "Initial migration"
    flask db upgrade
)

echo Setup complete. You can now run the application with "flask run".

ENDLOCAL
