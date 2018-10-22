Dim shell
Set shell = WScript.CreateObject("WScript.Shell") 
shell.run "easy-window.exe -url samples/no-border/index.html -border false -timeout 3000 -minmax true -shadow true"