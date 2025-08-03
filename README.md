
# Junior DevOps / Linux SysAdmin — Тестовое задание 1

## О проекте
Демонстрация базовых навыков работы с Linux, CI/CD, Docker, Kubernetes и системным администрированием.  
Выполнены задачи по установке и настройке NGINX, написанию пайплайна для GitLab CI, созданию Docker-образа и подготовке Kubernetes Deployment манифеста.

---

## Структура проекта
```
.
├── Dockerfile              # Docker-образ с NGINX и кастомной главной страницей
├── index.html              # "Hello from DevOps!" страница
├── deployment.yaml         # Kubernetes Deployment манифест (nginx\:stable)
└── .gitlab-ci.yml          # CI/CD пайплайн для проверки установленного NGINX
```

---

## 1. Установка и настройка NGINX (Linux systemd)
### Шаги:
```bash
sudo apt update
sudo apt install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx
````

### Проверка:

```bash
systemctl status nginx
```

---

## 2. GitLab CI/CD пайплайн (.gitlab-ci.yml)

```yaml
stages:
  - test

test_nginx:
  stage: test
  script:
    - echo "Проверяем наличие nginx..."
    - which nginx
    - nginx -v
```

---

## 3. Dockerfile с кастомной страницей "Hello from DevOps!"

```Dockerfile
FROM nginx:stable
COPY index.html /usr/share/nginx/html/index.html
```

### Сборка и запуск контейнера:

```bash
docker build -t devops-nginx .
docker run -d -p 8080:80 devops-nginx
```

### Проверка:

```bash
curl http://localhost:8080
```

---

## 4. Kubernetes Deployment (deployment.yaml)

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:stable
          ports:
            - containerPort: 80
```

---

## 5. Ответы на вопросы

**➤ Чем отличается apt update от apt upgrade?**

* `apt update`: обновляет кэш списка доступных пакетов.
* `apt upgrade`: устанавливает новые версии уже установленных пакетов.

**➤ Как проверить, слушает ли сервис нужный порт?**

* `ss -tuln` или `netstat -tuln`

**➤ Команды для диагностики сетевых проблем:**

* `ping`, `traceroute`, `curl`, `dig`, `telnet`, `nc`

