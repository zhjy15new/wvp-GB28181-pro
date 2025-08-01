# WVP-GB28181-PRO TODO 注释清单

本文档整理了项目中所有的TODO注释，按照模块、类/函数、原文和相关说明进行分类。

## Java 后端 TODO 注释

### JT1078 模块

#### TODO-001: JT1078Controller.java
- **模块**: JT1078配置模块
- **类/函数**: `startLive()` 方法
- **原文**: `// TODO 分配ZLM,获取IP、端口`
- **相关说明**: 需要实现ZLM媒体服务器的IP和端口分配逻辑，用于JT1078音视频流传输

#### TODO-002: JT1078Controller.java
- **模块**: JT1078配置模块
- **类/函数**: `startLive()` 方法
- **原文**: `// TODO 设备响应成功后,封装拉流结果集`
- **相关说明**: 需要在设备响应成功后，将拉流结果进行封装处理

### 安全认证模块

#### TODO-003: JwtAuthenticationFilter.java
- **模块**: 安全认证模块
- **类/函数**: `doFilterInternal()` 方法
- **原文**: `// TODO 处理各个状态`
- **相关说明**: 需要完善JWT认证过滤器中各种状态的处理逻辑

### GB28181 设备管理模块

#### TODO-004: ApiDeviceController.java
- **模块**: GB28181设备API控制器
- **类/函数**: `getDeviceChannelList()` 方法
- **原文**: `deviceJOSNChannel.put("Channel", 0); // TODO 自定义序号`
- **相关说明**: 需要实现自定义的通道序号逻辑

#### TODO-005: ApiDeviceController.java
- **模块**: GB28181设备API控制器
- **类/函数**: `getDeviceChannelList()` 方法
- **原文**: `deviceJOSNChannel.put("SubCount", deviceChannelExtend.getSubCount()); // TODO ? 子节点数, SubCount > 0 表示该通道为子目录`
- **相关说明**: 需要确认子节点数的处理逻辑，SubCount > 0 表示该通道为子目录

### XML工具模块

#### TODO-006: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机位置类型扩展。`
- **相关说明**: 需要扩展摄像机位置类型的处理

#### TODO-007: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机安装位置室外、室内属性。1-室外、2-室内。`
- **相关说明**: 需要实现摄像机安装位置属性的处理

#### TODO-008: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机用途属性`
- **相关说明**: 需要实现摄像机用途属性的处理

#### TODO-009: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机补光属性。1-无补光、2-红外补光、3-白光补光`
- **相关说明**: 需要实现摄像机补光属性的处理

#### TODO-010: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机监视方位属性。1-东、2-西、3-南、4-北、5-东南、6-东北、7-西南、8-西北。`
- **相关说明**: 需要实现摄像机监视方位属性的处理

#### TODO-011: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 摄像机支持的分辨率,可有多个分辨率值,各个取值间以"/"分隔。分辨率取值参见附录 F中SDPf字段规定`
- **相关说明**: 需要实现摄像机支持分辨率的处理

#### TODO-012: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 下载倍速范围(可选),各可选参数以"/"分隔,如设备支持1,2,4倍速下载则应写为"1/2/4"`
- **相关说明**: 需要实现下载倍速范围的处理

#### TODO-013: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 空域编码能力,取值0:不支持;1:1级增强(1个增强层);2:2级增强(2个增强层);3:3级增强(3个增强层)`
- **相关说明**: 需要实现空域编码能力的处理

#### TODO-014: XmlUtil.java
- **模块**: GB28181 XML工具类
- **类/函数**: `buildDeviceInfo()` 方法
- **原文**: `// TODO 时域编码能力,取值0:不支持;1:1级增强;2:2级增强;3:3级增强`
- **相关说明**: 需要实现时域编码能力的处理

### 录像计划模块

#### TODO-015: RecordPlanServiceImpl.java
- **模块**: 录像计划服务
- **类/函数**: `updateRecordPlan()` 方法
- **原文**: `// TODO  更新录像队列`
- **相关说明**: 需要实现录像队列的更新逻辑

#### TODO-016: RecordPlanServiceImpl.java
- **模块**: 录像计划服务
- **类/函数**: `updateRecordPlan()` 方法
- **原文**: `// TODO  更新录像队列`
- **相关说明**: 需要实现录像队列的更新逻辑

#### TODO-017: RecordPlanServiceImpl.java
- **模块**: 录像计划服务
- **类/函数**: `updateRecordPlan()` 方法
- **原文**: `// TODO  更新录像队列`
- **相关说明**: 需要实现录像队列的更新逻辑

### 播放服务模块

#### TODO-018: PlayServiceImpl.java
- **模块**: GB28181播放服务
- **类/函数**: `playBack()` 方法
- **原文**: `// TODO 暂不做处理`
- **相关说明**: 暂时不处理某个逻辑，需要后续完善

#### TODO-019: PlayServiceImpl.java
- **模块**: GB28181播放服务
- **类/函数**: `broadcast()` 方法
- **原文**: `// TODO 必须多端口模式才支持语音喊话鹤语音对讲`
- **相关说明**: 语音喊话和语音对讲功能需要多端口模式支持

### 平台服务模块

#### TODO-020: PlatformServiceImpl.java
- **模块**: GB28181平台服务
- **类/函数**: `register()` 方法
- **原文**: `// 默认不进行SSRC校验， TODO 后续可改为配置`
- **相关说明**: SSRC校验功能需要改为可配置的方式

### SIP处理模块

#### TODO-021: SIPProcessorObserver.java
- **模块**: SIP处理器观察者
- **类/函数**: `processResponse()` 方法
- **原文**: `// TODO 回复错误玛`
- **相关说明**: 需要实现错误码的回复处理

### 通道服务模块

#### TODO-022: GbChannelServiceImpl.java
- **模块**: GB28181通道服务
- **类/函数**: `updateChannel()` 方法
- **原文**: `// TODO 是否需要通知上级, 或者等添加新的行政区划时发送更新通知`
- **相关说明**: 需要确定是否通知上级平台通道更新

#### TODO-023: GbChannelServiceImpl.java
- **模块**: GB28181通道服务
- **类/函数**: `updateChannel()` 方法
- **原文**: `// TODO 发送通知`
- **相关说明**: 需要实现通知发送逻辑

#### TODO-024: GbChannelServiceImpl.java
- **模块**: GB28181通道服务
- **类/函数**: `updateChannel()` 方法
- **原文**: `// TODO 发送通知`
- **相关说明**: 需要实现通知发送逻辑

### 代理配置模块

#### TODO-025: ProxyServletConfig.java
- **模块**: 代理Servlet配置
- **类/函数**: 注释部分
- **原文**: `// TODO 使用这个代理库实现代理在遇到代理视频文件时，如果是206结果，会遇到报错蛋市目前功能正常，`
- **相关说明**: 代理库在处理206状态码时存在问题，需要后续优化

#### TODO-026: ProxyServletConfig.java
- **模块**: 代理Servlet配置
- **类/函数**: 注释部分
- **原文**: `// TODO 暂时去除异常处理。后续使用其他代理框架修改测试`
- **相关说明**: 需要后续使用其他代理框架进行测试

### SIP请求头模块

#### TODO-027: SIPRequestHeaderPlarformProvider.java
- **模块**: SIP平台请求头提供者
- **类/函数**: 类注释
- **原文**: `* @description: 平台命令request创造器 TODO 冗余代码太多待优化`
- **相关说明**: 代码存在冗余，需要优化重构

#### TODO-028: SIPRequestHeaderPlarformProvider.java
- **模块**: SIP平台请求头提供者
- **类/函数**: `createRegisterRequest()` 方法
- **原文**: `// TODO`
- **相关说明**: 需要完善注册请求的创建逻辑

#### TODO-029: SIPRequestHeaderProvider.java
- **模块**: SIP请求头提供者
- **类/函数**: 类注释
- **原文**: `* @description:摄像头命令request创造器 TODO 冗余代码太多待优化`
- **相关说明**: 代码存在冗余，需要优化重构

### 响应处理器模块

#### TODO-030: CancelResponseProcessor.java
- **模块**: 取消响应处理器
- **类/函数**: `process()` 方法
- **原文**: `// TODO Auto-generated method stub`
- **相关说明**: 需要实现取消响应的处理逻辑

#### TODO-031: ByeResponseProcessor.java
- **模块**: BYE响应处理器
- **类/函数**: `process()` 方法
- **原文**: `// TODO Auto-generated method stub`
- **相关说明**: 需要实现BYE响应的处理逻辑

#### TODO-032: SIPCommander.java
- **模块**: SIP命令器
- **类/函数**: `sendByeCmd()` 方法
- **原文**: `// TODO Auto-generated method stub`
- **相关说明**: 需要实现BYE命令的发送逻辑

#### TODO-033: CancelRequestProcessor.java
- **模块**: 取消请求处理器
- **类/函数**: `process()` 方法
- **原文**: `// TODO 优先级99 Cancel Request消息实现，此消息一般为级联消息，上级给下级发送请求取消指令`
- **相关说明**: 需要实现优先级99的取消请求处理

### Redis配置模块

#### TODO-034: RedisRpcConfig.java
- **模块**: Redis RPC配置
- **类/函数**: `onMessage()` 方法
- **原文**: `// TODO 如果多个上级点播同一个通道会有问题`
- **相关说明**: 多个上级同时点播同一通道时存在问题，需要处理

### 请求处理器模块

#### TODO-035: ByeRequestProcessor.java
- **模块**: BYE请求处理器
- **类/函数**: `process()` 方法
- **原文**: `// TODO 流再其他wvp上时应该通知这个wvp停止推流和发送BYE`
- **相关说明**: 当流在其他WVP上时，需要通知停止推流并发送BYE

#### TODO-036: ByeRequestProcessor.java
- **模块**: BYE请求处理器
- **类/函数**: `process()` 方法
- **原文**: `// TODO 结束点播 避免等待`
- **相关说明**: 需要实现结束点播逻辑，避免等待

#### TODO-037: InviteRequestProcessor.java
- **模块**: INVITE请求处理器
- **类/函数**: `process()` 方法
- **原文**: `// 点播成功， TODO 可以在此处检测cancel命令是否存在，存在则不发送`
- **相关说明**: 点播成功后，需要检测cancel命令是否存在

### 消息处理器模块

#### TODO-038: ControlMessageHandler.java
- **模块**: 控制消息处理器
- **类/函数**: 类注释
- **原文**: `* 命令类型： 设备控制： 远程启动, 录像控制（TODO）, 报警布防/撤防命令（TODO）, 报警复位命令（TODO）,`
- **相关说明**: 需要实现录像控制、报警布防/撤防、报警复位等命令

#### TODO-039: ControlMessageHandler.java
- **模块**: 控制消息处理器
- **类/函数**: 类注释
- **原文**: `*                   强制关键帧命令（TODO）, 拉框放大/缩小控制命令（TODO）, 看守位控制（TODO）, 报警复位（TODO）`
- **相关说明**: 需要实现强制关键帧、拉框放大/缩小、看守位控制等命令

#### TODO-040: ControlMessageHandler.java
- **模块**: 控制消息处理器
- **类/函数**: 类注释
- **原文**: `* 命令类型： 设备配置： SVAC编码配置（TODO）, 音频参数（TODO）, SVAC解码配置（TODO）`
- **相关说明**: 需要实现SVAC编码配置、音频参数、SVAC解码配置等

#### TODO-041: QueryMessageHandler.java
- **模块**: 查询消息处理器
- **类/函数**: 类注释
- **原文**: `* 命令类型： 设备状态, 设备目录信息, 设备信息, 文件目录检索(TODO), 报警(TODO), 设备配置(TODO), 设备预置位(TODO), 移动设备位置数据(TODO)`
- **相关说明**: 需要实现文件目录检索、报警、设备配置、设备预置位、移动设备位置数据等查询

#### TODO-042: NotifyMessageHandler.java
- **模块**: 通知消息处理器
- **类/函数**: 类注释
- **原文**: `* 命令类型： 状态信息(心跳)报送, 报警通知, 媒体通知, 移动设备位置数据，语音广播通知(TODO), 设备预置位(TODO)`
- **相关说明**: 需要实现语音广播通知、设备预置位等通知

#### TODO-043: MediaStatusNotifyMessageHandler.java
- **模块**: 媒体状态通知消息处理器
- **类/函数**: `process()` 方法
- **原文**: `// 如果级联播放，需要给上级发送此通知 TODO 多个上级同时观看一个下级 可能存在停错的问题，需要将点播CallId进行上下级绑定`
- **相关说明**: 多个上级同时观看一个下级时可能存在停错问题，需要将点播CallId进行上下级绑定

### 云录像模块

#### TODO-044: CloudRecordTimer.java
- **模块**: 云录像定时器
- **类/函数**: `deleteExpiredRecord()` 方法
- **原文**: `// TODO 后续可以删除空了的过期日期文件夹`
- **相关说明**: 需要实现删除空的过期日期文件夹功能

### 媒体服务模块

#### TODO-045: ZLMHttpHookListener.java
- **模块**: ZLM HTTP钩子监听器
- **类/函数**: `onStreamChanged()` 方法
- **原文**: `// TODO 加快处理速度`
- **相关说明**: 需要优化处理速度

#### TODO-046: ZLMRESTfulUtils.java
- **模块**: ZLM RESTful工具类
- **类/函数**: `getMediaList()` 方法
- **原文**: `//todo 暂时写死超时时间 均为5s`
- **相关说明**: 超时时间暂时写死为5秒，需要改为可配置

#### TODO-047: MediaServerServiceImpl.java
- **模块**: 媒体服务器服务
- **类/函数**: `resetOnlineServer()` 方法
- **原文**: `* 媒体服务节点 重启后重置他的推流信息， TODO 给正在使用的设备发送停止命令`
- **相关说明**: 媒体服务节点重启后，需要给正在使用的设备发送停止命令

#### TODO-048: Hook.java
- **模块**: 钩子接口
- **类/函数**: 接口注释
- **原文**: `// TODO 后续修改所有方法`
- **相关说明**: 需要后续修改所有钩子方法

## 前端 TODO 注释

### Vue 组件

#### TODO-049: historyLog.vue
- **模块**: 历史日志组件
- **类/函数**: 组件方法
- **原文**: `// TODO`
- **相关说明**: 需要完善历史日志功能

#### TODO-050: SidebarItem.vue
- **模块**: 侧边栏组件
- **类/函数**: 组件方法
- **原文**: `// TODO: refactor with render function`
- **相关说明**: 需要使用render函数重构组件

#### TODO-051: record.vue
- **模块**: 录像组件
- **类/函数**: 组件方法
- **原文**: `count: 1000000, // TODO 分页导致滑轨视频有效值无法获取完全`
- **相关说明**: 分页导致滑轨视频有效值无法获取完全，需要优化

#### TODO-052: detail.vue
- **模块**: 云录像详情组件
- **类/函数**: 组件方法
- **原文**: `count: 1000000, // TODO 分页导致滑轨视频有效值无法获取完全`
- **相关说明**: 分页导致滑轨视频有效值无法获取完全，需要优化

### JavaScript 库

#### TODO-053: ZLMRTCClient.js
- **模块**: ZLM RTC客户端
- **类/函数**: 多个方法
- **原文**: 多个TODO注释
- **相关说明**: WebRTC相关的优化和功能完善

## 总结

### TODO 统计
- **Java后端**: 48个TODO
- **前端Vue**: 4个TODO
- **JavaScript库**: 多个TODO（第三方库）
- **总计**: 52个主要TODO

### 优先级建议
1. **高优先级**: 核心功能相关的TODO（如JT1078、播放服务、媒体服务）
2. **中优先级**: 功能完善相关的TODO（如XML工具、消息处理器）
3. **低优先级**: 优化和重构相关的TODO（如代码优化、性能提升）

### 清理建议
- 对于已注释的TODO，可以考虑删除
- 对于功能不完整的模块，建议先完善功能再清理
- 对于第三方库的TODO，可以保留或更新到最新版本 