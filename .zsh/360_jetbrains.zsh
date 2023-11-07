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

    _idea="$(command -v idea)";
    if [[ -x "${_idea}" ]]; then
        function idea() {
            { "${_idea}" $@ & } >/dev/null 2>&1 &;
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

    _rubymine="$(command -v rubymine)";
    if [[ -x "${_rubymine}" ]]; then
        function rubymine() {
            { "${_rubymine}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _webstorm="$(command -v webstorm)";
    if [[ -x "${_webstorm}" ]]; then
        function webstorm() {
            { "${_webstorm}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _clion="$(command -v clion)";
    if [[ -x "${_clion}" ]]; then
        function clion() {
            { "${_clion}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _goland="$(command -v goland)";
    if [[ -x "${_goland}" ]]; then
        function goland() {
            { "${_goland}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _intellij="$(command -v intellij)";
    if [[ -x "${_intellij}" ]]; then
        function intellij() {
            { "${_intellij}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _appcode="$(command -v appcode)";
    if [[ -x "${_appcode}" ]]; then
        function appcode() {
            { "${_appcode}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _rider="$(command -v rider)";
    if [[ -x "${_rider}" ]]; then
        function rider() {
            { "${_rider}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _resharper="$(command -v resharper)";
    if [[ -x "${_resharper}" ]]; then
        function resharper() {
            { "${_resharper}" $@ & } >/dev/null 2>&1 &;
        }
    fi

    _dottrace="$(command -v dottrace)";
    if [[ -x "${_dottrace}" ]]; then
        function dottrace() {
            { "${_dottrace}" $@ & } >/dev/null 2>&1 &;
        }
    fi
fi
