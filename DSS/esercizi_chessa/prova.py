def char_range(c1, c2):
    for c in range(ord(c1), ord(c2)+1):
        yield chr(c)   
base = ['S','t','e','f','a','n','o']

lista = []
for posn in range(8):
   
    for posl in range(9):
 
           
            for n in range(10):
                base_copy = base[:]
                base_copy.insert(posn,n) 
                for l in char_range('a','z'):
                    base_copy2 = base_copy[:]
                    base_copy2.insert(posl,l)
                    passw = ''.join(map(str,base_copy2)) 
                    lista.append(passw)
                   # print("PosizioneN: "+str(posn)+" PosizioneL: "+str(posl)+ " Password: "+passw)
passs = "S0xtefano"

if passs in lista: 
    print("trovata")
else : 
    print("non trovata")


