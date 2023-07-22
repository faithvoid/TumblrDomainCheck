#!/bin/bash

function is_tumblr_domain_available() {
    local domain="$1"
    local url="https://$domain"
    local page_content=$(curl -s "$url")

    if [[ "$page_content" =~ "There's nothing here." ]]; then
        return 0 # Domain available
    else
        return 1 # Domain in use
    fi
}

# Replace the array elements with the Tumblr domains you want to monitor
tumblr_domains=("example1.tumblr.com" "example2.tumblr.com" "example3.tumblr.com")

function show_notification() {
    local domain="$1"
    local os_name=$(uname -s)

    if [ "$os_name" = "Darwin" ]; then
        local os_version=$(sw_vers -productVersion)
        # Check macOS version for compatibility with osascript
        if [[ "$os_version" == 10.* ]]; then
            osascript -e "display notification \"Good news! The domain '$domain' is now available!\" with title \"Tumblr Domain Check\""
        else
            echo "Good news! The domain '$domain' is now available!"
        fi
    else
        notify-send "Tumblr Domain Check" "Good news! The domain '$domain' is now available!"
    fi
}

while true; do
    for tumblr_domain in "${tumblr_domains[@]}"; do
        if is_tumblr_domain_available "$tumblr_domain"; then
            show_notification "$tumblr_domain" # Show notification when domain is available
        else
            echo "The domain '$tumblr_domain' is in use."
        fi
    done

    sleep 3600 # Wait for 1 hour (3600 seconds) before checking again
done
