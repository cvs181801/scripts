!/bin/bash
    username = "Test"
    if id "$username" &>/dev/null; then
        echo "User Account '$username' has been found."
    fi
done