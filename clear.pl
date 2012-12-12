#!/usr/bin/perl -w

use Device::SerialPort;
use Text::Wrap;

# Note: the portvalue we set below can be got from the Arduino IDE when you 
# upload the sketch... I have a method of automating the port discovery 
# on Mac OS X but I've not tested it on other platforms so I took it out 
# of this version... hardcoding sucks but sometimes it works.

my $port = Device::SerialPort -> new("/dev/cu.usbmodem411");

$port->databits(8);
$port->baudrate(9600);
$port->parity("none");
$port->stopbits(1);

$hex = pack('C*', 0xFE, 0x58);
$port->write($hex);


__END__
