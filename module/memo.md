# Oma Salt-moduuli

* Tarkista käyttöjärjestelmä grainsin avulla. Jatka asianmukaisesti (eli hylkää muut paitsi toimivat)
* Tarkista GPU-valmistaja grainsin avulla. Ajureiden päivitys ei onnistu, mutta Jinjan avulla file.managed-tekstitiedosto "Päivitä ajurit!"
* Asenna SteamCMD, sekä muut ohjelmat (jos mitään)
* Käynnistä SteamCMD, kirjaudu sisään etukäteen luodulla käyttäjällä (pillar)
* Lataa TF2 ja hoida asetukset (autoexec ym.), käynnistä peli.

top.sls:

```
base:
  '*':
```
Moduuliin voisi jatkossa lisätä seuraavaa:
* Windows ja Mac -tuen? Mikäli mahdollista
* Linuxille pelipalvelimen luova koodi (uusi käyttäjä, tervapallon purku ja läjä skriptejä verkko-, päivitys- ja ajohommiin)

---
