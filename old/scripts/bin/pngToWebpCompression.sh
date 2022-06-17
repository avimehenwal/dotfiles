#!/bin/bash
#
# AUTHOR  : avimehenwal
# CREATED : Wed Dec 16 09:17:29 PM CET 2020
# PURPOSE : compress all PNG images to WEBP format
#
# files are renamed in SRC
# output files are placed in DEST
# [ ] NO cleanUp
# [ ] NO S3 upload
# [ ] Compression Gained --du output
# [ ] write logs to a file

SRC=$1
DEST="$SRC/webp"

cleanUp () {
  unset SRC
  unset DEST
  unset findCmd
  unset COUNT
  unset i
}

gracefulExit () {
  echo -e "$1"
  exit 1
}

destDir () {
  [ -d $DEST ] || mkdir -v -p $DEST
}

# Losssy compression in parallel
# use --dry-run to simulate parallel 
pngToWebp () {
  find . -maxdepth 1 -type f -name '*.png' -print |
    parallel --eta cwebp -q 100 {} -o ./webp/{.}_lossy.webp
}

[ -d $SRC ] && cd $SRC || gracefulExit "directory $SRC not found"

echo "searching png files at $SRC"
# FILES=$(find ${SRC} -type f -name "*.png" -print)
findCmd="find . -type f -name '*.png' -print | sed --regexp-extended 's/^.{2}//'"
COUNT=$(eval $findCmd | sed '/^$/d' | wc -l)
echo "$COUNT PNG Files found"
# eval $findCmd

[ $COUNT -gt 0 ] && destDir || gracefulExit "No PNG files found to process $COUNT"
  # parallel -0 cwebp -q 100 {} -o {.}.webp

rename -v 's/\s/_/g' ./*.png && pngToWebp
# for i in $(eval $findCmd); do
#   echo "$(basename --suffix=.png $i)"
# done

# upload to S3

cleanUp

# aws --profile personal-avi s3 sync . s3://avi-anime/intoTheSpiderVerse/
# aws --profile personal-avi s3 ls s3://avi-anime/intoTheSpiderVerse/ | wc
# aws --profile personal-avi s3api list-objects --bucket avi-anime --query 'Contents[].{Key: Key,Size: Size}'

# generate URLs from awsCLI
# aws --profile personal-avi s3api list-objects --bucket avi-anime --query 'Contents[].{Key: Key}' | sort |
#  awk '{prefix="https://avi-anime.s3.amazonaws.com/"};{print prefix$1}' | xargs firefox
# curl URLs in parallel using xargs
# | xargs -P 10 -n 1 curl -I

# xargs --max-args=1 --max-procs=20 curl -o /dev/null --silent --head --write-out '%{url_effective};%{http_code};%{time_total};%{time_namelookup};%{time_connect};%{size_download};%{speed_download};%{speed_upload}\n' < URLs.txt | tee curl.log

xargs --max-args=1 --max-procs=20 curl -o /dev/null --silent --head --write-out '\t%{http_code}\t%{time_total}\t%{url_effective}\n' < URLs.txt | sort -r | tee curl.log



# END
