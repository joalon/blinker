CC := avr-gcc

.PHONY: install clean

all: build strip install

clean:
	rm *.o *.elf *.hex

build: blink.elf
	${CC} -Wall -g -Os -D F_CPU=100000 -mmcu=attiny85 -o blink.elf

strip: blink.hex
	avr-objcopy -O ihex -R .eeprom blink.elf blink.hex

install: strip
	avrdude -p t85 -P /dev/spidev0.0 -c linuxspi -U flash:w:blink.hex
