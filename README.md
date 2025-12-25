🎄 Magic Christmas Tree - 3D 手势交互相册
一个基于 Web 的 3D 粒子圣诞树，支持 AI 手势控制与沉浸式照片浏览。

本项目结合了 Three.js (3D 粒子特效) 和 Google MediaPipe (手势识别)，打造了一个无需鼠标键盘，仅通过摄像头手势即可互动的魔法圣诞树相册。

(建议替换为你项目的实际运行截图)

✨ 核心功能
🌌 粒子特效：数千个粒子组成的动态场景，支持“聚合（圣诞树）”和“散开（星云）”两种形态的流畅切换。

🤖 AI 手势控制：

✊ 握拳：粒子聚合成旋转的圣诞树。

🖐 张手：粒子炸开，变成漫天星尘。

👌 捏合 (Pinch)：自动抓取并聚焦查看下一张照片（带有穿梭动画）。

👋 挥手：在星云散开状态下，控制视角旋转。

🖼️ 智能相册：

支持加载本地 assets 文件夹中的照片序列。

支持界面按钮手动上传照片。

照片在 3D 空间中悬浮，查看时自动旋转至屏幕中心。

🎨 双主题切换：内置“经典黑金 (Classic)”和“冰雪奇缘 (Frozen)”两套视觉/配色主题。

🎵 沉浸体验：支持背景音乐播放与泛光 (Bloom) 后期特效。

📂 目录结构
为了确保程序正常运行，请保持以下目录结构：

Plaintext

MyChristmasTree/
│
├── index.html                # 主程序入口 (包含核心代码)
├── 启动(Edge).bat            # Windows 快速启动脚本 (无需安装环境)
├── README.md                 # 说明文档
│
└── assets/                   # [重要] 资源文件夹
    ├── hand_landmarker.task  # MediaPipe AI 模型文件 (必须存在!)
    ├── music.mp3             # 背景音乐
    ├── 1.jpg                 # 自动加载的照片 1
    ├── 2.jpg                 # 自动加载的照片 2
    ├── 3.jpg                 # ... 以此类推 (必须小写 .jpg)
    └── ...
🚀 如何运行
由于浏览器安全策略（CORS）限制，以及 AI 模型加载需求，直接双击 index.html 是无法运行的（会出现摄像头无法启动、模型加载失败等问题）。

请选择以下任意一种方式运行：

✅ 方法 1：Windows 快速启动（推荐新手）
如果你使用的是 Windows 电脑，且不想配置开发环境：

确保电脑上安装了 Microsoft Edge 浏览器。

直接双击根目录下的 启动(Edge).bat 脚本。

脚本会自动打开一个配置好权限的浏览器窗口，即可直接体验。

✅ 方法 2：使用 VS Code Live Server（推荐开发者）
使用 Visual Studio Code 打开项目文件夹。

安装插件 Live Server。

在 index.html 上右键，选择 "Open with Live Server"。

✅ 方法 3：Python 本地服务
如果你电脑安装了 Python，在项目根目录打开终端/命令行，输入：

Bash

python -m http.server
然后在浏览器访问 http://localhost:8000。

⚙️ 配置与自定义
1. 添加照片
自动加载：将你的照片重命名为 1.jpg, 2.jpg... 放入 assets 文件夹。程序启动时会自动读取前 5 张（可在代码 CONFIG.maxAutoLoadPhotos 修改数量）。

手动上传：运行后点击界面右下角的“上传更多照片”按钮。

提示：建议将照片长边压缩至 1920px 以下，单张体积控制在 500KB 以内，以保证流畅度。

2. 更换音乐
将你喜欢的音乐命名为 music.mp3，覆盖 assets 文件夹中的同名文件。

3. AI 模型
本项目依赖 hand_landmarker.task 文件。如果缺失，请从 Google 官方下载 并放入 assets 目录。

🛠️ 技术栈
HTML5 / CSS3

JavaScript (ES6+)

Three.js (r160) - WebGL 3D 渲染引擎

MediaPipe Tasks Vision - 手部关键点检测

❓ 常见问题 (FAQ)
Q: 打开后一直显示 "LOADING MAGIC..." 且没有摄像头画面？ A: 请按 F12 打开控制台查看报错。

如果是 ERR_FILE_NOT_FOUND：检查 assets 目录下是否有 hand_landmarker.task。

如果是 CORS 或 Access-Control-Allow-Origin 错误：说明你直接双击了 html 文件。请参考【如何运行】章节，使用 启动(Edge).bat 或 Live Server 运行。

Q: 照片显示太白/过曝？ A: 这是由于泛光特效导致的。现在的代码已经优化了材质（使用了灰色滤镜压暗），请确保使用的是最新版代码。

Enjoy your Magic Christmas! 🎄
