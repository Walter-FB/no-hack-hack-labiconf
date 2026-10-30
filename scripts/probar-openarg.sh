#!/usr/bin/env bash
# Prueba la conexión con el MCP de OpenArg sin depender de ningún cliente MCP.
#
#   ./scripts/probar-openarg.sh          # handshake + lista de herramientas (no gasta cupo)
#   ./scripts/probar-openarg.sh --cupo   # además llama listar_fuentes: valida la clave, gasta 1 pedido de datos
#
# La clave se lee de OPENARG_API_KEY. Nunca se imprime.
set -euo pipefail

URL="${OPENARG_MCP_URL:-https://mcp.openarg.org/mcp}"

if [[ -z "${OPENARG_API_KEY:-}" ]]; then
  echo "Falta OPENARG_API_KEY. Sacala gratis en https://openarg.org/desarrolladores" >&2
  exit 1
fi
if [[ "$OPENARG_API_KEY" != oarg_sk_* ]]; then
  echo "OPENARG_API_KEY no empieza con oarg_sk_: revisá que sea la clave correcta." >&2
  exit 1
fi

rpc() {
  curl -sS --fail-with-body -m 60 "$URL" \
    -H "Authorization: Bearer $OPENARG_API_KEY" \
    -H "Content-Type: application/json" \
    -H "Accept: application/json, text/event-stream" \
    -H "MCP-Protocol-Version: 2025-06-18" \
    -d "$1"
}

echo "1) initialize"
rpc '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2025-06-18","capabilities":{},"clientInfo":{"name":"no-hack-hack-labiconf","version":"0.1"}}}' \
  | jq '.result.serverInfo'

echo "2) tools/list"
rpc '{"jsonrpc":"2.0","id":2,"method":"tools/list"}' \
  | jq -r '.result.tools[] | "   - \(.name)"'

if [[ "${1:-}" == "--cupo" ]]; then
  echo "3) listar_fuentes (gasta 1 pedido de datos)"
  rpc '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"listar_fuentes","arguments":{}}}' \
    | jq -r '.result.content[0].text // .error'
fi

echo "OK"
