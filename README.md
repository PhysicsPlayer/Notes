这是我写物理感想的地方，不特别记录知识点，更多记录整体逻辑和零散的感悟

文档采取多文档编译模式，主文档是`main.tex`，在里面指明章节标题和引用子文档。子文档位于`./Part/`文件夹下，此文件夹下一个文件夹表示一个专题（即一本独立的书），在一个专题文件夹内，一个文档表示一个章节，不写章节序号，只给出章节题目。部分专题文件夹下，一个文档即表示一本书

每个子文档要有完整的文档结构，开头用`\documentclass[../../main.tex]{subfiles}`指明主文档，导言区可以正常引用宏包

交叉引用正常书写，无需额外操作（但只有在编译主文档是才有效，子文档编译不出来）

---
[![License: Apache-2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)

本项目采用 Apache-2.0 许可协议，详见 [LICENSE](./LICENSE) 与 [NOTICE](./NOTICE)。