# 南京大学学位论文 LaTeX 模板 #

## 简介 ##

NJUthesis 宏包在 [CASthesis](http://www.ctex.org/PackageCASthesis) 宏包的基础上根据南京大学对学位论文的规定修改而来。宏包的另一个目的是简化学位论文的撰写，使得论文作者可以将精力集中到论文的内容上而不是浪费在版面设置上。同时宏包在符合学位论文撰写要求的基础上尽可能地进行美化，其中还参考了出版界的一些排版规范。

## 本宏包支持 ##

本宏包目前有两个选项： phd 和 master，分别对应于博士学位论文和硕士学位论文。当选择 phd 时，模板会自动生成国家图书馆格式的封面，但不包括书脊，书脊需要单独制作。

本模板默认使用 BibTeX 处理参考文献，如果您不使用 BibTeX，您需要手动修改模板中的参考文献数据用引用方式。此外，推荐使用 [JabRef](http://jabref.sourceforge.net/) 管理您的 bib 参考文献数据库（本宏包作者亦是该软件中文版译者），其使用方式可以参见这篇文章：[文献管理软件 JabRef 快速入门](http://blog.solrex.org/articles/jabref-quick-guide.html)。

## 本宏包不支持 ##

南京大学本科学位论文格式。

## 下载和安装 ##

NJUthesis 宏包的最新版本可以从 http://njuthesis.googlecode.com/ 网站或者 http://share.solrex.org/njuthesis/ 网站下载。

NJUthesis 宏包主要包含两个文件：NJUthesis.cls 和 NJUthesis.cfg，
还有一个额外的 BibTeX 格式控制的 NJUthesis.bst，不过您完全可以使用
自己的 .bst 文件或者根本不使用 BibTeX。

简单方便的安装方法是将宏包文件和学位论文.tex 文件放置在同一目录
下。或者将宏包文件放置到 TEX 系统的 localtexmf/tex/latex/njuthesis 目录下，然
后刷新 TEX 系统的文件名数据库。

同时，宏包还提供了一个使用模板，也就是这份说明文档的源文件。用户
可以通过修改这个模板来编写自己的学位论文。

关于安装过程的问题可以参考 CTEX-FAQ 以及其他 LATEX 教材。

## 编译 ##

如果您使用 BibTeX 来管理自己的参考文献，那么在Windows 下您可以直接双击 make.bat 或
者在命令行当前目录下执行 make 来生成 pdf 文件。

如果您不使用 BibTeX，那么您需要用记事本或者其它文本编辑器打开 make.bat，去掉 bibtex 命令。

## TODO 列表 ##

  * （高优先级）增加本科生论文格式，当bachelor 作为模板参数时生成本科生毕业论文格式。
  * （低优先级）提供UTF-8 格式，在此格式下提供对Linux 系统的支持。

## 参与本项目 ##

我们欢迎，或者不妨说我们期望，任何有兴趣的朋友参与本项目。如果您有较为重要的 patch 被接受，而且您本人愿意参与此项目，我们将非常非常乐意将您纳入项目成员中。

## Legacy Introdcution ##

NJUThesis is a LaTeX template package based on ThuThesis for Nanjing University, in order to make it easy to write thesises of bachelor, master or doctor.

Thanks fro SinoSuSE, who contirbutes all the files here.

This is the begining.
