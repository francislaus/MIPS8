# Description of Supported Instructions

In the following text, the instructions get described and
the format is shown.
All instructions are 32 bits wide.

## add

adds the content of two registers and stores the result
in a third register.

The format of the instruction is:

`add $rd, $ra, $rb`,

where `$ra + $rb` is stored in `$rd`

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100000`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|

## addi

adds the content of one register and a 16 bit long immediate and
stores the result a second register.

The format of the instruction is:

`add $ra, $rb, imm`,

where `$rb + imm` is stored in `$ra`

The according instruction encoding format is:

|`001000`|`$ra`|`$rb`|`imm`|
|:-:|:-:|:-:|:-:|
|6|5|5|16|

## and

applies the `and` operation to the contents of two registers
and stores the result in a third register.

The format of the instruction is:

`and $rd, $ra, $rb`,

where `$ra and $rb` is stored in `$rd`

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100100`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|