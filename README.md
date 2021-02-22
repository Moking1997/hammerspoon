> 本项目为[hammerspoon](https://github.com/Hammerspoon/hammerspoon)的配置扩展

## 安装配置与升级:

安装 hammerspoon

```
brew cask install hammerspoon
```

将配置文件克隆到本地根目录。

```
git clone https://github.com/Moking1997/hammerspoon ~/.hammerspoon
```

**重新加载配置文件即可生效**。

如果提示：`already exists and is not an empty directory`.
先删除目录

```
rm -rf ~/.hammerspoon
```

升级：

```
cd ~/.hammerspoon && git pull
```

## 自定义配置

拷贝私有配置文件

```
cp ~/.hammerspoon/config-example.lua ~/.hammerspoon/private/config.lua
```

按照注释编辑私有配置文件 `~/.hammerspoon/private/config.lua` 即可。

## 功能实现：

**注：所有模式按 `esc` 和 `q` 退出。**

## 使用方式:

> 以下快键键均可在`private/config.lua`下进行配置

| 功能                   | 描述                                         | 快键键/实例                           |
| ---------------------- | -------------------------------------------- | ------------------------------------- |
| **帮助面板**           | 显示帮助面板查看各个模式快捷键               | `shift` + `option` + `/`              |
| **快捷搜索**           | 是用`\`加关键字进行对应网站的快捷搜索        | 输入 `test\g` 将会用谷歌进行搜索 test |
| **快捷文字输入**       | 是用`\`加关键字进行快捷文字输入              | 输入 `\t1` 将自动输入`15057466****`   |
| **窗口管理**           | 进入窗口管理模式                             | `Option` + `R`                        |
| **显示时间**           | 显示当前时间日期                             | `Option` + `T`                        |
| **网站快速打开**       | 打开网站列表,选择后自动用默认浏览器打开      | `Option` + `O`                        |
| **应用快速切换**       | 显示窗口提示，按下对应应用显示的字母快速切换 | `Option` + `tab`                      |
| **历史剪切板**         | 历史剪切板，选择对应的输入到当前输入框       | `Option` + `C`                        |
| **实时网速**           | 顶部实时显示网速                             | 默认开启                              |
| **当前应用快键键显示** | 当前应用快键键显示                           | `Option` + `S`                        |

## 预览:

![帮助面板](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChatb5dcc0bba4541db83f1883dc51fede31.png)
![应用快速切换](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat96f6b01bd173aa358ce1a48cd7ebdd21.png)
![网站快捷打开](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat6762619376b18d30fa41f7673f90e6c5.png)
![历史剪切板](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat683794c434a018337a74f8b89f21893a.png)
![实时网速](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat109c5b4dc369f8ad703917ce899e684e.png)
![窗口管理](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat928b479fa2a746edfb0c92fe954ee96a.png)
![显示时间](https://imgs-1258913739.cos-website.ap-shanghai.myqcloud.com/2021/01/22/WeChat6f83d77d56d1f17822cb74ae1810a48f.png)

## 参考：

- [Hammerspoon Spoons](https://www.hammerspoon.org/Spoons/)
- [awesome-hammerspoon](https://github.com/ashfinal/awesome-hammerspoon)
- [hammerspoon_config](https://github.com/zuorn/hammerspoon_config)
