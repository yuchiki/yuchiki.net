#! /usr/bin/zsh -eu
set -x

branch=$(git symbolic-ref --short HEAD)

case $branch in
    master)
        SITE_ROOT=`cat secret/site_root`
        SERVER=`cat secret/server`
        ACCOUNT=`cat secret/account`
        PASSWORD=`cat secret/password`

        echo "Build with Jekyl."
        jekyll build

        echo "Deploy to the server."
        sshpass -p${PASSWORD} ssh ${ACCOUNT}@${SERVER} "cd yuchiki.net; ls | grep -v 'kantan-cgi' |xargs rm -r"
        sshpass -p${PASSWORD} scp -r ./_site/* ${ACCOUNT}@${SERVER}:${SITE_ROOT}
        ;;
    *) echo "No deploy-task for branch ${branch}.";;
esac