# WVP-GB28181-PRO 开发者指南

## 📋 目录
- [项目简介](#项目简介)
- [开发环境搭建](#开发环境搭建)
- [项目架构详解](#项目架构详解)
- [核心概念与流程](#核心概念与流程)
- [开发指南](#开发指南)
- [调试技巧](#调试技巧)
- [常见问题](#常见问题)
- [进阶开发](#进阶开发)

## 🚀 项目简介

WVP-GB28181-PRO是一个基于GB28181-2016标准的开箱即用网络视频平台，专为视频监控系统设计。

### 核心功能
- **设备接入**: 支持海康、大华、宇视等主流厂商的IPC/NVR设备
- **实时预览**: 支持H.264/H.265视频流的Web端无插件播放
- **录像回放**: 支持设备本地录像和云端录像的查询与播放
- **云台控制**: 支持PTZ云台控制、预置位管理
- **平台级联**: 支持多级平台互联，实现跨网络视频传输
- **流媒体转发**: 支持RTSP/RTMP流的接入和多协议分发

### 技术特色
- **协议完整性**: 完全实现GB28181-2016国标协议
- **高性能**: 基于ZLMediaKit的高性能流媒体服务
- **跨平台**: 支持x86和ARM架构，适配Linux/Windows/macOS
- **现代化前端**: Vue.js + Element UI响应式界面
- **容器化部署**: 完整的Docker部署方案

## 🛠 开发环境搭建

### 基础环境要求

| 组件 | 版本要求 | 说明 |
|------|----------|------|
| JDK | 1.8+ | 推荐OpenJDK 8或Oracle JDK 8 |
| Maven | 3.6+ | 用于后端项目构建 |
| Node.js | 12+ | 用于前端项目构建 |
| MySQL | 5.7+ / 8.0+ | 主数据库（也支持PostgreSQL） |
| Redis | 5.0+ | 缓存和消息队列 |
| ZLMediaKit | 最新版 | 流媒体服务器 |

### 1. 克隆项目
```bash
git clone https://github.com/your-repo/wvp-GB28181-pro.git
cd wvp-GB28181-pro
```

### 2. 数据库初始化

#### MySQL配置
```sql
-- 创建数据库
CREATE DATABASE wvp_pro DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 创建用户
CREATE USER 'wvp'@'localhost' IDENTIFIED BY 'wvp123456';
GRANT ALL PRIVILEGES ON wvp_pro.* TO 'wvp'@'localhost';
FLUSH PRIVILEGES;

-- 导入初始化脚本
USE wvp_pro;
SOURCE 数据库/2.7.4/初始化-mysql-2.7.4.sql;
```

#### Redis配置
```bash
# 启动Redis服务
redis-server

# 建议配置密码
redis-cli
CONFIG SET requirepass "wvp123456"
CONFIG REWRITE
```

### 3. ZLMediaKit安装

#### Docker方式（推荐）
```bash
docker run -d --name zlm \
  -p 1935:1935 \
  -p 8080:80 \
  -p 8443:443 \
  -p 8554:554 \
  -p 10000:10000 \
  -p 10000:10000/udp \
  -p 8000:8000/udp \
  panjjo/zlmediakit:master
```

#### 源码编译方式
```bash
# 安装依赖
sudo apt-get update
sudo apt-get install cmake build-essential libssl-dev libmysqlclient-dev

# 克隆并编译
git clone https://github.com/ZLMediaKit/ZLMediaKit.git
cd ZLMediaKit
git submodule update --init
mkdir build && cd build
cmake ..
make -j$(nproc)
```

### 4. 后端项目配置

#### 修改配置文件
```yaml
# src/main/resources/application-dev.yml
server:
  port: 18080

spring:
  # 数据库配置
  datasource:
    driver-class-name: com.mysql.cj.jdbc.Driver
    url: jdbc:mysql://localhost:3306/wvp_pro?useUnicode=true&characterEncoding=UTF8&rewriteBatchedStatements=true&useSSL=false&allowMultiQueries=true&useAffectedRows=true&serverTimezone=PRC
    username: wvp
    password: wvp123456
    
  # Redis配置
  redis:
    host: localhost
    port: 6379
    password: wvp123456
    timeout: 10000
    database: 6

# SIP配置
sip:
  ip: 192.168.1.100  # 修改为你的实际IP
  port: 5060
  domain: 4401010000
  id: 44010100002000000001
  password: admin123

# 媒体服务配置
media:
  ip: 192.168.1.100  # ZLMediaKit服务器IP
  http-port: 8080
  secret: 035c73f7-bb6b-4889-a715-d9eb2d1925cc
```

#### 启动后端服务
```bash
# 方式1: 使用Maven直接运行
mvn spring-boot:run -Dspring-boot.run.profiles=dev

# 方式2: 打包后运行
mvn clean package -DskipTests
java -jar target/wvp-pro-*.jar --spring.profiles.active=dev

# 方式3: 使用脚本运行
chmod +x run.sh
./run.sh
```

### 5. 前端项目配置

```bash
cd web

# 安装依赖
npm install

# 修改API地址 (src/utils/request.js)
const service = axios.create({
  baseURL: 'http://localhost:18080', // 后端服务地址
  timeout: 60000
})

# 启动开发服务器
npm run dev
```

### 6. 验证安装

1. **后端服务**: 访问 http://localhost:18080/doc.html (API文档)
2. **前端界面**: 访问 http://localhost:9528
3. **默认账号**: admin / admin

## 🏗 项目架构详解

### 整体架构图
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   前端 (Vue.js)  │    │  后端 (Spring)   │    │ 流媒体 (ZLM)     │
│                 │    │                 │    │                 │
│ - Element UI    │────│ - REST API      │────│ - RTSP/RTMP     │
│ - Axios         │    │ - WebSocket     │    │ - HTTP-FLV      │
│ - 播放器集成     │    │ - SIP Stack     │    │ - HLS           │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   MySQL/PgSQL   │    │      Redis      │    │   GB28181设备    │
│                 │    │                 │    │                 │
│ - 设备信息       │    │ - 会话缓存       │    │ - IPC/NVR       │
│ - 通道数据       │    │ - 消息队列       │    │ - DVR           │
│ - 用户权限       │    │ - 流状态        │    │ - 平台级联       │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 后端模块结构

#### 1. GB28181核心模块 (`gb28181/`)
```
gb28181/
├── bean/           # 数据模型定义
│   ├── Device.java         # 设备实体
│   ├── DeviceChannel.java  # 通道实体
│   ├── Platform.java       # 平台实体
│   └── ...
├── controller/     # REST API控制器
│   ├── DeviceControl.java  # 设备控制API
│   ├── PlayController.java # 播放控制API
│   └── ...
├── service/        # 业务逻辑层
│   ├── IDeviceService.java      # 设备服务接口
│   ├── IDeviceChannelService.java # 通道服务接口
│   └── ...
├── transmit/       # SIP信令处理
│   ├── SIPSender.java      # SIP消息发送
│   ├── cmd/                # SIP命令处理器
│   └── ...
└── utils/          # 工具类
    ├── SipUtils.java       # SIP工具
    ├── XmlUtil.java        # XML解析工具
    └── ...
```

#### 2. 媒体服务模块 (`media/`)
```
media/
├── bean/           # 媒体相关实体
├── service/        # 媒体服务接口
└── zlm/            # ZLMediaKit集成
    ├── ZLMRESTfulUtils.java    # ZLM API调用
    ├── ZLMHttpHookListener.java # ZLM Hook处理
    └── ...
```

#### 3. 通用服务模块 (`service/`)
```
service/
├── IUserService.java           # 用户服务
├── ICloudRecordService.java    # 云端录像服务
├── IStreamProxyService.java    # 流代理服务
└── impl/                       # 服务实现类
```

### 前端模块结构

#### 1. 核心组件 (`src/components/`)
```
components/
├── channelPlayer/      # 播放器组件
│   ├── index.vue           # 主播放器
│   ├── ptzControl.vue      # 云台控制
│   └── ...
├── common/             # 通用组件
│   ├── DeviceTree.vue      # 设备树
│   ├── VideoTimeLine.vue   # 视频时间轴
│   └── ...
└── dialog/             # 对话框组件
```

#### 2. 页面视图 (`src/views/`)
```
views/
├── device/             # 设备管理
│   ├── index.vue           # 设备列表
│   └── channel/            # 通道管理
├── live/               # 实时监控
├── platform/           # 平台管理
├── cloudRecord/        # 云端录像
└── ...
```

## 🔄 核心概念与流程

### GB28181协议核心概念

#### 1. 设备注册流程
```
设备(IPC/NVR) ──REGISTER──> WVP平台
       │                      │
       │<────401 Unauthorized──│ (携带认证挑战)
       │                      │
       │──REGISTER(带认证)────> │
       │                      │
       │<────200 OK───────────│ (注册成功)
       │                      │
       │────心跳保活─────────────>│ (定期发送)
```

#### 2. 设备目录查询
```
WVP平台 ──MESSAGE(Catalog)──> 设备
   │                         │
   │<──MESSAGE(DeviceList)───│ (返回通道列表)
   │                         │
   │──200 OK─────────────────>│
```

#### 3. 实时播放流程
```
客户端 ──播放请求──> WVP平台 ──INVITE──> 设备
   │                 │                 │
   │                 │<────200 OK─────│ (携带SDP)
   │                 │                 │
   │                 │──ACK───────────>│
   │                 │                 │
   │                 │<════RTP流═══════│
   │                 │                 │
   中──转发──> ZLMediaKit ──多协议分发──> 客户端
```

### 关键业务流程

#### 1. 设备接入完整流程
```java
// 1. 设备注册 (SIPProcessorRegister.java)
@Override
public void process(RequestEvent requestEvent) {
    // 验证设备认证信息
    // 保存设备信息到数据库
    // 返回注册响应
}

// 2. 设备心跳保活 (SIPProcessorMessage.java)
public void processMessageKeepAlive(RequestEvent evt) {
    // 更新设备在线状态
    // 重置心跳超时计时器
}

// 3. 查询设备目录
public void queryCatalog(Device device) {
    // 发送Catalog查询消息
    sipSender.catalogQuery(device, sn -> {
        // 处理设备响应的通道列表
    });
}
```

#### 2. 实时播放实现
```java
// PlayServiceImpl.java
public DeferredResult<ResponseEntity<String>> play(
    String deviceId, String channelId, String protocol) {
    
    // 1. 查找设备和通道信息
    Device device = deviceService.getDevice(deviceId);
    DeviceChannel channel = channelService.getOne(deviceId, channelId);
    
    // 2. 选择合适的媒体服务器
    MediaServer mediaServer = mediaServerService.getDefaultMediaServer();
    
    // 3. 开启RTP接收端口
    int port = mediaServer.getNextPort();
    
    // 4. 发送INVITE请求到设备
    return sipCommanderForPlatform.playStreamCmd(
        mediaServer, device, channel, protocol, 
        (response) -> {
            // 处理播放成功回调
            return ResponseEntity.ok(JSON.toJSONString(response));
        },
        (error) -> {
            // 处理播放失败回调
            return ResponseEntity.status(HttpStatus.REQUEST_TIMEOUT).build();
        }
    );
}
```

## 💻 开发指南

### 1. 添加新的设备控制功能

#### 步骤1: 定义控制命令
```java
// gb28181/bean/DeviceControlType.java
public enum DeviceControlType {
    PTZ_CONTROL("PTZ", "云台控制"),
    DEVICE_REBOOT("DeviceReboot", "设备重启"),
    // 添加新的控制类型
    CUSTOM_CONTROL("CustomControl", "自定义控制");
}
```

#### 步骤2: 实现控制服务
```java
// gb28181/service/impl/DeviceControlServiceImpl.java
@Service
public class DeviceControlServiceImpl implements IDeviceControlService {
    
    public void customControl(String deviceId, String command) {
        Device device = deviceService.getDevice(deviceId);
        
        // 构造控制消息
        String cmdXml = buildCustomControlXml(command);
        
        // 发送SIP消息
        sipSender.deviceControlCmd(device, cmdXml);
    }
    
    private String buildCustomControlXml(String command) {
        // 构造符合GB28181标准的XML控制消息
        return "<?xml version=\"1.0\"?>" +
               "<Control>" +
               "<CmdType>DeviceControl</CmdType>" +
               "<SN>" + (int)((Math.random()*9+1)*100000) + "</SN>" +
               "<DeviceID>" + deviceId + "</DeviceID>" +
               "<Command>" + command + "</Command>" +
               "</Control>";
    }
}
```

#### 步骤3: 添加REST API
```java
// gb28181/controller/DeviceControl.java
@RestController
@RequestMapping("/api/device/control")
public class DeviceControl {
    
    @PostMapping("/custom")
    public ResponseEntity<String> customControl(
            @RequestParam String deviceId,
            @RequestParam String command) {
        
        try {
            deviceControlService.customControl(deviceId, command);
            return ResponseEntity.ok("控制命令发送成功");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                               .body("控制命令发送失败: " + e.getMessage());
        }
    }
}
```

### 2. 添加新的播放器支持

#### 步骤1: 创建播放器组件
```vue
<!-- web/src/components/player/CustomPlayer.vue -->
<template>
  <div class="custom-player" :id="playerId">
    <!-- 播放器DOM结构 -->
  </div>
</template>

<script>
export default {
  name: 'CustomPlayer',
  props: {
    videoUrl: String,
    autoplay: {
      type: Boolean,
      default: false
    }
  },
  data() {
    return {
      player: null,
      playerId: `player_${Date.now()}`
    }
  },
  mounted() {
    this.initPlayer()
  },
  methods: {
    initPlayer() {
      // 初始化自定义播放器
      this.player = new CustomPlayerSDK({
        container: document.getElementById(this.playerId),
        url: this.videoUrl,
        autoplay: this.autoplay
      })
    },
    play() {
      this.player && this.player.play()
    },
    pause() {
      this.player && this.player.pause()
    },
    destroy() {
      this.player && this.player.destroy()
    }
  },
  beforeDestroy() {
    this.destroy()
  }
}
</script>
```

#### 步骤2: 集成到主播放器
```vue
<!-- web/src/components/channelPlayer/index.vue -->
<template>
  <div class="channel-player">
    <!-- 播放器选择 -->
    <el-select v-model="playerType" @change="switchPlayer">
      <el-option label="Jessibuca" value="jessibuca"/>
      <el-option label="H265Web" value="h265web"/>
      <el-option label="Custom Player" value="custom"/>
    </el-select>
    
    <!-- 动态播放器组件 -->
    <component 
      :is="currentPlayerComponent"
      :video-url="streamUrl"
      :autoplay="autoplay"
      ref="player"/>
  </div>
</template>

<script>
import CustomPlayer from '@/components/player/CustomPlayer'

export default {
  components: {
    CustomPlayer
  },
  computed: {
    currentPlayerComponent() {
      const playerMap = {
        'jessibuca': 'Jessibuca',
        'h265web': 'H265Web', 
        'custom': 'CustomPlayer'
      }
      return playerMap[this.playerType] || 'Jessibuca'
    }
  }
}
</script>
```

### 3. 扩展录像功能

#### 步骤1: 扩展录像实体
```java
// service/bean/CloudRecordItem.java
@Data
public class CloudRecordItem {
    private String id;
    private String deviceId;
    private String channelId;
    private String fileName;
    private Date startTime;
    private Date endTime;
    private Long fileSize;
    // 添加新字段
    private String recordType; // 录像类型：手动/自动/报警
    private String description; // 录像描述
    private Map<String, Object> metadata; // 扩展元数据
}
```

#### 步骤2: 实现录像查询接口
```java
// service/impl/CloudRecordServiceImpl.java
@Service
public class CloudRecordServiceImpl implements ICloudRecordService {
    
    public List<CloudRecordItem> queryRecordsByType(
            String deviceId, String channelId, 
            String recordType, Date startTime, Date endTime) {
        
        return cloudRecordMapper.selectByConditions(
            deviceId, channelId, recordType, startTime, endTime);
    }
    
    public void addRecordMetadata(String recordId, Map<String, Object> metadata) {
        CloudRecordItem record = getById(recordId);
        record.setMetadata(metadata);
        updateById(record);
    }
}
```

## 🐛 调试技巧

### 1. SIP消息调试

#### 启用SIP消息日志
```yaml
# application-dev.yml
logging:
  level:
    com.genersoft.iot.vmp.gb28181.transmit: DEBUG
    javax.sip: DEBUG
```

#### 使用Wireshark抓包
```bash
# 监听SIP端口
sudo tcpdump -i any port 5060 -w sip.pcap

# 或使用tshark
tshark -i any -f "port 5060" -w sip.pcap
```

#### SIP消息格式示例
```
REGISTER sip:44010100002000000001@192.168.1.100:5060 SIP/2.0
Via: SIP/2.0/UDP 192.168.1.200:5060;branch=z9hG4bK123456
Max-Forwards: 70
From: <sip:44010100001110000001@192.168.1.100:5060>;tag=abc123
To: <sip:44010100001110000001@192.168.1.100:5060>
Call-ID: 1234567890@192.168.1.200
CSeq: 1 REGISTER
Contact: <sip:44010100001110000001@192.168.1.200:5060>
Content-Length: 0
Expires: 3600
```

### 2. 流媒体调试

#### ZLMediaKit日志配置
```ini
# config.ini
[general]
# 日志级别
logLevel=4

[http]
# 开启HTTP API
enable=1
port=80

[hook]
# 开启所有Hook事件
enable=1
on_publish=http://192.168.1.100:18080/index/hook/on_publish
on_play=http://192.168.1.100:18080/index/hook/on_play
```

#### 检查媒体流状态
```bash
# 查看ZLM媒体流列表
curl "http://localhost:8080/index/api/getMediaList"

# 查看特定流信息
curl "http://localhost:8080/index/api/getMediaInfo?schema=rtsp&vhost=__defaultVhost__&app=rtp&stream=streamid"
```

### 3. 前端调试

#### 启用Vue DevTools
```javascript
// main.js
if (process.env.NODE_ENV === 'development') {
  Vue.config.devtools = true
}
```

#### API请求调试
```javascript
// utils/request.js
const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API,
  timeout: 60000
})

// 请求拦截器
service.interceptors.request.use(
  config => {
    console.log('API Request:', config)
    return config
  }
)

// 响应拦截器  
service.interceptors.response.use(
  response => {
    console.log('API Response:', response)
    return response
  }
)
```

## ❓ 常见问题

### 1. 设备注册失败

**症状**: 设备无法注册到平台，日志显示认证失败

**排查步骤**:
```java
// 1. 检查设备配置
SELECT * FROM device WHERE device_id = '设备ID';

// 2. 检查SIP配置
// application.yml中的sip配置是否正确

// 3. 查看SIP消息日志
tail -f logs/wvp.log | grep "REGISTER"

// 4. 验证网络连通性
telnet 设备IP 5060
```

**常见解决方案**:
- 检查设备ID和密码配置
- 确认网络防火墙设置
- 验证SIP域和设备编码规范

### 2. 视频播放失败

**症状**: 点击播放按钮无响应，或播放器黑屏

**排查步骤**:
```bash
# 1. 检查ZLMediaKit状态
curl http://localhost:8080/index/api/getServerConfig

# 2. 查看媒体流状态
curl http://localhost:8080/index/api/getMediaList

# 3. 检查RTP端口占用
netstat -upln | grep 端口号

# 4. 查看播放日志
tail -f logs/wvp.log | grep "play"
```

**常见解决方案**:
- 重启ZLMediaKit服务
- 检查防火墙RTP端口范围
- 验证设备RTSP流可访问性

### 3. 录像回放问题

**症状**: 录像列表为空，或回放失败

**排查步骤**:
```java
// 1. 检查录像查询参数
// 确认时间范围、设备ID、通道ID正确

// 2. 查看设备录像查询日志
tail -f logs/wvp.log | grep "RecordInfo"

// 3. 验证设备录像存储
// 登录设备Web界面检查录像文件
```

### 4. 平台级联异常

**症状**: 上级平台连接失败，通道推送失败

**排查步骤**:
```java
// 1. 检查级联配置
SELECT * FROM platform WHERE enable = true;

// 2. 查看级联注册日志
tail -f logs/wvp.log | grep "platform"

// 3. 验证网络连接
ping 上级平台IP
telnet 上级平台IP 5060
```

## 🚀 进阶开发

### 1. 性能优化

#### 数据库优化
```sql
-- 为常用查询添加索引
CREATE INDEX idx_device_online ON device(online);
CREATE INDEX idx_channel_device_id ON device_channel(device_id);
CREATE INDEX idx_device_alarm_time ON device_alarm(alarm_time);

-- 分区表优化（大数据量场景）
CREATE TABLE device_alarm_2024 PARTITION OF device_alarm
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
```

#### Redis缓存策略
```java
@Service
public class DeviceCacheService {
    
    @Cacheable(value = "device", key = "#deviceId")
    public Device getDevice(String deviceId) {
        return deviceMapper.selectById(deviceId);
    }
    
    @CacheEvict(value = "device", key = "#device.deviceId")
    public void updateDevice(Device device) {
        deviceMapper.updateById(device);
    }
}
```

#### 异步任务处理
```java
@Component
public class AsyncTaskService {
    
    @Async("taskExecutor")
    public CompletableFuture<Void> syncDeviceChannels(String deviceId) {
        // 异步同步设备通道
        deviceChannelService.syncChannels(deviceId);
        return CompletableFuture.completedFuture(null);
    }
}
```

### 2. 集群部署

#### Redis集群配置
```yaml
spring:
  redis:
    cluster:
      nodes:
        - 192.168.1.100:7000
        - 192.168.1.100:7001
        - 192.168.1.101:7000
        - 192.168.1.101:7001
      max-redirects: 3
```

#### 多媒体节点负载均衡
```java
@Service
public class MediaServerLoadBalancer {
    
    public MediaServer selectBestServer() {
        List<MediaServer> servers = mediaServerService.getOnlineServers();
        
        return servers.stream()
                .min(Comparator.comparing(this::getServerLoad))
                .orElse(null);
    }
    
    private double getServerLoad(MediaServer server) {
        // 计算服务器负载：CPU + 内存 + 活跃流数量
        return server.getCpuUsage() * 0.4 + 
               server.getMemoryUsage() * 0.3 + 
               server.getStreamCount() * 0.3;
    }
}
```

### 3. 监控告警

#### 集成Prometheus监控
```java
@Component
public class MetricsCollector {
    
    private final Counter deviceRegisterCounter = Counter.build()
            .name("device_register_total")
            .help("Total device register count")
            .register();
    
    private final Gauge activeStreamGauge = Gauge.build()
            .name("active_streams")
            .help("Current active stream count")
            .register();
    
    @EventListener
    public void onDeviceRegister(DeviceRegisterEvent event) {
        deviceRegisterCounter.inc();
    }
    
    @Scheduled(fixedRate = 30000)
    public void updateStreamMetrics() {
        int streamCount = streamService.getActiveStreamCount();
        activeStreamGauge.set(streamCount);
    }
}
```

#### 健康检查端点
```java
@Component
public class CustomHealthIndicator implements HealthIndicator {
    
    @Override
    public Health health() {
        // 检查关键服务状态
        boolean sipServiceOk = checkSipService();
        boolean mediaServiceOk = checkMediaService();
        boolean databaseOk = checkDatabase();
        
        if (sipServiceOk && mediaServiceOk && databaseOk) {
            return Health.up()
                    .withDetail("sip", "UP")
                    .withDetail("media", "UP")
                    .withDetail("database", "UP")
                    .build();
        } else {
            return Health.down()
                    .withDetail("sip", sipServiceOk ? "UP" : "DOWN")
                    .withDetail("media", mediaServiceOk ? "UP" : "DOWN")
                    .withDetail("database", databaseOk ? "UP" : "DOWN")
                    .build();
        }
    }
}
```

### 4. 安全加固

#### API访问控制
```java
@RestController
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {
    
    @PostMapping("/device/add")
    @PreAuthorize("hasPermission(#device, 'CREATE')")
    public ResponseEntity<String> addDevice(@RequestBody Device device) {
        // 添加设备逻辑
    }
}
```

#### SIP消息加密
```java
@Component
public class SipMessageEncryption {
    
    public String encryptSipMessage(String message, String key) {
        // 实现SIP消息加密
        return AESUtil.encrypt(message, key);
    }
    
    public String decryptSipMessage(String encryptedMessage, String key) {
        // 实现SIP消息解密
        return AESUtil.decrypt(encryptedMessage, key);
    }
}
```

## 📚 参考资料

- [GB/T 28181-2016 标准文档](http://www.std.gov.cn/)
- [ZLMediaKit官方文档](https://github.com/ZLMediaKit/ZLMediaKit)
- [Vue.js官方文档](https://vuejs.org/)
- [Spring Boot官方文档](https://spring.io/projects/spring-boot)
- [项目官方文档](https://doc.wvp-pro.cn/)

---

## 🤝 贡献指南

欢迎提交Issue和Pull Request！请参考[贡献指南](CONTRIBUTING.md)了解详细信息。

## 📄 许可证

本项目采用MIT许可证，详情请查看[LICENSE](LICENSE)文件。