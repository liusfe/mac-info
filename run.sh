#!/bin/bash

# Archivo de salida
OUTPUT_FILE="info_mac.txt"

# Título
echo "===== Información del Sistema =====" > "$OUTPUT_FILE"

# Modelo del Mac
echo "Modelo del Mac: $(sysctl -n hw.model)" >> "$OUTPUT_FILE"

# Versión del sistema operativo
echo "Versión del macOS: $(sw_vers -productName) $(sw_vers -productVersion) $(sw_vers -buildVersion)" >> "$OUTPUT_FILE"

# Procesador
echo "Procesador: $(sysctl -n machdep.cpu.brand_string)" >> "$OUTPUT_FILE"

# Número de núcleos
echo "Núcleos: $(sysctl -n hw.ncpu)" >> "$OUTPUT_FILE"

# Memoria RAM instalada
echo "Memoria RAM: $(($(sysctl -n hw.memsize) / 1024 / 1024 / 1024)) GB" >> "$OUTPUT_FILE"

# Espacio en disco
echo "Espacio en disco:" >> "$OUTPUT_FILE"
df -h / | awk 'NR==1 || NR==2 {print $1, $2, $3, $4, $5}' >> "$OUTPUT_FILE"

# Estado de la batería
echo "===== Estado de la Batería =====" >> "$OUTPUT_FILE"
if pmset -g batt &> /dev/null; then
  pmset -g batt | grep -Eo "\d+%|\(discharging\)|\(charging\)|\(charged\)" >> "$OUTPUT_FILE"
else
  echo "Batería no detectada (tal vez estás en una Mac de escritorio)." >> "$OUTPUT_FILE"
fi

# Temperatura del CPU (requiere instalar 'iStat Menus' o 'osx-cpu-temp')
if command -v osx-cpu-temp &> /dev/null; then
  echo "Temperatura del CPU: $(osx-cpu-temp)" >> "$OUTPUT_FILE"
else
  echo "Temperatura del CPU: Instala 'osx-cpu-temp' para obtener esta información." >> "$OUTPUT_FILE"
fi

# Estado del disco (SMART)
echo "===== Estado del Disco =====" >> "$OUTPUT_FILE"
if command -v smartctl &> /dev/null; then
  smartctl -H disk0 | grep "SMART overall-health self-assessment test result" >> "$OUTPUT_FILE"
else
  echo "Instala 'smartmontools' para obtener información SMART del disco." >> "$OUTPUT_FILE"
fi

# Red
echo "===== Información de la Red =====" >> "$OUTPUT_FILE"
echo "IP Local: $(ipconfig getifaddr en0)" >> "$OUTPUT_FILE"
echo "IP Pública: $(curl -s ifconfig.me)" >> "$OUTPUT_FILE"

# Fin
echo "===================================" >> "$OUTPUT_FILE"

# Mensaje de confirmación
echo "Información exportada a $OUTPUT_FILE"
