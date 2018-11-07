Dim shell
Set shell = WScript.CreateObject("WScript.Shell") 
shell.run "easy-window.exe -url samples/website/index.html  -timeout 5000 -border false -shadow true"
