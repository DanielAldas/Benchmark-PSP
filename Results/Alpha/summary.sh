for file in *.stride
do 
	grep -n -A1 SEQ $file > $file.summary
done
