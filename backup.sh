#!/bin/bash

#mc定时同步备份脚本
back_log_file="bac.log"
current_bac=$(date "+bac_%Y_%m_%d__%H_%M.tar")

echo "所处文件夹"  $(pwd) | tee -a $back_log_file
echo -e '\n' | tee -a $back_log_file
(echo -e "当前时间 \c" && date "+%Y:%m:%d %H:%M") | tee -a $back_log_file
echo '开始备份' | tee -a $back_log_file

#如果不存在，创建备份文件夹
if [ ! -d "./bac" ]; then
	echo "备份文件夹不存在，正在创建文件夹" | tee -a $back_log_file
	mkdir bac
fi


if [ ! -d "./current/worlds" ]; then
	echo '错误，没有找到当前游戏地图文件' | tee -a $back_log_file
	exit 1 
fi

tar -cvf ./bac/$current_bac -C  ./current worlds    | tee -a $back_log_file



echo '备份完成' | tee -a $back_log_file
echo -e '\n\n' | tee -a $back_log_file





