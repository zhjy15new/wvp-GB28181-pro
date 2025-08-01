# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目简介

WVP-GB28181-PRO是一个基于GB28181-2016标准实现的开箱即用的网络视频平台，负责实现核心信令与设备管理后台部分，支持NAT穿透，支持海康、大华、宇视等品牌的IPC、NVR接入，支持国标级联。

## 技术栈

### 后端
- **框架**: Spring Boot 2.7.18
- **数据库**: MySQL/PostgreSQL/人大金仓
- **缓存**: Redis
- **SIP协议栈**: jain-sip-ri 1.3.0-91
- **流媒体**: 基于ZLMediaKit
- **API文档**: SpringDoc OpenAPI + Knife4j

### 前端
- **框架**: Vue 2.6.10 + Element UI 2.15.14
- **构建工具**: Vue CLI
- **播放器**: Jessibuca (H.264/H.265)、h265web.js、WebRTC

## 常用命令

### 后端构建与运行
```bash
# Maven构建 (默认jar包)
mvn clean package

# 构建war包
mvn clean package -P war

# 运行应用
java -jar target/wvp-pro-*.jar

# 使用脚本运行
./run.sh

# 打包脚本(生成带配置的压缩包)
./buildPackage.sh
```

### 前端开发与构建
```bash
cd web

# 安装依赖
npm install

# 开发环境运行
npm run dev

# 生产环境构建
npm run build:prod

# 代码检查
npm run lint

# 单元测试
npm run test:unit
```

### Docker部署
```bash
cd docker

# 构建并启动所有服务
docker-compose up -d

# 构建脚本
./build.sh

# 升级脚本
./docker-upgrade.sh
```

## 项目架构

### 核心模块结构

#### GB28181模块 (`src/main/java/com/genersoft/iot/vmp/gb28181/`)
- **bean/**: 数据模型定义，包含设备、通道、平台等核心实体
- **controller/**: REST API控制器，处理设备管理、播放控制、PTZ控制等
- **service/**: 业务逻辑层，实现设备服务、通道服务、平台服务等
- **transmit/**: SIP信令传输处理，包含SIP消息发送和处理逻辑
- **session/**: 会话管理，处理音频广播、目录数据、邀请会话等
- **utils/**: 工具类，包含坐标转换、SIP工具、XML解析等

#### 流媒体模块 (`src/main/java/com/genersoft/iot/vmp/media/`)
- **zlm/**: ZLMediaKit集成，包含RESTful API调用和HTTP Hook处理
- **bean/**: 媒体服务器相关数据模型
- **service/**: 媒体服务接口定义

#### 业务服务模块 (`src/main/java/com/genersoft/iot/vmp/service/`)
- **云端录像**: 录像计划、录像文件管理
- **流代理/推流**: RTSP/RTMP流的代理和推送
- **用户管理**: 用户认证、权限管理、API密钥管理

### 前端架构 (`web/src/`)
- **views/**: 页面组件
  - `device/`: 设备管理界面
  - `live/`: 实时监控界面
  - `platform/`: 级联平台管理
  - `cloudRecord/`: 云端录像管理
- **components/**: 通用组件，包含播放器、PTZ控制等
- **api/**: API接口封装
- **store/**: Vuex状态管理

### 配置文件
- `src/main/resources/application.yml`: 主配置文件
- `src/main/resources/application-dev.yml`: 开发环境配置
- `src/main/resources/application-docker.yml`: Docker环境配置
- `src/main/resources/配置详情.yml`: 详细配置说明

### 数据库
- `数据库/`: 包含各版本的数据库初始化和升级脚本
- 支持MySQL、PostgreSQL、人大金仓数据库
- 脚本按版本组织：2.7.4为最新版本

## 开发注意事项

### 关键业务流程
1. **设备注册**: GB28181设备通过SIP REGISTER注册到平台
2. **目录查询**: 通过SIP MESSAGE查询设备通道目录
3. **实时预览**: 通过SIP INVITE建立媒体会话，使用ZLMediaKit转发流媒体
4. **录像回放**: 查询设备录像并通过媒体会话播放历史录像
5. **平台级联**: 向上级平台注册并推送通道，接收上级平台控制命令

### SIP信令处理
- SIP消息处理主要在`gb28181/transmit/`目录
- 使用jain-sip协议栈处理SIP消息
- 支持UDP和TCP两种传输模式

### 流媒体处理
- 依赖ZLMediaKit作为流媒体服务器
- 通过RESTful API与ZLMediaKit交互
- 支持RTSP、RTMP、HTTP-FLV、WebSocket-FLV、HLS等多种协议

### 前端播放器
- 优先使用Jessibuca播放器（支持H.264/H.265）
- h265web.js专用于H.265解码
- WebRTC用于低延迟播放

### 测试
- 后端测试在`src/test/java/`目录
- 前端测试在`web/tests/`目录
- Maven配置跳过测试：`mvn clean package -DskipTests`

### 部署方式
- **单机部署**: 直接运行jar包
- **Docker部署**: 使用docker-compose编排多服务
- **分布式部署**: WVP与ZLMediaKit可分开部署
- **集群部署**: 支持多媒体节点负载均衡