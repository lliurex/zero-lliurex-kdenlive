VENV_PATH="/usr/lib/kdenlive-venv"
DOC_PATH="/usr/share/doc/llx-kdenlive"
FREEZE_FILE="kdenlive-env-freeze.list"
CFG_FILE="kdenliverc"

if [ "$(id -u)" != "0" ]; then
    echo "Need run as root user"
    exit 1
fi

pip cache purge
python3 -m venv $VENV_PATH
source $VENV_PATH/bin/activate
pip cache purge
pip install --no-cache-dir -r $DOC_PATH/$FREEZE_FILE
cp $DOC_PATH/$CFG_FILE /etc/xdg/$CFG_FILE
