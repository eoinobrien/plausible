#!/bin/sh

cd /opt/app

mix ecto.create
mix ecto.migrate
mix phx.server