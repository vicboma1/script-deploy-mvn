mvn -B -e -q -U -s .m2/settings.xml --batch-mode deploy:deploy-file -DgroupId=$1 -DartifactId=$2.$4 -Dversion=$3 -Dpackaging=$4 -Dfile=$5 -DgeneratePom=true -DrepositoryId=deploy-$6 -url=$7
