
# Linki
   - codec vs container - https://superuser.com/questions/300897/what-is-a-codec-e-g-divx-and-how-does-it-differ-from-a-file-format-e-g-mp/300997#300997


# Instalacja
`sudo apt install  ffmpeg` - wersja 3.2.4, nie ma codec-a do narrowband
`docker pull jrottenberg/ffmpeg` - daily build, zawiera  codec do narrowband(zad II/1/f)

# Odpalanie dockera
Wersja fish shell:
```
 docker run  --rm -v (pwd):/tmp/workdir -w="/tmp/workdir" jrottenberg/ffmpeg  KOMENDY
```
Wersja bash shell:
```
 docker run --rm -v `pwd`:/tmp/workdir -w="/tmp/workdir" jrottenberg/ffmpeg  KOMENDY
```
### Opcje
-  `--rm` - usuń kontener po zakończeniu wykonania komendy 
- `-v (pwd):/tmp/workdir` - podmontowanie obecnego katalogu na host do `/tmp/workdir`
-  `-w="/tmp/workdir"` - ustawienie bieżącego katalogu wenątrz dockera
  Podsumowując: docker widzi nasz obecny katalog 

## Zadanie II – Kompresja g.7xx

### Opcje 
   - `-i` - plik wejściowy
   - `-acodec` - kodek audio. Wybierany z listy `ffmpeg -encoders`
   - `-ab` - audio bitrate
   - `-ar` - audio sampling frequency
   - `-ac` - number of audio channels

-------------
  - 1) Przy użyciu programu ffmpeg przekonwertować przykładowe pliki audio
(zawierające muzykę i mowę) następująco:

    - a) [bitrate dla przepustowości DS0] na format wav, pcm (brak kompresji),
częstotliwość próbkowania 8kHz, słowo kodowe 8 bitów bez znaku, bitrate
64kbity/s, jeden kanał  - ` ffmpeg -i Alesis-Sanctuary-QCard-Wind.wav -acodec pcm_u8 -ab 64k -ar 8k -ac 1 out.wav`
    - b) [bardzo niska częstotliwość próbkowania] na format wav, pcm (brak kompresji),
częstotliwośc próbkowania 1kHz, słowo kodowe 8 bitów bez znaku
     - c) [g.711 A-law] na format wav, pcm alaw, częstotliwość próbkowania 8kHz, słowo
kodowe 8 bitów (z oryginalnych 16 bitów)
     - d) [g.711 µ-law] na format wav, pcm mulaw, częstotliwość próbkowania 8kHz,
słowo kodowe 8 bitów (z oryginalnych 16 bitów)
e) [g.722] na format g722, częstotliwość próbkowania 16kHz, słowo kodowe 16
bitów, bitrate 64kbity/s
f) [amr] na format amr (narrowband), częstotliwość próbkowania 8Khz, jeden
kanał, wszystkie dostępne bitrate (sprawdzić jakie są dostępne )


2) Porównać odsłuch