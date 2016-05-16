#!/bin/bash

#fazendo cópia do banco
echo 'Iniciando Backup'
date +'%a %b %e %H:%M:%S %Z %Y'
path="${HOME}/atitude"
cd "$path"
pg_dump atitude_development > backup_atitude.sql
mv backup_atitude.sql /home/backup_atitude.sql

#enviando arquivo
s3cmd sync --recursive --preserve /home/backup_atitude.sql s3://atitude-backup
date +'%a %b %e %H:%M:%S %Z %Y'
echo 'Ação Finalizada'
