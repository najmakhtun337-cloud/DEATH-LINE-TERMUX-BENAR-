#!/bin/bash

# COLORS
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'

type () {
  for ((i=0; i<${#1}; i++)); do
    printf "%s" "${1:$i:1}"
    sleep 0.03
  done
  echo
}

clear
sleep 0.5

echo -e "${R}"
figlet -f slant "DEATH LINE"
echo -e "${N}"

type "[ SYSTEM BOOTING... ]"
sleep 0.4
type "INITIALIZING CODEX CORE"
type "AUTH : DH-اERROR"
sleep 0.6

# DEVICE INFO
MODEL=$(getprop ro.product.model)
BRAND=$(getprop ro.product.brand)
ANDROID=$(getprop ro.build.version.release)
ARCH=$(uname -m)
BATTERY=$(termux-battery-status 2>/dev/null | grep percentage | tr -dc '0-9')

echo
echo -e "${C}━━━━━━━━ DEVICE INFO ━━━━━━━━${N}"
echo -e "${Y}• Brand     :${W} $BRAND"
echo -e "${Y}• Model     :${W} $MODEL"
echo -e "${Y}• Android   :${W} $ANDROID"
echo -e "${Y}• Arch      :${W} $ARCH"
[ -n "$BATTERY" ] && echo -e "${Y}• Battery   :${W} $BATTERY%"
echo -e "${C}━━━━━━━━━━━━━━━━━━━━━━━━━━━━${N}"
sleep 1

# SETUP
rm -rf "$HOME/DEATH-LINE"
mkdir -p "$HOME/DEATH-LINE"

cat > "$HOME/DEATH-LINE/deathline.sh" << 'EOF'
#!/bin/bash
clear

COLORS=(31 32 33 34 35 36)
CLR=${COLORS[$RANDOM % ${#COLORS[@]}]}

echo -e "\033[1;${CLR}m"
figlet -f slant "DEATH LINE"
echo -e "\033[0m"

sleep 0.3
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "❖ PROJECT : DEATH LINE"
echo "❖ CREATOR : DH-اERROR"
echo "❖ MODE    : CODEX CORE"
echo "❖ STATUS  : ONLINE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo
EOF

chmod +x "$HOME/DEATH-LINE/deathline.sh"

# AUTOSTART
if ! grep -q "DEATH-LINE/deathline.sh" "$PREFIX/etc/bash.bashrc"; then
  echo "bash \$HOME/DEATH-LINE/deathline.sh" >> "$PREFIX/etc/bash.bashrc"
fi

echo
echo -e "${G}[✓] DEATH LINE INSTALLED${N}"
echo -e "${C}Restart Termux to activate Codex mode${N}"
