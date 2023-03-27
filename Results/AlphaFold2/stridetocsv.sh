for i in $(wc -l *summary| grep -w 2|awk '{print $2}');\
do #code=$(awk '{print $NF}' $i | sed -n 1p); \
	code=$(echo $i | cut -d . -f 1);  
	length=$(awk '{print $0}' $i | sed -n 1p| sed 's/\(.*\)          /\1\t/'| awk -F"\t" '{print $1}'| awk '{print $NF}'); \
	seq=$(sed -n 1p $i | awk '{print $3}'); \
	structure=$(cat $i| sed -n 2p| sed 's/       /\t/'| awk -F"\t" '{print $2}'| sed -e 's/ /C/g' -e 's/T/C/g' -e 's/S/C/g' -e 's/G/H/g' -e 's/I/H/g' -e 's/b/E/g' -e 's/B/E/g' | cut -c -${length}); \
	echo -e $code'\t'$length'\t'$seq'\t'$structure;\
done 
