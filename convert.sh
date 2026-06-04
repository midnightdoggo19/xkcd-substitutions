#!/bin/sh

echo "function xkcdSubstitutions(html){"
echo "	var words = ["

jq -r 'to_entries[] | "\t\t{find: new RegExp(\"\\\\b\(.key)\\\\b\", \"gi\"), replace: \(.value | tojson)},"' substitutions.json | sed '$ s/,$//'

echo "	];"
echo ""
echo "	for (var i = 0; i < words.length; i++) {"
echo "		html = html.replace(words[i].find, words[i].replace);"
echo "	}"
echo ""
echo "	return html;"
echo "}"
echo ""
echo "document.body.innerHTML = xkcdSubstitutions(document.body.innerHTML);"
