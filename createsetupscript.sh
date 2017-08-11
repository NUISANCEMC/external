
# Create new setup script
echo "#!/bin/sh " > setupexternal.sh
echo 'NUISANCE_EXTERNAL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"' >> setupexternal.sh
for obj in setuppythia6.sh setuplhapdf.sh setuplog4cpp.sh  setuplibxml2.sh setupcernlib.sh setuproot.sh setupcernlib.sh
do
    if [ -e $obj ]
    then
	cat $obj >> setupexternal.sh
    fi
done
