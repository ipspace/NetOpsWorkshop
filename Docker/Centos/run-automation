docker run -it --rm \
    --user $(id -u):$(id -g) \
    --volume $(pwd):/ansible \
    --volume="/etc/group:/etc/group:ro" \
    --volume="/etc/passwd:/etc/passwd:ro" \
    --volume="/etc/shadow:/etc/shadow:ro" \
    --volume="/home/$USER:/home/$USER" \
    ipspace/automation:centos $@
