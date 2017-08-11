for obj in getlhapdf.sh getlog4cpp.sh getpythia6.sh getlibxml2.sh getroot.sh getcernlib.sh
do
    source $obj
    source ${obj/get/setup}
done
source createsetupscript.sh

