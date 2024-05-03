# 2024.5.3 对 Dockerfile 文件进行以下修改：

在原版基础上对 Dockerfile 文件进行以下修改：

1.最小化图层：尽可能组合命令以减少图像中的图层数。

2.安全性：如果可能，避免以 root 身份运行容器。考虑在 Dockerfile 中创建一个用户并切换到该用户。

3.非根用户：出于安全原因，以非根用户身份在容器内运行进程。

4.版本固定：固定使用 apk 安装的软件包的版本，以确保可重复性。

5.清理：使用 apk 安装依赖项后，删除缓存以减小图像大小。

通过这些调整，Dockerfile 更加安全，并且更严格地遵循最佳实践。该应用程序现在以非根用户身份运行，并且在构建后删除不必要的包以保持较小的图像大小。

（感谢原作者)

同步 [dockerhub](https://hub.docker.com/r/dzluck/flowerss-bot)

# flowerss bot

[![Build Status](https://github.com/indes/flowerss-bot/workflows/Release/badge.svg)](https://github.com/indes/flowerss-bot/actions?query=workflow%3ARelease)
[![Test Status](https://github.com/indes/flowerss-bot/workflows/Test/badge.svg)](https://github.com/indes/flowerss-bot/actions?query=workflow%3ATest)
![Build Docker Image](https://github.com/indes/flowerss-bot/workflows/Build%20Docker%20Image/badge.svg)
[![Go Report Card](https://goreportcard.com/badge/github.com/indes/flowerss-bot)](https://goreportcard.com/report/github.com/indes/flowerss-bot)
![GitHub](https://img.shields.io/github/license/indes/flowerss-bot.svg)

[安装与使用文档](https://flowerss-bot.now.sh/)  

<img src="https://github.com/rssflow/img/raw/master/images/rssflow_demo.gif" width = "300"/>

## Features

- 常见的 RSS Bot 该有的功能
- 支持 Telegram 应用内 instant view
- 支持为 Group 和 Channel 订阅 RSS 消息
- 丰富的订阅设置

## 安装与使用

详细安装与使用方法请查阅项目[使用文档](https://flowerss-bot.now.sh/)。  

使用命令：

```
/sub [url] 订阅（url 为可选）
/unsub [url] 取消订阅（url 为可选）
/list 查看当前订阅
/set 设置订阅
/check 检查当前订阅
/setfeedtag [sub id] [tag1] [tag2] 设置订阅标签（最多设置三个Tag，以空格分割）
/setinterval [interval] [sub id] 设置订阅刷新频率（可设置多个sub id，以空格分割）
/activeall 开启所有订阅
/pauseall 暂停所有订阅
/import 导入 OPML 文件
/export 导出 OPML 文件
/unsuball 取消所有订阅
/help 帮助
```
详细使用方法请查阅项目[使用文档](https://flowerss-bot.now.sh/#/usage)。 
