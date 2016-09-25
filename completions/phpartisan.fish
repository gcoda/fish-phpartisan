# remove all
complete -c phpart -e

set art_commands (php artisan list | \
	grep '  ' | \
	sed 's/^  \{1,\}//g' | \
	sed 's/ \{1,\}/\t/' | \
	sed 's/ \{1,\}/ /g' | \
	sed 's/|/ /g')
#
for command in $art_commands
	set art_cmd (echo -n "$command" | cut -f 1 )
	set art_dsc (echo -n "$command" | cut -f 2 )
	complete -c phpart -f -a $art_cmd -d $art_dsc
end
