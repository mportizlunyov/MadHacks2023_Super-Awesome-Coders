# Written by: Mikhail Ortiz-Lunyov (https://github.com/mportizlunyov)
# For:        MadHacks 2023, Team 'Super Awesome Coders'
#
# This PowerShell script is intended for setting up and running our
#  application created for the 2023 MadHacks hackathon

# Confirm with Dependencies.txt
# - java
# - gradle

$install_python_q
$install_pip_q
$install_flask_q
$install_pandas_q

# Check for Python
try {python --version}
catch {
    Write-Host "Python is required to run this application"
    $valid_response = $false
    while ($valid_response -ne $true) {
        Write-Host "Install [Y/n]?"
        $install_python_q = Read-Host
        if ($install_python_q -eq "Y") {
            winget install python
            Write-Host "Done"
            $valid_response = $true
        }
        elseif ($install_python_q -eq "N") {
            Write-Host "Install and try again later"
            exit
        }
        else {
            Write-Host "Sorry, only 'y' or 'n' accepted"
        }
    }
}
# Check for Pip
try {pip --version}
catch {
    Write-Host "Pip is required to run this application"
    $valid_response = $false
    while ($valid_response -ne $true) {
        Write-Host "Install [Y/n]?"
        $install_pip_q = Read-Host
        if ($install_pip_q -eq "Y") {
            python -m ensurepip --upgrade
            Write-Host "Done"
            $valid_response = $true
        }
        elseif ($install_pip_q -eq "N") {
            Write-Host "Install and try again later"
            exit
        }
        else {
            Write-Host "Sorry, only 'y' or 'n' accepted"
        }
    }
}
# Check for Flask
try {flask --version}
catch {
    Write-Host "Flask is required to run this application"
    $valid_response = $false
    while ($valid_response -ne $true) {
        Write-Host "Install [Y/n]?"
        $install_flask_q = Read-Host
        if ($install_flask_q -eq "Y") {
            pip3 install flask
            Write-Host "Done"
            $valid_response = $true
        }
        elseif ($install_flask_q -eq "N") {
            Write-Host "Install and try again later"
            exit
        }
        else {
            Write-Host "Sorry, only 'y' or 'n' accepted"
        }
    }
}

# Set up environmental values
#  Name may change with development

$env:FLASK_ENV='development'

# Execute Python backends
python .\backend.py
$env:FLASK_APP='views.py'
python .\views.py
$env:FLASK_APP='app.py'
python .\app.py