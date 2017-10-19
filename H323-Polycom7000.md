-Multimedia i transmisje multimedialne – Laboratorium H 01
Tematyka:
H323 Podstawy
Zadanie I – Sprawdzenie podstawowej funkcjonalności punktu końcowego
 - getting-started - http://support.polycom.com/global/documents/support/user/products/video/vsx_series_getting_started_guide.pdf

 - admin-guide - https://support.polycom.com/content/dam/polycom-support/products/Telepresence-and-Video/VSX%20Series/user/en/vsx_series_admin_guide.pdf

 -  1) bezpośrednie połączenie audio/video z innym punktem końcowym wskazanym za pomocą adresu IP

```
Placing a Video Call
```

-  2) bezpośrednie połączenie audio z innym punktem końcowym wskazanym za
pomocą adresu IP

```
getting-started - Placing an Audio-only Call
```

- 3) odbierania i odrzucanie połączeń

```
getting-started - 
Answering a Video Call
Ending a Video Call
```
- 4) wyciszanie mikrofonu
```
getting-started - 
Muting the Microphone
```
 - 5) wyłączanie kamery
 - 6) selfview - to jest chyba to samo co PIP
 - 7) pip
 ```
 getting-started- 
Showing, Moving, and Turning Off the PIP 
```
 - 8) automatyczne odbieranie połączeń przychodzących
 ```
 getting-started - 
 Answering Calls Automatically
```
 -  9) limitowanie maksymalnego czasu trwania połączenia
 ```
 admin-guide - 
 Configuring Call Settings / Maximum Time in Call
 ```
 - 10) funkcja 'Do Not Disturb'
 ```
 getting-started -
Changing the Way Calls Are Answered / Temporarily Refusing Calls 
```
 - 11) książka telefoniczna
```
getting-started -
Working with Directory Entries
```

 - 12) Diagnostyka – podgląd parametrów podczas połączenia]*
 ```
 admin-guide - 
 Statistics and Diagnostics / Call Statistics
 ```

 - 13) [Przypisanie numerów speed dials]*
```
admin-guide - 
Customizing the Home Screen /  Displaying Contacts on the Home Screen
```
*) O ile punkt końcowy zapewnia taką funkcjonalność
Zadanie II – Sprawdzenie wpływu dopuszczalnego pasma (bandwidth) na
jakość transmisji – co najmniej dla 3-ch wartości:
```
admin-guide - 
Specifying Quality of Service /  Maximum Transmit Bandwidth , Maximum Receive Bandwidth
albo: Configuring Call Preferences / 4. Preferred Speed for Placing Calls , Maximum Speed for Receiving Calls
```
 - 14)minimalnej (np. 64 kbits/s)
 - 15)maksymalnej (np. 512 kbits/s)
 - 16)pośredniej (np. 320 kbits/s)
Zadanie III – Rejestracja za pomocą programu Wireshark transmisji pomiędzy
punktami końcowymi.
 - 1) Analiza transmisji RTP – [Wireshark] Telephony -> RTP -> Show All Streams.
Sprawdzenie strumienie były przesyłane, jakie kodowanie zostało użyte przez
punkty końcowe (Payload)
 - 2) Analiza strumienia audio – [Wireshark] wybranie strumienia audio widocznego w
oknie 'Wireshark: RTP Streams' następnie przycisk 'Analyze'.
Sprawdenie: mksymalnego i średniego jitter, ilości pakietów utraconych, max delta
(time).
Wizualna prezentacja analizy po wybraniu w oknie 'Wireshark: RTP Streams
Analysis' przycisku 'Graph'
Opis parametrów anazlizowanego strumienia znajduje się w podrozdziale 'RTP
stream analysys' na stronie https://wiki.wireshark.org/RTP_statistics
 - 3) Odtwarzanie strumienia audio – [Wireshark] w oknie 'Wireshark: RTP Streams
Analysis' (dla strumienia audio) przycisk 'Save payload...', wybranie formatu '.raw' i
wskazanie ścieżki dla zapisywanego pliku. W rezultacie zostanie zapisamy plik
zawierający payload transmitowanych danych (np. dane w formacie g.711 u-law).
Należy dokonać konwersji na format .wav z kodowaniem pcm 16 little endian przy
użyciu program ffmpeg i następnie odsłuchać wynikowy plik .wav
Zadanie IV [nadobowiązkowe] – H 323 i NAT
 - 1) Podłączyć dwa end pointy H 323 w następujący sposób:
[End point 1] ->- [NAT] ->- [End point 2]
Czyli end point 2 znajduje się za NATem.
Sprawdzić (w manualu do urządzenia nr  - 2) jakie porty muszą być otwarte
(propagowane przez NAT) do poprawnego zestawienia transmisji H 323 między
punktami końcowymi nr 1 i 2.
Skonfigurować odpowiednio NAT i przetestować możliwość wykonywania połączeń
(w obie strony) między punktami końcowymi 1 i 2.
Ustawienie monitorowania ruchu – switch Cisco
Switch(config)# no monitor session 1
Switch(config)# monitor session 1 source interface gigabitethernet0/1
Switch(config)# monitor session 1 destination interface gigabitethernet0/2
Switch(config)# end
Switch# show monitor session 1
Session 1
---------
Source Ports:
 RX Only: None
 TX Only: None
 Both: Gi0/1
Destination Ports: Gi0/2