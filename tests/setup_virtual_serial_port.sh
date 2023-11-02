# Note that tests that require virtual serial ports will only work on Linux machines

apt-get install socat

socat -d -d pty,rawer,echo=0,link=/tmp/ttyharness0,b38400  pty,rawer,echo=0,link=/tmp/ttyharness1,b38400
