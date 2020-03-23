Dim shell
Set shell = WScript.CreateObject("WScript.Shell") 
shell.run "easy-window.exe -url samples/unregular/index.html -layered true -width 200 -height 200 -topmost true"