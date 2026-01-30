#!/bin/bash

# 蓝牙设备监控脚本
# 用法: bluetooth-monitor <command> [args]

set -e

# 颜色输出
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 检查blueutil是否安装
check_blueutil() {
    if ! command -v blueutil &> /dev/null; then
        echo -e "${RED}错误: blueutil 未安装${NC}"
        echo "请运行: brew install blueutil"
        exit 1
    fi
}

# 格式化设备地址
format_address() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

# 显示已连接设备
cmd_connected() {
    check_blueutil
    
    echo -e "${BLUE}📱 已连接的蓝牙设备:${NC}"
    echo "================================"
    
    devices=$(blueutil --connected 2>/dev/null)
    
    if [ -z "$devices" ]; then
        echo -e "${YELLOW}暂无已连接的蓝牙设备${NC}"
        exit 0
    fi
    
    echo "$devices" | while IFS= read -r line; do
        if [[ $line == address:* ]]; then
            addr=$(echo "$line" | sed 's/.*address: \([^,]*\),.*/\1/')
            addr=$(format_address "$addr")
            name=$(echo "$line" | sed 's/.*name: "\([^"]*\)".*/\1/')
            echo -e "🔗 ${GREEN}$name${NC}"
            echo "   地址: $addr"
            echo ""
        fi
    done
}

# 显示已配对设备
cmd_paired() {
    check_blueutil
    
    echo -e "${BLUE}📋 已配对的蓝牙设备:${NC}"
    echo "================================"
    
    devices=$(blueutil --paired 2>/dev/null)
    
    if [ -z "$devices" ] || [[ "$devices" == "[]" ]]; then
        echo -e "${YELLOW}暂无已配对的蓝牙设备${NC}"
        exit 0
    fi
    
    echo "$devices" | while IFS= read -r line; do
        if [[ $line == address:* ]]; then
            addr=$(echo "$line" | sed 's/.*address: \([^,]*\),.*/\1/')
            addr=$(format_address "$addr")
            name=$(echo "$line" | sed 's/.*name: "\([^"]*\)".*/\1/')
            connected=$(echo "$line" | grep -o 'connected' || echo "")
            
            if [ -n "$connected" ]; then
                echo -e "🔗 ${GREEN}$name${NC} (已连接)"
            else
                echo -e "🔗 $name (未连接)"
            fi
            echo "   地址: $addr"
            echo ""
        fi
    done
}

# 连接设备
cmd_connect() {
    local addr="$1"
    
    if [ -z "$addr" ]; then
        echo -e "${RED}用法: bluetooth-monitor connect <设备地址>${NC}"
        echo "示例: bluetooth-monitor connect 08-65-18-B9-9C-B2"
        exit 1
    fi
    
    check_blueutil
    
    addr=$(format_address "$addr")
    echo -e "${BLUE}正在连接到设备: $addr${NC}"
    
    if blueutil --connect "$addr" 2>/dev/null; then
        echo -e "${GREEN}✅ 连接成功${NC}"
    else
        echo -e "${RED}❌ 连接失败${NC}"
        exit 1
    fi
}

# 断开设备
cmd_disconnect() {
    local addr="$1"
    
    if [ -z "$addr" ]; then
        echo -e "${RED}用法: bluetooth-monitor disconnect <设备地址>${NC}"
        echo "示例: bluetooth-monitor disconnect 08-65-18-B9-9C-B2"
        exit 1
    fi
    
    check_blueutil
    
    addr=$(format_address "$addr")
    echo -e "${BLUE}正在断开设备: $addr${NC}"
    
    if blueutil --disconnect "$addr" 2>/dev/null; then
        echo -e "${GREEN}✅ 已断开${NC}"
    else
        echo -e "${RED}❌ 操作失败${NC}"
        exit 1
    fi
}

# 蓝牙电源状态
cmd_power() {
    check_blueutil
    
    local state="$1"
    
    if [ -z "$state" ]; then
        # 显示当前状态
        local power=$(blueutil --power)
        if [ "$power" == "1" ]; then
            echo -e "${GREEN}🔵 蓝牙已开启${NC}"
        else
            echo -e "${RED}⚫ 蓝牙已关闭${NC}"
        fi
    else
        # 设置状态
        if [[ "$state" == "on" || "$state" == "1" ]]; then
            echo -e "${BLUE}正在开启蓝牙...${NC}"
            blueutil --power 1
            echo -e "${GREEN}✅ 蓝牙已开启${NC}"
        elif [[ "$state" == "off" || "$state" == "0" ]]; then
            echo -e "${BLUE}正在关闭蓝牙...${NC}"
            blueutil --power 0
            echo -e "${YELLOW}⚠️ 蓝牙已关闭${NC}"
        else
            echo -e "${RED}用法: bluetooth-monitor power [on|off]${NC}"
            exit 1
        fi
    fi
}

# 显示帮助
cmd_help() {
    echo "蓝牙设备监控 v1.0.0"
    echo ""
    echo "用法: bluetooth-monitor <命令> [参数]"
    echo ""
    echo "命令:"
    echo "  connected          查看已连接的蓝牙设备  paired            "
    echo " 查看已配对的蓝牙设备"
    echo "  connect <地址>     连接到指定设备"
    echo "  disconnect <地址>  断开指定设备"
    echo "  power [on|off]     查看/设置蓝牙电源状态"
    echo "  help               显示此帮助信息"
    echo ""
    echo "示例:"
    echo "  bluetooth-monitor connected"
    echo "  bluetooth-monitor connect 08-65-18-B9-9C-B2"
    echo "  bluetooth-monitor power on"
}

# 主逻辑
main() {
    local command="${1:-}"
    shift || true
    
    case "$command" in
        connected|c)
            cmd_connected
            ;;
        paired|p)
            cmd_paired
            ;;
        connect|conn)
            cmd_connect "$@"
            ;;
        disconnect|disconn)
            cmd_disconnect "$@"
            ;;
        power|pw)
            cmd_power "$@"
            ;;
        help|--help|-h|"")
            cmd_help
            ;;
        *)
            echo -e "${RED}未知命令: $command${NC}"
            cmd_help
            exit 1
            ;;
    esac
}

main "$@"
