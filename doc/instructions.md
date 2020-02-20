# Description of Supported Instructions

In the following text, the instructions get described and
the format is shown.
All instructions are 32 bits wide.

## add

adds two registers and stores the result in a third register

The format of the instruction is:

`add $rd, $ra, $rb`,

where `$ra + $rb` is stored in `$rd`

The according instruction encoding format is:

|`000000`|ra|rb|rd|`00000`|`100000`|
|6|5|5|5|5|6|