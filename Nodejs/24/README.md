# 部署 Node.js 24

## 环境变量

确保运行脚本的目录下有 `.env` 文件。格式参考 `.env.example`。

## 启动容器

```bash
# 正常启动（使用 .env 文件中的环境变量）
docker-compose up -d

# 生产环境启动
docker compose --env-file .env.prod up -d

# 验证配置
docker compose config

# 查看容器
docker ps

# 查看日志
docker logs nodejs-container-24

# 实时查看日志
docker logs -f nodejs-container-24

# 进入容器
docker exec -it nodejs-container-24 sh

# 进入容器后执行命令
# 查看 Node.js 版本
node --version

# 查看 npm 版本
npm --version

# 查看应用进程
ps aux

# 查看环境变量
env | grep NODE

# 检查容器健康状态
docker inspect --format='{{.State.Health.Status}}' nodejs-container-24
```

## 应用部署

### 1. 准备应用代码

将你的 Node.js 应用代码放入 `app` 目录，确保包含：
- `package.json` - 项目依赖配置
- `package-lock.json` - 依赖锁定文件（推荐）
- 应用源代码文件

### 2. 应用结构示例

```
app/
├── package.json
├── package-lock.json
├── src/
│   └── index.js
└── config/
    └── default.json
```

### 3. 自定义启动命令

如果需要自定义启动命令，修改 `docker-compose.yml` 中的 `command` 字段：

```yaml
command: sh -c "npm install --production && node src/index.js"
```

### 4. 依赖管理

- 本地依赖卷：`node_modules` 使用 Docker volume 管理，避免与宿主机冲突
- 生产环境：建议使用 `npm install --production` 或 `npm ci --only=production`

## 常见问题

### 权限问题

如果遇到文件权限问题，在容器内执行：
```bash
chown -R node:node /app
```

### 端口冲突

如果 3000 端口被占用，修改 `.env` 文件中的 `HOST_PORT` 值。

### 日志查看

```bash
# 查看最近 100 行日志
docker logs --tail 100 nodejs-container-24

# 查看特定时间的日志
docker logs --since 2024-01-01T00:00:00 nodejs-container-24
```

### 容器重启

```bash
# 重启容器
docker-compose restart

# 停止容器
docker-compose down

# 停止并删除容器（保留数据）
docker-compose down

# 停止并删除所有（包括 volumes）
docker-compose down -v
```
