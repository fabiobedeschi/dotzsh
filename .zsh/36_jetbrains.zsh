_uname=$(uname)
if [[ $_uname == "Linux" ]]; then
    _datagrip="$(command -v datagrip)";
    if [[ -x "${_datagrip}" ]]; then
        function datagrip() {
            { "${_datagrip}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _fleet="$(command -v fleet)";
    if [[ -x "${_fleet}" ]]; then
        function fleet() {
            { "${_fleet}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _phpstorm="$(command -v phpstorm)";
    if [[ -x "${_phpstorm}" ]]; then
        function phpstorm() {
            { "${_phpstorm}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _pycharm="$(command -v pycharm)";
    if [[ -x "${_pycharm}" ]]; then
        function pycharm() {
            { "${_pycharm}" $@ & } >/dev/null 2>&1 &;
        }
    fi
fi
