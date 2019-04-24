#include demo.ahk

/*
不打算修改程序本身，只想为某个按键实现功能的话，可以在这里：
1. 添加 keyfunc_xxxx() 的函数，
2. 在 Capslock+settings.ini [keys]下添加设置，
例如按下面这样写，然后添加设置：caps_f7=keyFunc_test2(apple)
3. 保存，重载 capslock+ (capslock+F5)
4. 按下 capslock+F7 试试
************************************************/


keyfunc_listary(){
  ; 获取选中的文字
  selText:=getSelText()

  ; 发送 win+F 按键（Listary默认的呼出快捷键），呼出Listary
  sendinput, ^^
  MsgBox, You pressed Numpad1 while holding down Numpad0
  ; 等待 Listary 输入框打开
  winwait, ahk_exe Listary.exe, , 0.5

  ; 如果有选中文字的话
  if(selText){
    ; 在选中的字前面加上"gg "（因为谷歌搜索是我最常用的，你也可以不加）
    selText:="gg " . selText
    ; 输出刚才复制的文字，并按一下`home`键将光标移到开头，以方便加入其它关键词
    sendinput, %selText%{home}
  }
}