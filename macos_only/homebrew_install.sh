#!/usr/bin/env bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
    echo "Homebrew installation failed. Please check your network connection or Homebrew availability!"
    exit 1
}

config_file=~/.zprofile
[[ -f "$config_file" ]] && ! grep -q '# Added for homebrew' "$config_file" && {
    cat << 'EOF' >> "$config_file"
# Added for homebrew
export PATH="/opt/homebrew/bin:$PATH"
EOF
}
