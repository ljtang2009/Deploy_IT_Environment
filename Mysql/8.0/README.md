# 部署Mysql8.0

## 环境变量

确保运行脚本的目录下有`.env`文件。格式参考`.env.example`。

## 启动容器

```bash
# 正常启动 （使用 .env 文件中的环境变量）
docker-compose up -d

# 生产环境启动
docker compose --env-file .env.prod up -d

# 验证配置
docker compose config

# 查看容器
docker ps

# 查看日志
docker logs mysql-container-8-0

# 进入容器
docker exec -it mysql-container-8-0 mysql -uroot -p

输入密码后，执行：
# 查看字符集
SHOW VARIABLES LIKE 'character%';
# 查看默认字符集
SHOW VARIABLES LIKE 'default_authentication_plugin';
# 查看mysql状态
STATUS;
```
