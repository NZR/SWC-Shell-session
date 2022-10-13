# this script is a wrapper over readings_09.py
# 	readings_09.py: 
#		takes an operation and a list of files
#		prints the result of the operation applied to each file to the command line
# 
# wrapper :
#	input: a single file
#	output: 
#		creation of an output folder
#		output in 1 file per operation -> 3 output files per call 
# 		

set -x

OUTPUT_FOLDER=$1
INPUT_FILE=$2

#Tests could be removed.
if [ -z "$OUTPUT_FOLDER" ]
	then 
		echo "you must provide the output folder - relative or absolute path"
		exit
fi

if [ -z "$INPUT_FILE" ]
	then 
		echo "you must provide an input file - relative or absolute path"
		exit
fi
#create the output file

#recover the name of the file, without its full path: basename command.
output_file_name="$(basename $INPUT_FILE)"
output=$OUTPUT_FOLDER/$output_file_name.output.txt
touch $output
echo "" > $output #clear the content of the output file.


echo ""
echo "### Input parameters ###"
echo "input: about to extract all info of file '$INPUT_FILE'"
echo "input: analysis results will be put in $output"


OPERATIONS="max min mean"


for op in $OPERATIONS 
do
	
	echo "$op">>$output
	python readings_09.py --$op $INPUT_FILE >> $output
	echo "=====">>$output
done
