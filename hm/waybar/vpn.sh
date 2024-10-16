vpn=$(nmcli c show --active | grep vpn | awk '{ print $1}')

wifi=$(nmcli c show --active | grep wifi | awk '{ print $1 }')
ether=$(nmcli c show --active | grep ethernet | awk '{ print $1 }')

if [[ -n "$vpn" ]]; then
  echo -n " "
else
  echo -n " "
fi

if [[ -n $wifi ]]; then
  echo -n "󰖩 $wifi"
  exit
else 
  if [[ -n $ether ]]; then
    echo -n "󰈀 $ether"
    exit
  fi
fi

echo No Connection
