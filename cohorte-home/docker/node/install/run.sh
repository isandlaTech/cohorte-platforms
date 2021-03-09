#!/bin/bash
echo "--- Boot of Cohorte Container..."
#./opt/init.sh
# check what kind of init we have. init.sh or init.py 
PWD=`pwd`
echo "current dir $PWD"
whoami

echo "set handle sigterm/ sigkill"
_term() { 
  echo "Caught SIGTERM signal! stop cohorte" 
  echo "stop 0" -n | /bin/nc localhost 9001
}

trap _term SIGTERM

echo "check launch_jvm.sh exists"
if [ -f /opt/node/felix/launch/launch_jvm.sh ]; then
	echo "launch launch_jvm.sh "
	echo "start cohorte" 
	dos2unix  /opt/node/felix/launch/launch_jvm.sh
	dos2unix  /opt/node/felix/launch/config.properties
	
	bash /opt/node/felix/launch/launch_jvm.sh
else
	echo "no file /c/opt/node/felix/launch/launch_jvm.sh"
	ls /opt/node/felix/launch/
fi
