#!/usr/bin/env bash
mysql --protocol=tcp -u root --execute="create database gogreen; grant all on gogreen.* to 'gogreen'@'%' identified by 'mypassword'; flush privileges;" -ppassword