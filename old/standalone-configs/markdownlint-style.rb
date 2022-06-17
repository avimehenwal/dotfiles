#                _ _       _         _
#  _ __ ___   __| | |  ___| |_ _   _| | ___
# | '_ ` _ \ / _` | | / __| __| | | | |/ _ \
# | | | | | | (_| | | \__ \ |_| |_| | |  __/
# |_| |_| |_|\__,_|_| |___/\__|\__, |_|\___|
#                              |___/
#
# https://github.com/markdownlint/markdownlint/blob/master/docs/creating_styles.md

all

# Rule Parameters
rule 'MD013', :line_length => 200
# accepts lists as ones or ordered
rule 'MD029', :style => 'one_or_ordered'

# skip rule MD033 - Inline HTML
exclude_rule 'MD033'
