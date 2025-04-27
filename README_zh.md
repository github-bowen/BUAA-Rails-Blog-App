# BUAA-Rails-Blog-App

[English Version](./README.md)

这是一个基于 Ruby on Rails 框架开发的旅游博客分享 Web 应用，同时也是北京航空航天大学 Ruby 语言程序设计课程的大作业项目。

## 环境要求

### 系统要求

- 操作系统：Windows 10 或 Ubuntu 20.04

### 软件版本

- Ruby: 3.1.2
- Rails: 7.0.4
- sqlite3: 1.4
- yarn: 1.22.19
- nodejs: 16.17.1

> 更多依赖请参考项目中的 `Gemfile` 文件。

## 安装与配置

1. 克隆项目代码：

```shell
git clone https://github.com/github-bowen/BUAA-Rails-Blog-App.git
cd BUAA-Rails-Blog-App
```

2. 安装项目依赖：

```shell
bundle install
```

3. 配置数据库：

```shell
rails db:migrate
```

4. (可选) 初始化种子数据：

```shell
rails db:init_data
```

5. 构建前端资源：

```shell
yarn install  # 如遇到问题可尝试：yarn install --ignore-engines
yarn build:css
```

> 注意：以上初始化步骤只需执行一次。

## 运行项目

启动开发服务器：

```shell
rails s
```

在浏览器中访问 [http://localhost:3000](http://localhost:3000) 即可体验应用。

## 项目说明

### 注册与登录

首页展示如下：

![1](./img/1.png)

点击右上角的注册按钮创建新账号：

![1](./img/2.png)

注册成功后会自动登录，并跳转回刚刚访问的页面：

![1](./img/3.png)

### 博客浏览与演示

点击任意博客即可查看详情页面：

![1](./img/4.png)

![1](./img/5.png)

![1](./img/6.png)

发表评论后如下所示：

![1](./img/7.png)

评论支持删除操作。

### 修改个人资料

![1](./img/8.png)

### 用户权限管理

> 由于酒店、酒店房间、航空公司、航线等数据的创建需要管理员权限，这里提供了一个权限管理页面，方便测试。

![1](./img/9.png)

可将普通用户修改为管理员：

![1](./img/10.png)

### 查看已注册用户（管理员）

![1](./img/11.png)

管理员可删除其他用户账号。

### 管理酒店房间、酒店、航空公司、航线（管理员）

管理以上四个数据模型。其中：

- 创建酒店房间类型时需要先选择所属酒店；
- 创建航空路线时需要先选择所属航空公司；
- 即：酒店与房间类型为一对多关系；航空公司与航空路线为一对多关系。

![1](./img/12.png)

![1](./img/13.png)

以上为酒店房间管理页面，其他页面类似。

### 旅游路线管理

添加旅游路线：

![1](./img/14.png)

![1](./img/15.png)

创建成功后可查看详情：

![1](./img/16.png)

旅游路线与酒店、航空路线均为一对多关系。

### 博客操作

新建博客：

![1](./img/17.png)

创建成功页面：

![1](./img/18.png)

![1](./img/19.png)

删除博客：

![1](./img/20.png)

## 问题排查（Windows 平台特定问题）

### 问题：`uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger`

如果在 Windows 上运行 Rails 命令时遇到以下错误：

```shell
C:/Ruby31-x64/lib/ruby/gems/3.1.0/gems/activesupport-7.0.8.7/lib/active_support/logger_thread_safe_level.rb:12:in `<module:LoggerThreadSafeLevel>': uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger (NameError)
```

#### 解决方案

1. **手动加载 `Logger`**
   打开 `config/boot.rb` 文件，在顶部添加以下代码：

   ```ruby
   require 'logger'
   ```

2. **暂时禁用 `bootsnap`**
   在同一文件中，注释掉以下代码：

   ```ruby
   # require 'bootsnap/setup'
   ```

3. **清理缓存**
   手动删除 `tmp/cache/bootsnap` 文件夹，确保没有旧的缓存文件干扰。

4. **重新安装依赖**
   运行以下命令重新安装依赖：

   ```shell
   bundle install --force
   ```

5. **重启 Rails 服务器**
   重启 Rails 服务器：

   ```shell
   rails s
   ```
