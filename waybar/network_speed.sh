#custom script to display network speeds
# related file (waybar/Modules) and (waybar/configs/custom_config)
#!/bin/bash
INTERFACE="eno1"

RX1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

RXBPS=$((RX2 - RX1))
TXBPS=$((TX2 - TX1))

RXKBPS=$((RXBPS / 1024))
TXKBPS=$((TXBPS / 1024))

# Output JSON instead of plain text
echo "{\"text\": \" ${RXKBPS}KB/s  ${TXKBPS}KB/s\"}"
