

export YABAI_CMD="$(which yabai) -m"
check_exist() {
  number_of_displays="$($YABAI_CMD query --displays | jq '. | length')"
   
  echo $number
}
check_exist
