Dim shell
Set shell = WScript.CreateObject("WScript.Shell") 
shell.run "easy-window.exe -url samples/login/index.html -timeout 3000 -resizable true -border true"