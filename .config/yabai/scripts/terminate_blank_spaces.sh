export blanks=$(yabai -m query --spaces  | jq '.[] | [.index, .windows] | if (.[1] | length) < 1 then .[0] else empty end' | jq -n '[inputs]' | jq '. | sort_by(100-.) | .[]')
echo gogogo
echo $blanks

for space_index in ${blanks[@]}; do
  #  ${#original_array[@]}-1
  echo "Removing the space with index $space_index..."

  yabai -m space $space_index  --destroy
done

