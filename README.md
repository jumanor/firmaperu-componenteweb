# Instalador Firma Perú - Componente Web
Una forma sencilla de ejecutar **Firma Perú - Componente Web**

# Requisitos
- Java 8 de Oracle (esta versión tiene javaws).
# Instalación
1. Ejecute **instalador.bat**
2. El **instalador.bat** creara una carpeta *"firmaperu"* en el home del usuario con todos los utilitarios
3. Ejecute **firmaperu.lnk** el cual se encuentra en el escritorio.
4. La primera vez que ejecute **firmaperu.lnk** se descargan varios **jar**, enseguida procedera a ejecutarse.
5. Le solicitara un permiso explicito para ejecutar **Firma Perú - Componente Web** 
6. Cierre sesion, vuelva ingresar.

:warning:Importante (aún por resolver), solamente la primera vez que ejecuta **firmaperu.lnk** el servidor -en algunos casos- no levanta correctamente entonces tiene 3 opciones:
- 1º opción: Ejecute **stop_firmaperu.bat** y luego ejecute **firmaperu.lnk** 
- 2º opción: Cierre sesión y vuelva ingresar (opción recomendada)
- 3º opción: Reinstalar Java 8 (extraño pero funciona).
# Utilitarios
- **status_firmaperu.bat** verifica el estado de **Firma Perú - Componente Web** 
- **stop_firmaperu.bat** para el servicio **Firma Perú - Componente Web** 
- **delete_inicio_sesion.bat** elimina la opcion de ejecutarse al inicio de la sesion. 

# Tutoriales
- Aqui un [video 01](https://www.youtube.com/watch?v=3krIhVr6NCs) de referencia
# Características
- No se utiliza **Microsoft Click Once**.
- No es necesario instalar extensiones o plugins en Chrome o Firefox.
- No es necesario tener permisos de administrador.
- **Firma Perú - Componente Web** se puede configurar para que se ejecute automaticamente al iniciar sesión en S.O Windows.
- Se crea acceso directo en el Escritorio para ejecutar manualmente.

# Contribución

Por favor contribuya usando [Github Flow](https://guides.github.com/introduction/flow/). Crea un fork, agrega los commits, y luego abre un [pull request](https://github.com/jumanor/firmaperu-componenteweb/compare/).

# License
Copyright © 2025 [Jorge Cotrado](https://github.com/jumanor). <br />
This project is [MIT](https://github.com/jumanor/firmaperu-componenteweb/blob/master/License) licensed.