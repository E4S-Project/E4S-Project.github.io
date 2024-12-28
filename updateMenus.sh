#!/bin/bash
htmlWithMenus="Deployments.html DocPortal.html about.html contact.html documentation.html  download.html events.html faq.html index.html join.html policies.html e4s-cl.html"

lead='^<!--MENU START-->$'
tail='^<!--MENU END-->$'

for html in $htmlWithMenus
do
output=$(sed -e "/$lead/,/$tail/{/$lead/{p; r MenuBlob.html
};/$tail/p;d}" $html)

echo "$output" > $html
#echo $html

done
