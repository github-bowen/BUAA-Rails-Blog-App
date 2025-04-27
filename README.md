# BUAA-Rails-Blog-App

[中文版](./README_zh.md)

This is a travel blog sharing web application developed based on the Ruby on Rails framework. It is also the final project for the "Ruby Programming" course at Beihang University.

## Requirements

### System Requirements

- Operating System: Windows 10 or Ubuntu 20.04

### Software Versions

- Ruby: 3.1.2
- Rails: 7.0.4
- sqlite3: 1.4
- yarn: 1.22.19
- nodejs: 16.17.1

> For more dependencies, please refer to the `Gemfile` file in the project.

## Installation and Setup

1. Clone the project repository:

```shell
git clone https://github.com/github-bowen/BUAA-Rails-Blog-App.git
cd BUAA-Rails-Blog-App
```

2. Install project dependencies:

```shell
bundle install
```

3. Set up the database:

```shell
rails db:migrate
```

4. (Optional) Initialize seed data:

```shell
rails db:init_data
```

5. Build frontend assets:

```shell
yarn install  # If issues occur, try: yarn install --ignore-engines
yarn build:css
```

> Note: The above initialization steps only need to be performed once.

## Running the Project

Start the development server:

```shell
rails s
```

Then visit [http://localhost:3000](http://localhost:3000) in your browser to use the application.

## Project Overview

### Registration and Login

The homepage looks like this:

![1](./img/1.png)

Click the "Register" button at the top right to create a new account:

![1](./img/2.png)

After registering, you will be automatically logged in and redirected back to the page you were previously visiting:

![1](./img/3.png)

### Blog Browsing and Demonstration

Click on any blog to view its details:

![1](./img/4.png)

![1](./img/5.png)

![1](./img/6.png)

After posting a comment:

![1](./img/7.png)

You can delete comments after posting them.

### Editing Personal Profile

![1](./img/8.png)

### User Permission Management

> Since creating hotels, hotel rooms, airlines, and flight routes requires administrator privileges, a permission management page is provided for testing purposes.

![1](./img/9.png)

You can promote a regular user to an administrator:

![1](./img/10.png)

### Viewing Registered Users (Admin Only)

![1](./img/11.png)

As an administrator, you can delete user accounts.

### Managing Hotels, Hotel Rooms, Airlines, and Flight Routes (Admin Only)

Manage these four data models:

- When creating a hotel room type, you must first select the hotel it belongs to;
- When creating a flight route, you must first select the associated airline;
- In short: there is a one-to-many relationship between hotels and room types, and between airlines and flight routes.

![1](./img/12.png)

![1](./img/13.png)

The above shows the hotel room management page; other pages are similar.

### Travel Route Management

Add a travel route:

![1](./img/14.png)

![1](./img/15.png)

After creation, you can view the details:

![1](./img/16.png)

Travel routes also have a one-to-many relationship with hotels and flight routes.

### Blog Operations

Create a new blog:

![1](./img/17.png)

After creation:

![1](./img/18.png)

![1](./img/19.png)

Delete a blog:

![1](./img/20.png)
