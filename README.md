# CFWaxDemo
AliWax 热更新Demo

# QQ 598199033 微信 Chengf____

# 框架地址：
https://github.com/probablycorey/wax（已停更）
http://github.com/probablycorey/wax（阿里维护中）
wax的基础语法 http://www.jianshu.com/p/374ad9e322fc

# Wax
Wax是什么?
　　Wax是一个框架，让你可以用Lua开发原生的iPhone应用。Wax把Lua和Objetive-C的类库 连接起来，也就是说，你可以用Lua使用任何的Objective-C类及框架。
 
为什么使用Wax?
 
　　Wax是免费的、开源的。你总是可以改动源代码，以满足自己的需要。
　　用Lua这种高效脚本语言编写代码可以大大节省时间
　　可以使用所有现有的Objective-C库
　　可以让你的App在线更新一些功能，不再需要经过苹果App Store的审核，不过被苹果发现你的应用下载代码的话可能会被拒绝。

# Lua 
lua 优点
1. 垃圾自动回收！alloc、retain和release的日子终于一去不复返了！
2. 更少的代码！不再有头文件，不再有静态类型、数组和字典语句！Lua使你的代码行数减少。
3. 能访问Cocoa、UITouch、Foundation这些框架，每一样都不少！Wax会将OC框架自动暴露给Lua，你想要的每个框架仍然是有效的！
4. HTTP请求更简单。与RESTwebservice进行交互从来没有这么容易过！
5. Lua支持闭包，即块语句！如何使用过它们的人都知道它们是如何的强大。
6. Lua内置了正则表达式匹配库。

Lua 学习地址
http://www.yiibai.com/lua/if_statement_in_lua.html

框架克隆地址：
http://github.com/probablycorey/wax
Wiki地址：
https://github.com/alibaba/wax/wiki/Installation-CN

# 使用方法
1. 使用Cocoapods（官方例子里通过 pod 下载失败，具体原因不知）
2. 手动添加源码（太麻烦，源码为MRC，所以还需要修改所有源码的编码方式）

3. 使用静态库（推荐）
  ● 打开命令行cd到Framework工程目录.cd WAX_ROOT/tools/Framework
  ● 运行Rakefile. rake package wax将会被编译
  ● 编译产物在WAX_ROOT/framework/wax.framework
  ● 将wax.framework添加到你的工程
  ● Build Settings-> Framework Search Paths添加wax.framework所在目录.(注意要用相对目录)
  ● 头文件依赖使用#import <wax/wax.h>
  ● 例子见examples/InstallationExample/InstallWithStaticFramework

# 使用Wax
   wax_start("init.lua", nil);

    使用注意
  ● wax_start需要在使用任何wax接口前被调用
  ● wax_start要在主线程被调用
  ● wax_start只能被调用一次


# Xcode 支持 lua 语言
git 地址：https://github.com/intheway/Wax-In-Xcode
只是有一些关键字的提示，没有方法的提示，不过相对于白板来说好多了。

  1. download the two files (Add-Lua.sh, Lua.xclangspec)
  2. Open Add-Lua.sh and change the DVTFOUNDATION_PATH if necessary. You probably do not need to change this if you are on Xcode
  3. Make sure Xcode is closed
  4. Run Add-Lua.sh from the terminal with sudo (I.E. 'sudo Add-Lua.sh')
  5. Enter your admin password and hit enter
  6. Open Xcode and select a Lua file, then click the 'Lua' entry under "Editor->Syntax Coloring"

通过这个小程序，可以简单的实现，方法的替换，新增类、方法。

# 思考
1. 更新文件放在自己的服务器上，方便我们维护。
2. 我们可以自己定义热修复的规则，这样使得客户端更加灵活，需要一个完善的机制去实现它，对此我认为可以参考JSPath
3. lua 修复或者添加新功能时，可以将代码写在多个 lua 文件中，打包成 zip，通过下载远程的 zip 包，在客户端通过解压，调用。可以参考 http://www.jianshu.com/p/adb88c88fc63


