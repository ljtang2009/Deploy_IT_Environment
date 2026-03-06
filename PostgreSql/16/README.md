# 部署PostgreSql16

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
docker logs postgresql-container-16

# 进入容器
docker exec -it postgresql-container-16 psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}

输入密码后，执行：
# 查看连接信息
\conninfo

# 查看postgresql版本
SELECT version();
```
