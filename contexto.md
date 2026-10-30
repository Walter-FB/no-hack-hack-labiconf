# Contexto del equipo: hackatón LABITCONF 2026

> Resumen de todo lo que sabemos al 30/10/2026. Sirve para que cualquier chat o integrante arranque sin repetir la investigación.
>
> **Leyenda**
> - ✅ verificado con fuente primaria (código o repo leído completo).
> - 📎 sale del informe del 2.º chat. Lo verificó **solo con fragmentos del buscador**, porque la red bloqueó las páginas. Confirmar antes de citarlo textual.
> - 🔶 inferencia, no verificada.
> - ❌ buscado y no encontrado.

---

## 0. Reglas del equipo (Walter)
- **Nunca mentir ni inventar.** Si algo no es 100 % seguro, se dice. Siempre separar lo verificado de lo inferido.
- No dar la razón por darla. Prioridades: **verdad y creatividad**.
- Español rioplatense. Charlar está bien; ser creativos cuando suma.
- Claves y secretos: **nunca** en el repo ni en el chat.

## 1. El evento
- 📎 Es **LABITCONF 2026**, la conferencia de Bitcoin de Latinoamérica: **30 y 31/10/2026, BA Ferial (ex Costa Salguero)**. "Labiconf" era un error de tipeo.
- 📎 Es el **primer hackatón en vivo** de LABITCONF:
  - lo organiza el **EDU HUB**;
  - es para estudiantes de más de 40 comunidades;
  - los premios se pagan en BTC (un post de LinkedIn habla de USD 1.500 en total);
  - está pensado como "tu primera hackatón".
- 📎 **Cuatro categorías: Inclusión Financiera · Nueva Educación · Creator Economy · Impacto y Comunidad.**
- 📎 Hay **otro hackatón en paralelo**: el #6 de La Crypta (Bitcoin, Lightning, Nostr). 🔶 El nuestro sería el del EDU HUB. **Hay que confirmarlo.**
- Brief que nos dieron: **"construir algo que se base en datos"**.
- ✅ **OpenArg preparó datos para esta hackatón** (ver §4).

## 2. Jurado
| Jurado | Quién es (📎) | Qué va a valorar (🔶) | Pregunta incómoda probable |
|---|---|---|---|
| **Federico Kohen** | Socio o cofundador de TENT Creator Summit (creator economy; 3.ª edición el 27/10/2026, misma sede) | Algo compartible, con narrativa y gancho | "¿Por qué alguien lo compartiría?" |
| **Augusto Ardiles** | Subsecretario de Inversiones de CABA (Decreto 149/2025). Fue director del BICE y de Casa de Moneda, asesor del BCRA, abogado fintech. Impulsa la "ciudad sandbox" y el distrito IA | Negocio, escala, API, reglas claras, inclusión financiera | "¿Modelo de negocio? ¿Regulación?" |
| **Leo Suárez** | Head of Design en Paisanos (TheOrg dice "Lead UI"). Design systems, IA aplicada al diseño | Una sola pantalla clara, mobile-first, la IA al servicio de la UX | "¿Por qué es un chat? ¿Quién es el usuario?" |
| **Tomás Moreno** | PM en Moonsong Labs. Director académico de blockchain y tokenización en la UTDT | Disciplina de producto, blockchain con sentido real, verificabilidad | "¿Por qué blockchain? ¿Métrica de éxito?" |

🔶 En común: ninguno es "de datos" puro. Van a premiar **producto con usuario claro** y **potencial de startup**.

## 3. Picante y Umai
- 📎 **Picante**:
  - aceleradora y VC para **founders menores de 30**, salida de la gente de Takenos (Federico Ades, Fede Gir, Lolo Sacerdoti);
  - tickets de hasta **USD 30.000**;
  - organiza la **"Picanthon"**;
  - valora el equipo por sobre la idea, la adaptabilidad y la dedicación full time.
  - ❌ No encontramos su vínculo con LABITCONF. 🔶 Sería sponsor o mentor.
- ❌ **Umai**: no identificada. Hay dos candidatas, **no verificadas**:
  - **Humai** (educación en IA, encajaría en Nueva Educación);
  - **UMAI 360** (software de restaurantes).
  - **Preguntar en el evento. No inventar una integración.**

## 4. OpenArg (openarg.org): nuestra base de datos
✅ Todo esto sale de leer el código de github.com/colossus-lab (`openarg_backend`, `openarg-mcp`, `openarg_frontend`). El backend tuvo actividad el 29/10/2026.

**Qué es:** un chat con IA sobre datos públicos argentinos, de **Colossus Lab**. El MCP es MIT.
- El motor es un agente con Claude Sonnet (en AWS Bedrock), con hasta 10 llamadas a herramientas por turno.
- **Verifica cada cifra** contra lo que devolvieron las herramientas.
- Cita la fuente oficial con link.

**Canales (misma clave `oarg_sk_…`, gratis en openarg.org/desarrolladores):**
- Chat web: openarg.org/chat (30 preguntas por mes).
- API: `api.openarg.org`. Endpoints:
  - `POST /api/v1/ask`
  - `GET /api/v1/fuentes`
  - `GET /api/v1/catalogo/buscar?q=`
  - `GET /api/v1/catalogo/tabla?nombre=`
  - `POST /api/v1/catalogo/datos`
  - `POST /api/v1/catalogo/agregar`
- **MCP:** `https://mcp.openarg.org/mcp` (Streamable HTTP, header `Authorization: Bearer …`). Herramientas:
  - `buscar_datasets`
  - `describir_tabla`
  - `obtener_datos` (hasta 500 filas, sin SQL)
  - `listar_fuentes`
  - `consultar_datos_publicos` (modo respuestas)

**Cupo gratis por clave** (se renueva el 1.º de cada mes a las 00:00 UTC; agotado devuelve HTTP 402):
- Modo datos: **200 pedidos/mes**, 30/min, hasta 500 filas por pedido.
- Modo respuestas: **10 preguntas/mes**, 2/min.
- Los "Fundadores" (quienes aportan) tienen 2.000 y 100.
- → **Una clave por integrante.** Usar OpenArg para **descubrir** la tabla y, para volumen, ir **directo a la fuente oficial**.

**Datos que cubre:**
- **APIs en vivo:**
  - Series de Tiempo de datos.gob.ar: IPC, PIB, EMAE, desempleo, salarios.
  - BCRA: reservas, tipos de cambio, tasas, base monetaria, UVA, CER.
  - DolarApi / ArgentinaDatos: blue, MEP, CCL, riesgo país.
  - Georef.
- **Propios:**
  - Declaraciones juradas: funcionarios nacionales desde 2012 y CABA desde 2023.
  - **Versiones taquigráficas de Diputados con búsqueda semántica.**
  - Personal de legisladores.
- **76 tablas curadas (marts).** Entre otras: inflación, pobreza por aglomerado, delitos (SNIC y CABA), escuelas, salud, presupuestos (nacional, CABA, Mendoza, Neuquén), compras públicas (incluido PAMI), pauta oficial, decretos, SUBE, subte, energía y combustibles, exportaciones, empleo, salarios por sector, cultivos, SENASA, registro automotor, IGJ, nombres.
- **~45 portales en el código:**
  - nacionales y ministerios;
  - provincias: Córdoba, Mendoza, Santa Fe, Chaco, Salta, Jujuy, Misiones, Entre Ríos, Río Negro, PBA, Tucumán;
  - municipios: Rosario, La Plata, Bahía Blanca, Corrientes, Mendoza;
  - CSJN, ACUMAR, PAMI.
- "33.000 datasets / 38 portales" es lo que dicen ellos; no lo contamos.

**Preparado para LABITCONF:**
- ✅ El código dice textual *"Para la categoría Creator Economy del hackatón de LABITCONF"* y agrega series de **monotributistas** y **monotributo social** (SIPA, mensuales, desde 2012).
- ✅ El PR #210 trae los "huecos del hackatón".
- 📎 Según el 2.º chat también corrige presupuesto 2026 y el IPC hasta sep-2026.

**Límites honestos:**
- Refleja lo que publica cada organismo, con su atraso. No hay tiempo real ni datos privados.
- ✅ La tabla `presupuesto_nacional_ejecutado` figura **BLOQUEADA** en su config, por un problema en la fuente.
- No vimos **precio de BTC**, ni datos de **ARCA/AFIP** (escalas del monotributo), ni el texto completo del Boletín Oficial: solo decretos. Que no lo hayamos visto ≠ que no exista.
- El modo respuestas usa un LLM y puede equivocarse: chequear la fuente antes de mostrar una cifra.

## 5. Ideas y estado de la decisión
- **A. "Seguí al legislador"** (qué dijo en sesiones, patrimonio, personal). Es la más original y usa lo único que tiene OpenArg. **Descartada para el centro del proyecto**: hay un funcionario del GCBA en el jurado y no entra limpia en ninguna categoría. Queda para el roadmap.
- **B. "Tu barrio en datos"** (dirección → ficha con mapa). Sólida para Impacto y Comunidad, pero lejos del ADN Bitcoin.
- **C. "¿Cuánto vale tu sueldo?"**: engancha, pero es la más trillada.
- **D (propuesta actual) = C mejorada.**
  - Funcionamiento: sueldo o facturación → poder de compra contra IPC, canasta básica, dólar (oficial, MEP, blue), plazo fijo y **BTC en sats**.
  - Formato: **una tarjeta compartible** con fuente visible, una **lección de 60 segundos** y, opcional, un sello con **OpenTimestamps**.
  - Lo que la diferencia: el ángulo Bitcoin + educación, el formato para creadores y la verificabilidad. Sin eso, es otra calculadora de inflación.
- Opinión del 1.er chat: **elegir UNA categoría** y no estirarla a tres. Candidata: **Creator Economy**, con usuario **creador o monotributista menor de 30**. Razones:
  - OpenArg cargó el monotributo para esa categoría;
  - Kohen es el especialista del tema;
  - calza con el perfil que busca Picante.
- ⚠️ El precio de BTC no está en OpenArg: hay que integrar otra fuente. 🔶 El plazo fijo debería salir de las tasas del BCRA; confirmarlo con datos reales.
- **Pitch** (🔶):
  - presentarlo como startup: usuario, distribución por creadores, API para fintechs;
  - disclaimer "no es asesoramiento financiero";
  - cerrar con "queremos seguir después del 31".
- **Decisión final: PENDIENTE de Walter.**

## 6. Estado técnico
- Repo: `walter-fb/no-hack-hack-labiconf`. `main` solo tiene el commit inicial.
- **Rama `openarg-mcp`:**
  - `.mcp.json`: servidor `openarg`, la clave sale de `${OPENARG_API_KEY}`;
  - `scripts/probar-openarg.sh`: handshake y lista de herramientas sin gastar cupo; con `--cupo` llama a `listar_fuentes` (gasta 1 pedido);
  - `README.md`, `.gitignore`;
  - este `contexto.md`.
- **Rama `investigacion-jurado`:** `investigacion/jurado-y-picante.md`, el informe completo del 2.º chat con todas las fuentes.
- **Bloqueos:**
  1. La red del entorno **rechaza** (proxy 403) `openarg.org`, `mcp.openarg.org`, `api.openarg.org`, `apis.datos.gob.ar`, `api.bcra.gob.ar`, `api.argentinadatos.com` y `dolarapi.com`. Hay que agregarlos en **Edit → Network access → Allowed domains** del entorno.
  2. Falta cargar **`OPENARG_API_KEY`** en la config del entorno. Después, abrir una sesión nueva.
  3. Las sesiones nuevas clonan `main`: hay que mergear `openarg-mcp` a `main` (directo o por PR; falta el ok de Walter).
- ⚠️ La parte del script que habla con el servidor **no se pudo probar** contra un servidor real: no hay red y se bloqueó correr el servidor de OpenArg localmente.

## 7. Preguntas abiertas
1. ¿Nuestro hackatón es el del **EDU HUB** o el de **La Crypta**?
2. ¿Cuántas horas quedan? ¿Cuántos somos y qué sabe hacer cada uno?
3. ¿Qué es **Umai**? ¿Qué rol tiene **Picante** en el evento?
4. ¿Vamos con **D en Creator Economy** o con otra cosa?
5. ¿`openarg-mcp` → `main` directo o por PR?

## 8. Fuentes principales
- https://github.com/colossus-lab/openarg_backend (README, código, PR #210)
- https://github.com/colossus-lab/openarg-mcp (README, `llms.txt`)
- https://github.com/colossus-lab/openarg_frontend
- Informe del 2.º chat, con todas las fuentes del evento, el jurado y Picante: rama `investigacion-jurado`, `investigacion/jurado-y-picante.md`
- https://www.elobservador.com.uy//argentina/sociedad/openarg-la-inteligencia-artificial-que-convierte-los-datos-publicos-argentina-respuestas-cualquier-ciudadano-n6038104
- https://code.claude.com/docs/en/cloud-environments#network-access
