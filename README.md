# no-hack-hack-labiconf

Proyecto de la hackatón de Labiconf, construido sobre datos públicos argentinos vía [OpenArg](https://openarg.org).

## Conexión con OpenArg (MCP)

El servidor MCP de OpenArg (`https://mcp.openarg.org/mcp`) ya está configurado en [`.mcp.json`](.mcp.json). La clave **no** está en el repo: se lee de la variable `OPENARG_API_KEY`.

1. Sacá tu clave gratis en <https://openarg.org/desarrolladores> (empieza con `oarg_sk_`). Una por persona: el cupo es por clave.
2. Cargala como variable de entorno `OPENARG_API_KEY`:
   - **Claude Code en la nube:** settings del entorno → variables de entorno / secretos.
   - **Local:** `export OPENARG_API_KEY=oarg_sk_...` (o en un `.env`, que está en `.gitignore`).
3. Si el entorno restringe la red, permití estos dominios: `openarg.org`, `mcp.openarg.org`, `api.openarg.org`.
4. Probá la conexión:

   ```bash
   ./scripts/probar-openarg.sh          # handshake + herramientas, no gasta cupo
   ./scripts/probar-openarg.sh --cupo   # valida la clave con listar_fuentes (gasta 1 pedido)
   ```

5. Abrí `claude` en la carpeta del repo y aprobá el servidor `openarg` cuando lo pida.

### Herramientas

| Herramienta | Modo | Uso |
|---|---|---|
| `buscar_datasets` | datos | Buscar en el catálogo: título, portal, link oficial, tablas |
| `describir_tabla` | datos | Columnas, tipos, filas, período y muestra |
| `obtener_datos` | datos | Hasta 500 filas en CSV, con filtros de período e igualdad |
| `listar_fuentes` | datos | Portales cubiertos y datasets por portal |
| `consultar_datos_publicos` | respuestas | Pregunta en lenguaje natural, con fuentes |

### Cupo (plan gratis, por clave, se renueva el 1° de cada mes)

- Modo datos: 200 pedidos/mes, 30/min, hasta 500 filas por pedido.
- Modo respuestas: 10 preguntas/mes, 2/min.
- Agotado el cupo, la API responde HTTP 402.

Usar OpenArg para **descubrir** qué tabla sirve y, para volumen, ir directo a la fuente oficial que cita cada respuesta (Series de Tiempo, BCRA, Georef y ArgentinaDatos no piden clave).
