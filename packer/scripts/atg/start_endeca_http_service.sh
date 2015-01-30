#!/bin/sh
ENDECA_USER=atgdev
INSTALLER_SH=/home/atgdev/commerce/endeca/PlatformServices/workspace/setup/installer_sh.ini
# We want to use installer_sh.ini variables in this script,
# so we source it here.
source $INSTALLER_SH
# change to user endeca
su $ENDECA_USER -c "/bin/sh -c \"source $INSTALLER_SH; \
 cd $ENDECA_CONF/setup; exec env USER=$ENDECA_USER \
 $ENDECA_ROOT/tools/server/bin/endeca_run.sh\""
