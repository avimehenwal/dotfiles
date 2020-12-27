#!/bin/bash
#
# AUTHOR  : avimehenwal
# CREATED : Fri Dec 18 04:22:17 PM CET 2020
# PURPOSE : print browsing firefoxHistory on terminal

# set -o verbose

firefoxHistory () {
  db=$(find "${HOME}/.mozilla/firefox/mdiq6dhm.default-release" -name "places.sqlite")
  query="select p.url from moz_historyvisits as h, moz_places as p where substr(h.visit_date, 0, 11) >= strftime('%s', date('now')) and p.id == h.place_id order by h.visit_date;"
  todays_urls=$(sqlite3 "${db}" "${query}")
  echo "${todays_urls}"
}

firefoxHistoryReport () {
  # local patterns=(google stack youtube github linkedin reddit)

  # for pattern in "${patterns[@]}"; do
  #   echo -e "${pattern} $(firefoxHistory | rg --count ${pattern})"
  # done
  echo -e "${pattern} $(firefoxHistory | grep --perl-regexp --only-matching '.*?//\K.*?(?=/)' | sort | uniq -c)"
}

firefoxHistory | bat --style=grid,numbers -l url --plain --pager=never
echo -e "\n BROWSING REPORT from today\n"
firefoxHistoryReport | sort --reverse --numeric-sort | column --table --output-width=10 --table-right=1 | bat -l tsv --style=grid
echo -e "\n TOTAL page Visits from today $(firefoxHistory | wc -l)"

# END
