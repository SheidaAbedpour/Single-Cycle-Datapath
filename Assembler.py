def instructureToBin(asm):
    ins = list(asm.split())
    opCode, rd, rs, rt, imm, funct = "", "", "", "", "", ""
 
    match ins[0]:
        case "and":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 0)), (map(bin, (map(int, ins[1:]))))
        case "or":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 1)), (map(bin, (map(int, ins[1:]))))
        case "add":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 2)), (map(bin, (map(int, ins[1:]))))
        case "sub":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 3)), (map(bin, (map(int, ins[1:]))))
        case "mul":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 4)), (map(bin, (map(int, ins[1:]))))
        case "div":
            (opCode, funct), (rd, rs, rt) = map(bin, (0, 5)), (map(bin, (map(int, ins[1:]))))
        case "andi":
            (opCode), (rt, rs, imm) = bin(1), (map(bin, (map(int, ins[1:]))))
        case "ori":
            (opCode), (rt, rs, imm) = bin(2), (map(bin, (map(int, ins[1:]))))
        case "bnq":
            (opCode), (rs, rt, imm) = bin(3), (map(bin, (map(int, ins[1:]))))
        case "lw":
            (opCode), (rt, imm, rs) = bin(4), (map(bin, (map(int, ins[1:]))))
        case "sw":
            (opCode), (rt, imm, rs) = bin(5), (map(bin, (map(int, ins[1:]))))

    return (opCode, rs, rt, rd, imm, funct)
   
def standardizeBin(opCode, rs, rt, rd, imm, funct):
    return opCode[2:].zfill(4), rs[2:].zfill(4), rt[2:].zfill(4), rd[2:].zfill(4), imm[2:].zfill(8), funct[2:].zfill(4)

def decode(ins):
    if '\n' in ins:
        ins = ins[:-1]
        
    opCode, rs, rt, rd, imm, funct = standardizeBin(*instructureToBin(ins))
    
    if opCode == "0000":
        return f"{opCode}{rs}{rt}{rd}{funct}"
    else:
        return f"{opCode}{rs}{rt}{imm}"
    
def decodeInstructions(path):
    fRead = open(path, "r")
    
    fWrite = open("DecodeInstructions.txt", "w")
    for line in fRead:
        fWrite.write(decode(line) + "\n")        
        

decodeInstructions("Instructions.txt")