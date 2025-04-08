#!/usr/bin/env zsh
set -e

# Check whether zsh is installed or not
command -v curl > /dev/null || {
    echo "Please install curl yourself before running this script!"
    exit 1
}

curl -LsSf https://astral.sh/uv/install.sh | sh

for config_file in  ~/.zprofile; do
    if [[ -f "$config_file" ]] && ! grep -q '# >>> python uv config start >>>' "$config_file"; then
            cat << 'EOF' >> "$config_file"
# >>> python uv config start >>>
export UV_PYTHON_BIN_DIR=$HOME/.uv/python/bin
export UV_PYTHON_INSTALL_DIR=$HOME/.uv/python
export UV_TOOL_BIN_DIR=$HOME/.uv/tool/bin
export UV_TOOL_DIR=$HOME/.uv/tool
export PATH=$UV_PYTHON_BIN_DIR:$UV_TOOL_BIN_DIR:$PATH
# <<< python uv config end <<<
EOF
    fi
done
