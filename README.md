# Analiza glavnih komponent večdimenzionalnih podatkov

Repozitorij vsebuje celotno delo, opravljeno za mojo diplomsko nalogo: **Analiza glavnih komponent večdimenzionalnih podatkov** .
Repozitorij je organiziran v naslednje mape:

### 1. Algortimi

V mapi `algorithms` so implementacije vseh algoritmov, implementiranih v okviru diplomske naloge:

- TRPCA (Robustna tenzorska analiza glavnih komponent),
- TLRR (Tenzorska predstavitev nizkega ranga),
- RPCA (Robustna analiza glavnih komponent),
- LRR (Predstavitev nizkega ranga),
- general_TRPCA (Robustna tenzorska analiza glavnih komponent z uporabo poljubne obrnljive transformacije).

### 2. Operatorji

Mapa `operators` vsebuje implementacijo vseh potrenih tenzorskih operatorjev.

### 3. Pomožne funkcije

Mapa `helper_functions` vsebuje pomožne funkcije za:

- generiranje tenzorja določenega ranga,
- generiranje Bernoullijevega in Gaussovega šuma,
- vrednotenje metod (izračun napake).

### 4. Analize

Mapa `analysis` vsebuje vse izvedene analize:

- primerjavo med metodami,
- vrednotenje parametrov posameznih metod,
- rekonstrukcijo z različnimi obrnljivimi transformacijami.

### 5. Testi

Mapa `testi` vsebuje:

- kodo za testiranje delovanja posameznih metod,
- testiranje na sintetičnih podatkih.

Testiranje je bilo izvedeno na podatkovni bazi CBS68 (Berkeley Segmentation Database), ki je dostopna v mapi `testne_slike`.
Rezultati, ki so prikazani v diplomski nalogi, so na voljo v mapi `vsi_rezultati_diplomske_naloge`, vsi ostali rezultati pa so v mapi `rezultati`.
