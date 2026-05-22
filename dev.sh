#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

echo "测试区域，请勿随意使用"
echo "1.更新SSR-Bsah"
echo "2.一键封禁BT下载，SPAM邮件流量（无法撤销）"
echo "3.防止暴力破解SS连接信息 (重启后失效)"

while :; do echo
	read -p "请选择： " devc
	[ -z "$devc" ] && ssr && break
	if [[ ! $devc =~ ^[1-3]$ ]]; then
		echo "输入错误! 请输入正确的数字!"
	else
		break	
	fi
done

if [[ $devc == 1 ]];then
	rm -rf /usr/local/bin/ssr
	cd /usr/local/SSR-Bash-Python/
	# 安全警告：原始远端仓库(Readour/AR-B-P-B)已被删除
	# 使用本地文件代替从远端下载，防止供应链攻击
	echo "更新功能被禁用 - 原仓库已删除"
	echo "请手动从可信源更新"
	sleep 2s
	ssr
fi

if [[ $devc == 2 ]];then
	echo "一键封禁BT下载/SPAM功能已禁用"
	echo "原脚本源(softs.pw)已不可信，跳过执行以防止RCE攻击。"
fi

if [[ $devc == 3 ]];then
	nohup tail -F /usr/local/shadowsocksr/ssserver.log | python autoban.py >log 2>log &
fi
