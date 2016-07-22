#!/bin/bash
for FILE in *.html; do
  echo "Processing ${FILE}"
  if [ "$FILE" == "google17c17b39e5bb1995.html" ]
  then
    echo "Skipping ${FILE}"
    continue
  fi

  perl -i -pe 'BEGIN{undef $/;} s/<!-- begin menu_items -->.*<!-- end menu_items -->/MENU_ITEMS/smg' $FILE
  sed -i '/MENU_ITEMS/r snippets/.menu_items.html' $FILE
  sed -i '/MENU_ITEMS/d' $FILE

  perl -i -pe 'BEGIN{undef $/;} s/<!-- begin brand_address -->.*<!-- end brand_address -->/BRAND_ADDRESS/smg' $FILE
  sed -i '/BRAND_ADDRESS/r snippets/.brand_address.html' $FILE
  sed -i '/BRAND_ADDRESS/d' $FILE

  perl -i -pe 'BEGIN{undef $/;} s/<!-- begin footer -->.*<!-- end footer -->/FOOTER/smg' $FILE
  sed -i '/FOOTER/r snippets/.footer.html' $FILE
  sed -i '/FOOTER/d' $FILE

  perl -i -pe 'BEGIN{undef $/;} s/<!-- begin navbar_brand -->.*<!-- end navbar_brand -->/REPLACE_THIS/smg' $FILE
  sed -i '/REPLACE_THIS/r snippets/.footer.html' $FILE
  sed -i '/REPLACE_THIS/d' $FILE

  perl -i -pe 'BEGIN{undef $/;} s/<!-- begin behandlungszeiten -->.*<!-- end behandlungszeiten -->/REPLACE_THIS/smg' $FILE
  sed -i '/REPLACE_THIS/r snippets/.behandlungszeiten.html' $FILE
  sed -i '/REPLACE_THIS/d' $FILE

  tidy -xml --indent auto --indent-spaces 2 --quiet yes -modify --char-encoding utf8 $FILE
done
