#!/bin/bash

# WVP-GB28181-PRO 历史包袱清理任务清单
# 每个任务都是原子操作，可以独立执行

echo "======================================================"
echo "WVP-GB28181-PRO 历史包袱清理任务清单"
echo "======================================================"
echo

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# 显示任务信息
show_task() {
    local task_id="$1"
    local task_desc="$2" 
    local file_path="$3"
    local risk_level="$4"
    
    echo -e "${BLUE}[$task_id]${NC} $task_desc"
    if [ -n "$file_path" ]; then
        echo -e "    文件路径: ${YELLOW}$file_path${NC}"
    fi
    echo -e "    风险等级: $risk_level"
    echo
}

# 检查文件是否存在
check_file() {
    local file_path="$1"
    if [ -e "$file_path" ]; then
        echo -e "    ${GREEN}✓ 存在${NC}"
    else
        echo -e "    ${RED}✗ 不存在${NC}"
    fi
}

echo "============ 数据库脚本清理任务 ============"
echo

show_task "CT001-1" "删除2.6.9版本初始化脚本" "数据库/2.6.9/初始化-mysql-2.6.9.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.6.9/初始化-mysql-2.6.9.sql"

show_task "CT001-2" "删除2.6.9版本PostgreSQL初始化脚本" "数据库/2.6.9/初始化-postgresql-kingbase-2.6.9.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.6.9/初始化-postgresql-kingbase-2.6.9.sql"

show_task "CT001-3" "删除2.6.9版本MySQL更新脚本" "数据库/2.6.9/更新-mysql-2.6.9.sql" "${GREEN}低风险${NC}" 
check_file "数据库/2.6.9/更新-mysql-2.6.9.sql"

show_task "CT001-4" "删除2.6.9版本PostgreSQL更新脚本" "数据库/2.6.9/更新-postgresql-kingbase-2.6.9.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.6.9/更新-postgresql-kingbase-2.6.9.sql"

show_task "CT001-5" "删除2.6.9版本目录" "数据库/2.6.9/" "${GREEN}低风险${NC}"
check_file "数据库/2.6.9/"

show_task "CT002-1" "删除2.7.0版本初始化脚本" "数据库/2.7.0/初始化-mysql-2.7.0.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.0/初始化-mysql-2.7.0.sql"

show_task "CT002-2" "删除2.7.0版本PostgreSQL初始化脚本" "数据库/2.7.0/初始化-postgresql-kingbase-2.7.0.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.0/初始化-postgresql-kingbase-2.7.0.sql"

show_task "CT002-3" "删除2.7.0版本MySQL更新脚本" "数据库/2.7.0/更新-mysql-2.7.0.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.0/更新-mysql-2.7.0.sql"

show_task "CT002-4" "删除2.7.0版本PostgreSQL更新脚本" "数据库/2.7.0/更新-postgresql-kingbase-2.7.0.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.0/更新-postgresql-kingbase-2.7.0.sql"

show_task "CT002-5" "删除2.7.0版本目录" "数据库/2.7.0/" "${GREEN}低风险${NC}"
check_file "数据库/2.7.0/"

show_task "CT003-1" "删除2.7.1版本初始化脚本" "数据库/2.7.1/初始化-mysql-2.7.1.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.1/初始化-mysql-2.7.1.sql"

show_task "CT003-2" "删除2.7.1版本PostgreSQL初始化脚本" "数据库/2.7.1/初始化-postgresql-kingbase-2.7.1.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.1/初始化-postgresql-kingbase-2.7.1.sql"

show_task "CT003-3" "删除2.7.1版本MySQL更新脚本" "数据库/2.7.1/更新-mysql-2.7.1.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.1/更新-mysql-2.7.1.sql"

show_task "CT003-4" "删除2.7.1版本PostgreSQL更新脚本" "数据库/2.7.1/更新-postgresql-kingbase-2.7.1.sql" "${GREEN}低风险${NC}"
check_file "数据库/2.7.1/更新-postgresql-kingbase-2.7.1.sql"

show_task "CT003-5" "删除2.7.1版本目录" "数据库/2.7.1/" "${GREEN}低风险${NC}"
check_file "数据库/2.7.1/"

show_task "CT004-1" "删除old目录下2.6.6-2.6.7更新脚本" "数据库/old/2.6.6-2.6.7更新.sql" "${GREEN}低风险${NC}"
check_file "数据库/old/2.6.6-2.6.7更新.sql"

show_task "CT004-2" "删除old目录下2.6.8升级脚本" "数据库/old/2.6.8升级2.6.9.sql" "${GREEN}低风险${NC}"
check_file "数据库/old/2.6.8升级2.6.9.sql"

show_task "CT004-3" "删除old目录下2.6.8补丁脚本" "数据库/old/2.6.8补丁更新.sql" "${GREEN}低风险${NC}"
check_file "数据库/old/2.6.8补丁更新.sql"

show_task "CT004-4" "删除old目录下清理脚本" "数据库/old/clean.sql" "${GREEN}低风险${NC}"
check_file "数据库/old/clean.sql"

show_task "CT004-5" "删除old目录" "数据库/old/" "${GREEN}低风险${NC}"
check_file "数据库/old/"

echo "============ Maven依赖清理任务 ============"
echo

show_task "CT005-1" "移除pom.xml中被注释的kxml2依赖(279-284行)" "pom.xml" "${GREEN}低风险${NC} - 已完成"

show_task "CT005-2" "移除pom.xml中被注释的log-generator依赖(353-357行)" "pom.xml" "${GREEN}低风险${NC} - 已完成"

show_task "CT005-3" "优化重复的kingbase8依赖配置" "pom.xml" "${YELLOW}中风险${NC}"
echo "    说明: 第168-174行和175-181行存在重复的kingbase8依赖，只是系统路径不同"

echo "============ 重复工具类清理任务 ============"  
echo

show_task "CT006-1" "删除GB28181目录下的重复坐标转换工具类" "src/main/java/com/genersoft/iot/vmp/gb28181/utils/Coordtransform.java" "${YELLOW}中风险${NC}"
check_file "src/main/java/com/genersoft/iot/vmp/gb28181/utils/Coordtransform.java"

show_task "CT006-2" "保留utils目录下的坐标转换工具类" "src/main/java/com/genersoft/iot/vmp/utils/Coordtransform.java" "${GREEN}低风险${NC}"
check_file "src/main/java/com/genersoft/iot/vmp/utils/Coordtransform.java"

show_task "CT006-3" "更新引用gb28181.utils.Coordtransform的代码" "src/**/*.java" "${YELLOW}中风险${NC}"
echo "    操作: 查找并替换所有引用 com.genersoft.iot.vmp.gb28181.utils.Coordtransform 为 com.genersoft.iot.vmp.utils.Coordtransform"

echo "============ 被注释文件清理任务 ============"
echo

show_task "CT007-1" "检查是否存在RedisUtil2.java文件" "src/main/java/com/genersoft/iot/vmp/utils/redis/RedisUtil2.java" "${GREEN}低风险${NC}"
check_file "src/main/java/com/genersoft/iot/vmp/utils/redis/RedisUtil2.java"

show_task "CT007-2" "如果存在则删除RedisUtil2.java(整个文件被注释)" "src/main/java/com/genersoft/iot/vmp/utils/redis/RedisUtil2.java" "${GREEN}低风险${NC}"

echo "============ JT1078模块评估任务 ============"
echo

show_task "CT008-1" "评估JT1078模块的必要性" "src/main/java/com/genersoft/iot/vmp/jt1078/" "${RED}高风险${NC}"
check_file "src/main/java/com/genersoft/iot/vmp/jt1078/"
echo "    说明: JT1078模块功能不完整，包含大量TODO，需要评估是否删除整个模块"

show_task "CT008-2" "删除JT1078测试类" "src/test/java/com/genersoft/iot/vmp/jt1078/JT1078ServerTest.java" "${YELLOW}中风险${NC}"
check_file "src/test/java/com/genersoft/iot/vmp/jt1078/JT1078ServerTest.java"

show_task "CT008-3" "删除JT1078整个模块目录" "src/main/java/com/genersoft/iot/vmp/jt1078/" "${RED}高风险${NC}"

echo "============ 前端清理任务 ============"
echo

show_task "CT009-1" "检查前端未使用的依赖" "web/package.json" "${GREEN}低风险${NC}"
echo "    操作: cd web && npx depcheck"

show_task "CT009-2" "检查前端安全漏洞" "web/package.json" "${GREEN}低风险${NC}"
echo "    操作: cd web && npm audit"

show_task "CT009-3" "更新过时的前端依赖" "web/package.json" "${YELLOW}中风险${NC}"
echo "    操作: cd web && npm outdated"

echo "============ 代码质量改进任务 ============"
echo

show_task "CT010-1" "清理过多TODO注释的文件" "src/**/*.java" "${YELLOW}中风险${NC}"
echo "    说明: 查找包含5个以上TODO注释的文件进行清理"

show_task "CT010-2" "移除未使用的import语句" "src/**/*.java" "${GREEN}低风险${NC}"
echo "    操作: 使用IDE的优化import功能"

show_task "CT010-3" "清理死代码(未被调用的方法)" "src/**/*.java" "${YELLOW}中风险${NC}"
echo "    操作: 使用IDE的代码分析功能查找未使用的方法"

echo "============ 配置文件优化任务 ============"
echo

show_task "CT011-1" "清理配置文件中的测试数据" "src/main/resources/application*.yml" "${YELLOW}中风险${NC}"
echo "    说明: 检查并移除硬编码的测试配置值"

show_task "CT011-2" "添加配置项详细注释" "src/main/resources/application*.yml" "${GREEN}低风险${NC}"
echo "    说明: 为配置项添加中文注释说明"

echo "============= 执行建议 ============="
echo
echo "建议按以下顺序执行清理任务："
echo
echo -e "${GREEN}第一阶段 (低风险，可立即执行):${NC}"
echo "  CT001-* ~ CT004-*: 数据库脚本清理"
echo "  CT007-*: 被注释文件清理"
echo "  CT009-1, CT009-2: 前端依赖检查"
echo "  CT010-2: 清理import语句"
echo
echo -e "${YELLOW}第二阶段 (中风险，需要测试):${NC}"
echo "  CT005-3: 优化Maven依赖配置"
echo "  CT006-*: 重复工具类处理"
echo "  CT009-3: 更新前端依赖"
echo "  CT010-1, CT010-3: 代码质量改进"
echo "  CT011-*: 配置文件优化"
echo
echo -e "${RED}第三阶段 (高风险，需要慎重评估):${NC}" 
echo "  CT008-*: JT1078模块处理"
echo
echo "============= 执行示例 ============="
echo
echo "# 执行单个任务示例："
echo "rm '数据库/2.6.9/初始化-mysql-2.6.9.sql'  # CT001-1"
echo "rm -rf '数据库/old/'                      # CT004-5"
echo
echo "# 批量执行示例："
echo "rm -rf 数据库/2.6.9/ 数据库/2.7.0/ 数据库/2.7.1/ 数据库/old/"
echo
echo "注意: 执行任何操作前建议先备份项目！"