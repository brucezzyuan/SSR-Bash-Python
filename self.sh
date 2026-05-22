#!/bin/bash
export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#Check Root
[ $(id -u) != "0" ] && { echo "Error: You must be root to run this script"; exit 1; }

#Main
updateme(){
	cd ~
	if [[ -e ~/version.txt ]];then
		rm -f ~/version.txt
	fi
	# 安全警告：由于原始 GitHub 仓库(Readour/AR-B-P-B)已被删除，
	# 不再从外部源检查版本或下载更新，以防止供应链攻击。
	echo "警告: 自动更新功能已禁用 - 原作者的仓库已删除，"
	echo "从外部源下载代码可能带来严重的安全风险。"
	echo ""
	echo "如需更新，请手动从可信源获取最新版本。"
	sleep 3s
	ssr
}
sumdc(){
	sum1=`cat /proc/sys/kernel/random/uuid| cksum | cut -f1 -d" "|head -c 2`
	sum2=`cat /proc/sys/kernel/random/uuid| cksum | cut -f1 -d" "|head -c 1`
	solve=`echo "$sum1-$sum2"|bc`
	echo -e "请输入\e[32;49m $sum1-$sum2 \e[0m的运算结果,表示你已经确认,输入错误将退出"
	read sv
}

#Show
echo "输入数字选择功能："
echo ""
echo "1.检查更新"
echo "2.切换到开发版"
echo "3.程序自检"
echo "4.卸载程序"
while :; do echo
	read -p "请选择： " choice
	if [[ ! $choice =~ ^[1-4]$ ]]; then
		[ -z "$choice" ] && ssr && break
		echo "输入错误! 请输入正确的数字!"
	else
		break	
	fi
done

if [[ $choice == 1 ]];then
	updateme
fi
if [[ $choice == 2 ]];then
	echo "切换到开发版功能已禁用 - 原仓库已删除"
	echo "从外部源下载代码可能带来严重的安全风险。"
	echo ""
	sleep 3s
	bash /usr/local/SSR-Bash-Python/self.sh
fi
if [[ $choice == 3 ]];then
	bash /usr/local/SSR-Bash-Python/self-check.sh
fi
if [[ $choice == 4 ]];then
	echo "你在做什么？你真的这么狠心吗？"
	sumdc
	if [[ "$sv" == "$solve" ]];then
		echo "正在执行卸载..."
		if [[ -f /usr/local/SSR-Bash-Python/install.sh ]]; then
			bash /usr/local/SSR-Bash-Python/install.sh uninstall
		elif [[ -f "${PWD}/install.sh" ]]; then
			bash "${PWD}/install.sh" uninstall
		else
			echo "错误：找不到 install.sh 文件，无法执行卸载。"
			echo "请手动删除以下目录："
			echo "  rm -rf /usr/local/bin/ssr"
			echo "  rm -rf /usr/local/SSR-Bash-Python"
			echo "  rm -rf /usr/local/shadowsocksr"
		fi
		exit 0
	else
		echo "计算错误，正确结果为$solve"
		bash /usr/local/SSR-Bash-Python/self.sh
	fi
fi
exit 0
