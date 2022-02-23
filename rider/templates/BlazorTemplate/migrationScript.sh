#Installing jq
curl -L -o /usr/bin/jq.exe https://github.com/stedolan/jq/releases/latest/download/jq-win64.exe

connectionString=$(jq '.ConnectionStrings.DefaultConnection' ./View/appsettings.json)
databaseString="$(cut -d';' -f3 <<<"$connectionString")"
userString="$(cut -d';' -f4 <<<"$connectionString")"
passwordString="$(cut -d';' -f5 <<<"$connectionString")"

database="${databaseString:10:${#databaseString}-10}"
user="${userString:6:${#userString}-6}"
password="${passwordString:10:${#passwordString}-10}"

export MYSQL_PWD=$password;"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u $user -e "DROP DATABASE $database;CREATE DATABASE $database;"

cd Model
rm -rf Migrations

dotnet ef -s ../View migrations add "Init"

dotnet ef -s ../View database update

export MYSQL_PWD=$password;"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -u $user $database < ../inserts.sql
echo "Script Done!"
read