SITE_ROOT=`cat secret/site_root`
SERVER=`cat secret/server`
ACCOUNT=`cat secret/account`
PASSWORD=`cat secret/password`
sshpass -p${PASSWORD} ssh ${ACCOUNT}@${SERVER} "cd yuchiki.net; ls | grep -v 'kantan-cgi' |xargs rm -r"
sshpass -p${PASSWORD} scp -r ./root/* ${ACCOUNT}@${SERVER}:${SITE_ROOT}