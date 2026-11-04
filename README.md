## 项目简介
这是我写物理感想的地方，不特别记录知识点，更多记录整体逻辑和零散的感悟

项目采取多文档编译模式，主文档是`main.tex`，在里面引用一级子文档。一级子文档位于`./build/`文件夹下，此文件夹下的每一个`tex`表示一个独立的专题（即一本独立的书），在里面引用二级子文档，引用的先后顺序就是二级子文档的成书顺序。

二级子文档位于`./Part/`文件夹下，此文件夹下一个子文件夹表示一个专题（即一本独立的书），在一个专题文件夹内，一个`tex`表示一个章节，不写章节序号，只给出章节题目。

每个子文档要有完整的文档结构，一级子文档开头用`\documentclass[../main.tex]{subfiles}`指明主文档，二级子文档开头用`\documentclass[../../main.tex]{subfiles}`指明主文档。子文档导言区可以正常引用宏包和设置宏命令，但建议在`main.tex`中引用和设置宏命令。

交叉引用正常书写，无需额外操作（但只有在编译主文档和一级子文档时才有效，编译二级子文档时跨章节引用无效）

---

## 编译指南
1. 首先克隆该仓库
	```
	git clone https://github.com/Physicsplayer/Notes.git && cd Notes
	```
	或者
	```
	git clone https://gitee.com/Physicsplayer/Notes.git && cd Notes
	```

2. 调用`xelatex`连续编译两次即可，推荐在[Visual Studio Code](https://code.visualstudio.com/)中借助[LaTeX Workshop](https://github.com/James-Yu/LaTeX-Workshop)插件辅助编译。

3. 也可以在终端中调用编译脚本编译

	对于`Linux/MacOS`
	```
	./build.sh
	```
	对于`Windows`
	```
	.\build.ps1
	```
	编译后可以调用清理脚本删除辅助文件
	对于`Linux/MacOS`
	```
	./clean.sh
	```
	对于`Windows`
	```
	.\clean.ps1
	```
	> PS:所有脚本均由AI生成，本人对运行结果不符任何责任，请仔细阅读脚本后再运行。所有脚本只在`Debian13`平台上运行过，未在其余平台测试。本人使用`TexLive2025`，其余发行版未做测试。
## TODO

- [x] 线性代数
	- [x] 相似变换
	- [x] 特征值与特征向量
	- [x] 复线性空间
- [ ] 微分几何
	- [ ] 欧式空间的张量
	- [ ] 一般流形上的张量
- [ ] 量子力学
	- [ ] 观念的转变
	- [ ] 数学基础
	- [ ] 量子力学的基本原理
	- [ ] 基本原理的简单运用
	- [ ] 一维谐振子
	- [ ] 角动量理论
	- [ ] 中心势场
	- [ ] 自旋
	- [ ] 角动量的耦合
	- [ ] 定态微扰理论
- [ ] 热力学与统计物理学
	- [x] 热统在干什么
	- [ ] 热力学定律与热力学过程
	- [ ] 均匀热力学系统的性质
	- [ ] 单元平衡复相系
	- [ ] 多元平衡复相系
	- [x] 系综理论基本原理
	- [x] 正则系综
	- [x] 正则系综的若干应用
	- [x] 巨正则系综
	- [ ] 量子理想气体
---
## 文档模板

本项目采用$\text{Elegant}\LaTeX$项目中的[ElegantBook](https://github.com/ElegantLaTeX/ElegantBook)作为模板

---
## LICENCE

本项目采用 Apache-2.0 许可协议，详见 [LICENSE](./LICENSE) 与 [NOTICE](./NOTICE)。