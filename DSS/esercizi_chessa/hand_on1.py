import base64
import os
from cryptography.fernet import Fernet
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
import time

def decrypt(passwd):
    salt = b"\x9aF\xdb^\xd5\x18\xb0\xe2k\r\xfc\xf3\x7f3\xe0\xb5"
    cyphertext = b'gAAAAABlJ678-7eprVhp3wnTslVPcDZzK33bXpQ8WTctjUI8mTobjVwYa7LQfASyRzD2rh1RkB8ufPKsL-xHJyYaUGJa-dDi8wzx2XQzYV6dnnwbw1NJWxsfeb_Ol9_DhGcxQMm8nqjZw-6JHzR3_YtQpiZ4083_btWasC_Jg1EEjupDRp0-vXTwuTuwgYWMLlxwyFox9pCabsieEasHhb8mJFeBhw7xCDbUlLEJLPeUalSUSSv1JuA='
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=salt,
        iterations=100000,
    )
    key = base64.urlsafe_b64encode(kdf.derive(passwd))
    f = Fernet(key)
    try:
        print(f.decrypt(cyphertext))
        print('right password: '+str(passwd)+'\n')
    except:
       # print ('wrong password:'+ str(passwd))
        pass

def char_range(c1, c2):
    for c in range(ord(c1), ord(c2)+1):
        yield chr(c)   
base = ['S','t','e','f','a','n','o']

counter = 0
start_time = time.time()
for posn in range(8):
    for posl in range(9):
        for n in range(10):
            base_copy = base[:]
            base_copy.insert(posn,n)
            for l in char_range('a','z'):
                base_copy2 = base_copy[:]
                base_copy2.insert(posl,l)
                passw = ''.join(map(str, base_copy2)) 
                decrypt(passw.encode())
                counter+=1
                if counter%1000 == 0 : 
                    print(counter)
                    print(time.time()-start_time)
                    start_time = time.time()
                  