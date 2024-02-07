#!/bin/bash

# Define the function to process JSON data
results() {
    pass_cnt=0
    fail_cnt=0
    skip_cnt=0

    # Iterate through the JSON data
    for elements in $(echo "$1" | jq -r '.[0].elements[]'); do
        for step in $(echo "$elements" | jq -r '.steps[]'); do
            step_status=$(echo "$step" | jq -r '.result.status' | tr '[:upper:]' '[:lower:]')
            case $step_status in
                "passed")
                    ((pass_cnt++))
                    ;;
                "failed")
                    ((fail_cnt++))
                    ;;
                "skipped")
                    ((skip_cnt++))
                    ;;
                *)
                    ;;
            esac
        done
    done

    # Output the results
    echo "Passed: $pass_cnt, Failed: $fail_cnt, Skipped: $skip_cnt"
}

file_path="cucumber.json"

# Check if the file exists
if [ -f "$file_path" ]; then
    # Read and process the JSON data
    json_data=$(cat "$file_path")
    results "$json_data"
else
    echo "Error: File $file_path not found."
    exit 1
fi
