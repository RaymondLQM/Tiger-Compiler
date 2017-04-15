# Tiger-Compiler
This is a compiler for Tiger language.
## 2017/04/15 v0.0.2
 1. 这次更新基本上啥都没写，思路好混乱。
 2. 主要更改的东西有：
   + 词法分析部分全部返还定义的 Token 类型，不再直接返回字符（对于操作符来说）；
   + 语法分析部分想重新按照书上所说的情况来写，但是有点懵逼，只写了一点；
   + 抽象语法的部分，把书上给的代码移植到项目中，并且修改的 Makefile 文件；
   + 将虎书上给的全部源代码放在了 reference 目录当中。
 3. 这次的主要工作是理了一下从词法到抽象语法的整体思路，文档太长，所以我把他放在了[这里](./reference/idea.md)。

-------
## 2017/04/13 v0.0.1

 1. 初步实现了 Yacc 语法分析的内容，写明了 BNF 语法，执行`make`命令可以成功，但是并没有经过测试，不保证全部正确；
 2. 在 reference 文件夹中添加了我实验四写的 lex 和 yacc 程序，用来进行参考。
 3. 对于部分操作符的处理，如括号，分号，冒号等，现在使用的是字符，但是建议用 token 代替（还未进行修改）。

-------
## 2017/04/10 v0.0.0

 1. 更新了项目的文件结构；
 2. 重写了项目的 Makefile 文件；
 3. 词法分析方面实现了对 Tiger 语言的关键字、操作符（标点符号）、标识符以及基本类型（int、string）数据的识别；
 4. 语法分析方面定义了 token，但是语法规则还没有写，只是单纯的写了一个测试用的规则。

### 文件结构
 + **source**：存储我们所有手写的源代码，包括 lex 程序、yacc 程序以及之后会写的 C 源程序；
 + **tmp**： 存储工程在编译生成过程中的中间文件，可以通过`make clean`命令清除。在git上传时，不会上传这个文件夹中的内容；
 + **reference**：存储一些参考代码，并不参与工程的编译生成；
 + **test**：存储 Tiger 语音的一些测试程序，目前只有一个小的测试程序；
 + **compiler**： 项目生成的可执行文件，运行环境为 Linux，可通过`make`命令重新生成或更新；
 + **makefile**： 项目的 Makefile 文件；
 + **README.md**： 项目的 Readme 文件，存储更新信息以及其他不方便放在commit里的信息；

### Makefile指令
 + `make`： 编译生成目标文件（可执行程序）compiler；
 + `make clean`：清空 tmp 文件夹中的内容，可以节省磁盘空间。

-----
