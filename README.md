# Shellcoding
This repository is dedicated to development in ASM 

Extract shellcode from binary :
```bash
objdump -d $FILE|grep '[0-9a-f]:'|grep -v 'file'|cut -f2 -d:|cut -f1-6 -d' '|tr -s ' '|tr '\t' ' '|sed 's/ $//g'|sed 's/ /\\x/g'|paste -d '' -s |sed 's/^/"/'|sed 's/$/"/g'
```

Push string on the stack :
```bash
python -c "payload = 'STRING';print(f'[+] String length : {len(payload)}\n[+] LE string     : {payload[::-1]}\n[+] LE Hex string : 0x{payload[::-1].encode().hex()}\n')"
```

### Reference
https://godbolt.org/
