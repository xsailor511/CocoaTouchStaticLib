# 测试将文件打包成静态库
新建cocoa touch static libray 项目(ios)，主要用到设置里面的build phases，在此选项下

1.设置Headers,如果没有此项目，就点击build phases 左上角的“+”，新增New Headers Phase

* Headers项目下有三个子项目，分别为Public, Private, Project,如果你新建一个文件，其.h文件会自动加载到
Project 子项目下。但是我们既然要使用，一般都是把头文件拖到Public下（对，直接拖拽就行）。


2.设置Compile Sources ，这个主要包含.m 文件，一般你添加了.h文件到Headers下面之后，或者你新建一个文件时，xcode都会
自动添加.m文件到Compile Sources，当然，如果你发现没有，可以新增，点击左下角的"+"就可以了


3.光有a文件还是不够的，还需要导出头文件，这些导出的头文件需要拷贝到项目中，项目才能正确的使用.a 文件

* 所以，这就需要设置build phases项目下的Copy Files,这个项目配置了哪些头文件会被拷贝出去，以及拷贝的路径
* 我们都知道，文件不可能都在一个目录下，因此需要分包，我们需要为每个文件夹下的头文件新建一个Copy Files,在
本例子中就使用了两个Copy Files项目（新增也是在build phases左上角的"+" ==> New Copy Files Phases),
具体可以查看本例子中的具体设置

4.设置好上面的东西，就可以cmd+B 进行编译了，编译完毕就可以在Products下看到生成的a文件

5.使用静态库，静态库实际上包含了两个内容，一是.a文件，二是.h 文件，因此把上面3中拷贝出来的头文件和.a文件放到项目中
* 本例子中，.h 文件和.a 文件处于同一个目录下（右击Products/libCocoaTouchStaticLib.a  ==> show in finder查看生成的文件，这些文件就可以拖入项目使用了）

6.针对虚拟机simulator和真机，会生成不同的a文件

* 我们都知道build项目分为debug 和Release两种，在Edit Scheme里配置build的方式
（菜单路径：Product==>Scheme==>Edit Scheme) Run 下面的Build Configuration
设置为Release时，build就会生成Release版本的.a文件，debug以此类推，我们项目一般用Release版本的
* 真机，选择Generic ios Device,然后 build
* 虚拟机，选择iPhone 7 plus ，然后 build
* 合并真机，虚拟机:

```
$ lipo -create Release-iphoneos/libCocoaTouchStaticLib.a Release-iphonesimulator/libCocoaTouchStaticLib.a -output libCocoaTouchStaticLib.a

```
