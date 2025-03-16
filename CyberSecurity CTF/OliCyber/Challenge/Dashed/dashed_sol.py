import base64

def suddividi_stringa(stringa):
    return [stringa[i:i + 8] for i in range(0, len(stringa), 8)]

def hex_a_ascii(hex_str):
    # Converte la stringa esadecimale in un numero intero
    numero_intero = int(hex_str, 16)
    # Calcola il numero di byte necessari
    num_byte = (numero_intero.bit_length() + 7) // 8
    # Converte il numero intero in una stringa di byte
    byte_str = numero_intero.to_bytes(num_byte, byteorder='big')
    # Decodifica i byte in una stringa ASCII
    ascii_str = byte_str.decode('ascii')
    return ascii_str
def cifrario_cesare(text, shift):
    risultato = ""
    
    for char in text:
        # Cifratura delle lettere maiuscole
        if char.isupper():
            risultato += chr((ord(char) + shift - 65) % 26 + 65)
        # Cifratura delle lettere minuscole
        elif char.islower():
            risultato += chr((ord(char) + shift - 97) % 26 + 97)
        else:
            risultato += char  # Non cifrare caratteri non alfabetici
            
    return risultato
    



file = open("dashed.txt",'r')
contenuto = file.read()
file.close()
morse_dict = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.',
    'G': '--.', 'H': '....', 'I': '..', 'J': '.---', 'K': '-.-', 'L': '.-..',
    'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.',
    'S': '...', 'T': '-', 'U': '..-', 'V': '...-', 'W': '.--', 'x': '-..-',
    'Y': '-.--', 'Z': '--..',
    
    '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-', 
    '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',

    '.': '.-.-.-', ',': '--..--', '?': '..--..', '\'': '.----.', '!': '-.-.--',
    '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...', ':': '---...',
    ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-',
    '"': '.-..-.', '$': '...-..-', '@': '.--.-.', ' ': '/'
}

parole = contenuto.split()
traduzione = []
for p in parole:
    check = False
    for chiave, valore in morse_dict.items():
        if valore == p:
            traduzione.append(chiave)
            check = True
    if check == False:
        traduzione.append(p)    
print(traduzione)        
lista_stringhe = [str(elem) for elem in traduzione]  # Converte ogni elemento in stringa
stringa = ''.join(lista_stringhe)
lista_esa = stringa.split(',')
byte_array = bytes(int(hex_str, 16) for hex_str in lista_esa)
print(byte_array)
gruppi_8 = suddividi_stringa(byte_array)
print(gruppi_8)
lista_binari = [int(b,2) for b in gruppi_8]
lista_esa = [hex(nume)[2:] for nume in lista_binari]
print(lista_esa)
stringa_ascii = ''.join(lista_esa)
print(stringa_ascii.upper())
ascii_final = hex_a_ascii(stringa_ascii.upper())
print(ascii_final)
bytes_decode = base64.b64decode(ascii_final)
print(bytes_decode)
decode_str = bytes_decode.decode('utf-8')
print(decode_str)
#lista_ascii = [asc.decode('ascii') for asc in lista_esa]
#segmenti = suddividi_stringa(stringa_ascii)
#hex_v=[]
#for b in segmenti:
#     hex_v.append(hex(int(b, 2)))
#     
#cleaned_hex_list = [x[2:] for x in hex_v]  # Rimuove '0x' da ciascun elemento
#
## Unire gli elementi a coppie
#paired_hex = [cleaned_hex_list[i] + cleaned_hex_list[i + 1] for i in range(0, len(cleaned_hex_list), 2)]
#byte_list = [int(x, 16) for x in paired_hex]
#byte_string = bytes(byte_list)
#decoded_bytes = base64.b64decode(byte_string)
#
## Stampa i byte decodificati
#print(decoded_bytes)
#
## Se desideri convertire i byte in una stringa (assumendo che siano caratteri ASCII)
#decoded_string = decoded_bytes.decode('utf-8', errors='ignore')
#print(decoded_string)
#print(byte_string)
cesare = cifrario_cesare(decode_str,13)
print(cesare)