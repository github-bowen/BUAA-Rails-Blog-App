# BUAA-Rails-Blog-App

该项目是使用 Ruby On Rails 框架搭建的一个关于旅游博客分享的 Web 应用。同时，这也是北航 Ruby 语言程序设计的大作业。

## 环境要求

- 操作系统：Windows 10 或 Ubuntu 20.04
- Ruby 版本：3.1.2
- Rails 版本：7.0.4
- sqlite3 版本：1.4
- yarn 版本：1.22.19
- nodejs 版本：16.17.1
- 更多具体依赖详见 `Gemfile`

## 开始使用

- 从 GitHub 上克隆该仓库代码：

  ```shell
  git clone https://github.com/NormalLLer/BUAA-Rails-Blog-App.git
  cd ./BUAA-Rails-Blog-App
  ```

- 在项目根目录执行：

  ```ruby
  bundle install
  ```

- 构建数据库：

  ```ruby
  rails db:migrate
  ```

- 插入初始数据（可选）：

  ```ruby
  rails db:init_data
  ```

- `yarn` 配置：

  ```ruby
  yarn install  # 如果遇到问题可尝试：yarn install --ignore-engines
  yarn build:css
  ```

> 注：以上步骤只需要执行一次；之后如果要启动项目，只需要执行下面的命令。

- 启动项目：

  ```ruby
  # 本机启动
  rails s
  ```

  访问 [https://localhost:3000](https://localhost:3000) 即可，再次运行时只须执行 `rails s`。

## 项目说明

### 注册和登录

首页为：

![1](./img/1.png)

点击右上角注册按钮注册账号：

![1](./img/2.png)

点击注册后自动登录，并跳转到刚刚在访问的主页面：

![1](./img/3.png)

### 博客查看与演示

点开一个博客后可以看到页面如下：

![1](./img/4.png)

![1](./img/5.png)

![1](./img/6.png)

发表评论后：

![1](./img/7.png)

该评论可以进行删除。

### 修改个人资料页面

![1](./img/8.png)

### 用户权限修改页面

> 由于酒店、酒店房间、航空公司、航线这四个数据实体的创建需要管理员权限，这里提供了该页面用来修改用户权限。仅用于测试。

![1](./img/9.png)

将该用户修改为管理员：

![1](./img/10.png)

### 查看已注册用户（管理员）

![1](./img/11.png)

可以点击删除账号删除用户。

### 酒店房间、酒店、航空公司、航空路线管理（管理员）

管理这四个数据模型。其中：

- 创建酒店房间类型时必须知道其所属酒店；

- 创建航空路线时必须知道所属航空公司；

- 即：酒店-房间类型为 1对多关系；航空公司-航空路线为 1对多关系。

![1](./img/12.png)

![1](./img/13.png)

上图为酒店房间类型页面，其他类似。

### 旅游路线

添加旅游路线：

![1](./img/14.png)

![1](./img/15.png)

添加完成后可查看：

![1](./img/16.png)

这里旅游路线与酒店、航空路线均为一对多关系。

### 博客操作

新建博客：

![1](./img/17.png)

创建成功后：

![1](./img/18.png)

![1](./img/19.png)

删除博客：

![1](./img/20.png)

