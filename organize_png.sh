origin=$PWD
process=$origin/05-data_level1_processed/
level1=$origin/05-data_level1/
cp_site=copied_to_site/
ql=04-quicklooks_graphics/
rcs=05-rcsignalmean_graphics/
re='^[0-9]+$'

# Check if the folders png_files and copied_to_site exist
if ! [ -d ${process}png_files/ ]
then
	mkdir ${process}png_files/
	mkdir ${process}copied_to_site/
fi

cd $level1
shopt -s nullglob
years_folders=(*/)
shopt -u nullglob


for yyyy in ${years_folders[@]} 
do 
	cd $yyyy	
	
	shopt -s nullglob
	folders=(*/)
	shopt -u nullglob
	
	for png_folder in ${folders[@]}
	do
		year=${png_folder:0:4}
		month=${png_folder:4:2}
		day=${png_folder:6:2}
		
		if [[ $year =~ $re ]] && [[ $month =~ $re ]] && ! [ -d ${process}png_files/$year/ ]
		then
			mkdir ${process}png_files/$year/
		fi
		if [[ $year =~ $re ]] && [[ $month =~ $re ]] && ! [ -d ${process}png_files/$year/$month/ ]
		then
			mkdir ${process}png_files/$year/$month/
		fi

		if [[ $year =~ $re ]] && [[ $month =~ $re ]] && [ -d ${process}png_files/$year/$month/ ]
		then
			cp $level1$yyyy$png_folder${ql}* ${process}png_files/$year/$month/
			cp $level1$yyyy$png_folder${rcs}*30km* ${process}png_files/$year/$month/
			mv $png_folder $process$cp_site
		fi
	
	done

done

