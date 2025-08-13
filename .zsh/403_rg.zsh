_rg="$(command -v rg)"
if [[ -x "${_rg}" ]]; then
  function rgp() {
  	${_rg} -p "$@" | less -r
  }
fi
