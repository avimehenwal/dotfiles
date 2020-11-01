function apt.versions --argument NAME -d 'print all available apt versions'
    # apt-cache policy firefox
    apt-cache policy $NAME
end