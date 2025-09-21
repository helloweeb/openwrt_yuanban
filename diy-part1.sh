#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default




# 安装额外依赖软件包
# sudo -E apt-get -y install rename
#ln -s ../../diy ./package/openwrt-packages

# 更新feeds文件
#sed -i 's@#src-git helloworld@src-git helloworl#d@g' feeds.conf.default #启用helloworld
#sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default
#sed -i '$a src-git xiaorouji https://github.com/xiaorouji/openwrt-package' feeds.conf.default
#sed -i '$a src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
#cat feeds.conf.default

# 更新并安装源
#./scripts/feeds clean
#./scripts/feeds update -a && ./scripts/feeds install -a

# 删除软件包
#rm -rf ./package/lean/UnblockNeteaseMusic
#rm -rf ./package/lean/UnblockNeteaseMusic-Go
#rm -rf ./package/lean/luci-app-unblockmusic

# 添加第三方软件包
#git clone https://github.com/gbaoye/openwrt-packages package/openwrt-packages
#git clone https://github.com/kenzok8/openwrt-packages package/openwrt-packages
#git clone https://github.com/destan19/OpenAppFilter package/OpenAppFilter
#git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan
#git clone https://github.com/garypang13/luci-theme-edge package/luci-theme-edge
#git clone https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome
#git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash
#git clone https://github.com/hubbylei/luci-app-clash package/luci-app-clash
#git clone https://github.com/immortalwrt/luci-app-unblockneteasemusic.git package/luci-app-unblockneteasemusic
#git clone https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-smartdns.git package/luci-app-smartdns
#git clone https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-openclash package/luci-app-openclash
git clone https://github.com/xiaorouji/openwrt-passwall/tree/main/luci-app-passwall package/luci-app-passwall

# 下载自定义软件
#svn co https://github.com/kenzok8/openwrt-packages/tree/master/luci-app-clash ../package/luci-app-clash
svn co https://github.com/vernesong/OpenClash/tree/master/luci-app-openclash ../package/luci-app-openclash

# 替换更新插件
rm -rf package/openwrt-packages/luci-app-passwall && svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-passwall package/openwrt-packages/luci-app-passwall
#rm -rf package/openwrt-packages/luci-app-ssr-plus && svn co https://github.com/fw876/helloworld package/openwrt-packages/helloworld
#rm -rf package/openwrt-packages/adguardhome && svn co https://github.com/Lienol/openwrt/tree/dev-19.07/package/diy/adguardhome package/openwrt-packages/adguardhome
#rm -rf package/openwrt-packages/luci-app-adguardhome && svn co https://github.com/kongfl888/luci-app-adguardhome package/openwrt-packages/luci-app-adguardhome
#rm -rf package/openwrt-packages/luci-app-clash && svn co https://github.com/frainzy1477/luci-app-clash package/openwrt-packages/luci-app-clash

# 添加passwall依赖库
git clone https://github.com/kenzok8/small package/small
#svn co https://github.com/Lienol/openwrt-package/tree/master/package package/small

# 替换更新haproxy默认版本
#rm -rf feeds/packages/net/haproxy && svn co https://github.com/Lienol/openwrt-packages/net/haproxy feeds/packages/net/haproxy

# 自定义定制选项
sed -i 's#192.168.1.1#192.168.18.1#g' package/base-files/files/bin/config_generate #定制默认IP
sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings #取消系统默认密码
#sed -i 's#option commit_interval 24h#option commit_interval 10m#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计写入为10分钟
#sed -i 's#option database_directory /var/lib/nlbwmon#option database_directory /etc/config/nlbwmon_data#g' feeds/packages/net/nlbwmon/files/nlbwmon.config #修改流量统计数据存放默认位置
#sed -i 's@background-color: #e5effd@background-color: #f8fbfe@g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
#sed -i 's#rgba(223, 56, 18, 0.04)#rgba(223, 56, 18, 0.02)#g' package/luci-theme-edge/htdocs/luci-static/edge/cascade.css #luci-theme-edge主题颜色微调
#sed -i 's/config internal themes/config internal themes\n    option atmaterial  \"\/luci-static\/atmaterial\"/g' feeds/luci/modules/luci-base/root/etc/config/luci #修改默认主题
#sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap #去除默认bootstrap主题
