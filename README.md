
# Single Cycle Datapath

An impplementation of 20-bit ISA.

The single-cycle implementation follows the below data path:

![App Screenshot](https://s8.uupload.ir/files/cpu_ohnv.png)




## Instructions


#### R-type

| opcode    | rs       | rt      | rd      | fucntion|
| :-------- | :------- | :-------|:------- | :-------|
| 19:16 | 15:12 | 11:8 | 7:4 | 3:0 |

opcode in all R-type instruction is "0000".

instructions include: add, sub, mul, div, and, or



#### I-type

| opcode    | rs       | rt      | fucntion|
| :-------- | :------- | :-------|:-------|
| 19:16 | 15:12 | 11:8 | 7:0 | 

instructions include: bnq, lw, sw, andi, ori



## ISA

![App Screenshot](https://s8.uupload.ir/files/isa_c65s.png)


## Tech 

**HDL:** ISE(Language: Verilog)

**Design:** Logisim

**Assembler:** Python



## Running Tests

Run the following command in assembler.

```bash
ori 1 1 10
ori 2 2 4
add 3 1 2
sub 4 1 2
mul 5 1 2
and 7 1 2
or 8 1 2
sw 1 0 0
lw 9 0 0
bnq 3 3 20
bnq 3 4 30
```
Run HDL using machine code in binary and Logisim in hex. 


## Team

- [Sheida Abedpour](https://github.com/SheidaAbedpour)
- [Matin Azami](https://github.com/InFluX-M)
- [Asal Khaef](https://github.com/asalkhaef)

