# *Zastosowania systemów wbudowanych* - projekt
##### Prowadzący: *dr inż. Marek Woda*

## Temat: Domowy serwer NAS
## Skład grupy:
- **Przemysław Wujek** *234983*
- **Paweł Czarnecki** *234974*
- **Michał Madarasz** *238903*
- **Artsiom Vasiliuk** *239517*

## Konfiguracja SSH
Żeby uzyskać dostęp do urządzenia RPI, będzie potrzebny klucz SSH. Klucz można stworzyć przy użyciu polecenia:
```bash
ssh-keygen -t rsa -b 4096 -f rpi
```
Następnie program poprosi o podanie hasła do klucza SSH. Tu należy podać hasło w celu podwyższenia bezpieczeństwa. W momencie przejęcia takiego klucza istnieje kolejny etap uwierzytelniania. Do przechowywania haseł zaleca się stosowanie menedżerów haseł.
Po wykonaniu poleceń program powinien utworzyć dwa klucze SSH. Jeden publiczny, a drugi prywatny. Klucza prywatnego nie wolno udostępniać! Klucz publiczny będzie służył do zdalnego logowania się do urządzenia RPI.
