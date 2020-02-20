# Description of Registers

All registers are 8 bits wide. The binary code
for registers is 5 bits wide, which means that
we can have 32 possible registers, but we do
not use all possible ones.

|Name|Purpose|Binary Code|
|:-:|:-:|:-:|
|`$0`|zero register|`0000`|
|`$1`|general purpose register|`00001`|
|`$2`|general purpose register|`00010`|
|`$3`|general purpose register|`00011`|
|`$4`|general purpose register|`00100`|
|`$5`|general purpose register|`00101`|
|`$6`|general purpose register|`00110`|
|`$7`|general purpose register|`00111`|
|`pc`|program counter|`01000`|