## setup this repository

```shell
$ rails new rails-api-playground -T --api

$ bundle install

$ rails generate rspec:install
```

```shell
$ rails g model article title content:text slug

$ rails db:migrate

$ rails c

> Article.create
> Article.first.title
```
