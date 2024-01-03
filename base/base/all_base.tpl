{% if request.target == "clash" or request.target == "clashr" %}

port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
mode: Rule
log-level: {{ default(global.clash.log_level, "info") }}
external-controller: :9090
{% if default(request.clash.dns, "") == "1" %}
dns:
  enable: true
  listen: :1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
# IPV6 启动与否
ipv6 = false
# udp 类的 dns 服务器，用,隔开多个服务器，system 表示系统 dns
dns-server = 119.29.29.29, 223.5.5.5
# DNS over HTTPS服务器，用,隔开多个服务器
doh-server = https://223.5.5.5/resolve, https://sm2.doh.pub/dns-query
# 是否开启局域网代理访问
allow-wifi-access = false
# 开启局域网访问后的 http 代理端口
wifi-access-http-port = 7222
# 开启局域网访问后的 socks5 代理端口
wifi-access-socks5-port = 7221
# 测速所用的测试链接，如果策略组没有自定义测试链接就会使用这里配置的
proxy-test-url = http://connectivitycheck.gstatic.com
# 节点测速时的超时秒数
test-timeout = 2
# 指定流量使用哪个网络接口进行转发
interface-mode = auto
sni-sniffing = true
# 禁用 stun 是否禁用 stun 协议的 udp 数据，禁用后可以有效解决 webrtc 的 ip 泄露
disable-stun = true
# 策略改变时候打断连接
disconnect-on-policy-change = true
# 一个节点连接失败几次后会进行节点切换，默认 3 次
switch-node-after-failure-times = 3
# 订阅资源解析器链接
resource-parser = https://gitlab.com/lodepuly/vpn_tool/-/raw/main/Resource/Script/Sub-Store/sub-store-parser_for_loon.js
# 自定义 geoip 数据库的 url
geoip-url = https://gitlab.com/Masaiki/GeoIP2-CN/-/raw/release/Country.mmdb
# 配置了该参数，那么所配置的这些IP段、域名将不会转发到Loon，而是由系统处理
skip-proxy = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, localhost, *.local, captive.apple.com, e.crashlynatics.com
# 配置了该参数，那么所配置的这些IP段、域名就会不交给Loon来处理，系统直接处理
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 239.255.255.250/32, 255.255.255.255/32
# 当切换到某一特定的WiFi下时改变Loon的流量模式，如"loon-wifi5g":DIRECT，表示在loon-wifi5g这个wifi网络下使用直连模式，"cellular":PROXY，表示在蜂窝网络下使用代理模式，"default":RULE，默认使用分流模式
ssid-trigger = "Ccccccc":DIRECT,"cellular":RULE,"default":RULE

[Proxy]

[Remote Proxy]

[Remote Filter]

[Proxy Group]
♻️ 自动选择=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
🔰 节点选择=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
🌍 国外媒体=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
🌏 国内媒体=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
Ⓜ️ 微软服务=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
📲 电报信息=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
🍎 苹果服务=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
🎯 全球直连=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
🛑 全球拦截=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
🐟 漏网之鱼=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[Rule]

[Remote Rule]

[Rewrite]

[Host]

[Script]
# 多看阅读  (By @chavyleung)
# 我的 > 签到任务 等到提示获取 Cookie 成功即可
http-request ^https:\/\/www\.duokan\.com\/checkin\/v0\/status script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/duokan/duokan.cookie.js, requires-body=true, tag=多看_cookie
cron "16 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/duokan/duokan.js, tag=多看阅读

# 飞客茶馆  (By @chavyleung)
# 打开 APP, 访问下个人中心
http-request ^https:\/\/www\.flyertea\.com\/source\/plugin\/mobile\/mobile\.php\?module=getdata&.* script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/flyertea/flyertea.cookie.js, tag=飞客茶馆_cookie
cron "17 9 * * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/flyertea/flyertea.js,tag=飞客茶馆

# 10010  (By @chavyleung)
# 打开 APP , 进入签到页面, 系统提示: 获取刷新链接: 成功
# 然后手动签到 1 次, 系统提示: 获取Cookie: 成功 (每日签到)
# 首页>天天抽奖, 系统提示 2 次: 获取Cookie: 成功 (登录抽奖) 和 获取Cookie: 成功 (抽奖次数)
http-request ^https?:\/\/act.10010.com\/SigninApp\/signin\/querySigninActivity.htm script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie1
http-request ^https?:\/\/act.10010.com\/SigninApp(.*?)\/signin\/daySign script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie2
http-request ^https?:\/\/m.client.10010.com\/dailylottery\/static\/(textdl\/userLogin|active\/findActivityInfo) script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.cookie.js, tag=中国联通_cookie3
cron "18 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.js, tag=中国联通

# 万达电影  (By @chavyleung)
# 进入签到页面获取，网页端:https://act-m.wandacinemas.com/2005/17621a8caacc4d190dadd/
http-request ^https:\/\/user-api-prd-mx\.wandafilm\.com script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/wanda/wanda.cookie.js, tag=万达电影_cookie
cron "19 9 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/wanda/wanda.js, tag=万达电影

[MITM]
hostname = m.client.10010.com, act.10010.com, www.flyertea.com, www.duokan.com, tieba.baidu.com
ca-p12 = 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
ca-passphrase = FA1A9849
skip-server-cert-verify = false

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[server_remote]

[filter_remote]

[rewrite_remote]

[server_local]

[filter_local]

[rewrite_local]

[mitm]

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
{% if request.target == "singbox" %}

{
    "log": {
        "disabled": false,
        "level": "info",
        "timestamp": true
    },
    "dns": {
        "servers": [
            {
                "tag": "dns_proxy",
                "address": "tls://1.1.1.1",
                "address_resolver": "dns_resolver"
            },
            {
                "tag": "dns_direct",
                "address": "h3://dns.alidns.com/dns-query",
                "address_resolver": "dns_resolver",
                "detour": "DIRECT"
            },
            {
                "tag": "dns_fakeip",
                "address": "fakeip"
            },
            {
                "tag": "dns_resolver",
                "address": "223.5.5.5",
                "detour": "DIRECT"
            },
            {
                "tag": "block",
                "address": "rcode://success"
            }
        ],
        "rules": [
            {
                "outbound": [
                    "any"
                ],
                "server": "dns_resolver"
            },
            {
                "geosite": [
                    "category-ads-all"
                ],
                "server": "dns_block",
                "disable_cache": true
            },
            {
                "geosite": [
                    "geolocation-!cn"
                ],
                "query_type": [
                    "A",
                    "AAAA"
                ],
                "server": "dns_fakeip"
            },
            {
                "geosite": [
                    "geolocation-!cn"
                ],
                "server": "dns_proxy"
            }
        ],
        "final": "dns_direct",
        "independent_cache": true,
        "fakeip": {
            "enabled": true,
            {% if default(request.singbox.ipv6, "") == "1" %}
            "inet6_range": "fc00::\/18",
            {% endif %}
            "inet4_range": "198.18.0.0\/15"
        }
    },
    "ntp": {
        "enabled": true,
        "server": "time.apple.com",
        "server_port": 123,
        "interval": "30m",
        "detour": "DIRECT"
    },
    "inbounds": [
        {
            "type": "mixed",
            "tag": "mixed-in",
            {% if bool(default(global.singbox.allow_lan, "")) %}
            "listen": "0.0.0.0",
            {% else %}
            "listen": "127.0.0.1",
            {% endif %}
            "listen_port": {{ default(global.singbox.mixed_port, "2080") }}
        },
        {
            "type": "tun",
            "tag": "tun-in",
            "inet4_address": "172.19.0.1/30",
            {% if default(request.singbox.ipv6, "") == "1" %}
            "inet6_address": "fdfe:dcba:9876::1/126",
            {% endif %}
            "auto_route": true,
            "strict_route": true,
            "stack": "mixed",
            "sniff": true
        }
    ],
    "outbounds": [],
    "route": {
        "rules": [],
        "auto_detect_interface": true
    },
    "experimental": {}
}

{% endif %}

{% if request.target == "mac-surge" %}

[General]
# ================ iOS和MacOS共同的 Surge 参数 ================ #
# > 日志级别 verbose, info, notify, or warning 不建议在日常使用中启用详细，因为这会显著降低性能。
loglevel = notify
# > IPv6协议 启用完整的 IPv6 支持。具体来说，开启该选项后，访问域名时会查询该域名的AAAA记录。即使未启用此选项，也可以通过直接访问 IPv6 地址来访问 IPv6 站点。
ipv6 = false
# > 允许 IPv6 通过 Surge VIF。当您希望 Surge 处理连接到 IPv6 地址的原始 TCP 连接时很有用。
# > off ：切勿使用 IPv6 设置 Surge VIF
# > auto ：仅当本地网络具有有效的 IPv6 网络时，才使用 IPv6 设置 Surge VIF
# > always ：始终使用 IPv6 设置 Surge VIF
ipv6-vif = false
# > dns服务器 上游DNS服务器的IP地址
dns-server = system, 223.5.5.5, 119.29.29.29, 1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4, 9.9.9.9:995
# > 跳过代理 在 iOS 版本中，此选项强制与这些域/IP 范围的连接由 Surge VIF 而不是 Surge 代理处理。在 macOS 版本中，当启用“设置为系统代理”时，这些设置将应用于系统。此选项用于修复某些应用的兼容性问题。
# > apple.com、*apple.com、192.168.2.* or 192.168.2.0/24
# > 注意：如果输入 IP 地址或地址范围，则只有在使用该地址连接到该主机时才能绕过代理，而不能在通过解析为该地址的域名连接到主机时绕过代理。
skip-proxy = localhost, *.local, 0.0.0.0/8, 10.0.0.0/8, 17.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 172.17.0.0/12, 172.18.0.0/12, 172.19.0.0/12, 172.20.0.0/24, 192.0.0.0/24, 192.0.2.0/24, 192.168.0.0/16, 192.88.99.0/24, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 240.0.0.0/4, 255.255.255.255/32, 117.71.53.199/32, 47.75.120.166/32,
# > 排除简单主机名 就像 skip-proxy 参数一样。此选项允许请求使用由 Surge VIF 而不是 Surge 代理处理的简单主机名（不带点）。
# > mysql01、redis01
exclude-simple-hostnames = true
# > 外部控制器访问 此选项允许外部控制器控制 Surge，例如 Surge Dashboard （macOS） 和 Surge iOS 遥控器 （iOS）。例如：key@0.0.0.0:6166
external-controller-access = mima1234@0.0.0.0:6166
# > 使用 HTTPS 协议而不是 HTTP。必须先配置 MitM CA 证书。您需要在客户端设备上手动安装证书。
# http-api-tls =
# > 启用此功能后，您可以通过 Web 浏览器控制 Surge。
http-api-web-dashboard = true
# > 显示错误页面拒绝,如果请求是纯 HTTP 请求，则显示 REJECT 策略的错误网页。
show-error-page-for-reject = true
# > Surge VIF只能处理 TCP 和 UDP 协议。使用此选项可绕过特定 IP 范围，以允许所有流量通过。
# > 注意：此选项仅适用于Surge VIF。Surge Proxy Server 处理的请求不受影响。合并 skip-proxy 并确保 tun-excluded-routes 特定 HTTP 流量绕过 Surge。
# tun-excluded-routes =
# > 默认情况下，Surge VIF 接口将自身声明为默认路由。但是，由于 Wi-Fi 接口的路由较小，因此某些流量可能无法通过浪涌 VIF 接口。使用此选项可添加较小的路由。
# tun-included-routes =
# > Internet 连接测试的 URL, 以及，DIRECT 策略的测试 URL
internet-test-url = http://connect.rom.miui.com/generate_204
# > 代理策略的默认测试 URL
proxy-test-url = http://www.gstatic.com/generate_204
# > 连接测试超时（秒）
test-timeout = 5
# > 始终真实的 IP 此选项要求 Surge 在 Surge VIF 处理 DNS 问题时返回真实 IP 地址而不是虚假 IP 地址 DNS数据包将被转发到上游DNS服务器 此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
# > 使用前缀 - 排除主机名
# > 支持通配符 * 和 ?
# > 使用后缀 :port 匹配其他端口,如果未提供端口号，则 Surge 将自动为该参数附加标准端口号，就像 force-http-engine-hosts 参数一样，如果仅配置了主机名，则仅对端口 80 有效。对于 MITM 功能，它仅对端口 443 有效。
# > 使用后缀 :0 以匹配所有端口
# > 使用<ip-address> 直接使用 IPv4/IPv6 地址（而不是域）匹配所有主机名
# > -*icloud*, -*.mzstatic.com, -*.facebook.com, -*.instagram.com, -*.twitter.com, -*dropbox*, -*apple*, -*.amazonaws.com, -<ip-address>, *
always-real-ip = *.test.com
# > 劫持DNS,默认情况下，Surge 仅返回发送到 Surge DNS 地址 （198.18.0.2） 的 DNS 查询的虚假 IP 地址。发送到标准 DNS 的查询将被转发。某些设备或软件始终使用硬编码的 DNS 服务器。（例如，Google Speakers始终使用 8.8.8.8）。您可以使用此选项劫持查询以获取虚假地址。您可以使用 hijack-dns = *:53 劫持所有DNS查询
hijack-dns = *:53
# > 使 Surge 将 TCP 连接视为 HTTP 请求。Surge HTTP 引擎将处理请求，并且所有高级功能都将可用，例如捕获、重写和脚本编写。此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
# force-http-engine-hosts =
# > 加密 DNS 跟随出站模式,默认情况下，加密的 DNS 查找使用直接出站。启用该选项将使 DOH 遵循出站模式设置和规则。
# encrypted-dns-follow-outbound-mode = true
# > 加密的 DNS 服务器,加密的 DNS 服务器的 URL。如果配置了加密 DNS，则传统 DNS 将仅用于测试连接并解析加密 DNS URL 中的域。
# encrypted-dns-server =
# > 跳过加密的DNS服务器证书验证，这是不安全的。
encrypted-dns-skip-cert-verification = false
# > 使用本地主机代理,默认情况下，如果使用代理策略，则始终在远程服务器上执行 DNS 查找。启用此选项后，如果存在目标域的本地 DNS 映射结果，则 Surge 会使用 IP 地址而不是域来设置代理连接。
use-local-host-item-for-proxy = true
# > 要更新的 GeoIP 数据库的 URL
geoip-maxmind-url = https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb
# > 禁用 GeoIP 数据库的自动更新
disable-geoip-db-auto-update = false
# > iOS 系统可能会执行 SVCB 记录 DNS 查找，而不是标准 A 记录查找。这会导致 Surge 无法返回虚拟 IP 地址。因此，默认情况下，禁止 SVCB 记录查找，以强制系统执行 A 记录查找。
allow-dns-svcb = false
# > UDP 流量与不支持 UDP 中继的策略匹配时的回退行为,可能的值： DIRECT 、 REJECT, 如果没有代理服务器支持 UDP 转发，可修改为「 direct 」或注释下条，但需注意同一目标主机名 TCP 请求与 UDP 请求的源地址不同所造成的隐私及安全风险。
udp-policy-not-supported-behaviour = REJECT
# > 代理的默认 UDP 测试参数, 例如： apple.com@8.8.8.8
# proxy-test-udp = apple.com@8.8.8.8
# > 当系统负载非常高且数据包处理延迟时，启用将优先处理 UDP 数据包。也称为游戏模式
udp-priority = false
# > Surge 将自动嗅探发送到端口 80 和 443 的 TCP 请求的协议，从而在优化性能的同时启用高级 HTTP/HTTPS 功能。但是，这可能会导致一些兼容性问题。如果遇到问题，可以在此处添加主机名，Surge 不会嗅探这些请求的协议。此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
always-raw-tcp-hosts = *.baidu.com
# ================ 仅限 iOS 的 Surge 参数 ================ #
# > 允许 wifi 访问,允许 Surge 代理服务从 LAN 中的其他设备访问。
# allow-wifi-access = false
# > Surge HTTP 代理服务的端口号
# wifi-access-http-port = 6152
# > Surge SOCKS5 代理服务的端口号
# wifi-access-socks5-port = 6153
# > 要求对 Surge HTTP 代理服务进行身份验证。例如：用户名：密码
# wifi-access-http-auth = surge:mima1234
# > 启用 Wi-Fi 助手 (在 Wi-Fi 网络不佳时尝试使用数据网络建立连接，请仅当使用不限量的数据流量时开启)
# wifi-assist = false
# > 隐藏状态栏中的 VPN 图标
# hide-vpn-icon = false
# > 当 Wi-Fi 网络较差时，不要设置与蜂窝数据的连接，而是始终同时设置与 Wi-Fi 和蜂窝数据的连接 此选项可以在 Wi-Fi 较差或 Wi-Fi 网络切换时显著改善网络体验 此功能将应用于所有 TCP 连接和 DNS 查找。仅当您拥有无限的蜂窝数据计划时才启用它
# all-hybrid = false
# > 允许在“个人热点”打开时从其他设备访问 Surge 代理服务
# allow-hotspot-access = ture
# > 包含所有网络,默认情况下，某些请求可能不会被 Surge 接管。例如，应用程序可以绑定到物理网络接口以绕过浪涌 VIF。启用“包括所有网络”选项，以确保所有请求都由 Surge 处理而不会泄漏。当您使用 Surge 作为防火墙时，此选项很有用。（需要 iOS 14.0 或以上版本）,启用此选项可能会导致 AirDrop 和 Xcode 调试问题、通过 USB 的 Surge Dashboard 无法正常工作以及其他意外的副作用。请谨慎使用。
# include-all-networks = false
# > 包含本地网络,启用此选项可使 Surge VIF 处理发送到 LAN 的请求。（需要 iOS 14.2 或更高版本）启用此选项可能会导致 AirDrop 和 Xcode 调试问题、通过 USB 的 Surge Dashboard 无法正常工作以及其他意外的副作用。请谨慎使用。必须与 include-all-networks=true 结合使用。
# include-local-networks = false
# > 启用此选项可使 Surge VIF 处理 Apple 推送通知服务 （APNs） 的网络流量。必须与 include-all-networks=true 结合使用。
# include-apns = false
# > 启用此选项可使 Surge VIF 处理蜂窝服务的 Internet 可路由网络流量。（VoLTE、Wi-Fi 通话、IMS、彩信、可视语音信箱等）.请注意，某些蜂窝运营商会绕过互联网，将蜂窝网络服务流量直接路由到运营商网络。此类蜂窝服务流量始终被排除在隧道之外。必须与 include-all-networks=true 结合使用。
# include-cellular-services = false
# > 兼容性模式,此选项用于控制 Surge iOS 的工作模式。
# > 0：自动，在 5.8.0 之前的 Surge iOS 版本中，这相当于 1，从 5.8.0 开始，它相当于 3
# > 1：代理接管 + VIF，在此模式下，代理接管的优先级高于 VIF 接管，提供最佳性能，但某些应用程序可能会检查代理设置并拒绝工作。
# > 2：仅代理接管
# > 3：VIF Takeover Only：最新版本的默认工作模式。
# > 4：代理接管 + VIF，但代理使用 VIF 地址而不是环回地址。
# > 5：代理接管+VIF，但VIF路由使用多个较小的路由进行接管，没有配置默认路由，可以用来绕过一些特殊问题。（例如，HomeKit 安防摄像头）
# compatibility-mode = 0
# ================ 仅限 MacOS 的 Surge 参数 ================ #
# > 如果禁用，即使 Wi-Fi 不是主网络接口，SSID/BSSID 模式仍可匹配。
use-default-policy-if-wifi-not-primary = false
# > 遵循 /etc/hosts 中的本地 DNS 映射项
read-etc-hosts = true
# > Surge HTTP 代理服务的端口号
http-listen = 0.0.0.0
# > Surge SOCKS5 代理服务的端口号
socks5-listen = 0.0.0.0
# > 启用 CPU 调试模式。这可能会降低性能。
debug-cpu-usage = false
# > 启用内存调试模式。这可能会降低性能。
debug-memory-usage = false
# > vif模式
# > auto ：让Surge自动选择最合适的工作模式。
# > v1 ：传统模式，TCP协议栈完全由Surge管理。由于 Surge 运行在用户空间中，这意味着每个数据包都需要从内核空间传输到用户空间进行处理。
# > v2 ：在 5.0 版本中引入，它使用 macOS 中的数据包过滤器机制，利用 macOS 的 TCP 协议栈，从而避免了在内核空间和用户空间之间切换的开销，从而显着提高了性能。但是，由于它需要修改 pf 设置，因此它与虚拟机网络和网络共享功能不兼容。
# > v3 ：在 5.2 版中引入，它绕过了数据包过滤器，并采用另一种技术来使用 macOS 的 TCP 协议栈。性能略低于 v2，但避免了因调整 pf 设置而导致的兼容性问题。
vif-mode = v3

[Replica]
hide-apple-request=1
hide-crashlytics-request=1
hide-udp=0
keyword-filter-type=(null)
keyword-filter=(null)

[Proxy]

[Proxy Group]

[Rule]

[URL Rewrite]
# Redirect Google Search Service
^https?://(www.)?g.cn https://www.google.com 302
^https?://(www.)?google.cn https://www.google.com 302

{% endif %}

{% if request.target == "ios-surge" %}

[General]
# ================ iOS和MacOS共同的 Surge 参数 ================ #
# > 日志级别 verbose, info, notify, or warning 不建议在日常使用中启用详细，因为这会显著降低性能。
loglevel = notify
# > IPv6协议 启用完整的 IPv6 支持。具体来说，开启该选项后，访问域名时会查询该域名的AAAA记录。即使未启用此选项，也可以通过直接访问 IPv6 地址来访问 IPv6 站点。
ipv6 = false
# > 允许 IPv6 通过 Surge VIF。当您希望 Surge 处理连接到 IPv6 地址的原始 TCP 连接时很有用。
# > off ：切勿使用 IPv6 设置 Surge VIF
# > auto ：仅当本地网络具有有效的 IPv6 网络时，才使用 IPv6 设置 Surge VIF
# > always ：始终使用 IPv6 设置 Surge VIF
ipv6-vif = false
# > dns服务器 上游DNS服务器的IP地址
dns-server = system, 223.5.5.5, 119.29.29.29, 1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4, 9.9.9.9:995
# > 跳过代理 在 iOS 版本中，此选项强制与这些域/IP 范围的连接由 Surge VIF 而不是 Surge 代理处理。在 macOS 版本中，当启用“设置为系统代理”时，这些设置将应用于系统。此选项用于修复某些应用的兼容性问题。
# > apple.com、*apple.com、192.168.2.* or 192.168.2.0/24
# > 注意：如果输入 IP 地址或地址范围，则只有在使用该地址连接到该主机时才能绕过代理，而不能在通过解析为该地址的域名连接到主机时绕过代理。
skip-proxy = localhost, *.local, 0.0.0.0/8, 10.0.0.0/8, 17.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 172.17.0.0/12, 172.18.0.0/12, 172.19.0.0/12, 172.20.0.0/24, 192.0.0.0/24, 192.0.2.0/24, 192.168.0.0/16, 192.88.99.0/24, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 240.0.0.0/4, 255.255.255.255/32, 117.71.53.199/32, 47.75.120.166/32
# > 排除简单主机名 就像 skip-proxy 参数一样。此选项允许请求使用由 Surge VIF 而不是 Surge 代理处理的简单主机名（不带点）。
# > mysql01、redis01
exclude-simple-hostnames = true
# > 外部控制器访问 此选项允许外部控制器控制 Surge，例如 Surge Dashboard （macOS） 和 Surge iOS 遥控器 （iOS）。例如：key@0.0.0.0:6166
external-controller-access = mima1234@0.0.0.0:6166
# > 使用 HTTPS 协议而不是 HTTP。必须先配置 MitM CA 证书。您需要在客户端设备上手动安装证书。
# http-api-tls =
# > 启用此功能后，您可以通过 Web 浏览器控制 Surge。
http-api-web-dashboard = false
# > 显示错误页面拒绝,如果请求是纯 HTTP 请求，则显示 REJECT 策略的错误网页。
show-error-page-for-reject = true
# > Surge VIF只能处理 TCP 和 UDP 协议。使用此选项可绕过特定 IP 范围，以允许所有流量通过。
# > 注意：此选项仅适用于Surge VIF。Surge Proxy Server 处理的请求不受影响。合并 skip-proxy 并确保 tun-excluded-routes 特定 HTTP 流量绕过 Surge。
# tun-excluded-routes =
# > 默认情况下，Surge VIF 接口将自身声明为默认路由。但是，由于 Wi-Fi 接口的路由较小，因此某些流量可能无法通过浪涌 VIF 接口。使用此选项可添加较小的路由。
# tun-included-routes =
# > Internet 连接测试的 URL, 以及，DIRECT 策略的测试 URL
internet-test-url = http://connect.rom.miui.com/generate_204
# > 代理策略的默认测试 URL
proxy-test-url = http://www.gstatic.com/generate_204
# > 连接测试超时（秒）
test-timeout = 5
# > 始终真实的 IP 此选项要求 Surge 在 Surge VIF 处理 DNS 问题时返回真实 IP 地址而不是虚假 IP 地址 DNS数据包将被转发到上游DNS服务器 此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
# > 使用前缀 - 排除主机名
# > 支持通配符 * 和 ?
# > 使用后缀 :port 匹配其他端口,如果未提供端口号，则 Surge 将自动为该参数附加标准端口号，就像 force-http-engine-hosts 参数一样，如果仅配置了主机名，则仅对端口 80 有效。对于 MITM 功能，它仅对端口 443 有效。
# > 使用后缀 :0 以匹配所有端口
# > 使用<ip-address> 直接使用 IPv4/IPv6 地址（而不是域）匹配所有主机名
# > -*icloud*, -*.mzstatic.com, -*.facebook.com, -*.instagram.com, -*.twitter.com, -*dropbox*, -*apple*, -*.amazonaws.com, -<ip-address>, *
always-real-ip = *.test.com
# > 劫持DNS,默认情况下，Surge 仅返回发送到 Surge DNS 地址 （198.18.0.2） 的 DNS 查询的虚假 IP 地址。发送到标准 DNS 的查询将被转发。某些设备或软件始终使用硬编码的 DNS 服务器。（例如，Google Speakers始终使用 8.8.8.8）。您可以使用此选项劫持查询以获取虚假地址。您可以使用 hijack-dns = *:53 劫持所有DNS查询
hijack-dns = *:53
# > 使 Surge 将 TCP 连接视为 HTTP 请求。Surge HTTP 引擎将处理请求，并且所有高级功能都将可用，例如捕获、重写和脚本编写。此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
# force-http-engine-hosts =
# > 加密 DNS 跟随出站模式,默认情况下，加密的 DNS 查找使用直接出站。启用该选项将使 DOH 遵循出站模式设置和规则。
# encrypted-dns-follow-outbound-mode = true
# > 加密的 DNS 服务器,加密的 DNS 服务器的 URL。如果配置了加密 DNS，则传统 DNS 将仅用于测试连接并解析加密 DNS URL 中的域。
# encrypted-dns-server =
# > 跳过加密的DNS服务器证书验证，这是不安全的。
encrypted-dns-skip-cert-verification = false
# > 使用本地主机代理,默认情况下，如果使用代理策略，则始终在远程服务器上执行 DNS 查找。启用此选项后，如果存在目标域的本地 DNS 映射结果，则 Surge 会使用 IP 地址而不是域来设置代理连接。
use-local-host-item-for-proxy = true
# > 要更新的 GeoIP 数据库的 URL
geoip-maxmind-url = https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb
# > 禁用 GeoIP 数据库的自动更新
disable-geoip-db-auto-update = false
# > iOS 系统可能会执行 SVCB 记录 DNS 查找，而不是标准 A 记录查找。这会导致 Surge 无法返回虚拟 IP 地址。因此，默认情况下，禁止 SVCB 记录查找，以强制系统执行 A 记录查找。
allow-dns-svcb = false
# > UDP 流量与不支持 UDP 中继的策略匹配时的回退行为,可能的值： DIRECT 、 REJECT, 如果没有代理服务器支持 UDP 转发，可修改为「 direct 」或注释下条，但需注意同一目标主机名 TCP 请求与 UDP 请求的源地址不同所造成的隐私及安全风险。
udp-policy-not-supported-behaviour = REJECT
# > 代理的默认 UDP 测试参数, 例如： apple.com@8.8.8.8
# proxy-test-udp = apple.com@8.8.8.8
# > 当系统负载非常高且数据包处理延迟时，启用将优先处理 UDP 数据包。也称为游戏模式
udp-priority = false
# > Surge 将自动嗅探发送到端口 80 和 443 的 TCP 请求的协议，从而在优化性能的同时启用高级 HTTP/HTTPS 功能。但是，这可能会导致一些兼容性问题。如果遇到问题，可以在此处添加主机名，Surge 不会嗅探这些请求的协议。此参数属于主机列表类型，详细规则请参见：https://manual.nssurge.com/others/host-list.html
always-raw-tcp-hosts = *.baidu.com
# ================ 仅限 iOS 的 Surge 参数 ================ #
# > 允许 wifi 访问,允许 Surge 代理服务从 LAN 中的其他设备访问。
allow-wifi-access = false
# > Surge HTTP 代理服务的端口号
wifi-access-http-port = 6152
# > Surge SOCKS5 代理服务的端口号
wifi-access-socks5-port = 6153
# > 要求对 Surge HTTP 代理服务进行身份验证。例如：用户名：密码
wifi-access-http-auth = surge:mima1234
# > 启用 Wi-Fi 助手 (在 Wi-Fi 网络不佳时尝试使用数据网络建立连接，请仅当使用不限量的数据流量时开启)
wifi-assist = false
# > 隐藏状态栏中的 VPN 图标
hide-vpn-icon = false
# > 当 Wi-Fi 网络较差时，不要设置与蜂窝数据的连接，而是始终同时设置与 Wi-Fi 和蜂窝数据的连接 此选项可以在 Wi-Fi 较差或 Wi-Fi 网络切换时显著改善网络体验 此功能将应用于所有 TCP 连接和 DNS 查找。仅当您拥有无限的蜂窝数据计划时才启用它
all-hybrid = false
# > 允许在“个人热点”打开时从其他设备访问 Surge 代理服务
allow-hotspot-access = ture
# > 包含所有网络,默认情况下，某些请求可能不会被 Surge 接管。例如，应用程序可以绑定到物理网络接口以绕过浪涌 VIF。启用“包括所有网络”选项，以确保所有请求都由 Surge 处理而不会泄漏。当您使用 Surge 作为防火墙时，此选项很有用。（需要 iOS 14.0 或以上版本）,启用此选项可能会导致 AirDrop 和 Xcode 调试问题、通过 USB 的 Surge Dashboard 无法正常工作以及其他意外的副作用。请谨慎使用。
include-all-networks = false
# > 包含本地网络,启用此选项可使 Surge VIF 处理发送到 LAN 的请求。（需要 iOS 14.2 或更高版本）启用此选项可能会导致 AirDrop 和 Xcode 调试问题、通过 USB 的 Surge Dashboard 无法正常工作以及其他意外的副作用。请谨慎使用。必须与 include-all-networks=true 结合使用。
include-local-networks = false
# > 启用此选项可使 Surge VIF 处理 Apple 推送通知服务 （APNs） 的网络流量。必须与 include-all-networks=true 结合使用。
include-apns = false
# > 启用此选项可使 Surge VIF 处理蜂窝服务的 Internet 可路由网络流量。（VoLTE、Wi-Fi 通话、IMS、彩信、可视语音信箱等）.请注意，某些蜂窝运营商会绕过互联网，将蜂窝网络服务流量直接路由到运营商网络。此类蜂窝服务流量始终被排除在隧道之外。必须与 include-all-networks=true 结合使用。
include-cellular-services = false
# > 兼容性模式,此选项用于控制 Surge iOS 的工作模式。
# > 0：自动，在 5.8.0 之前的 Surge iOS 版本中，这相当于 1，从 5.8.0 开始，它相当于 3
# > 1：代理接管 + VIF，在此模式下，代理接管的优先级高于 VIF 接管，提供最佳性能，但某些应用程序可能会检查代理设置并拒绝工作。
# > 2：仅代理接管
# > 3：VIF Takeover Only：最新版本的默认工作模式。
# > 4：代理接管 + VIF，但代理使用 VIF 地址而不是环回地址。
# > 5：代理接管+VIF，但VIF路由使用多个较小的路由进行接管，没有配置默认路由，可以用来绕过一些特殊问题。（例如，HomeKit 安防摄像头）
compatibility-mode = 1
# ================ 仅限 MacOS 的 Surge 参数 ================ #
# > 如果禁用，即使 Wi-Fi 不是主网络接口，SSID/BSSID 模式仍可匹配。
# use-default-policy-if-wifi-not-primary = false
# > 遵循 /etc/hosts 中的本地 DNS 映射项
# read-etc-hosts = true
# > Surge HTTP 代理服务的端口号
# http-listen = 0.0.0.0:6152
# > Surge SOCKS5 代理服务的端口号
# socks5-listen = 0.0.0.0:6153
# > 启用 CPU 调试模式。这可能会降低性能。
# debug-cpu-usage = false
# > 启用内存调试模式。这可能会降低性能。
# debug-memory-usage = false
# > vif模式
# > auto ：让Surge自动选择最合适的工作模式。
# > v1 ：传统模式，TCP协议栈完全由Surge管理。由于 Surge 运行在用户空间中，这意味着每个数据包都需要从内核空间传输到用户空间进行处理。
# > v2 ：在 5.0 版本中引入，它使用 macOS 中的数据包过滤器机制，利用 macOS 的 TCP 协议栈，从而避免了在内核空间和用户空间之间切换的开销，从而显着提高了性能。但是，由于它需要修改 pf 设置，因此它与虚拟机网络和网络共享功能不兼容。
# > v3 ：在 5.2 版中引入，它绕过了数据包过滤器，并采用另一种技术来使用 macOS 的 TCP 协议栈。性能略低于 v2，但避免了因调整 pf 设置而导致的兼容性问题。
# vif-mode = v3

[Replica]
hide-apple-request=1
hide-crashlytics-request=1
hide-udp=0
keyword-filter-type=(null)
keyword-filter=(null)

[Proxy]

[Proxy Group]

[Rule]

[URL Rewrite]
# Redirect Google Search Service
^https?://(www.)?g.cn https://www.google.com 302
^https?://(www.)?google.cn https://www.google.com 302

{% endif %}
