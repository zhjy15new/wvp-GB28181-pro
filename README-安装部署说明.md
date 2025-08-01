# WVP-GB28181-PRO 安装部署说明

> 本文档面向初学者，提供详细的安装部署步骤和注意事项

## 📋 目录
- [系统要求](#系统要求)
- [快速开始](#快速开始)
- [详细安装步骤](#详细安装步骤)
- [配置说明](#配置说明)
- [常见问题](#常见问题)
- [进阶配置](#进阶配置)

## 🖥️ 系统要求

### 最低配置
- **操作系统**: Linux (推荐 Ubuntu 18.04+ / CentOS 7+)
- **CPU**: 2核心
- **内存**: 4GB RAM
- **存储**: 20GB 可用空间
- **网络**: 支持TCP/UDP端口访问

### 推荐配置
- **操作系统**: Linux (Ubuntu 20.04+ / CentOS 8+)
- **CPU**: 4核心以上
- **内存**: 8GB RAM以上
- **存储**: 100GB+ SSD
- **网络**: 千兆网络

### 软件依赖
- **Java**: JDK 1.8 或 OpenJDK 8
- **数据库**: MySQL 5.7+ 或 MariaDB 10.3+
- **缓存**: Redis 5.0+
- **流媒体**: ZLMediaKit (可选，内置)

## 🚀 快速开始

### 方式一：Docker 一键部署（推荐新手）

```bash
# 1. 克隆项目
git clone https://github.com/648540858/wvp-GB28181-pro.git
cd wvp-GB28181-pro

# 2. 进入docker目录
cd docker

# 3. 启动服务
docker-compose up -d

# 4. 查看服务状态
docker-compose ps
```

### 方式二：手动安装

```bash
# 1. 下载最新版本
wget https://github.com/648540858/wvp-GB28181-pro/releases/latest/download/wvp-pro-2.7.18-11211115.jar

# 2. 运行安装脚本
chmod +x install.sh
./install.sh
```

## 📝 详细安装步骤

### 步骤1：环境准备

#### 1.1 安装Java环境
```bash
# Ubuntu/Debian
sudo apt update
sudo apt install openjdk-8-jdk

# CentOS/RHEL
sudo yum install java-1.8.0-openjdk

# 验证安装
java -version
```

#### 1.2 安装MySQL
```bash
# Ubuntu/Debian
sudo apt install mysql-server

# CentOS/RHEL
sudo yum install mysql-server

# 启动MySQL
sudo systemctl start mysqld
sudo systemctl enable mysqld

# 安全配置
sudo mysql_secure_installation
```

#### 1.3 安装Redis
```bash
# Ubuntu/Debian
sudo apt install redis-server

# CentOS/RHEL
sudo yum install redis

# 启动Redis
sudo systemctl start redis
sudo systemctl enable redis
```

### 步骤2：下载和配置

#### 2.1 下载WVP-PRO
```bash
# 创建安装目录
mkdir -p /opt/wvp-pro
cd /opt/wvp-pro

# 下载最新版本
wget https://github.com/648540858/wvp-GB28181-pro/releases/latest/download/wvp-pro-2.7.18-11211115.jar
```

#### 2.2 配置文件设置
```bash
# 复制配置文件
cp 配置详情.yml application.yml

# 编辑配置文件
nano application.yml
```

### 步骤3：数据库初始化

#### 3.1 创建数据库
```sql
-- 登录MySQL
mysql -u root -p

-- 创建数据库
CREATE DATABASE wvp CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- 创建用户（可选）
CREATE USER 'wvp'@'%' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON wvp.* TO 'wvp'@'%';
FLUSH PRIVILEGES;
```

#### 3.2 导入数据库脚本
```bash
# 进入数据库脚本目录
cd 数据库/2.7.4/

# 导入初始化脚本
mysql -u root -p wvp < 初始化-mysql-2.7.4.sql
```

### 步骤4：启动服务

#### 4.1 使用脚本启动
```bash
# 给脚本执行权限
chmod +x run.sh

# 启动服务
./run.sh start

# 查看状态
./run.sh status
```

#### 4.2 使用Systemd服务
```bash
# 安装为系统服务
chmod +x install.sh
./install.sh

# 管理服务
sudo systemctl start wvp
sudo systemctl enable wvp
sudo systemctl status wvp
```

## ⚙️ 配置说明

### 基础配置 (application.yml)

```yaml
# 数据库配置
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/wvp?useUnicode=true&characterEncoding=UTF8&serverTimezone=Asia/Shanghai
    username: root
    password: your_password

# Redis配置
spring:
  redis:
    host: localhost
    port: 6379
    password: # 如果有密码，请填写

# SIP配置
sip:
  ip: 0.0.0.0  # 监听所有网卡
  port: 5060   # SIP端口
  domain: 3402000000  # SIP域

# 媒体服务配置
media:
  id: your_media_id
  ip: 192.168.1.100  # 修改为你的服务器IP
  http-port: 80
  secret: your_secret_key
```

### 重要配置项说明

| 配置项 | 说明 | 示例值 |
|--------|------|--------|
| `sip.ip` | SIP服务监听IP | `0.0.0.0` |
| `sip.port` | SIP服务端口 | `5060` |
| `sip.domain` | SIP域标识 | `3402000000` |
| `media.ip` | 媒体服务器IP | `192.168.1.100` |
| `media.http-port` | 媒体服务HTTP端口 | `80` |
| `media.secret` | 媒体服务密钥 | `your_secret_key` |

## 🔧 常见问题

### Q1: 启动失败，提示端口被占用
```bash
# 查看端口占用
netstat -tlnp | grep 5060

# 关闭占用进程
sudo kill -9 <PID>

# 或者修改配置文件中的端口
```

### Q2: 数据库连接失败
```bash
# 检查MySQL服务状态
sudo systemctl status mysql

# 检查防火墙
sudo ufw status
sudo firewall-cmd --list-all

# 检查MySQL用户权限
mysql -u root -p
SHOW GRANTS FOR 'wvp'@'%';
```

### Q3: 设备无法注册
- 检查SIP配置是否正确
- 确认设备IP和端口配置
- 查看日志文件排查问题

### Q4: 视频无法播放
- 检查媒体服务配置
- 确认网络连通性
- 查看浏览器控制台错误

## 📊 监控和维护

### 查看服务状态
```bash
# 查看进程
ps aux | grep wvp

# 查看端口
netstat -tlnp | grep java

# 查看日志
tail -f logs/wvp.log
```

### 日志文件位置
- **应用日志**: `logs/wvp.log`
- **错误日志**: `logs/error.log`
- **访问日志**: `logs/access.log`

### 性能监控
```bash
# 查看内存使用
free -h

# 查看CPU使用
top

# 查看磁盘使用
df -h
```

## 🔒 安全建议

### 1. 防火墙配置
```bash
# Ubuntu/Debian
sudo ufw allow 5060/tcp  # SIP端口
sudo ufw allow 5060/udp  # SIP端口
sudo ufw allow 80/tcp    # HTTP端口
sudo ufw allow 443/tcp   # HTTPS端口

# CentOS/RHEL
sudo firewall-cmd --permanent --add-port=5060/tcp
sudo firewall-cmd --permanent --add-port=5060/udp
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
```

### 2. 数据库安全
- 修改默认密码
- 限制数据库访问IP
- 定期备份数据

### 3. 应用安全
- 修改默认管理员密码
- 启用HTTPS
- 定期更新系统

## 📚 进阶配置

### 1. 集群部署
- 配置负载均衡
- 设置Redis集群
- 配置数据库主从

### 2. 高可用配置
- 配置服务监控
- 设置自动重启
- 配置日志轮转

### 3. 性能优化
- 调整JVM参数
- 优化数据库配置
- 配置CDN加速

## 📞 技术支持

### 官方文档
- [WVP-PRO 官方文档](https://doc.wvp-pro.cn)
- [ZLMediaKit 文档](https://github.com/ZLMediaKit/ZLMediaKit)

### 社区支持
- [GitHub Issues](https://github.com/648540858/wvp-GB28181-pro/issues)
- [Gitee 仓库](https://gitee.com/pan648540858/wvp-GB28181-pro)

### 联系方式
- 邮箱: [项目维护者邮箱]
- QQ群: [官方QQ群号]

---

## 📝 更新日志

### v2.7.18 (最新版本)
- 修复已知问题
- 性能优化
- 新增功能支持

### 版本历史
- 查看 [CHANGELOG.md](./CHANGELOG.md) 了解详细更新内容

---

**注意**: 本文档会随着项目更新而更新，请关注最新版本。 