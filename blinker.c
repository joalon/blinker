#include <avr/io.h>
#include <util/delay.h>

int main(void) {
     DDRC = 0xFF;
     while(1) {
         PORTC ~= PORTC;
         _delay_ms(500);
     }
}
