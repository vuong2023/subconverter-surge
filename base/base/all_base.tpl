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
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS Cài đặt hoặc thực hiện cài đặt tương ứng theo điều kiện mạng của riêng bạn
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/iQIYI-DailyBonus/iQIYI.js

{% endif %}
{% if request.target == "loon" %}

[General]
# IPV6 Bắt đầu hay không
ipv6 = false
# udp Loại dns Máy chủ, sử dụng, để tách nhiều máy chủ, system Hệ thống đại diện dns
dns-server = 119.29.29.29, 223.5.5.5
# DNS over HTTPS Máy chủ, sử dụng, để tách nhiều máy chủ
doh-server = https://223.5.5.5/resolve, https://sm2.doh.pub/dns-query
# Có bật quyền truy cập proxy mạng LAN hay không
allow-wifi-access = false
# Mở cổng proxy http sau khi truy cập mạng LAN
wifi-access-http-port = 7222
# Sau khi cho phép truy cập mạng LAN socks5 cổng giao thức
wifi-access-socks5-port = 7221
# Liên kết kiểm tra được sử dụng để kiểm tra tốc độ. Nếu nhóm chính sách không có liên kết kiểm tra tùy chỉnh thì liên kết được định cấu hình ở đây sẽ được sử dụng.
proxy-test-url = http://connectivitycheck.gstatic.com
# Hết thời gian chờ giây khi đo tốc độ nút
test-timeout = 2
# Chỉ định giao diện mạng nào sẽ sử dụng để chuyển tiếp lưu lượng
interface-mode = auto
sni-sniffing = true
# Tắt stun. Có nên tắt dữ liệu udp của giao thức stun hay không. Việc tắt nó có thể giải quyết hiệu quả tình trạng rò rỉ IP của webrtc.
disable-stun = true
# Ngắt kết nối khi chính sách thay đổi
disconnect-on-policy-change = true
# Sau khi kết nối nút không thành công vài lần, việc chuyển đổi nút sẽ được thực hiện, mặc định là 3 lần.
switch-node-after-failure-times = 3
# Đăng ký liên kết giải quyết tài nguyên
resource-parser = https://gitlab.com/lodepuly/vpn_tool/-/raw/main/Resource/Script/Sub-Store/sub-store-parser_for_loon.js
# Tùy chỉnh url của cơ sở dữ liệu Geoip
geoip-url = https://gitlab.com/Masaiki/GeoIP2-CN/-/raw/release/Country.mmdb
# Nếu tham số này được định cấu hình, các phân đoạn IP và tên miền được định cấu hình sẽ không được chuyển tiếp đến Loon mà sẽ được hệ thống xử lý.
skip-proxy = 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, localhost, *.local, captive.apple.com, e.crashlynatics.com
# Nếu tham số này được định cấu hình, các phân đoạn IP và tên miền được định cấu hình sẽ không được chuyển giao cho Loon để xử lý mà sẽ được hệ thống xử lý trực tiếp.
bypass-tun = 10.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 192.0.0.0/24, 192.0.2.0/24, 192.88.99.0/24, 192.168.0.0/16, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 239.255.255.250/32, 255.255.255.255/32
#Thay đổi chế độ lưu lượng của Loon khi chuyển sang một WiFi cụ thể, chẳng hạn như "loon-wifi5g":DIRECT, nghĩa là sử dụng chế độ kết nối trực tiếp trong mạng wifi loon-wifi5g, "mobile":PROXY, nghĩa là sử dụng mạng di động Sử dụng chế độ proxy, "mặc định":RULE, sử dụng chế độ giảm tải theo mặc định
ssid-trigger = "Ccccccc":DIRECT,"cellular":RULE,"default":RULE

[Proxy]

[Remote Proxy]

[Remote Filter]

[Proxy Group]
♻️ Tự động chọn=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
🔰 Lựa chọn nút=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
🌍 Truyền thông nước ngoài=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
🌏 Truyền thông trong nước=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
Ⓜ️ Microsoft=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
📲 Telegram=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
🍎 Apple=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
🎯 Kết nối trực tiếp toàn cầu=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
🛑 Chặn toàn cầu=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
🐟 Một con cá đã lọt lưới=select, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

[Rule]

[Remote Rule]

[Rewrite]

[Host]

[Script]
# Đọc thêm (By @chavyleung)
# Của tôi > Tác vụ đăng nhập Đợi cho đến khi lời nhắc lấy cookie thành công
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
ca-p12 = MIIKGQIBAzCCCeMGCSqGSIb3DQEHAaCCCdQEggnQMIIJzDCCBBcGCSqGSIb3DQEHBqCCBAgwggQEAgEAMIID/QYJKoZIhvcNAQcBMBwGCiqGSIb3DQEMAQYwDgQImj1O53xwYioCAggAgIID0HZE8LBl4XFV6NulqdzN58vwAkhwiiES++WDPqsE+NHCIa8VCBlfd6/MV21vO2zw8X90mSaO2/PEW7hyH6890zrF11J3rxDzkVtUnV7e8rq5vOdivjWl4s5Nx5zgyJ0AOHJU7Xe2f8OMb4VzsAqeqF/D6FwNGZBJhBn0nPCRFIIgEpOFUrcwvErPbySY6w8mmHm0DVbKvBFGqOth3fco6gIBpZBILgaQ8t9eLep3IiBFcyH1ezILwgOJ0G0qOJwRxOIXRYT3SaTD65rL90w2nW3xcD8jU5raF3PBDEpWf2+xis69nRU8QiWLjJEJkedE+GpZ/CEKR2BL02E9uB+IFF1/Y4bXk17Ty7D8D0WbIgKeLvRcKxFZoQEZfr/vEpdzedt704NBjDRPe3TPDApQgBtvXFvKZ9RB7uo17AJkLZbTGicFVP+a33+e0B1594zNy30eZ3zwwgpsdZ7S23JX/90FQwsTJWxpO4f9qaDqUHVcsSVlG21U4ujIPWkpIi51XE9gM+JmL6nWaU8cRY2CI0ETLnsSWIOJfQG4s6sy0P5liJfqVUtIpZqrSxdzmGlLe2HsOQYo+M6SVpwx8Liopqu5vrvZhuUlUAwmjDodianY57AObCYP5/fM/3yKeZW7v9JH0pQY9eQ5qT6+oWIWoxnERYbXqpEGUDWN6vUG/JkJ6paHIyJ07mCLs4hXXWCin3dAXzmwyMNyGPH3SH03EKK2o/aMWTQNSfSyzFSDS+xXrj3wAZLdzTlyLA4l0iZhzvWLcgfzqHaj922hFhuO3zxQr2cVQihMwXd0gCPsNA4b0Uqaor2GF3qHxctscIGyKafNpmsVM7pSvYmqi0lMijjVfYsx3zV4FgYfQBOQAEaD6VXIHHeg/JBDbfatoQOp6j+GW/Mz5djaeHarA6QdZVeKiGLkKOXT3JYLtxL8QUx2SINlLgWpR3XvMY7f8cIyPMsTrJdLix5wXVRtUVx2A83GyAOt3QxP/rtM+b+86YtAhBdSTRhJfuDL4sjW4//wtnU0B0CzpOlB1CXRprcnUSUeGyOD4eiOaBYnPpY5wUYyQ+eJYQvYdXWDiFx2sBSxyZMAiXMLtBxBoGoyirzFZKK3cw6DdjXrOGepcqFlesEzraz8yfXerOcPwgI4JD13oDKSiw3iUhjTnfrXpoAX+3rEhNfJeqFf7nooGd30z//v4u09KM3l2gEA9WJt60leoDkp3PjL8LPsgBjO5f+odey9O/YqHmxt3dpRD02HvL5VhnJG/kBeZpGd81yX0ceM8x5f2HKzMy38osE6Q/Ru+L0wggWtBgkqhkiG9w0BBwGgggWeBIIFmjCCBZYwggWSBgsqhkiG9w0BDAoBAqCCBO4wggTqMBwGCiqGSIb3DQEMAQMwDgQIJsPUIRvXx3ACAggABIIEyJxMbTjKmMs37xEKKy5d8HBJzPs30yLXeSbO0taa3o6XGEGt6rbBIF3MIGSKAOLuLOwhddVqkFxdUkYiAUTMptSrN8YyR9yhn06mkZPViPHrKNMXIKlAomg87rD54e8AnQPxKvOVPUYne7WBu4QWrUnbuBTOnoWLQAY6dRRE4EDAdQbMRx34sWpjVBvNrgO1h36T11wnCIGDC+FNchV/zs0Xfpt+JB2HGe1KXxH2lO9QKo0ONQlx/GtKBto1HRyN0pzEbdifUBqy1hgVjb5KnK7z3ah3lcZITYQqprn85Mrc8sMfDJRWZlXJM4t4Tz27XbHIlGxnvSmSHGFl74yKbIGCgz/mr9LCwQt8HAeG5QR4+KpImehYGEZeqysAh1ywPTmWnojmdHrrjuUowPZPdihzKgONsiDgCHTRYzmAlDcPGNlipjIOacSC/hgf6lIZL/QelH8eC3lefpAbyE1paruw2a39yLRX4rb4DWcWk0n3dsy23PElhLBTwGQQsaHTbz7EIabEOb8/tPsOM9P/LaHrD3A3nODPvmgMyAdGsXJ+sHPTjFXOGn2vuB5edJvVARZnQZIpPskcDvcL/Ho+SEITaSYREm2iNkRya0jTBoQ7mtrR+DmE7plvWdjcDceOafDTs81rtrsJ5zdcxOHOmw4QTUtOiebnulbu6kChC5pddgVY9ahTSjQsnxJ5xkAn2AJeS/2GdmIV0edXdK0ojHxYgLWfDjv6WNZ3mag9+ntZw+m7dIwqLTQHPC+Q+YWJMHU8l8Mfu4vSAfG0k15GMjy40Pavi+6UdadTgKajm3N8ieCTyDoSsdf8HGUZkCNB2nAU2UhTwrCB/2APoKy7Mwg+DHIb6G5o9OCeA9ZmSov2dDsWrxTD6rlkjveGGfhIqvlotcpqKBMf752pj/qtCMJq1+SqcIWZEW20jL7AF5ZkEBNcDWkAaBAl1rvTqH8d6vjYQtQm3v9RD3z0cF/xu+og84O3OrKXp8vb3uTn7lOX42RsObEWKW7rBfvkiseSZH8QMzPcmy1oBt6R0mZlmqD/gOGN0V/ipkEY1+YGFmIkgvECziZjHOIvdeTKG09duCsbmm9lHIFcnRSNjVJC/z+ITpjzhh1LNPiKRGSu+pzMkO+nv6mKSXZRrZBI1suhidVSeISK5OqbH+EGYe5nQbG+8LEnWNyKPsMTZlG3v3RRKIi1Qe0blmqqISzfID+KmHjK1/aJIZP7QKhlfyGDfqlbl/hT3Pbxl85AI1iU4DeMrTbKfZgAHNExukebLZbZjumZ1PRKGruc5gIGFF9pc0QBt1O1DSNBoWCNiqsZWm1MlJ1o6sDKRZArHU2dvonkOfkk6h4wfHV2Pn2hBZnIubYvuOZ1vCfM9ghPeVGzilxhh2arerkC9E60VUJx1iMpPTfjU1uw94gA30GSrx2dWRo6HcP3gW9s/va/2NxrsjswVO9qEmOLLZS9BF+e2PQecncoDUsbbunZ8+sdtm/OXQOazWGS5W/Pl315yzH0o0bYcolAUWDYt1hPCFvwOAfxWNZFoTFYEw4dJUAYMGvaRdg3ywQ/jK2k1MOMv+gbHc8p/jpbHNVQQtbBIuwAsvICQNX6PCSDbCMS/K/AiKivnffQ8kSDMFX9ijGBkDAjBgkqhkiG9w0BCRUxFgQUlgCJh1d8WORIThv+Ju2NkD9fS0gwaQYJKoZIhvcNAQkUMVweWgBRAHUAYQBuAHQAdQBtAHUAbAB0ACAAQwBlAHIAdABpAGYAaQBjAGEAdABlACAARgBBADEAQQA5ADgANAA5ACAAKAAxADEAIABPAGMAdAAgADIAMAAxADkAKTAtMCEwCQYFKw4DAhoFAAQU8gunnEf1jIaelyXFamHM4uv0avgECFTS7nopsZ+Z
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
network_check_url=http://223.6.6.6
server_check_url=http://1.0.0.1/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ Tự động, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 Lựa chọn nút, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 Truyền thông nước ngoài, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 Truyền thông trong nước, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ Microsoft, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 Telegram, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 Apple, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 Kết nối trực tiếp toàn cầu, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 Đánh chặn toàn cầu, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 Một con cá đã lọt lưới, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png

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

{% if request.target == "surge-macos" %}

[General]
# ================ iOS & MacOS chung Surge tham số ================ #
# > Mức đăng nhập verbose, info, notify, or warning Việc kích hoạt dài dòng không được khuyến khích sử dụng hàng ngày vì nó có thể làm giảm đáng kể hiệu suất.
loglevel = notify
# > Giao thức IPv6 Cho phép hỗ trợ IPv6 đầy đủ. Cụ thể, sau khi bật tùy chọn này, bản ghi AAAA của tên miền sẽ được truy vấn khi truy cập vào tên miền. Ngay cả khi tùy chọn này không được bật, các trang web IPv6 vẫn có thể được truy cập bằng cách truy cập trực tiếp vào địa chỉ IPv6.
ipv6 = false
# > Cho phép IPv6 thông qua Surge VIF. Hữu ích khi bạn muốn Surge xử lý các kết nối TCP thô tới địa chỉ IPv6.
# > off ：Không bao giờ sử dụng IPv6 để thiết lập Surge VIF
# > auto ：Chỉ thiết lập Surge VIF với IPv6 nếu mạng cục bộ có mạng IPv6 hợp lệ
# > always ：Luôn thiết lập Surge VIF với IPv6
ipv6-vif = false
# > địa chỉ IP máy chủ dns của máy chủ DNS ngược tuyến
# dns-server = system, 223.5.5.5, 119.29.29.29, 1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4, 9.9.9.9:995
# doh-server = https://223.5.5.5/dns-query, https://1.12.12.12/dns-query, https://8.8.8.8/dns-query, https://1.1.1.1/dns-query
# > Bỏ qua proxy Trong phiên bản iOS, tùy chọn này buộc các kết nối đến các miền/dải IP này phải được xử lý bởi Surge VIF thay vì proxy Surge. Trong các phiên bản macOS, khi bật Set as System Proxy, các cài đặt này sẽ được áp dụng cho hệ thống. Tùy chọn này được sử dụng để khắc phục sự cố tương thích với một số ứng dụng.
# > apple.com、*apple.com、192.168.2.* or 192.168.2.0/24
# > Lưu ý: Nếu bạn nhập địa chỉ IP hoặc dải địa chỉ, proxy sẽ chỉ bị bỏ qua khi kết nối với máy chủ đó bằng địa chỉ đó chứ không phải khi kết nối với máy chủ qua tên miền phân giải theo địa chỉ đó.
skip-proxy = localhost, *.local, 0.0.0.0/8, 10.0.0.0/8, 17.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 172.17.0.0/12, 172.18.0.0/12, 172.19.0.0/12, 172.20.0.0/24, 192.0.0.0/24, 192.0.2.0/24, 192.168.0.0/16, 192.88.99.0/24, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 240.0.0.0/4, 255.255.255.255/32, 117.71.53.199/32, 47.75.120.166/32,
# > Loại trừ các tên máy chủ đơn giản giống như tham số Skip-proxy. Tùy chọn này cho phép các yêu cầu sử dụng tên máy chủ đơn giản (không có dấu chấm) được xử lý bởi Surge VIF thay vì tác nhân Surge.
# > mysql01、redis01
exclude-simple-hostnames = true
# > Truy cập bộ điều khiển bên ngoài Tùy chọn này cho phép bộ điều khiển bên ngoài điều khiển Surge, chẳng hạn như Bảng điều khiển Surge (macOS) và Điều khiển từ xa Surge iOS (iOS). Ví dụ: key@0.0.0.0:6166
external-controller-access = mima1234@0.0.0.0:6166
# > Sử dụng giao thức HTTPS thay vì HTTP. Chứng chỉ MitM CA phải được định cấu hình trước tiên. Bạn cần cài đặt chứng chỉ theo cách thủ công trên thiết bị khách.
# http-api-tls =
# > Khi tính năng này được bật, bạn có thể điều khiển Surge thông qua trình duyệt web của mình.
http-api-web-dashboard = true
# > Hiển thị trang lỗi để từ chối hoặc trang lỗi của chính sách TỪ CHỐI nếu yêu cầu là yêu cầu HTTP thuần túy.
show-error-page-for-reject = true
# > Surge VIF chỉ có thể xử lý các giao thức TCP và UDP. Sử dụng tùy chọn này để bỏ qua các dải IP cụ thể để cho phép tất cả lưu lượng truy cập.
# > Lưu ý: Tùy chọn này chỉ khả dụng cho Surge VIF. Các yêu cầu do Surge Proxy Server xử lý sẽ không bị ảnh hưởng. Kết hợp proxy bỏ qua và đảm bảo lưu lượng truy cập HTTP cụ thể được loại trừ theo tuyến đường bỏ qua Surge.
# tun-excluded-routes =
# > Theo mặc định, giao diện Surge VIF tự khai báo là tuyến mặc định. Tuy nhiên, do giao diện Wi-Fi định tuyến nhỏ hơn nên một số lưu lượng truy cập có thể không đi qua giao diện VIF đột biến. Sử dụng tùy chọn này để thêm các tuyến đường nhỏ hơn.
# tun-included-routes =
# > Internet URL cho kiểm tra kết nối và URL kiểm tra cho chiến lược TRỰC TIẾP
internet-test-url = http://223.6.6.6
# > URL kiểm tra mặc định cho chính sách proxy
proxy-test-url = http://1.0.0.1/generate_204
# > Thời gian chờ kiểm tra kết nối (giây)
test-timeout = 5
# > Luôn IP thật Tùy chọn này yêu cầu Surge trả về địa chỉ IP thực thay vì địa chỉ IP giả khi Surge VIF xử lý các sự cố DNS. Các gói DNS sẽ được chuyển tiếp đến máy chủ DNS ngược dòng. Tham số này thuộc về loại danh sách máy chủ. Để biết các quy tắc chi tiết, nhìn thấy：https://manual.nssurge.com/others/host-list.html
# > Sử dụng tiền tố - loại trừ tên máy chủ
# > Hỗ trợ các ký tự đại diện * và ?
# > Sử dụng hậu tố:port để khớp với các cổng khác. Nếu không cung cấp số cổng, Surge sẽ tự động nối số cổng tiêu chuẩn vào tham số này, giống như tham số Force-http-engine-hosts. Nếu chỉ có tên máy chủ được định cấu hình thì chỉ có cổng 80 sẽ được sử dụng. Hiệu quả. Đối với chức năng MITM, nó chỉ hợp lệ với cổng 443.
# > Sử dụng hậu tố :0 để khớp với tất cả các cổng
# > Sử dụng <ip-address> để khớp trực tiếp tất cả tên máy chủ bằng địa chỉ IPv4/IPv6 (thay vì tên miền)
# > -*icloud*, -*.mzstatic.com, -*.facebook.com, -*.instagram.com, -*.twitter.com, -*dropbox*, -*apple*, -*.amazonaws.com, -<ip-address>, *
always-real-ip = *.test.com
# > Chiếm quyền điều khiển DNS. Theo mặc định, Surge chỉ trả về địa chỉ IP giả cho các truy vấn DNS được gửi đến địa chỉ DNS của Surge (198.18.0.2). Các truy vấn gửi đến DNS tiêu chuẩn sẽ được chuyển tiếp. Một số thiết bị hoặc phần mềm luôn sử dụng máy chủ DNS được mã hóa cứng. (Ví dụ: Google luôn sử dụng 8.8.8.8). Bạn có thể sử dụng tùy chọn này để chiếm đoạt các truy vấn nhằm lấy địa chỉ giả. Bạn có thể chiếm quyền điều khiển tất cả các truy vấn DNS bằng cách sử dụng hijack-dns = *:53
hijack-dns = *:53
# > Khiến Surge coi các kết nối TCP là yêu cầu HTTP. Công cụ Surge HTTP sẽ xử lý yêu cầu và tất cả các tính năng nâng cao sẽ có sẵn như thu thập, viết lại và viết tập lệnh. Tham số này thuộc loại danh sách máy chủ. Để biết quy tắc chi tiết, vui lòng xem:https://manual.nssurge.com/others/host-list.html
# force-http-engine-hosts =
# > DNS được mã hóa tuân theo chế độ gửi đi và theo mặc định, việc tra cứu DNS được mã hóa sử dụng gửi đi trực tiếp. Việc bật tùy chọn này sẽ khiến DOH tuân theo các quy tắc và cài đặt chế độ đi.
# encrypted-dns-follow-outbound-mode = true
# > Máy chủ DNS được mã hóa,URL của máy chủ DNS được mã hóa. Nếu DNS được mã hóa được định cấu hình, DNS truyền thống sẽ chỉ được sử dụng để kiểm tra kết nối và phân giải miền khỏi URL DNS được mã hóa.
encrypted-dns-server = https://223.5.5.5/dns-query, https://1.12.12.12/dns-query, https://8.8.8.8/dns-query, https://1.1.1.1/dns-query
# > Bỏ qua xác minh chứng chỉ máy chủ DNS được mã hóa, điều này không an toàn.
encrypted-dns-skip-cert-verification = false
# > Sử dụng proxy localhost, theo mặc định, việc tra cứu DNS luôn được thực hiện trên máy chủ từ xa nếu sử dụng chính sách proxy. Khi tùy chọn này được bật, Surge sử dụng địa chỉ IP thay vì tên miền để thiết lập kết nối proxy nếu tồn tại ánh xạ DNS cục bộ cho tên miền mục tiêu.
use-local-host-item-for-proxy = true
# > URL của cơ sở dữ liệu GeoIP cần cập nhật
geoip-maxmind-url = https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb
# > Tắt cập nhật tự động cơ sở dữ liệu GeoIP
disable-geoip-db-auto-update = false
# > Hệ thống iOS có thể thực hiện tra cứu DNS bản ghi SVCB thay vì tra cứu bản ghi A tiêu chuẩn. Điều này ngăn Surge trả lại địa chỉ IP ảo. Do đó, theo mặc định, tính năng tra cứu bản ghi SVCB bị tắt để buộc hệ thống thực hiện tra cứu bản ghi A.
allow-dns-svcb = false
# > Hành vi dự phòng khi lưu lượng UDP khớp với chính sách không hỗ trợ chuyển tiếp UDP, các giá trị có thể có: DIRECT 、 REJECT, Nếu không có máy chủ proxy nào hỗ trợ chuyển tiếp UDP, nó có thể được sửa đổi thành「 direct 」Hoặc nhận xét về điểm tiếp theo, nhưng vui lòng chú ý đến các rủi ro về quyền riêng tư và bảo mật do các địa chỉ nguồn khác nhau của yêu cầu TCP và yêu cầu UDP có cùng tên máy chủ đích gây ra.
udp-policy-not-supported-behaviour = REJECT
# > Các tham số kiểm tra UDP mặc định cho proxy, ví dụ: apple.com@8.8.8.8
# proxy-test-udp = apple.com@8.8.8.8
# > Bật sẽ ưu tiên các gói UDP khi tải hệ thống rất cao và quá trình xử lý gói bị trì hoãn. Còn được gọi là chế độ trò chơi
udp-priority = false
# > Surge sẽ tự động đánh hơi giao thức của các yêu cầu TCP được gửi tới cổng 80 và 443, kích hoạt các tính năng HTTP/HTTPS nâng cao đồng thời tối ưu hóa hiệu suất. Tuy nhiên, điều này có thể gây ra một số vấn đề tương thích. Nếu gặp sự cố, bạn có thể thêm tên máy chủ tại đây và Surge sẽ không đánh hơi giao thức cho những yêu cầu này. Tham số này thuộc loại danh sách máy chủ. Để biết quy tắc chi tiết, vui lòng xem:https://manual.nssurge.com/others/host-list.html
always-raw-tcp-hosts = *.baidu.com
# ================ Thông số Surge chỉ dành cho iOS ================ #
# > Cho phép truy cập wifi, cho phép truy cập dịch vụ proxy Surge từ các thiết bị khác trong mạng LAN.
# allow-wifi-access = false
# > Số cổng của dịch vụ proxy Surge HTTP
# wifi-access-http-port = 6152
# > Surge SOCKS5 Số cổng của dịch vụ proxy
# wifi-access-socks5-port = 6153
# > Yêu cầu xác thực với dịch vụ proxy Surge HTTP. Ví dụ: tên người dùng: mật khẩu
# wifi-access-http-auth = surge:mima1234
# > Bật Wi-Fi Assistant (cố gắng sử dụng mạng dữ liệu để thiết lập kết nối khi mạng Wi-Fi kém, vui lòng chỉ bật khi sử dụng dữ liệu không giới hạn)
# wifi-assist = false
# > Ẩn biểu tượng VPN trên thanh trạng thái
# hide-vpn-icon = false
# > Thay vì thiết lập kết nối với dữ liệu di động khi mạng Wi-Fi kém, hãy luôn thiết lập đồng thời kết nối với Wi-Fi và dữ liệu di động. Tùy chọn này có thể cải thiện đáng kể mạng khi Wi-Fi kém hoặc khi Wi-Fi chuyển đổi mạng. Trải nghiệm rằng tính năng này sẽ được áp dụng cho tất cả các kết nối TCP và tra cứu DNS. Chỉ kích hoạt nó nếu bạn có gói dữ liệu di động không giới hạn
# all-hybrid = false
# > Cho phép truy cập vào dịch vụ proxy Surge từ các thiết bị khác khi Điểm truy cập cá nhân đang bật
# allow-hotspot-access = ture
# > Tất cả các mạng đều được bao gồm và một số yêu cầu có thể không được Surge tiếp quản theo mặc định. Ví dụ: các ứng dụng có thể liên kết với các giao diện mạng vật lý để vượt qua các VIF đột biến. Bật tùy chọn "Bao gồm tất cả các mạng" để đảm bảo tất cả các yêu cầu được Surge xử lý mà không bị rò rỉ. Tùy chọn này hữu ích khi bạn sử dụng Surge làm tường lửa. (Yêu cầu iOS 14.0 trở lên), Việc bật tùy chọn này có thể gây ra sự cố gỡ lỗi AirDrop và Xcode, Bảng điều khiển tăng tốc qua USB không hoạt động bình thường và các tác dụng phụ không mong muốn khác. Vui lòng sử dụng một cách thận trọng.
# include-all-networks = false
# > Bao gồm mạng cục bộ, việc bật tùy chọn này sẽ khiến Surge VIF xử lý các yêu cầu được gửi tới mạng LAN. (Yêu cầu iOS 14.2 trở lên) Việc bật tùy chọn này có thể gây ra sự cố gỡ lỗi AirDrop và Xcode, Bảng điều khiển tăng tốc qua USB không hoạt động bình thường và các tác dụng phụ không mong muốn khác. Vui lòng sử dụng một cách thận trọng. Phải được sử dụng cùng với include-all-networks=true.
# include-local-networks = false
# > Việc bật tùy chọn này cho phép Surge VIF xử lý lưu lượng truy cập mạng cho Dịch vụ thông báo đẩy của Apple (APN). Phải được sử dụng cùng với include-all-networks=true.
# include-apns = false
# > Việc bật tùy chọn này cho phép Surge VIF xử lý lưu lượng truy cập mạng có thể định tuyến trên Internet cho các dịch vụ di động. (VoLTE, Gọi qua Wi-Fi, IMS, MMS, Thư thoại kèm theo hình ảnh, v.v.). Xin lưu ý rằng một số nhà cung cấp dịch vụ di động bỏ qua Internet và định tuyến lưu lượng dịch vụ di động trực tiếp đến mạng của nhà cung cấp dịch vụ di động. Lưu lượng dịch vụ di động như vậy luôn bị loại trừ khỏi đường hầm. Phải được sử dụng cùng với include-all-networks=true.
# include-cellular-services = false
# > Chế độ tương thích, tùy chọn này được sử dụng để kiểm soát chế độ làm việc của Surge iOS.
# > 0：Tự động, trong các phiên bản Surge iOS trước 5.8.0, giá trị này tương đương với 1, bắt đầu từ 5.8.0, nó tương đương với 3
# > 1：Tiếp quản proxy + VIF, ở chế độ này, tiếp quản proxy được ưu tiên hơn tiếp quản VIF, mang lại hiệu suất tốt nhất nhưng một số ứng dụng có thể kiểm tra cài đặt proxy và từ chối hoạt động.
# > 2：Chỉ tiếp quản đại lý
# > 3：VIF Takeover Only：Chế độ làm việc mặc định của phiên bản mới nhất.
# > 4：Proxy tiếp quản + VIF, nhưng proxy sử dụng địa chỉ VIF thay vì địa chỉ loopback.
# > 5：Proxy tiếp quản + VIF, nhưng định tuyến VIF sử dụng nhiều tuyến nhỏ hơn để tiếp quản. Không có tuyến mặc định nào được định cấu hình, có thể được sử dụng để vượt qua một số vấn đề đặc biệt. (ví dụ: camera an ninh HomeKit)
# compatibility-mode = 0
# ================ Tăng thông số chỉ dành cho MacOS ================ #
# > Nếu bị tắt, các mẫu SSID/BSSID sẽ vẫn khớp ngay cả khi Wi-Fi không phải là giao diện mạng chính.
use-default-policy-if-wifi-not-primary = false
# > Theo dõi các mục ánh xạ DNS cục bộ trong /etc/hosts
read-etc-hosts = true
# > Số cổng của dịch vụ proxy Surge HTTP
http-listen = 0.0.0.0
# > Surge SOCKS5 Số cổng của dịch vụ proxy
socks5-listen = 0.0.0.0
# > Kích hoạt chế độ gỡ lỗi CPU. Điều này có thể làm giảm hiệu suất.
debug-cpu-usage = false
# > Bật chế độ gỡ lỗi bộ nhớ. Điều này có thể làm giảm hiệu suất.
debug-memory-usage = false
# > vif người mẫu
# > auto ：Để Surge tự động lựa chọn chế độ làm việc phù hợp nhất.
# > v1 ：Ở chế độ truyền thống, ngăn xếp giao thức TCP được quản lý hoàn toàn bởi Surge. Vì Surge chạy trong không gian người dùng, điều này có nghĩa là mọi gói cần được chuyển từ không gian kernel sang không gian người dùng để xử lý.
# > v2 ：Được giới thiệu trong phiên bản 5.0, nó sử dụng cơ chế lọc gói trong macOS để tận dụng ngăn xếp giao thức TCP của macOS, nhờ đó tránh được chi phí chuyển đổi giữa không gian kernel và không gian người dùng, từ đó cải thiện đáng kể hiệu suất. Tuy nhiên, vì nó yêu cầu sửa đổi cài đặt pf nên nó không tương thích với các tính năng chia sẻ mạng và mạng máy ảo.
# > v3 ：Được giới thiệu trong phiên bản 5.2, nó bỏ qua các bộ lọc gói và sử dụng một kỹ thuật khác để sử dụng ngăn xếp TCP của macOS. Hiệu suất thấp hơn một chút so với v2, nhưng tránh được các vấn đề tương thích do điều chỉnh cài đặt pf.
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

{% if request.target == "surge-ios" %}

[General]
# ================ Thông số xung phổ biến cho iOS và MacOS ================ #
# > Mức đăng nhập verbose, info, notify, or warning Việc kích hoạt dài dòng không được khuyến khích sử dụng hàng ngày vì nó có thể làm giảm đáng kể hiệu suất.
loglevel = notify
# > Giao thức IPv6 Cho phép hỗ trợ IPv6 đầy đủ. Cụ thể, sau khi bật tùy chọn này, bản ghi AAAA của tên miền sẽ được truy vấn khi truy cập vào tên miền. Ngay cả khi tùy chọn này không được bật, các trang web IPv6 vẫn có thể được truy cập bằng cách truy cập trực tiếp vào địa chỉ IPv6.
ipv6 = false
# > Cho phép IPv6 thông qua Surge VIF. Hữu ích khi bạn muốn Surge xử lý các kết nối TCP thô tới địa chỉ IPv6.
# > off ：Không bao giờ sử dụng IPv6 để thiết lập Surge VIF
# > auto ：Chỉ thiết lập Surge VIF với IPv6 nếu mạng cục bộ có mạng IPv6 hợp lệ
# > always ：Luôn thiết lập Surge VIF với IPv6
ipv6-vif = false
# > địa chỉ IP máy chủ dns của máy chủ DNS ngược tuyến
# dns-server = system, 223.5.5.5, 119.29.29.29, 1.1.1.1, 1.0.0.1, 8.8.8.8, 8.8.4.4, 9.9.9.9:995
# doh-server = https://223.5.5.5/dns-query, https://1.12.12.12/dns-query, https://8.8.8.8/dns-query, https://1.1.1.1/dns-query
# > Bỏ qua proxy Trong phiên bản iOS, tùy chọn này buộc các kết nối đến các miền/dải IP này phải được xử lý bởi Surge VIF thay vì proxy Surge. Trong các phiên bản macOS, khi bật Set as System Proxy, các cài đặt này sẽ được áp dụng cho hệ thống. Tùy chọn này được sử dụng để khắc phục sự cố tương thích với một số ứng dụng.
# > apple.com、*apple.com、192.168.2.* or 192.168.2.0/24
# > Lưu ý: Nếu bạn nhập địa chỉ IP hoặc dải địa chỉ, proxy sẽ chỉ bị bỏ qua khi kết nối với máy chủ đó bằng địa chỉ đó chứ không phải khi kết nối với máy chủ qua tên miền phân giải theo địa chỉ đó.
skip-proxy = localhost, *.local, 0.0.0.0/8, 10.0.0.0/8, 17.0.0.0/8, 100.64.0.0/10, 127.0.0.0/8, 169.254.0.0/16, 172.16.0.0/12, 172.17.0.0/12, 172.18.0.0/12, 172.19.0.0/12, 172.20.0.0/24, 192.0.0.0/24, 192.0.2.0/24, 192.168.0.0/16, 192.88.99.0/24, 198.18.0.0/15, 198.51.100.0/24, 203.0.113.0/24, 224.0.0.0/4, 240.0.0.0/4, 255.255.255.255/32, 117.71.53.199/32, 47.75.120.166/32
# > Loại trừ các tên máy chủ đơn giản giống như tham số Skip-proxy. Tùy chọn này cho phép các yêu cầu sử dụng tên máy chủ đơn giản (không có dấu chấm) được xử lý bởi Surge VIF thay vì tác nhân Surge.
# > mysql01、redis01
exclude-simple-hostnames = true
# > Truy cập bộ điều khiển bên ngoài Tùy chọn này cho phép bộ điều khiển bên ngoài điều khiển Surge, chẳng hạn như Bảng điều khiển Surge (macOS) và Điều khiển từ xa Surge iOS (iOS). Ví dụ: key@0.0.0.0:6166
external-controller-access = mima1234@0.0.0.0:6166
# > Sử dụng giao thức HTTPS thay vì HTTP. Chứng chỉ MitM CA phải được định cấu hình trước tiên. Bạn cần cài đặt chứng chỉ theo cách thủ công trên thiết bị khách.
# http-api-tls =
# > Khi tính năng này được bật, bạn có thể điều khiển Surge thông qua trình duyệt web của mình.
http-api-web-dashboard = false
# > Hiển thị trang lỗi bị từ chối nếu yêu cầu thuần túy HTTP yêu cầu, nó sẽ được hiển thị REJECT Trang lỗi chính sách.
show-error-page-for-reject = true
# > Surge VIF chỉ có thể xử lý các giao thức TCP và UDP. Sử dụng tùy chọn này để bỏ qua các dải IP cụ thể để cho phép tất cả lưu lượng truy cập.
# > Lưu ý: Tùy chọn này chỉ khả dụng cho Surge VIF. Các yêu cầu do Surge Proxy Server xử lý sẽ không bị ảnh hưởng. Kết hợp proxy bỏ qua và đảm bảo lưu lượng truy cập HTTP cụ thể được loại trừ theo tuyến đường bỏ qua Surge.
# tun-excluded-routes =
# > Theo mặc định, giao diện Surge VIF tự khai báo là tuyến mặc định. Tuy nhiên, do giao diện Wi-Fi định tuyến nhỏ hơn nên một số lưu lượng truy cập có thể không đi qua giao diện VIF đột biến. Sử dụng tùy chọn này để thêm các tuyến đường nhỏ hơn.
# tun-included-routes =
# > Internet URL cho kiểm tra kết nối và URL kiểm tra cho chiến lược TRỰC TIẾP
internet-test-url = http://223.6.6.6
# > 代理策略的默认测试 URL
proxy-test-url = http://1.0.0.1/generate_204
# > Thời gian chờ kiểm tra kết nối (giây)
test-timeout = 5
# >Luôn IP thật Tùy chọn này yêu cầu Surge trả về địa chỉ IP thực thay vì địa chỉ IP giả khi Surge VIF xử lý các sự cố DNS. Các gói DNS sẽ được chuyển tiếp đến máy chủ DNS ngược dòng. Tham số này thuộc về loại danh sách máy chủ. Để biết các quy tắc chi tiết, nhìn thấy:https://manual.nssurge.com/others/host-list.html
# > Sử dụng tiền tố - loại trừ tên máy chủ
# > Hỗ trợ các ký tự đại diện * và ?
# > Sử dụng hậu tố:port để khớp với các cổng khác. Nếu không cung cấp số cổng, Surge sẽ tự động nối số cổng tiêu chuẩn vào tham số này, giống như tham số Force-http-engine-hosts. Nếu chỉ có tên máy chủ được định cấu hình thì chỉ có cổng 80 sẽ được sử dụng. Hiệu quả. Đối với chức năng MITM, nó chỉ hợp lệ với cổng 443.
# > Sử dụng hậu tố :0 để khớp với tất cả các cổng
# > Sử dụng <ip-address> để khớp trực tiếp tất cả tên máy chủ bằng địa chỉ IPv4/IPv6 (thay vì tên miền)
# > -*icloud*, -*.mzstatic.com, -*.facebook.com, -*.instagram.com, -*.twitter.com, -*dropbox*, -*apple*, -*.amazonaws.com, -<ip-address>, *
always-real-ip = *.test.com
# > Chiếm quyền điều khiển DNS. Theo mặc định, Surge chỉ trả về địa chỉ IP giả cho các truy vấn DNS được gửi đến địa chỉ DNS của Surge (198.18.0.2). Các truy vấn gửi đến DNS tiêu chuẩn sẽ được chuyển tiếp. Một số thiết bị hoặc phần mềm luôn sử dụng máy chủ DNS được mã hóa cứng. (Ví dụ: Google luôn sử dụng 8.8.8.8). Bạn có thể sử dụng tùy chọn này để chiếm đoạt các truy vấn nhằm lấy địa chỉ giả. Bạn có thể chiếm quyền điều khiển tất cả các truy vấn DNS bằng cách sử dụng hijack-dns = *:53
hijack-dns = *:53
# > Khiến Surge coi các kết nối TCP là yêu cầu HTTP. Công cụ Surge HTTP sẽ xử lý yêu cầu và tất cả các tính năng nâng cao sẽ có sẵn như thu thập, viết lại và viết tập lệnh. Tham số này thuộc loại danh sách máy chủ. Để biết quy tắc chi tiết, vui lòng xem:https://manual.nssurge.com/others/host-list.html
# force-http-engine-hosts =
# > DNS được mã hóa tuân theo chế độ gửi đi và theo mặc định, việc tra cứu DNS được mã hóa sử dụng gửi đi trực tiếp. Việc bật tùy chọn này sẽ khiến DOH tuân theo các quy tắc và cài đặt chế độ đi.
# encrypted-dns-follow-outbound-mode = true
# > Máy chủ DNS được mã hóa,URL của máy chủ DNS được mã hóa. Nếu DNS được mã hóa được định cấu hình, DNS truyền thống sẽ chỉ được sử dụng để kiểm tra kết nối và phân giải miền khỏi URL DNS được mã hóa.
encrypted-dns-server = https://223.5.5.5/dns-query, https://1.12.12.12/dns-query, https://8.8.8.8/dns-query, https://1.1.1.1/dns-query
# > Bỏ qua xác minh chứng chỉ máy chủ DNS được mã hóa, điều này không an toàn.
encrypted-dns-skip-cert-verification = false
# > Sử dụng proxy localhost, theo mặc định, việc tra cứu DNS luôn được thực hiện trên máy chủ từ xa nếu sử dụng chính sách proxy. Khi tùy chọn này được bật, Surge sử dụng địa chỉ IP thay vì tên miền để thiết lập kết nối proxy nếu tồn tại ánh xạ DNS cục bộ cho tên miền mục tiêu.
use-local-host-item-for-proxy = true
# > URL của cơ sở dữ liệu GeoIP cần cập nhật
geoip-maxmind-url = https://github.com/Hackl0us/GeoIP2-CN/raw/release/Country.mmdb
# > Tắt cập nhật tự động cơ sở dữ liệu GeoIP
disable-geoip-db-auto-update = false
# > Hệ thống iOS có thể thực hiện tra cứu DNS bản ghi SVCB thay vì tra cứu bản ghi A tiêu chuẩn. Điều này ngăn Surge trả lại địa chỉ IP ảo. Do đó, theo mặc định, tính năng tra cứu bản ghi SVCB bị tắt để buộc hệ thống thực hiện tra cứu bản ghi A.
allow-dns-svcb = false
# > Hành vi dự phòng khi lưu lượng UDP khớp với chính sách không hỗ trợ chuyển tiếp UDP, các giá trị có thể có: DIRECT 、 REJECT, Nếu không có máy chủ proxy nào hỗ trợ chuyển tiếp UDP, nó có thể được sửa đổi thành「 direct 」Hoặc nhận xét về điểm tiếp theo, nhưng vui lòng chú ý đến các rủi ro về quyền riêng tư và bảo mật do các địa chỉ nguồn khác nhau của yêu cầu TCP và yêu cầu UDP có cùng tên máy chủ đích gây ra.
udp-policy-not-supported-behaviour = REJECT
# > Các tham số kiểm tra UDP mặc định cho proxy, ví dụ: apple.com@8.8.8.8
# proxy-test-udp = apple.com@8.8.8.8
# > Bật sẽ ưu tiên các gói UDP khi tải hệ thống rất cao và quá trình xử lý gói bị trì hoãn. Còn được gọi là chế độ trò chơi
udp-priority = false
# > Surge sẽ tự động đánh hơi giao thức của các yêu cầu TCP được gửi tới cổng 80 và 443, kích hoạt các tính năng HTTP/HTTPS nâng cao đồng thời tối ưu hóa hiệu suất. Tuy nhiên, điều này có thể gây ra một số vấn đề tương thích. Nếu gặp sự cố, bạn có thể thêm tên máy chủ tại đây và Surge sẽ không đánh hơi giao thức cho những yêu cầu này. Tham số này thuộc loại danh sách máy chủ. Để biết quy tắc chi tiết, vui lòng xem:https://manual.nssurge.com/others/host-list.html
always-raw-tcp-hosts = *.baidu.com
# ================ Thông số Surge chỉ dành cho iOS ================ #
# > Cho phép truy cập wifi, cho phép truy cập dịch vụ proxy Surge từ các thiết bị khác trong mạng LAN.
allow-wifi-access = false
# > Surge HTTP Số cổng của dịch vụ proxy
wifi-access-http-port = 6152
# > Surge SOCKS5 Số cổng của dịch vụ proxy
wifi-access-socks5-port = 6153
# > Yêu cầu xác thực với dịch vụ proxy Surge HTTP. Ví dụ: tên người dùng: mật khẩu
wifi-access-http-auth = surge:mima1234
# > Bật Wi-Fi Assistant (cố gắng sử dụng mạng dữ liệu để thiết lập kết nối khi mạng Wi-Fi kém, vui lòng chỉ bật khi sử dụng dữ liệu không giới hạn)
wifi-assist = false
# > Ẩn biểu tượng VPN trên thanh trạng thái
hide-vpn-icon = false
# > Thay vì thiết lập kết nối với dữ liệu di động khi mạng Wi-Fi kém, hãy luôn thiết lập đồng thời kết nối với Wi-Fi và dữ liệu di động. Tùy chọn này có thể cải thiện đáng kể mạng khi Wi-Fi kém hoặc khi Wi-Fi chuyển đổi mạng. Trải nghiệm rằng tính năng này sẽ được áp dụng cho tất cả các kết nối TCP và tra cứu DNS. Chỉ kích hoạt nó nếu bạn có gói dữ liệu di động không giới hạn
all-hybrid = false
# > Cho phép truy cập vào dịch vụ proxy Surge từ các thiết bị khác khi Điểm truy cập cá nhân đang bật
allow-hotspot-access = ture
# > Tất cả các mạng đều được bao gồm và một số yêu cầu có thể không được Surge tiếp quản theo mặc định. Ví dụ: các ứng dụng có thể liên kết với các giao diện mạng vật lý để vượt qua các VIF đột biến. Bật tùy chọn "Bao gồm tất cả các mạng" để đảm bảo tất cả các yêu cầu được Surge xử lý mà không bị rò rỉ. Tùy chọn này hữu ích khi bạn sử dụng Surge làm tường lửa. (Yêu cầu iOS 14.0 trở lên), Việc bật tùy chọn này có thể gây ra sự cố gỡ lỗi AirDrop và Xcode, Bảng điều khiểTất cả các mạng đều được bao gồm và một số yêu cầu có thể không được Surge tiếp quản theo mặc định. Ví dụ: các ứng dụng có thể liên kết với các giao diện mạng vật lý để vượt qua các VIF đột biến. Bật tùy chọn "Bao gồm tất cả các mạng" để đảm bảo tất cả các yêu cầu được Surge xử lý mà không bị rò rỉ. Tùy chọn này hữu ích khi bạn sử dụng Surge làm tường lửa. (Yêu cầu iOS 14.0 trở lên), Việc bật tùy chọn này có thể gây ra sự cố gỡ lỗi AirDrop và Xcode, Bảng điều khiển tăng tốc qua USB không hoạt động bình thường và các tác dụng phụ không mong muốn khác. Vui lòng sử dụng một cách thận trọng.n tăng tốc qua USB không hoạt động bình thường và các tác dụng phụ không mong muốn khác. Vui lòng sử dụng một cách thận trọng.
include-all-networks = false
# > Bao gồm mạng cục bộ, việc bật tùy chọn này sẽ khiến Surge VIF xử lý các yêu cầu được gửi tới mạng LAN. (Yêu cầu iOS 14.2 trở lên) Việc bật tùy chọn này có thể gây ra sự cố gỡ lỗi AirDrop và Xcode, Bảng điều khiển tăng tốc qua USB không hoạt động bình thường và các tác dụng phụ không mong muốn khác. Vui lòng sử dụng một cách thận trọng. Phải được sử dụng cùng với include-all-networks=true.
include-local-networks = false
# > Việc bật tùy chọn này cho phép Surge VIF xử lý lưu lượng truy cập mạng cho Dịch vụ thông báo đẩy của Apple (APN). Phải được sử dụng cùng với include-all-networks=true.
include-apns = false
# > Việc bật tùy chọn này cho phép Surge VIF xử lý lưu lượng truy cập mạng có thể định tuyến trên Internet cho các dịch vụ di động. (VoLTE, Gọi qua Wi-Fi, IMS, MMS, Thư thoại kèm theo hình ảnh, v.v.). Xin lưu ý rằng một số nhà cung cấp dịch vụ di động bỏ qua Internet và định tuyến lưu lượng dịch vụ di động trực tiếp đến mạng của nhà cung cấp dịch vụ di động. Lưu lượng dịch vụ di động như vậy luôn bị loại trừ khỏi đường hầm. Phải được sử dụng cùng với include-all-networks=true.
include-cellular-services = false
# > Chế độ tương thích, tùy chọn này được sử dụng để kiểm soát chế độ làm việc của Surge iOS.
# > 0：Tự động, trong các phiên bản Surge iOS trước 5.8.0, giá trị này tương đương với 1, bắt đầu từ 5.8.0, nó tương đương với 3
# > 1：Tiếp quản proxy + VIF, ở chế độ này, tiếp quản proxy được ưu tiên hơn tiếp quản VIF, mang lại hiệu suất tốt nhất nhưng một số ứng dụng có thể kiểm tra cài đặt proxy và từ chối hoạt động.
# > 2：Chỉ tiếp quản đại lý
# > 3：VIF Takeover Only：Chế độ làm việc mặc định của phiên bản mới nhất.
# > 4：Proxy tiếp quản + VIF, nhưng proxy sử dụng địa chỉ VIF thay vì địa chỉ loopback.
# > 5：Proxy tiếp quản + VIF, nhưng định tuyến VIF sử dụng nhiều tuyến nhỏ hơn để tiếp quản. Không có tuyến mặc định nào được định cấu hình, có thể được sử dụng để vượt qua một số vấn đề đặc biệt. (ví dụ: camera an ninh HomeKit)
compatibility-mode = 5
# ================ Tăng thông số chỉ dành cho MacOS ================ #
# > Nếu bị tắt, các mẫu SSID/BSSID sẽ vẫn khớp ngay cả khi Wi-Fi không phải là giao diện mạng chính.
# use-default-policy-if-wifi-not-primary = false
# > Theo dõi các mục ánh xạ DNS cục bộ trong /etc/hosts
# read-etc-hosts = true
# > Surge HTTP Số cổng của dịch vụ proxy
# http-listen = 0.0.0.0:6152
# > Surge SOCKS5 Số cổng của dịch vụ proxy
# socks5-listen = 0.0.0.0:6153
# > Kích hoạt chế độ gỡ lỗi CPU. Điều này có thể làm giảm hiệu suất.
# debug-cpu-usage = false
# > Bật chế độ gỡ lỗi bộ nhớ. Điều này có thể làm giảm hiệu suất.
# debug-memory-usage = false
# > chế độ vif
# > auto ：Để Surge tự động lựa chọn chế độ làm việc phù hợp nhất.
# > vif người mẫu
# > auto ：Để Surge tự động lựa chọn chế độ làm việc phù hợp nhất.
# > v1 ：Ở chế độ truyền thống, ngăn xếp giao thức TCP được quản lý hoàn toàn bởi Surge. Vì Surge chạy trong không gian người dùng, điều này có nghĩa là mọi gói cần được chuyển từ không gian kernel sang không gian người dùng để xử lý.
# > v2 ：Được giới thiệu trong phiên bản 5.0, nó sử dụng cơ chế lọc gói trong macOS để tận dụng ngăn xếp giao thức TCP của macOS, nhờ đó tránh được chi phí chuyển đổi giữa không gian kernel và không gian người dùng, từ đó cải thiện đáng kể hiệu suất. Tuy nhiên, vì nó yêu cầu sửa đổi cài đặt pf nên nó không tương thích với các tính năng chia sẻ mạng và mạng máy ảo.
# > v3 ：Được giới thiệu trong phiên bản 5.2, nó bỏ qua các bộ lọc gói và sử dụng một kỹ thuật khác để sử dụng ngăn xếp TCP của macOS. Hiệu suất thấp hơn một chút so với v2, nhưng tránh được các vấn đề tương thích do điều chỉnh cài đặt pf.
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
