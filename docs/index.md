# SSR多用户管理脚本（基于官方mujson版本）
稳定版V1.7.2：[![Build Status](https://travis-ci.org/Readour/AR-B-P-B.svg?branch=master)](https://travis-ci.org/Readour/AR-B-P-B) [![Code Climate](https://codeclimate.com/github/Readour/AR-B-P-B/badges/gpa.svg)](https://codeclimate.com/github/Readour/AR-B-P-B)

开发版V1.9.8：[![Build Status](https://travis-ci.org/Readour/AR-B-P-B.svg?branch=develop)](https://travis-ci.org/Readour/AR-B-P-B)

## 介绍 ##

一个Shell脚本，集成SSR多用户管理，流量限制，加密更改等基本操作。是一个基于ShadowsocksR官方的mujson的辅助脚本。方便用户操作，并且支持快速构建SSR服务环境。

- 请谨慎使用，出问题概不负责！！！！
- 如果发现脚本bug，请及时发issues，非常感谢

## 系统支持 ##
* Ubuntu 14
* Ubuntu 16
* Debian 7
* Debian 8
* CentOS 6
* CentOS 7

## 功能 ##
- 全自动无人值守安装，服务端部署只需一条命令，您和SSR都是如此的优雅：）
- 一键开启、关闭SSR服务
- 添加、删除、修改用户端口、密码和连接数限制
- 支持傻瓜式用户添加,小白也可以用
- 自由限制用户端口流量使用及端口网速
- 自动修改防火墙规则
- 自助修改SSR加密方式、协议、混淆等参数
- 自动统计，方便查询每个用户端口的流量使用情况
- 自动安装Libsodium库以支持Chacha20等加密方式
- 支持用户二维码生成(仅开发版可用)
- 支持一键构建ss-panel-V3-mod,前端后端自动对接，无需额外操作（仅开发版可用）
- 傻瓜式的BBR、锐速、LotServer一键构建（有风险，仅开发版可用）
- 可自定义的服务器巡检，故障自动重启服务，确保链接稳定有效
- 可对配置进行备份、还原，迁移服务器只需在新服务器上还原配置，无需麻烦设置
- 允许针对不同用户设置帐号有效期，到期自动删除！

不如看图:

![](https://github.com/zyh001/zyh001.github.com/raw/master/images/now1.png) ![](https://github.com/zyh001/zyh001.github.com/raw/master/images/now2.png)

未来可能的交互界面（吊下胃口）：
![](https://github.com/zyh001/zyh001.github.com/raw/master/images/future.png)

## 脚本安全性声明 ##
**本脚本采用Shell和Python语言编写，所有代码完全开源。不存在所谓的后台或挖矿代码，不会对您的任何信息进行上传，并在各个方面充分考虑到数据安全性。关于二维码生成过程是通过pip安装[第三方软件包](https://github.com/lincolnloop/python-qrcode)，由第三方软件在服务器本地生成，生成的二维码链接也会自动销毁，不会上传任何信息。您的IP被封，或者您服务器出现不正常的负荷增高，与脚本本身没有任何关系，请您自行做好服务器安全维护工作，例如：不要使用弱密码、不要使用默认SSH端口，等等，防止被闲人爆破。_本着人与人之间的互信原则，请确认您相信我和我的脚本，否则请不要使用，不懂请不要喷，容易伤和气！！！_**

## 缺点 ##
- 默认未设置开机启动

## 安装或更新到最新开发版(支持新特性，推荐使用) ##
    wget -q -N --no-check-certificate https://raw.githubusercontent.com/Readour/AR-B-P-B/master/install.sh && bash install.sh develop

## 安装&更新 ##
    wget -q -N --no-check-certificate https://raw.githubusercontent.com/Readour/AR-B-P-B/master/install.sh && bash install.sh

## 自检（没有卵用😝） ##
    wget -q -N --no-check-certificate https://raw.githubusercontent.com/Readour/AR-B-P-B/master/self-check.sh && bash self-check.sh

## 卸载 ##
    wget -q -N --no-check-certificate https://raw.githubusercontent.com/Readour/AR-B-P-B/master/install.sh && bash install.sh uninstall

## 离线安装 ##
    #此方法可用于网络情况不好，导致缺少文件的情况.亦可下载该脚本，用于备份
    wget -q -N --no-check-certificate https://github.com/Readour/AR-B-P-B/releases/download/1.9.8/install.sh && bash install.sh
    
## 客户端下载 ## 
常用平台：[Android](https://github.com/shadowsocksrr/shadowsocksr-latest-bin-backup/raw/master/Shadowsocksr-android-3.4.0.5.apk)、[MacOS](https://github.com/qinyuhang/ShadowsocksX-NG-R/releases/download/1.4.3-R8/ShadowsocksX-NG-R8.dmg)、[Windows](https://github.com/Readour/ShadowsocksR-Csharp/releases/download/4.7.0/ShadowsocksR-4.7.0-win.CONCISE.7z)、[Linux](https://github.com/shadowsocks/shadowsocks-qt5/releases/download/v2.9.0/Shadowsocks-Qt5-x86_64.AppImage)、[OpenWrt/LEDE](https://github.com/bettermanbao/openwrt-shadowsocksR-libev-full/releases)、[iOS](https://github.com/Readour/breakwa11.github.io/raw/master/download/Shadowrocket%202.1.14.ipa)

## 常见问题解答 ##
[戳这里~戳这里~戳这里](/QA.html)

## 写在最后 ##
<span style="font-size:18px;"><span style="color:#E53333;"></span></span><span style="font-size:16px;color:#E53333;">**关于该脚本的停更说明：**</span>由于本人个人原因，没有精力继续对该脚本进行维护。但并不是不管，脚本现在已经非常臃肿，不会再新加入功能，如果发现版本bug，请及时发E-mail：<stackzhao@gmail.com>，本人会尽快修复。此外，~~本人将在下个月进行V2ray一键脚本的开发~~，欢迎关注

## 赞助我 ##


__XMR(门罗币):__ 

    47LiGQz6VPGe23g1MtuPEcUAyki5A8BEpF6ViGv7WkQvGpaztSANVzzjXqrT3anyZ22j7DEE74GkbVcQFyH2nNiC3ea8z7g

__ETH(以太坊):__

    [0x133743A8A6D33a04CdaC57C9c497094FC333b8eb](https://etherscan.io/address/0x133743A8A6D33a04CdaC57C9c497094FC333b8eb)

__BTC(比特币):__ 

    [1KCSpD3XakscqgUXdCrTfr56xerrpY9kbw](https://blockchain.info/address/1KCSpD3XakscqgUXdCrTfr56xerrpY9kbw)

__BCH(比特现金):__

    [1HsB88an66MYrCqb4qUhPWT2gwRfNi8QxL](https://blockdozer.com/insight/address/1HsB88an66MYrCqb4qUhPWT2gwRfNi8QxL)

__Google Paly礼品卡:__ 

    stackzhao@gmail.com

__PayPal:__ 

[![给我捐赠](https://s1.ax1x.com/2017/12/23/jbclD.jpg)](https://paypal.me/stackzhao/5)

__支付宝红包:__

<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?e4303264d8a29aa569d269b7f1be2b6a";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-111498876-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-111498876-1');
</script>
<button class="btn" data-clipboard-text="【支付宝】年终红包再加10亿！12月24日还有机会获得圣诞惊喜红包！长按复制此消息，打开最新版支付宝就能领取！Z6mqlh92iN">
复制吱口令到剪贴板
</button>
<script type="text/javascript">
  var _paq = _paq || [];
  /* tracker methods like "setCustomDimension" should be called before "trackPageView" */
  _paq.push(['trackPageView']);
  _paq.push(['enableLinkTracking']);
  (function() {
    var u="//us.fdos.me/tongji/";
    _paq.push(['setTrackerUrl', u+'piwik.php']);
    _paq.push(['setSiteId', '2']);
    var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
    g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
  })();
</script>
<script src="js/clipboard.js"></script>
    <script>
    var clipboard = new Clipboard('.btn');
    clipboard.on('success', function(e) {
        console.log(e);
    });
    clipboard.on('error', function(e) {
        console.log(e);
    });
    </script>
