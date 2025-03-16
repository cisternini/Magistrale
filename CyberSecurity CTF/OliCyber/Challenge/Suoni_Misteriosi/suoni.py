from pydub import AudioSegment
import numpy as np
import scipy.signal as signal

# Funzione per analizzare l'audio e riconoscere i segnali Morse
def analizza_audio(audio_file):
    # Carica il file audio
    audio = AudioSegment.from_file(audio_file)

    # Converti l'audio in un array numpy
    samples = np.array(audio.get_array_of_samples())
    
    # Normalizza l'array
    samples = samples / np.max(np.abs(samples))
    
    # Rileva i picchi per i punti e le linee
    threshold = 0.3  # Soglia per considerare un segnale
    peaks, _ = signal.find_peaks(samples, height=threshold)

    # Trasformazione dei segnali in codice Morse
    morse_code = ""
    prev_time = 0
    for peak in peaks:
        duration = peak - prev_time
        if duration < 20:  # Durata breve
            morse_code += "."
        else:  # Durata media
            morse_code += "-"
        prev_time = peak
    
    return morse_code

# Funzione per decodificare il codice Morse
def decodifica_morse(morse_code):
    morse_dict = {
        '.-': 'A', '-...': 'B', '-..': 'D', '.': 'E', '..-.': 'F',
        '--.': 'G', '....': 'H', '..': 'I', '.---': 'J', '-.-': 'K',
        '.-..': 'L', '--': 'M', '-.': 'N', '---': 'O', '.--.': 'P',
        '--.-': 'Q', '.-.': 'R', '...': 'S', '-': 'T', '..-': 'U',
        '...-': 'V', '.--': 'W', '-..-': 'X', '-.--': 'Y', '--..': 'Z',
        '-----': '0', '.----': '1', '..---': '2', '...--': '3', '....-': '4',
        '.....': '5', '-....': '6', '--...': '7', '---..': '8', '----.': '9',
    }

    # Dividi il codice Morse in lettere e decodifica
    letters = morse_code.split("   ")  # Tre spazi rappresentano una nuova lettera
    decoded_message = ""
    
    for letter in letters:
        decoded_message += morse_dict.get(letter, '')  # Decodifica il lettera in codice Morse

    return decoded_message

# Esempio di utilizzo
audio_file = "comunicazione.wav"
morse_code = analizza_audio(audio_file)
print(f"Codice Morse: {morse_code}")

# Decodifica il codice Morse
messaggio_decodificato = decodifica_morse(morse_code)
print(f"Messaggio Decodificato: {messaggio_decodificato}")