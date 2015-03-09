#!/bin/sh

echo "" > ./files/etc/config/siteselect

dir -1 "$GLUON_SITEDIR"/extra/ | while read FILE
do
site_name="$(cat "$GLUON_SITEDIR"/extra/"$FILE" | grep "site_name" | sed "s/site_name =//; s/,//")"
site_code="$(cat "$GLUON_SITEDIR"/extra/"$FILE" | grep "site_code" | sed "s/site_code =//; s/,//")"

echo "config site"$site_code"" >> ./files/etc/config/siteselect
echo "    option path '/lib/gluon/site-select/"$FILE"'" >> ./files/etc/config/siteselect
echo "    option sitename"$site_name"" >> ./files/etc/config/siteselect
echo "" >> ./files/etc/config/siteselect

done