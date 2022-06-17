#!/bin/bash
#
# AUTHOR  : avimehenwal
# CREATED : Wed Dec  9 12:32:08 AM CET 2020
# PURPOSE : Image data url format

mimetype=$(file -bN --mime-type "$1")
content=$(base64 -w0 < "$1")
dataurl="url('data:$mimetype;base64,$content')"

echo "${dataurl}"
firefox --new-window "$dataurl"

# END

