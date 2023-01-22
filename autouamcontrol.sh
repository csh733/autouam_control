#!/bin/bash
# author: Connor
# url: www.sakurabox.io

function install {
echo -e "\n"
echo -e '即将开始下载，请确认系统中已安装 screen 软件包！\n'
sleep 3
wget https://raw.githubusercontent.com/csh733/autouam_control/main/uam.sh -O uam.sh
echo -e '下载完成，请先按教程正确配置uam.sh文件后再启动！'
echo -e '教程地址： https://www.sakurabox.io/cloudflareautouam.html\n'
break
}

function start {
echo -e "\n"
screen -dmS autouam && screen -x -S autouam -p 0 -X stuff "bash autouam.sh" && screen -x -S autouam -p 0 -X stuff $'\n'
echo -e '\n成功启动自动开盾'
}

function stop {
echo -e "\n"
screen -S autouam -X quit
echo -e '\n成功停止自动开盾'
}

function status {
echo -e "\n"
echo -e '即将显示状态，使用 Ctrl + A + D 退出'
sleep 3
screen -r autouam -d
}

function menu {

echo
echo -e "自动开盾功能菜单"
echo -e "By: Connor"
echo -e "URL: https://www.sakurabox.io\n"
echo -e "1. 安装自动开盾"
echo -e "2. 启动自动开盾" 
echo -e "3. 停止自动开盾" 
echo -e "4. 显示自动开盾状态" 
echo -e "0. 退出菜单\n"
echo -en "请选择:" 
read -n 1 option
}

while [ 1 ]
do 
    menu
    case $option in
    0)
        break ;;
    1)
        install  ;;
    2)
        start ;;
    3)
        stop ;;
    4)
        status ;;
    *)
        
        echo -e "\n选择错误！" ;;
    esac
    echo -en "\n按任意键继续...\n"
    read -n 1 line
done
echo -e "\n"
