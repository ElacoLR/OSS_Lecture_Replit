for file in image.jpg.*; do
  newName=$(echo "$file" | sed 's/image\.jpg\.//')
  mv $file "image$newName.jpg"
done