# Oma Salt-moduuli

* Tarkista käyttöjärjestelmä grainsin avulla. Jatka asianmukaisesti (eli hylkää muut paitsi toimivat)
* Tarkista GPU-valmistaja grainsin avulla. Ajureiden päivitys ei onnistu, mutta Jinjan avulla file.managed-tekstitiedosto "Päivitä ajurit!"
* Asenna SteamCMD, sekä muut ohjelmat (jos mitään)
* Käynnistä SteamCMD, kirjaudu sisään etukäteen luodulla käyttäjällä (pillar)
* Lataa TF2 ja hoida asetukset (file.managed muutama .cfg-tiedosto), käynnistä peli.

top.sls:

```
base:
  '*':
    - steamcmd
    - steamcmd.tf2
```
Moduuliin voisi jatkossa lisätä seuraavaa:
* Eri käyttöjärjestelmien tuki. Windows ja Mac hoituisivat omalla tavallaan. Lieneekö jatkotoimet mahdollisia.
* Linuxille pelipalvelimen luova koodi (uusi käyttäjä, tervapallon purku ja läjä skriptejä verkko-, päivitys- ja ajohommiin)

---
