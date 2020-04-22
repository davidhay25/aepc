#!/bin/bash


# echo "Applying IG fix..."
# ./fixIG.js
# echo "Fix complete.."

set -e
java -jar input-cache/org.hl7.fhir.publisher.jar -ig ig.ini # -tx https://primarycare.ontoserver.csiro.au/fhir

echo "zipping output..."

cd ~/IG/auPrimaryCare/shorthand/build/output

zip -r -X archive.zip . > /dev/null


while true; do
    read -p "Do you wish to upload the zipped output to the server (default is No)? " yn
    case $yn in
        [Yy]* ) scp ~/IG/auPrimaryCare/shorthand/build/output/archive.zip root@igs.clinfhir.com:/var/www/auPrimaryCare; break;;
        [Nn]* ) exit;;
        * ) exit;;
    esac
done