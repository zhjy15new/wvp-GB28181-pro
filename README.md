# WVP-GB28181-PRO 视频监控平台

<div align="center">

![logo](doc/_media/logo.png)

**开箱即用的国标GB28181视频监控平台**

[![license](http://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![JAVA](https://img.shields.io/badge/language-java-red.svg)](https://www.java.com/)
[![Vue](https://img.shields.io/badge/framework-vue-brightgreen.svg)](https://vuejs.org/)
[![platform](https://img.shields.io/badge/platform-linux%20|%20windows%20|%20docker-blue.svg)](https://github.com/pan648540858/wvp-GB28181-pro)

[💡 快速开始](#-快速开始) •
[📖 功能介绍](#-功能介绍) •
[🛠 安装部署](#-安装部署) •
[📚 开发文档](#-开发文档) •
[❓ 常见问题](#-常见问题)

</div>

## 🎯 项目简介

WVP-GB28181-PRO 是一个**完全基于web页面**的视频监控平台，让您无需安装任何客户端软件，直接在浏览器中管理和观看监控视频。

### 🌟 核心特点

- **🎪 零插件播放**: 浏览器直接播放，无需安装任何插件
- **🔌 设备兼容性强**: 支持海康、大华、宇视等主流厂商设备  
- **🌐 标准化协议**: 完整实现GB28181-2016国家标准
- **📱 现代化界面**: 响应式设计，支持PC和移动端
- **🚀 开箱即用**: 提供完整的部署方案和配置模板

### 🎥 适用场景

- **企业监控**: 工厂、办公楼、仓库等场所的安防监控
- **智慧城市**: 道路交通、公共区域监控集成
- **教育行业**: 校园安防、远程教学监控
- **医疗机构**: 医院安防、重要区域监控
- **零售连锁**: 门店监控、连锁管理
- **住宅小区**: 社区安防、访客管理

## 💡 快速开始

### 30秒快速体验

```bash
# 1. 克隆项目
git clone https://github.com/pan648540858/wvp-GB28181-pro.git
cd wvp-GB28181-pro

# 2. 使用Docker快速部署(推荐)
cd docker
docker-compose up -d

# 3. 等待服务启动(约1-2分钟)，然后访问
# http://localhost:18080
# 默认账号: admin / admin
```

### 🖥️ 系统界面预览

<table>
    <tr>
        <td align="center"><img src="doc/_media/1.png" width="400"><br><b>📊 登录页面</b></td>
        <td align="center"><img src="doc/_media/2.png" width="400"><br><b>🏠 系统首页</b></td>
    </tr>
    <tr>
        <td align="center"><img src="doc/_media/3.png" width="400"><br><b>📺 多屏播放</b></td>
        <td align="center"><img src="doc/_media/4.png" width="400"><br><b>📋 设备管理</b></td>
    </tr>
</table>

## 📖 功能介绍

### 🎛️ 设备管理
- **设备接入**: 支持GB28181设备自动注册和手动添加
- **通道管理**: 摄像头通道的增删改查、批量操作
- **设备状态**: 实时监控设备在线状态、信号质量
- **设备控制**: 重启、复位等设备控制功能

### 📹 视频功能
- **实时预览**: 
  - 支持H.264/H.265编码格式
  - 多种播放器: Jessibuca、H265Web、WebRTC
  - 1/4/9/16分屏同时观看
- **录像回放**: 
  - 设备本地录像查询和播放
  - 云端录像存储和管理  
  - 录像下载和导出
- **云台控制**: 
  - 方向控制: 上下左右、变焦
  - 预置位管理: 设置、调用、删除
  - 巡航功能: 自定义巡航路径

### 🌐 平台级联
- **上级接入**: 向上级监控平台注册并推送通道
- **下级管理**: 接收下级平台的设备和通道
- **跨网传输**: 支持NAT穿透和网闸互联
- **负载均衡**: 多节点部署，自动负载分配

### 📊 系统管理
- **用户管理**: 用户账号、角色权限管理
- **日志管理**: 系统日志、操作日志查看
- **配置管理**: 系统参数、网络配置
- **监控统计**: 系统性能、资源使用情况

## 🛠 安装部署

### 📋 系统要求

| 组件 | 最低要求 | 推荐配置 |
|------|----------|----------|
| **操作系统** | Linux/Windows | Linux CentOS 7+ |
| **CPU** | 2核心 | 4核心+ |
| **内存** | 4GB | 8GB+ |
| **存储** | 50GB | 200GB+ SSD |
| **Java** | JDK 1.8+ | OpenJDK 11 |
| **数据库** | MySQL 5.7+ | MySQL 8.0+ |

### 🐳 Docker部署 (推荐新手)

这是最简单的部署方式，适合快速测试和小规模使用：

```bash
# 1. 下载项目
git clone https://github.com/pan648540858/wvp-GB28181-pro.git
cd wvp-GB28181-pro/docker

# 2. 启动所有服务
docker-compose up -d

# 3. 查看服务状态
docker-compose ps

# 4. 查看日志
docker-compose logs wvp

# 5. 访问系统
# 浏览器打开: http://你的服务器IP:18080
# 默认账号: admin / admin
```

### 🖥️ 手动部署 (生产环境推荐)

适合需要自定义配置和生产环境使用：

#### 1. 准备环境

```bash
# 安装Java 8
sudo yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel

# 安装MySQL
sudo yum install mysql-server
sudo systemctl start mysqld
sudo systemctl enable mysqld

# 安装Redis
sudo yum install redis
sudo systemctl start redis
sudo systemctl enable redis
```

#### 2. 数据库初始化

```bash
# 创建数据库
mysql -u root -p
CREATE DATABASE wvp_pro DEFAULT CHARACTER SET utf8mb4;
CREATE USER 'wvp_user'@'localhost' IDENTIFIED BY '你的强密码';
GRANT ALL PRIVILEGES ON wvp_pro.* TO 'wvp_user'@'localhost';

# 导入数据库结构
mysql -u wvp_user -p wvp_pro < 数据库/2.7.4/初始化-mysql-2.7.4.sql
```

#### 3. 安装ZLMediaKit

```bash
# 下载并安装ZLMediaKit
wget https://github.com/ZLMediaKit/ZLMediaKit/releases/download/latest/ZLMediaKit_linux.tar.xz
tar -xvf ZLMediaKit_linux.tar.xz
cd ZLMediaKit_linux
./MediaServer -d
```

#### 4. 配置和启动WVP

```bash
# 编辑配置文件
vim src/main/resources/application-dev.yml

# 修改数据库连接
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/wvp_pro?...
    username: wvp_user
    password: 你的数据库密码

# 修改Redis连接
  redis:
    host: localhost
    password: 你的Redis密码

# 编译运行
mvn clean package -DskipTests
java -jar target/wvp-pro-*.jar --spring.profiles.active=dev
```

### ⚙️ 配置说明

关键配置项解释：

```yaml
# SIP服务配置 - GB28181协议服务
sip:
  ip: 0.0.0.0          # 监听IP，0.0.0.0表示监听所有网卡
  port: 5060            # SIP服务端口，默认5060
  domain: 4401020000    # 你的行政区划编码
  id: 44010200002000000001  # 平台编码，必须唯一

# 流媒体服务配置
media:
  ip: 127.0.0.1         # ZLMediaKit服务器IP
  http-port: 80         # ZLMediaKit HTTP端口
  secret: 你的密钥      # 与ZLMediaKit配置保持一致
```

## 📚 开发文档

### 📖 文档导航

- **[🚀 README-DEV.md](README-DEV.md)**: 详细的开发者指南，包含完整的开发环境搭建、架构分析、调试技巧
- **[🔧 CLAUDE.md](CLAUDE.md)**: 项目架构说明和常用命令，适合快速上手
- **[📋 Clear-Log.md](Clear-Log.md)**: 历史包袱清理记录，了解项目优化过程

### 🏗️ 技术架构

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   前端界面       │    │   WVP后端        │    │   ZLMediaKit    │
│   (Vue.js)      │────│   (Spring Boot) │────│   (流媒体服务)   │
│                 │    │                 │    │                 │
│ - Element UI    │    │ - REST API      │    │ - RTSP/RTMP     │
│ - 多种播放器     │    │ - GB28181协议    │    │ - HTTP-FLV      │  
│ - 响应式设计     │    │ - 设备管理       │    │ - WebRTC        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   MySQL/PgSQL   │    │      Redis      │    │   监控设备       │
│   (数据存储)     │    │   (缓存/队列)    │    │  (摄像头/NVR)    │  
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 🔧 开发环境

```bash
# 后端开发
cd wvp-GB28181-pro
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# 前端开发  
cd web
npm install
npm run dev

# 访问地址
# 后端API: http://localhost:18080
# 前端页面: http://localhost:9528
```

## ❓ 常见问题

### 🔧 部署问题

<details>
<summary><b>Q: Docker启动失败，提示端口占用？</b></summary>

**A**: 检查端口占用并修改配置
```bash
# 查看端口占用
netstat -tulpn | grep :18080

# 修改docker-compose.yml中的端口映射
ports:
  - "18081:18080"  # 改为其他端口
```
</details>

<details>
<summary><b>Q: 页面打开白屏，无法访问？</b></summary>

**A**: 按以下步骤排查：
```bash
# 1. 检查服务状态
docker-compose ps

# 2. 查看日志
docker-compose logs wvp

# 3. 检查防火墙
sudo firewall-cmd --list-ports
sudo firewall-cmd --add-port=18080/tcp --permanent
```
</details>

### 📹 使用问题

<details>
<summary><b>Q: 设备注册失败，显示离线？</b></summary>

**A**: 检查网络和配置：
```bash
# 1. 确认设备能访问WVP服务器
ping WVP服务器IP

# 2. 检查SIP端口是否开放
telnet WVP服务器IP 5060

# 3. 验证设备配置中的服务器地址和端口
```
</details>

<details>
<summary><b>Q: 视频无法播放，黑屏？</b></summary>

**A**: 按以下步骤排查：
1. 检查ZLMediaKit服务是否正常运行
2. 确认设备支持的编码格式 (H.264/H.265)
3. 尝试切换不同的播放器
4. 检查网络带宽是否足够
</details>

### ⚙️ 性能优化

<details>
<summary><b>Q: 系统支持多少路视频？</b></summary>

**A**: 取决于服务器配置：
- **2核4G**: 约10-20路1080P
- **4核8G**: 约30-50路1080P  
- **8核16G**: 约80-100路1080P

建议使用SSD存储和千兆网络以获得最佳性能。
</details>

## 🤝 参与贡献

### 🌟 如何参与

我们欢迎所有形式的贡献：

- **🐛 报告问题**: [提交Issue](https://github.com/pan648540858/wvp-GB28181-pro/issues)
- **💡 功能建议**: 在Issue中描述你的想法
- **📝 改进文档**: 帮助完善文档和示例
- **🔧 代码贡献**: 提交Pull Request

### 📧 获取帮助

- **官方文档**: [https://doc.wvp-pro.cn](https://doc.wvp-pro.cn)
- **GitHub Issues**: [问题反馈](https://github.com/pan648540858/wvp-GB28181-pro/issues)
- **技术交流**: 详见官方文档中的社群信息

## 📄 开源协议

本项目采用 [MIT License](LICENSE)，这意味着：

- ✅ 商业使用
- ✅ 修改源码  
- ✅ 分发
- ✅ 私人使用

只需要保留版权声明即可。

## 🙏 致谢

感谢以下开源项目的支持：

- **[ZLMediaKit](https://github.com/ZLMediaKit/ZLMediaKit)**: 高性能流媒体服务器
- **[Jessibuca](https://github.com/langhuihui/jessibuca)**: WebAssembly H.264/H.265播放器
- **[Vue Admin Template](https://github.com/PanJiaChen/vue-admin-template)**: 管理后台模板
- **[Spring Boot](https://spring.io/projects/spring-boot)**: Java企业级开发框架

## 📈 项目统计

<div align="center">

![GitHub stars](https://img.shields.io/github/stars/pan648540858/wvp-GB28181-pro?style=social)
![GitHub forks](https://img.shields.io/github/forks/pan648540858/wvp-GB28181-pro?style=social)
![GitHub issues](https://img.shields.io/github/issues/pan648540858/wvp-GB28181-pro)
![GitHub last commit](https://img.shields.io/github/last-commit/pan648540858/wvp-GB28181-pro)

**⭐ 如果这个项目对你有帮助，请给我们一个Star！**

</div>

---

<div align="center">

**🎉 开始你的视频监控之旅吧！**

[⬆️ 回到顶部](#wvp-gb28181-pro-视频监控平台)

</div>