# Path where Python will be installed
$pythonPath = "C:\Python39"
$pythonExe = "$pythonPath\python.exe"
$pythonDownloadUrl = "https://www.python.org/ftp/python/3.9.7/python-3.9.7-amd64.exe"

# Check if Python is installed
if (-Not (Test-Path $pythonExe)) {
    Write-Output "Python is not installed. Installing Python..."

    try {
        # Download Python installer
        $installerPath = "$env:TEMP\python-installer.exe"
        Invoke-WebRequest -Uri $pythonDownloadUrl -OutFile $installerPath

        # Install Python silently
        Start-Process -FilePath $installerPath -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1 TargetDir=$pythonPath" -NoNewWindow -Wait

        # Clean up installer
        Remove-Item $installerPath

        # Verify installation
        & $pythonExe --version
    } catch {
        Write-Output "Failed to install Python: $_"
        exit 1
    }
} else {
    Write-Output "Python is already installed."
}

# Check again if Python was installed successfully
if (-Not (Test-Path $pythonExe)) {
    Write-Output "Python installation failed."
    exit 1
}

# Create virtual environment if it doesn't exist
if (-Not (Test-Path "venv")) {
    & $pythonExe -m venv venv
}

# Activate virtual environment
& .\venv\Scripts\Activate.ps1

# Upgrade pip
& .\venv\Scripts\python.exe -m pip install --upgrade pip

# Install required packages
& .\venv\Scripts\pip.exe install -r requirements.txt

# Set FLASK_APP environment variable
$env:FLASK_APP = "app.py"

# Initialize database if it doesn't exist
if (-Not (Test-Path "migrations")) {
    & .\venv\Scripts\flask.exe db init
    & .\venv\Scripts\flask.exe db migrate -m "Initial migration"
    & .\venv\Scripts\flask.exe db upgrade
}

Write-Output "Setup complete. You can now run the application with 'flask run'."
