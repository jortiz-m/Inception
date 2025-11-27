#!/bin/bash
mysqld_safe &                    # 1. Arranca MariaDB (segundo plano)
sleep 5                          # 2. Espera que esté listo
mysql < /etc/mysql/init.sql      # 3. Ejecuta los comandos SQL
mysqladmin shutdown              # 4. Para MariaDB
mysqld_safe                      # 5. Reinicia en primer plano (Docker lo necesita)