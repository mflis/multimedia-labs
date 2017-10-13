
# Linki
   - codec vs container - https://superuser.com/questions/300897/what-is-a-codec-e-g-divx-and-how-does-it-differ-from-a-file-format-e-g-mp/300997#300997


# Instalacja
 - `sudo apt install  ffmpeg` - wersja 3.2.4, nie ma codec-a do narrowband
 - `docker pull jrottenberg/ffmpeg` - daily build, zawiera  codec do narrowband(zad II/1/f)

# Odpalanie dockera
 - `docker run  --rm -v (pwd):/tmp/workdir -w="/tmp/workdir" jrottenberg/ffmpeg  KOMENDY` -Wersja fish shell
 - `docker run --rm -v ``pwd``:/tmp/workdir -w="/tmp/workdir" jrottenberg/ffmpeg  KOMENDY` - Wersja bash shell:
 - `alias ffmpeg " docker run --rm  -v (pwd):/tmp/workdir -w="/tmp/workdir" jrottenberg/ffmpeg -y"` - alias chowający dokcera

### Opcje
-  `--rm` - usuń kontener po zakończeniu wykonania komendy 
- `-v (pwd):/tmp/workdir` - podmontowanie obecnego katalogu na host do `/tmp/workdir`
-  `-w="/tmp/workdir"` - ustawienie bieżącego katalogu wenątrz dockera
  Podsumowując: docker widzi nasz obecny katalog 
- `-y` - flaga dla ffmpeg, aby nadpisywała plik wyjściowy bez pytania

## Zadanie II – Kompresja g.7xx

### Opcje 
- `-i` - plik wejściowy
- `-acodec` lub `-codec:a` - kodek audio. Własciwy codec można znaleźć za pomocą `ffmpeg -encoders | grep SZUKANY_CODEC`
- `-ab` - audio bitrate
- `-ar` - audio sampling frequency
- `-ac` - number of audio channels


-------------
1) Przy użyciu programu ffmpeg przekonwertować przykładowe pliki audio
(zawierające muzykę i mowę) następująco:

- a) [bitrate dla przepustowości DS0] na format wav, pcm (brak kompresji),
częstotliwość próbkowania 8kHz, słowo kodowe 8 bitów bez znaku, bitrate
64kbity/s, jeden kanał  
```
ffmpeg -i Alesis-Sanctuary-QCard-Wind.wav -acodec pcm_u8 -ab 64k -ar 8k -ac 1 out.wav
```
- b) [bardzo niska częstotliwość próbkowania] na format wav, pcm (brak kompresji),
częstotliwośc próbkowania 1kHz, słowo kodowe 8 bitów bez znaku
- c) [g.711 A-law] na format wav, pcm alaw, częstotliwość próbkowania 8kHz, słowo
kodowe 8 bitów (z oryginalnych 16 bitów)
- d) [g.711 µ-law] na format wav, pcm mulaw, częstotliwość próbkowania 8kHz,
słowo kodowe 8 bitów (z oryginalnych 16 bitów)
- e) [g.722] na format g722, częstotliwość próbkowania 16kHz, słowo kodowe 16
bitów, bitrate 64kbity/s
- f) [amr] na format amr (narrowband), częstotliwość próbkowania 8Khz, jeden
kanał, wszystkie dostępne bitrate (sprawdzić jakie są dostępne)


## Zadanie III – Kompresja mp3

- `-qscale:a` - jakość kompresji przy mp3 . Dopuszczalne wartości `0-9`. Niższa cyfra -> lepsza jakość -> większy rozmia  

1) [VBR] Skompresować przykładowe pliki dźwiękowe (mowa, muzyka) z wykorzystaniem kodeka MP3 w trybie VBR. Porównać rozmiary plików oryginalnych i po kompresji oraz odsłuchowo sprawdzić jakość otrzymanych rezultatów. Należy przetestować efekty dla co najmniej 3 różnych wartości parametru określającego jakość kompresji.

``` ffmpeg -i lvb-sym-5-1\ \(1\).wav  -codec:a libmp3lame -qscale:a 2 out2.mp3 ```

2) [CBR] Skompresować przykładowe pliki dźwiękowe (mowa, muzyka) z wykorzystaniem kodeka MP3 w trybie CBR. Porównać rozmiary plików oryginalnych i po kompresji oraz odsłuchowo sprawdzić jakość otrzymanych rezultatów.
Sprawdzić jaki najniższy bitrate można osiągnąć i jaka jest jakość po kompresji.
3) [CBR niski bitrate] Jeśli chcemy uzyskać niższy CBR niż przy użyciu samego
programu ffmpeg. Konieczne jest bezpośrednie skorzystanie z programu lame.
Można to zrobić wywołując w potoku programy ffmpeg i lame:

`ffmpeg -i [plik źródłowy] -f wav - | lame --cbr -b 8 - out.mp3 `