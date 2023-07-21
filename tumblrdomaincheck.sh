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
    notify-send "Tumblr Domain Available" "The domain '$domain' is now available!"
}

while true; do
    for tumblr_domain in "${tumblr_domains[@]}"; do
        if is_tumblr_domain_available "$tumblr_domain"; then
            echo "The domain '$tumblr_domain' is available!"
            show_notification "$tumblr_domain" # Show notification when domain is available
        else
            echo "The domain '$tumblr_domain' is in use."
        fi
    done

    sleep 3600 # Wait for an hour (3600 seconds) before checking again
done
