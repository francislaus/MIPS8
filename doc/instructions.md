# Description of Supported Instructions

In the following text, the instructions get described and
the format is shown.
All instructions are 32 bits wide.

## add

adds the content of two registers and stores the result
in a third register.

The format of the instruction is:

`add $rd, $ra, $rb`,

where `$ra + $rb` is stored in `$rd`.

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100000`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|

## addi

adds the content of one register and a 16 bit long immediate and
stores the result a second register.

The format of the instruction is:

`addi $ra, $rb, imm`,

where `$rb + imm` is stored in `$ra`.

The according instruction encoding format is:

|`001000`|`$ra`|`$rb`|`imm`|
|:-:|:-:|:-:|:-:|
|6|5|5|16|

## and

applies the `and` operation to the contents of two registers
and stores the result in a third register.

The format of the instruction is:

`and $rd, $ra, $rb`,

where `$ra and $rb` is stored in `$rd`.

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100100`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|

## beq

branches to a relative offset if the contents of the two input
registers are equal.

The format of the instruction is:

`beq $ra, $rb, imm`,

where `$pc + (imm * 4)` is stored in `$pc` if `$ra == $rb`,
otherwise no action is taken. The multiplication by four
is done because of the fact that instructions are 32 bit wide.

The according instruction encoding format is:

|`000100`|`$ra`|`$rb`|`imm`|
|:-:|:-:|:-:|:-:|
|6|5|5|16|

## j

jump to the destination address, which is an immediate.

The format of the instruction is:

`j dest`,

where `dest` is stored in `$pc`.

The according instruction encoding format is:

|`000010`|dest|
|:-:|:-:|
|6|26|

## lb

load a byte addressed by an immediate and the content of a
register into another register.

The format of the instruction is:

`lb $ra, imm($rb)`,

where the byte at address `$rb + imm` is stored in `$ra`.

The according instruction encoding format is:

|`100000`|`$ra`|`$rb`|`imm`|
|:-:|:-:|:-:|:-:|
|6|5|5|16|

## or

applies the `or` operation to the contents of two registers
and stores the result in a third register.

The format of the instruction is:

`or $rd, $ra, $rb`,

where `$ra or $rb` is stored in `$rd`.

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100101`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|

## sb

stores the content of a register (a byte) to a memory location
addressed by a register and an immediate

The format of the instruction is:

`sb $ra, imm($rb)`,

where the byte in `$ra` is stored at address `$rb + imm`.

The according instruction encoding format is:

|`101000`|`$ra`|`$rb`|`imm`|
|:-:|:-:|:-:|:-:|
|6|5|5|16|

## slt

assigns a value to a register depending on whether the content
of another register is less than the content of a third register.

The format of the instruction is:

`slt $rd, $ra, $rb`,

where `1` is stored in `$rd` if `$ra < $rb`,
otherise `0` is stored in `$rd`.

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`101010`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|

## sub

subtracts the content of two registers and stores the result
in a third register.

The format of the instruction is:

`sub $rd, $ra, $rb`,

where `$ra - $rb` is stored in `$rd`.

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100010`|
|:-:|:-:|:-:|:-:|:-:|:-:|
|6|5|5|5|5|6|