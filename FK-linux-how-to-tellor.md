## Instructions:

1. Download files
    1. Bitstream - https://cdn.discordapp.com/attachments/707358075773780021/708131451144765440/tellor_fk33_uart.bit.zip
    1. Miner - https://cdn.discordapp.com/attachments/707358075773780021/708130442452402246/TellorMinerTCPandUART.zip
    1. Miner Update - https://cdn.discordapp.com/attachments/707358075773780021/708187628599640115/tellor-miners-update.zip
    1. TCP Bridge - https://cdn.discordapp.com/attachments/707358075773780021/708141165731381248/sqrl_tcp_bridge_linux_v1_0_1.zip
1. Make sure eeprom is up to date
    1. Linux: http://zetheron.com/d107280/FK_EEPROM_Update_Linux
    1. Windows: http://zetheron.com/d107280/FK_EEPROM_Update_Win10.exe
1. Load the stream
    1. Nextjtag: nextjtag -m -a --set-jtag-freq 30000000 -b tellor_fk33_uart.bit -f XCVU33P 
    1. SQRL TCP Bridge: sqrl_tcp_bridge a tellor_fk33_uart.bit
1. Launch 1 batch or sh file per card using mine_uart as example

### Linux specific:
Ensure telminer is executable
`chmod 755 telminer`
Note: type sudo rmmod ftdi_sio if no FKs are detected.

### Windows Specific:
Disable virusscan on directory with miner. 
