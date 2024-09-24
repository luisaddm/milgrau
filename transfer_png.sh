origin=$PWD
process=$origin/05-data_level1_processed/png_files/
site_folder=/usr/local/leal-site/
re="^[0-9]+$"

scp -P 443 $origin/10-ql_htmlfiles/*.html lealsite@gescon.ipen.br:${site_folder}ql

cd $process
shopt -s nullglob
year_folder=(*/)
shopt -u nullglob

months_abrev=("jan" "fev" "mar" "abr" "mai" "jun" "jul" "ago" "set" "out" "nov" "dez")

for yyyy in ${year_folder[@]} 
do 
	cd $yyyy
	
	shopt -s nullglob
	month_folder=(*/)
	shopt -u nullglob
	
	for mm in ${month_folder[@]}
	do
		scp -P 443 $process$yyyy$mm*.png lealsite@gescon.ipen.br:${site_folder}measurements/$yyyy${mm:0:2}${months_abrev[10#${mm:0:2}-1]}/


	done
	
	cd ..
done

