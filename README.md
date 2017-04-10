# Tiger-Compiler
This is a compiler for Tiger language.

-------
##2017/04/10 v0.0.0

 1. 更新了项目的文件结构；
 2. 重写了项目的 Makefile 文件；
 3. 词法分析方面实现了对 Tiger 语言的关键字、操作符（标点符号）、标识符以及基本类型（int、string）数据的识别；
 4. 语法分析方面定义了 token，但是语法规则还没有写，只是单纯的写了一个测试用的规则。

###文件结构
 + ××source××：存储我们所有手写的源代码，包括 lex 程序、yacc 程序以及之后会写的 C 源程序；
 + ××tmp××： 存储工程在编译生成过程中的中间文件，可以通过`make clean`命令清除。在git上传时，不会上传这个文件夹中的内容；
 + ××reference××：存储一些参考代码，并不参与工程的编译生成；
 + ××test××：存储 Tiger 语音的一些测试程序，目前只有一个小的测试程序；
 + ××compiler××： 项目生成的可执行文件，运行环境为 Linux，可通过`make`命令重新生成或更新；
 + ××makefile××： 项目的 Makefile 文件；
 + ××README.md××： 项目的 Readme 文件，存储更新信息以及其他不方便放在commit里的信息；

###Makefile指令
 + `make`： 编译生成目标文件（可执行程序）compiler；
 + `make clean`：清空 tmp 文件夹中的内容，可以节省磁盘空间。

-----
