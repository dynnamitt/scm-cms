BIN=./start.scm
CURL=curl

check:
	$(BIN) -p 5555 & \
		sleep 1 ;
		$(CURL) --data "param1=value1&param2=value2" localhost:5555/x/y/z
