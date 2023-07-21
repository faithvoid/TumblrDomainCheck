#!/bin/bash

function is_tumblr_domain_available() {
    local domain="$1"
    local url="https://$domain"
    local page_content=$(curl -s "$url")

    if [[ "$page_content" =~ "There's nothing here." ]]; then
        echo "The domain '$domain' is available!"
    else
        echo "The domain '$domain' is in use."
    fi
}

# Replace the array elements with the Tumblr domains you want to monitor
tumblr_domains=("example1.tumblr.com" "example2.tumblr.com" "example3.tumblr.com")

while true; do
    for tumblr_domain in "${tumblr_domains[@]}"; do
        status=$(is_tumblr_domain_available "$tumblr_domain")
        echo "$status"
    done

    sleep 3600 # Wait for an hour (3600 seconds) before checking again
done
