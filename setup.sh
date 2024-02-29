#!/bin/bash

# MySQL credentials
MYSQL_USER="your_root_user"
MYSQL_PASSWORD="your_root_password"

# Database details
DATABASE_NAME="ems"
NEW_USERNAME="ems_user"
NEW_USER_PASSWORD="ems_user123"

# SQL commands to create user and grant privileges
SQL_COMMANDS="CREATE USER IF NOT EXISTS '$NEW_USERNAME'@'localhost' IDENTIFIED BY '$NEW_USER_PASSWORD';"
SQL_COMMANDS+="GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$NEW_USERNAME'@'localhost';"
SQL_COMMANDS+="FLUSH PRIVILEGES;"

# Execute SQL commands using mysql command-line client
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "$SQL_COMMANDS"

# Check if the user creation and privilege granting were successful
if [ $? -eq 0 ]; then
    echo "User '$NEW_USERNAME' created and granted privileges for database '$DATABASE_NAME'."
else
    echo "Error: Failed to create user or grant privileges."
fi
