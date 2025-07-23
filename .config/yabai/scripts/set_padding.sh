# Function to execute a command and return the output
executeCommand() {
    /opt/homebrew/bin/yabai -m $@
}

# Function to set top padding
setTopPadding() {
    local padding=$1

    local currentTopPadding=$(executeCommand "config external_bar")
    if [[ $currentTopPadding == "main:$padding:0" ]]; then
        echo "[Padding] Top | $padding | No change"
        return
    fi

    executeCommand "config external_bar main:$padding:0"
    echo "[Padding] Top | $padding"
}

# Main script
DOCKED_DISPLAY_UUIDS=("C8ED11CF-ED3E-4EB4-9B78-DD83D978B8E6" "37D8832A-2D66-02CA-B9F7-8F30A301B230")

# Get the UUID of the main display
mainDisplay=$(executeCommand "query --displays" | jq -r '.[0] | {uuid: .uuid, index: .index}')
mainDisplayUUID=$(echo "$mainDisplay" | jq -r '.uuid')
mainDisplayIndex=$(echo "$mainDisplay" | jq -r '.index')

setTopPadding 35

