#!/bin/sh

## Install Elixir
# See https://elixir-lang.org/install.html#mac-os-x
echo 'Start: Installing Elixir'
brew update
brew install elixir
elixir --version
mix --version
echo 'End: Installing Elixir'

## Install PostgreSQL
echo 'Start: Installing PostgreSQL'
brew install postgresql
brew services start postgresql
echo 'End: Installling PostgreSQL'

## Create PostgreSQL role for `mix ecto.create`
# See http://www.phoenixframework.org/docs/mix-tasks#section--ecto-create-
echo 'Start: Creating postgres role for ecto.create`'
psql -c "CREATE ROLE postgres LOGIN CREATEDB;" -d postgres
echo 'End: Creating postgres role for ecto.create`'

## Install hex
# See https://hex.pm/docs/usage
echo 'Start: Installing hex'
mix local.hex
echo 'End: Installing hex'

## Install Phoenix archive for `mix phoenix.new`
# See http://www.phoenixframework.org/docs/installation#section-phoenix
echo 'Start: Installing Phoenix archive'
mix archive.install https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
echo 'End: Installing Phoenix archive'
