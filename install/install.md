## Tipus d'Instal·lacions de Grav

Grav CMS es pot instal·lar de diverses maneres segons les vostres necessitats i preferències. A continuació es descriuen alguns dels mètodes més comuns:

### Taula de Continguts

- [Instal·lació Manual](#installació-manual)
- [Utilitzant Docker](#utilitzant-docker)
- [Utilitzant Softaculous](#utilitzant-softaculous)
- [Utilitzant Composer](#utilitzant-composer)
- [Tornar a l'Inici](../README.md)

### Instal·lació Manual

Aquest és el mètode tradicional d'instal·lació de Grav, que implica descarregar els arxius del lloc web oficial i configurar-los manualment al vostre servidor web. Els passos detallats per a aquesta instal·lació es troben a la secció anterior d'aquesta guia.

> Aqui us deixo com he instal·lat Grav CMS en una Màquina Ubuntu 24.04 LTS pas a pas de forma Manual [aqui](/install/localinstall.md)

### Utilitzant Docker

Docker és una eina que permet crear, desplegar i executar aplicacions en contenidors. Grav CMS té una imatge oficial de Docker que facilita la seva instal·lació i desplegament. A continuació es mostren els passos bàsics per instal·lar Grav utilitzant Docker:

> Aqui us deixo com he instal·lat Grav CMS en un Docker pas a pas [aqui](/install/dockerinstall.md)

### Utilitzant Softaculous

Softaculous és un instal·lador automàtic que es troba en molts panells de control d'allotjament web com cPanel. Permet instal·lar Grav CMS amb uns pocs clics:

1. **Accedir a Softaculous**:
    - Inicieu sessió al vostre panell de control d'allotjament web i cerqueu Softaculous.

2. **Buscar Grav**:
    - Utilitzeu la barra de cerca per trobar Grav CMS.

3. **Instal·lar Grav**:
    - Feu clic a "Instal·lar" i seguiu les instruccions per completar la instal·lació.

### Utilitzant Composer

Composer és un gestor de dependències per a PHP que també es pot utilitzar per instal·lar Grav CMS:

1. **Instal·lar Composer**:
    - Seguiu les instruccions oficials per instal·lar Composer des de [aquí](https://getcomposer.org/download/).

2. **Crear un nou projecte de Grav**:
    - Executeu la següent comanda per crear un nou projecte de Grav:
    ```bash
    composer create-project getgrav/grav my-grav-project
    ```

3. **Accedir a Grav**:
    - Navegueu a la carpeta del projecte i inicieu el servidor web integrat de PHP:
    ```bash
    cd my-grav-project
    php -S localhost:8000
    ```
    - Accediu a Grav CMS obrint un navegador web i navegant a `http://localhost:8000`.

Aquestes són algunes de les maneres més comunes d'instal·lar Grav CMS. Trieu el mètode que millor s'adapti a les vostres necessitats i preferències.

# Guia d'Instal·lació de Grav CMS

> Aqui us deixo com he instal·lat Grav CMS en un Ubuntu Server 24.04 LTS pas a pas [aqui](/install/localinstall.md)

## Problemes durant la instal·lació
## Problemes durant la instal·lació

Durant la instal·lació de Grav CMS, podeu trobar alguns problemes comuns. A continuació es descriuen alguns d'ells i com solucionar-los:

1. **Permisos de fitxers**:
    - Assegureu-vos que els fitxers i carpetes tinguin els permisos correctes. Podeu utilitzar les següents comandes per ajustar els permisos:
    ```bash
    find . -type f -exec chmod 644 {} \;
    find . -type d -exec chmod 755 {} \;
    ```

2. **Requisits del servidor**:
    - Comproveu que el vostre servidor compleixi els requisits mínims de Grav CMS, com ara la versió de PHP i les extensions necessàries. Podeu trobar els requisits a la [documentació oficial](https://learn.getgrav.org/basics/requirements).

3. **Errors de dependències**:
    - Si utilitzeu Composer, assegureu-vos que totes les dependències s'han instal·lat correctament. Podeu intentar executar:
    ```bash
    composer install
    ```

4. **Configuració del servidor web**:
    - Assegureu-vos que el vostre servidor web (Apache, Nginx, etc.) estigui configurat correctament per servir Grav CMS. Podeu trobar exemples de configuració a la [documentació oficial](https://learn.getgrav.org/webservers-hosting).

5. **Problemes de memòria cau**:
    - Si observeu comportaments estranys, proveu de netejar la memòria cau de Grav:
    ```bash
    bin/grav clear-cache
    ```

Si continueu tenint problemes, consulteu els fòrums de la comunitat de Grav o la seva [documentació oficial](https://learn.getgrav.org/troubleshooting/common-problems) per obtenir més ajuda.


# Recomanacions

- **Actualitzacions Regulars**: Mantingueu el vostre Grav CMS i tots els plugins actualitzats per garantir que teniu les últimes funcions i correccions de seguretat.
- **Plugins Necessaris**: Instal·leu només els plugins que realment necessiteu. Això ajudarà a mantenir el vostre lloc web ràpid i segur.
- **Còpies de Seguretat**: Realitzeu còpies de seguretat regulars del vostre lloc web per evitar la pèrdua de dades en cas de problemes tècnics o atacs.
- **Optimització del Rendiment**: Utilitzeu tècniques d'optimització com la memòria cau i la compressió d'imatges per millorar el rendiment del vostre lloc web.
- **Seguretat**: Configureu correctament els permisos de fitxers i carpetes, i utilitzeu certificats SSL per assegurar les comunicacions.
- **Documentació**: Consulteu la [documentació oficial de Grav](https://learn.getgrav.org) per obtenir informació detallada sobre la configuració i l'ús de Grav CMS.

Seguint aquestes recomanacions, podreu assegurar-vos que el vostre lloc web amb Grav CMS funcioni de manera eficient i segura.
