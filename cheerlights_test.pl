#!/usr/bin/perl -w

use Device::SerialPort;
use LWP::Simple;
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

$Text::Wrap::columns = 16;
$Text::Wrap::break = '[\s:]';

@contents = qw(red green blue cyan white warmwhite purple magenta yellow orange);

foreach $content (@contents) {
	
	my $hex;
	
	my @colors = (0, 0, 0);
	
	if ($content eq 'red') {
		@colors = (255, 0, 0);
	}
	if ($content eq 'green') {
		@colors = (0, 255, 0);
	}
	if ($content eq 'blue') {
		@colors = (0, 0, 255);
	}
	if ($content eq 'cyan') {
		@colors = (0, 255, 255);
	}
	if ($content eq 'white') {
		@colors = (255, 255, 255);
	}
	if ($content eq 'warmwhite') {
		@colors = (204, 204, 204);
	}
	if ($content eq 'purple') {
		@colors = (204, 0, 255);
	}
	if ($content eq 'magenta') {
		@colors = (204, 0, 153);
	}
	if ($content eq 'yellow') {
		@colors = (255, 255, 0);
	}
	if ($content eq 'orange') {
		@colors = (255, 102, 0);
	}
	
	$hex = pack('C*', 0xFE, 0x58);
	$port->write($hex);
	
	$hex = pack('C*', 0xFE, 0xD0, @colors);
	$port->write($hex);

	$content =~ s/\s//gsi;
	
	$content = wrap("", "\r\n", ("Cheerlights are " . $content . "!"));
	
	$port->write($content);

	sleep(1);

}

__END__
