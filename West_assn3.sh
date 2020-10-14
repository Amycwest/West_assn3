#! /bin/bash

#extract the ID's for each of the snakes: sort them so uniq command works; isolate just the column with the snake ID's using cut;
#grep BTS to get rid of the header; use uniq to get rid of duplicate lines; and send all the snake ID's to a file called names_BTS
sort -k1 BTS_data.txt| cut -f 1 | grep BTS | uniq > names_BTS

#while loop: while reading through the file names_BTS;  grep each of the ID's and add them to a file with the name of the ID
while read snake;
do grep ${snake} BTS_data.txt  >> file_${snake}; done < names_BTS

#remove names_BTS file as it is no longer needed
rm names_BTS


#count the number of files starting with "file" and state "files were created" using the echo command
ls file* | wc -l ; echo "files were created"
