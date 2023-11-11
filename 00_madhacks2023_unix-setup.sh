# Written by: Mikhail Ortiz-Lunyov (https://github.com/mportizlunyov)
# For:        MadHacks 2023, Team 'Super Awesome Coders'
#
# This UNIX shell script is intended for setting up and running our
#  application created for the 2023 MadHacks hackathon

# Confirm with Dependencies.txt
# - python3
# - 

INSTALL_PANDAS_Q=""
INSTALL_PIP_Q=""
INSTALL_FLASK_Q=""

# Checks for python
python3 --version
if [ "$?" == "127" ] ; then
    echo "Python is required to run this application"
    echo "Install and try again later"
    exit 1
fi
# Checks for pip
pip --version
if [ "$?" == "127" ] ; then
    echo "Pip is required to run this application"
    VALID_RESPONSE=false
    while [ "$VALID_RESPONSE" != true ] ; do
        echo "Install [Y/n]?"
        read INSTALL_PIP_Q
        if [ "$INSTALL_PIP_Q" == "y" ] || [ "$INSTALL_PIP_Q" == "Y" ] ; then
            python3 -m ensurepip --upgrade
            echo "Done"
            VALID_RESPONSE=true
        elif [ "$INSTALL_PIP_Q" == "n" ] || [ "$INSTALL_PIP_Q" == "N" ] ; then
            echo "Install and try again later"
            exit 1
        else
            echo "Sorry, only 'y' or 'n' accepted"
        fi
    done
fi
# Checks for flask
flask --version
if [ "$?" == "127" ] ; then
    echo "Flask is required to run this application"
    VALID_RESPONSE=false
    while [ "$VALID_RESPONSE" != true ] ; do
        echo "Install [Y/n]?"
        read INSTALL_FLASK_Q
        if [ "$INSTALL_FLASK_Q" == "y" ] || [ "$INSTALL_FLASK_Q" == "Y" ] ; then
            pip install flask
            echo "Done"
            VALID_RESPONSE=true
        elif [ "$INSTALL_FLASK_Q" == "n" ] || [ "$INSTALL_FLASK_Q" == "N" ] ; then
            echo "Install and try again later"
            exit 1
        else
            echo "Sorry, only 'y' or 'n' accepted"
        fi
    done
fi

# Set up environmental values
#  Name may change with development
export FLASK_ENV=development
flask run