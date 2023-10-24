# Note that tests that require virtual serial ports will only work on Linux machines

apt-get install socat

echo "done waiting!"

socat -d -d pty,rawer,echo=0,link=/dev/ttyharness0  pty,rawer,echo=0,link=/dev/ttyharness1