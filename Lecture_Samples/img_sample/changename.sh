for file in image.jpg.*; do
  new_name=$(echo "$file" | sed 's/image\.jpg\.//')
  mv "$file" "image$new_name.jpg"
done