# ffmpeg3.2_build
resource for building ffmpeg3.2 on android
注意：由于NDK太大，所以这个仓库里面只有一个空文件目录，需要自己下载NDK放进去。
#前提：
如果你使用的是Windows 系统，需要用到Linux环境，以往一般需要安装虚拟机或者一些  Cygwin 等软件，会麻烦一点。
微软在Windows 10 引入了一个Linux子系统，我们可以直接在Windows 10 下开启这个子系统，它的运行效率比较高，并且使用的文件目录是和Windows 的当前用户目录是共享的，可以非常方便的进行两个系统之间文件的复制，共享。

##在Windows 10 的Linux子系统下编译FFmpeg

###1. 开启Windows 10 的Linux 子系统
百度教程即可

###2.  参考在Ubuntu 下编译FFmpeg的文章
http://blog.csdn.net/u013013970/article/details/53924316

http://blog.csdn.net/u010085954/article/details/54142386

在windows 使用MinGw编译FFmpeg
http://blog.csdn.net/huweijian5/article/details/52840177

如果你已经开启了Windows 10 的linux子系统，那么你不需要自己安装Ubuntu 或者MinGW了
你只需要的东西是：

*  FFmpeg 源代码 
下载地址：https://ffmpeg.org/download.html
我下载的是ffmpeg-3.2.2 

* Android 的NDK开发包（注意必须是Linux的 NDK开发包，我在开始的时候直接使用Windows 10 下的Android Studio 下载的Windows的包，结果卡了很久）
举例：
android-ndk-r10e-linux-x86_64  （正确）
android-ndk-r10e-windows-x86_64（错误）

因为墙里的原因，下载NDK开发包可能会遇到下不下来或者很难找到的问题：
可以在腾讯的Buggly提供的镜像地址下载：http://dsx.bugly.qq.com/repository/1



###3. 编译步骤：
a. 打开cmd ，输入bash ，进入linux 子系统
 
输入 ls 命令可以看到进入的Linux的默认目录其实就windows 下C盘当前用户的目录：

如：我的windows 用户名是lijian
C盘的用户目录是：
C:\Users\lijian

为了方便，我在windows 下的 C:\Users\lijian 建立了一个名字是 linux子目录，然后把FFmpeg的源代码和Android NDK的开发包都放进去
当然，你也可以在bash下用 linux命令操作，效果是一样的
除了FFmpeg源码和NDK开发包，我还建立了一个simplefflib的文件夹存放编译好的so库和头文件
如果你有看过上面推荐的参考的编译的文章的话，buid-ffmepg-arm1.sh就是一个编译脚本而已
需要编写一个编译脚本（网上的脚本基本都是类似copy的，需要根据自己的编译环境修改一下配置即可，参考http://blog.csdn.net/u010085954/article/details/54142386

这篇文章的步骤6.）



因为android使用的编译的so库命名有系统的要求
libXXX.so 以 lib开头 .so 后缀结束，所以需要进入ffmpeg-3.2.2的目录修改config文件
所有后续步骤参考这篇文章的步骤3~10即可
http://blog.csdn.net/u010085954/article/details/54142386

##注意下面几点：
* windows的文件目录和linux 目录的区别
比如 /  \
在编写编译脚本的时候，因为是在Linux下编译，必须填写linux的文件目录
* windows下的文本编码问题
为了省事，编译脚本我是在windows下编写的 xxx.sh 文本文件
但是windows下的记事本会非常坑，会造成Linux 下读取xxx.sh 乱码的问题，所以建议使用notepad++等文本编辑器编写（当前，你在linux下使用vi vim 编写也可以~）
编码格式在notepad++下的格式这个选项下选择 以UTF-无BOM编码即可：


* 编译完成后的so库看似会有很多，其实如果你在linux在使用 ls -l 查看一下，
很多.so文件的属性是
lrwxrwxrwx
这个表示这个软连接文件（可以理解为Window下的快捷方式，它指向一个真实的文件） 参考这里：https://zhidao.baidu.com/question/235514756.html
特别注意的是这些文件在window下是复制不了的，会报错，所以在window下复制你编译的.so库的时候
请不要复制这些文件大小是0kb或者1kb的文件。



###4.  测试，恭喜你，编译成功后应该的到了 .so 文件和 头文件，走到了这一步，反正我是花了大半天的时间
那么怎么测试我们编译好的so库可以在android 下正常使用呢？
我提供一个简单的方法，打开这个github 仓库，这是一个FFmpee on android 的demo，把这个demo的so库替换为我们自己编译的so库，然后编译运行，效果一样，不闪退
就算编译成功了吧。

https://github.com/huweijian5/MediaApp


#总结：
这篇文章非常简陋，因为其实步骤什么的基本和Ubuntu下编译是一样的，只是提供了一个新的思路，使用Windows 10 的linux子系统其实非常简单就可以编译FFmpeg，我把遇到的一些坑记录下来，大家看到的话绕过即可。

PS：Demo的Github仓库：https://github.com/bylijian/ffmpeg3.2_build/



















