<<<<<<< HEAD

For background on CheerLights see: http://www.cheerlights.com/

The USB+Serial Backpack will need to be connected to a computer with Internet access via USB.

The cheerlights.pl Perl script will loop forever (well, until you kill it, or it dies) and request the file at http://api.thingspeak.com/channels/1417/field/1/last.txt which will tell it the current color. The Perl script then 
prints the message (in the appropriate color) to the Adafruit USB+Serial Backpack.

On the Perl side you will need the Device::SerialPort and LWP::Simple modules.

The script cheerlights_test.pl will cycle through all the colors.

The script clear.pl will clear the text from the display.


This code is released under the GPL. 

Pete Prodoehl
pete@rasterweb.net
http://rasterweb.net/raster/
Twitter: @raster

=======
CheerLCD
========

An implementation of CheerLights using an Adafruit USB+Serial Backpack.
>>>>>>> eee37eb89aeb3fc25c42e8e65c3135241d967281
