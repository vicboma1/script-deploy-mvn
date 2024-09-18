# script-deploy-mvn


```

config .m2/settings.xml

<servers>
        <server>
            <id>deploy-releases</id>
            <username>${USER}</username>
            <password>${PASS}</password>
        </server>
        <server>
            <id>deploy-snapshots</id>
            <username>${USER}</username>
            <password>${PASS}</password>
        </server>
    </servers>


snapshot

groupID=es.vicboma.scripts
artifactID=file
version=1.0.0.0-snapshot
packaging=war
nameFile=./es/vicboma/target/$artifactID.$packaging
repository=snapshots
repoUrl=https://maven.vicboma.es/nexus/repository/repo-$repository

[$] sh script-deploy-mvn.sh $groupID $artifactID $version $packaging $nameFile $repository $repoUrl 

mvn -B -e -q -U -s .m2/settings.xml --batch-mode deploy:deploy-file -DgroupId=$1 -DartifactId=$2.$4 -Dversion=$3 -Dpackaging=$4 -Dfile=$5 -DgeneratePom=true -DrepositoryId=deploy-$6 -url=$7


release

groupID=es.vicboma.scripts
artifactID=file
version=1.0.0.0
packaging=war
nameFile=./es/vicboma/target/$artifactID.$packaging
repository=releases
repoUrl=https://maven.vicboma.es/nexus/repository/repo-$repository

[$] sh script-deploy-mvn.sh $groupID $artifactID $version $packaging $nameFile $repository $repoUrl 

mvn -B -e -q -U -s .m2/settings.xml --batch-mode deploy:deploy-file -DgroupId=$1 -DartifactId=$2.$4 -Dversion=$3 -Dpackaging=$4 -Dfile=$5 -DgeneratePom=true -DrepositoryId=deploy-$6 -url=$7

```
