
# http-guard

==========

>> http-guard 主要用户防御CC 类型攻击  
主要方式
在 config 配置文件中可以看到具体使用方法

prevent cc attack

设置说明：
在 nginx http {}  中添加如下内容，请根据具体的路径更改相关路径

## HttpGuard

```yml
lua_package_path "/data/www/waf/?.lua";  ## 填写具体下载地址加载lua
lua_shared_dict guard_dict 100m;
lua_shared_dict dict_white 100m;
lua_shared_dict dict_challenge 50m;
lua_shared_dict dict_captcha 70m;
init_by_lua_file "/data/www/waf/init.lua"; ## waf 地址
access_by_lua_file "/data/www/waf/runtime.lua"; ## waf 地址
lua_max_running_timers 1;
```

## 查看HttpGuard 黑/白名单列表

>在 server { } 块中添加以下内容, 重启Nginx, 通过 http://[server_name]/hglist   可查看 HttpGuard 黑/白名单列表

```yml
location /hglist {
  default_type 'text/html';
  content_by_lua_file /data/www/waf/hgListPage.lua;
  #allow x.x.x.x;  ## 只允许指定的IP访问
  #deny all;
}
```
