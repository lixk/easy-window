# easy-window
一个使用HTML5技术创建Windows应用程序的简单工具。本工具可以将HTML，CSS，JS写成的网页以桌面窗体应用的方式呈现出来。创作一般的桌面应用，不再需要掌握QT，C++，C#，Java那些繁琐的东西，你只需要会创建网页就够了。废话不多说，先来看看本工具可以创建哪些窗体应用吧。
### 示例
1. 简单窗体

![image](https://github.com/lixk/easy-window/raw/master/screenshots/1.png)

2. 设置窗体图标和标题

![image](https://github.com/lixk/easy-window/raw/master/screenshots/2.png)

3. 设置窗体宽高

![image](https://github.com/lixk/easy-window/raw/master/screenshots/3.png)

4. 隐藏最大化最小化按钮

![image](https://github.com/lixk/easy-window/raw/master/screenshots/4.png)

5. 无边框窗体

![image](https://github.com/lixk/easy-window/raw/master/screenshots/5.png)

6. 不规则窗体

![image](https://github.com/lixk/easy-window/raw/master/screenshots/6.png)

---
### 使用方式
第一步，下载本项目中的`easy-window.exe`和`startup.vbs`两个文件，`easy-window.exe`是渲染网页的核心程序，`startup.vbs`是启动文件。
第二步，在`startup.vbs`文件中配置自己需要的窗体参数；
第三步，运行`startup.vbs`文件即可。
### 参数说明
bool类型值只能是`true`或者`false`

|参数|类型|说明|
| :--- | :--- | :--- |
|url|string|网页地址，相对地址，绝对地址，网址均可|
|timeout|int|等待页面加载超时时间，单位：毫秒|
|icon|string|窗体图标路径|
|title|string|窗体标题|
|width|int|窗体宽度|
|height|int|窗体高度|
|minbox|bool|最小化窗体按钮，默认值：`true`|
|maxbox|bool|最大化窗体按钮，默认值：`true`|
|border|bool|窗体是否有边框，默认值：`true`|
|sizebox|bool|窗体是否可缩放，默认值：`true`|
|menu|bool|是否显示菜单栏，默认值：`true`|
|layered|bool|是否是不规则窗体，默认值：`false`|
|toolwindow|bool|是否是弹窗工具窗体，默认值：`false`|
|topmost|bool|窗体是否置顶，默认值：`false`|

### 内置JS函数

|函数|说明|
| :--- | :--- |
|hitCaption()|主要用于绑定鼠标拖动窗体。比如，在无边框或者不规则窗体中，对指定html元素绑定该函数即可实现鼠标拖动该元素的功能，示例：`<img src="images/ecology-heart.png" onmousedown="external.hitCaption()">`，详情参见不规则窗体示例|
|hitmax()|最大化窗体|
|hitmmin()|最小化窗体|
|close()|关闭窗体|
|alert(text, title)|提示框，`text`:提示内容，`title`:提示窗口标题|
|openFile(fileType, title)|打开文件，`fileType`:文件类型, `title`:选择文件窗口标题。参数均非必填|
|openDir(dir, subTitle, title)|打开目录，`dir`:初始目录, `subTitle`:子标题, `title`:标题。参数均非必填|
|saveFile(fileType, title)|保存文件，`fileType`:文件类型, `title`:窗口标题。参数均非必填|
|readFile(path)|读取文件，`path`:文件路径|
|writeFile(path, text)|写文件，`path`: 文件路径, `text`:文件内容|
|clipRead()|读取剪贴板内容|
|clipWrite(text)|将内容写入剪贴板，`text`:文本内容|
|getMousePos()|获取鼠标位置|
|getPos()|获取窗体位置|
|setPos(x,y,width,height)|设置窗体位置和大小，`x`:横坐标，`y`:纵坐标，`width`:宽度，`height`:高度。宽高参数可选|
|getScreen()|获取屏幕宽高|
|setIcon(icon)|设置窗体图标|
|setTitle(text)|设置窗体标题|
|setTopmost(state)|窗体是否置顶，`state`:true/false|

### 说明
本项目使用`aardio`语言开发，内部使用了`miniblink`做页面渲染。如果你对本项目感兴趣，欢迎使用，共同探讨。如果需要扩展功能，可以下载源码，自已修改编译即可。
最后，感谢`aardio`和`miniblink`作者，谢谢他们让我们的桌面软件开发变得这么简单^_^