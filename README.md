# BUAA-RUBY-2022

北航 2022 Ruby 大作业项目代码。

## 环境要求

- Ruby: 3.1.2
- Rails: 7.0.4

## 开始使用

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
  yarn install --ignore-engines
  yarn build:css
  ```

- 启动项目：

  ```ruby
  # 本机启动
  rails s
  
  # 局域网启动
  rails s -b 0 -p 3000  # 端口 3000
  ```

  访问 [链接](https://localhost:3000) 即可，再次运行时只须执行 `rails s`。
