
## Índex de Continguts

- [Introducció a Grav CMS](#introducció-a-grav-cms)
- [Característiques principals](#característiques-principals)
- [Instal·lació de Grav CMS](instal·lació.md)
- [Configuració de Grav CMS](cms-config.md)
- [Tipografia](#tipografia)



# Introducció a Grav CMS

![Grav Logo](https://getgrav.org/user/pages/media/grav-logo.svg)

Grav CMS és un sistema de gestió de continguts (CMS) modern i de codi obert que se centra en la simplicitat i la velocitat. A diferència d'altres CMS tradicionals, Grav no utilitza una base de dades per emmagatzemar contingut, sinó que empra fitxers Markdown, cosa que el fa extremadament lleuger i fàcil d'utilitzar.

## Característiques principals

- **Rendiment ràpid**: Gràcies a la seva arquitectura basada en fitxers, Grav és extremadament ràpid i eficient.
- **Flexibilitat**: Grav permet una gran personalització a través del seu sistema de plantilles i plugins.
- **Markdown**: Utilitza Markdown per a la creació de contingut, cosa que facilita l'edició i el manteniment.
- **Extensible**: Compta amb una àmplia gamma de plugins i temes que es poden instal·lar per ampliar les seves funcionalitats.
- **SEO amigable**: Inclou característiques integrades per millorar el SEO del teu lloc web.

> Grav CMS és ideal per a desenvolupadors i usuaris que busquen una solució de CMS lleugera i potent sense la complexitat dels sistemes tradicionals basats en bases de dades.

## Tipografia

- Com ja sabeu, quan estem creant pàgines normalment s'utilitzen llenguatges de marcat com HTML i CSS per definir l'estructura i l'estil del contingut. Grav CMS permet utilitzar aquests llenguatges juntament amb Markdown per oferir una experiència de creació de contingut més rica i flexible. Per aprendre les funcionalitats i com funciona ens dirigirem cap a `https://<el-teu-domini>/typography` i aqui us explica com reacciona cada element del markdown visualment.

# Creació de Pàgines

## Versió Grav

- Per crear pàgines a la pàgina per defcete de Grav tenia un guia de com fer-ho, igualment ho explicarem aqui pas a pas, primerament haurem d'obrir la consola de Ubuntu (SSH) i atravessar les carpetes `/grav-admin/user/pages` amb la comanda `cd /var/www/grav-admin/user/pages`.

- Per crear una nova pàgina es tan fàcil com crear un directori amb el numero i nom de la pàgina que voleu donar. EN el meu cas creare un amb nom de _USOLUTIONS_ .

    sudo mkdir 03.usolutions
    sudo nano 03.usolutions/default.md
        ---
        title: Welcome to Usolutions
        ---

        Benvingut a USolutions, el futur de la terra, el control de la tecnologia i la ciencia avançada.

    > Ctrl + S (Per guardar) i Ctrl + X (Per sortir)

- Una vegada creat el fitxer amb el default.md, recàrreguem el navegador i podem veure que a la nostra pàgina de grav tenim una altra pàgina que es la que hem creat fa poc a la consola.

![alt text](images/image5.png)



## Versió Grav-Admin