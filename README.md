# README

This README would normally document whatever steps are necessary to get the
application up and running.


Ruby v3.2.0

```
ruby --version
```

## Get started
```bash
git clone https://github.com/open-wm/altoquepe.git
cd altoquepe
asdf local ruby 3.2.0
bundle install
bun install
rails db:migrate
```

## Windows :)

```bash
find bin/ -type f -print0 | xargs -0 sed -i 's/\r$//'
```


## Run the dev server

```bash
bin/dev
```

## Useful commands

```bash
	rails console
 rails routes
 rails generate model Transaction amount_in_cents:integer transaction_number:string sender:references receiver:references
 rails generate controller Transaction
 rails db:rollback
 rails db:migrate
```