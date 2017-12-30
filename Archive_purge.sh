#!/bin/sh
export DATE=`date '+%m%d%y'`
TARGET_LOGIN=sys
TARGET_PASSWD=phone4me
ORACLE_SID=$1
LOG_DIR=/opt/app/oracle/admin/scripts/logs
LOG=$LOG_DIR/"$DATE"_arch_purge.log
rman  log $LOG_DIR/"$ORACLE_SID"_"$DATE"_arch_purge.log  <<EOF
 connect target $TARGET_LOGIN/$TARGET_PASSWD@$ORACLE_SID
run
{
delete noprompt archivelog all completed before 'sysdate - 10';
}
EOF
exit;

