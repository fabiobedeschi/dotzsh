if type dasel &> /dev/null; then
    # Prefer dasel over jq and yq
    alias jq='dasel -p json'
    alias yq='dasel -p yaml'
fi
