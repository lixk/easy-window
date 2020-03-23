# easy-window是什么？
easy-window 是一个旨在简化桌面开发难度的通用窗体，它可以让你使用当前主流的HTML5技术快速地创建Windows桌面应用程序。创作桌面应用，不需要掌握QT，C++，C#，Java那些繁琐的东西，只要会创建网页就可以。
相较于`NW.js`和`Electron`，使用方式更加简洁，体积更小（只有几M）。

软件界面可以有多绚，就看想象力了。闲话不多说，先来看看本工具可以创建哪些窗体应用吧。
### 应用示例
 1. 简单窗体
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/1-1.png)
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/1-2.png)
 2. 设置窗体图标和标题
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/2.png)
 3. 限制窗体宽高
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/3.png)
 4. 隐藏最大化最小化按钮
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/4.png)
 5. 无边框窗体
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/5-1.png)
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/5-2.png)
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/5-3.png)
 6. 不规则窗体
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/6-1.png)
    ![image](https://github.com/lixk/easy-window/raw/master/screenshots/6-2.gif)

---
### 使用方法
如果要运行示例程序，只需下载`easy-window.exe`文件，`samples`文件夹和后缀名为`.vbs`的文件，运行对应的`vbs`文件即可。可以修改`vbs`文件中对应的参数调整窗体样式。
`vbs`参数示例说明：
```vbs
Dim shell
Set shell = WScript.CreateObject("WScript.Shell") 
shell.run "easy-window.exe -url https://www.baidu.com -title 百度首页"
```

其中`easy-window.exe`是渲染窗体的主程序，`-url`指定了要显示的页面，`-title`设置窗口标题为`百度首页`，运行效果如下图：
![image](https://github.com/lixk/easy-window/raw/master/screenshots/baidu-title.png)
当然，`vbs`文件不是必须的，可以直接在cmd控制台中运行`easy-window.exe -url https://www.baidu.com -title 百度首页`，效果是一样的。
更多启动参数用法请参考下方`参数说明`。

除了启动参数配置窗体样式的方式外，还支持配置文件的方式。可以直接运行`easy-window.exe`，如果同级目录内不存在`config.ini`文件，则会在同级目录下自动生成该文件；如果已存在，则会直接读取该配置文件中的属性配置。
配置文件示例：
```ini
[window]
url=samples/login/index.html
title=用户登录
width=640
height=600
resizable=false
maxbox=false
```
然后即可直接运行`easy-window.exe`，此时会自动加载显示`samples/login/index.html`文件。
注意，启动参数配置的优先级高于配置文件，如果同时通过启动参数和配置文件的方式指定了同一个属性，则会优先使用启动参数。

### 参数说明
bool类型值只能是`true`或者`false`

|参数|类型|说明|
| :--- | :--- | :--- |
|url|string|网页地址，相对地址，绝对地址，远程网址均可|
|timeout|int|等待页面加载超时时间。单位：毫秒。如果指定了该参数，窗体会等到渲染完成再一次性显示出来。|
|icon|string|窗体图标路径|
|title|string|窗体标题|
|minbox|bool|最小化窗体按钮，默认值：`true`|
|maxbox|bool|最大化窗体按钮，默认值：`true`|
|minmax|bool|限定窗口缩放范围，默认值：`false`|
|border|bool|窗体是否有边框，默认值：`true`|
|resizable|bool|窗体是否可缩放，默认值：`true`|
|shadow|bool|窗体边框是否有阴影，默认值：`false`|
|posx|int|窗体初始横坐标|
|posy|int|窗体初始纵坐标|
|width|int|窗体宽度|
|height|int|窗体高度|
|contextmenu|bool|是否启用鼠标右键菜单，默认值：`true`|
|layered|bool|是否是不规则窗体，默认值：`false`|
|toolwindow|bool|是否是弹窗工具窗体，默认值：`false`|
|topmost|bool|窗体是否置顶，默认值：`false`|

### 内置扩展JS函数
内置扩展JS函数的作用是弥补Javascript在开发桌面应用时，无法调用Windows api的不足。使用这些扩展的JS函数的时候就跟调用原生的JS函数一样方便，只需要在函数前边加上`external.`即可。
使用示例：

```html
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
<body>
	<button onclick="loadFile()">打开文件</button>
	<script>
		function loadFile(){
			//选择文件
			var filePath = external.openFile('所有文件|*.*|文本文件(.txt)|*.txt|');
			//读取并显示文件
			external.alert(external.readFile(filePath), '您选择的文件内容如下');
		}
	</script>
</body>
</html>
```

运行效果

![image](https://github.com/lixk/easy-window/raw/master/screenshots/file-open.png)
![image](https://github.com/lixk/easy-window/raw/master/screenshots/file-read.png)
可以看到，调用`external.openFile()`打开了文件选择窗口，选择文件之后，该函数返回了选择的文件路径。`external.readFile()`则实现了本地文件的读取。
更多函数请参见下方函数说明。

|函数|说明|
| :--- | :--- |
|hitCaption()|主要用于绑定鼠标拖动窗体。比如，在无边框或者不规则窗体中，对指定html元素绑定该函数即可实现鼠标拖动该元素的功能，示例：`<img src="images/ecology-heart.png" onmousedown="external.hitCaption()">`，详情参见不规则窗体示例|
|hitMax()|最大化窗体|
|hitMin()|最小化窗体|
|close()|关闭窗体|
|alert(text, title)|提示框，`text`:提示内容，`title`:提示窗口标题|
|openFile(fileType, title)|打开文件，`fileType`:文件类型(所有文件&#124;\*.\*&#124;文本文件&#124;\*.txt&#124;), `title`:选择文件窗口标题。参数均非必填|
|openDir(dir, subTitle, title)|打开目录，`dir`:初始目录, `subTitle`:子标题, `title`:标题。参数均非必填|
|saveFile(fileType, title)|保存文件，`fileType`:文件类型(所有文件&#124;\*.\*&#124;文本文件&#124;\*.txt&#124;), `title`:窗口标题。参数均非必填|
|readFile(path)|读取文件，`path`:文件路径|
|writeFile(path, text)|写文件，`path`: 文件路径, `text`:文件内容|
|clipRead()|读取剪贴板内容|
|clipWrite(text)|将内容写入剪贴板，`text`:文本内容|
|getMousePos()|获取鼠标位置|
|getPos()|获取窗体位置|
|setPos(x,y,width,height)|设置窗体位置和大小，`x`:横坐标，`y`:纵坐标，`width`:宽度，`height`:高度。宽高参数可选|
|getScreen()|获取屏幕宽高|
|setIcon(iconPath)|设置窗体图标|
|setTitle(text)|设置窗体标题|
|setTopmost(state)|窗体是否置顶，`state`:true/false|
|shell(cmd, showCmdWindow, waitResult)|执行系统命令， `cmd`: 命令语句，`showCmdWindow`: 是否显示cmd窗体，`waitResult`: 是否等待命令执行完成并获取执行结果。示例：`var ip = external.shell('ipconfig /all', false, true); external.alert(ip);`|


### 备注
本项目主要目的在于简化桌面窗体开发，本身功能有限。如果需要更多功能，有两种方案：
 1. 用户界面使用`miniblink`（精简浏览器内核）做渲染，浏览器支持的大部分功能基本都支持，所以可以通过`Ajax`或者`Websocket`与其它服务器语言通信，更多功能由其他语言实现，其实就是用开发网站那一套开发桌面软件。
 2. 本项目使用`aardio`语言开发，您可以自行修改编译源码，然后打包，替换本项目的`easy-window.exe`即可。

如果你对本项目感兴趣，欢迎使用，共同探讨完善。

### 项目引用

 1. aardio 地址 [http://www.aardio.com/](http://www.aardio.com/)

 2. miniblink 地址 [https://weolar.github.io/miniblink/](https://weolar.github.io/miniblink/)
