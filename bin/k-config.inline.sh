#!/usr/bin/env bash

#
# creates an inlined kubeconfig file:
# - takes single optional input file or uses `kubectl config view`
# - depends on `yq` - brew install yq
#

if ! command -v yq >> /dev/null 2>&1; then
    echo "install yq; like brew install yq"
    exit
fi

INPUT=${1:-"INPUT"}
if [ ! -f "$INPUT" ]; then
    echo "$INPUT not a file, using current config:"
    echo "KUBECONFIG=$KUBECONFIG"
    INPUT_DIR=$(pwd)
    echo "inlined kubeconfig file: kubeconfig.inline"
    OUTPUT="$INPUT_DIR/kubeconfig.inline"
    kubectl config view -o yaml > "$OUTPUT"
else
    INPUT_DIR=$(dirname "$INPUT")
    OUTPUT="$INPUT_DIR"/$(basename -- "$INPUT")".inline"
    echo "inlined kubeconfig file: $OUTPUT"
    cp "$INPUT" "$OUTPUT"
fi

# TODO: this is naive and needs to be improved
# only walk the paths of the first cluster and user
declare -a paths=(
    'clusters[0].cluster.certificate-authority'
    'users[0].user.client-certificate'
    'users[0].user.client-key'
)

for path in "${paths[@]}"; do
    val=$(yq r "$OUTPUT" "$path")
    if [ -z "$val" ]; then
        continue
    elif [ -f "$val" ]; then
        file="$val"
    elif [ -f "$INPUT_DIR/$val" ]; then
        file="$INPUT_DIR/$val"
    else
        continue
    fi
    encoded=$(base64 < "$file" | tr -d '\r\n')
    yq d -i "$OUTPUT" "$path"
    yq w -i "$OUTPUT" "$path-data" "$encoded"
done
