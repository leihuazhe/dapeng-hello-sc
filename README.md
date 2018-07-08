# Dapeng-hello
以 [dapeng-soa](https://github.com/dapeng-soa/dapeng-soa) 构建的hello服务(Java实现)

## 项目目录树
```
|--dapeng-hello
|  |--hello-api                 dapeng服务api，插件生成代码
|  |  |--src
|  |  |  |--main
|  |  |  |  |--java
|  |  |  |  |--resources
|  |  |  |  |  |--thrifts       IDL文件存放
|  |  |--pom.xml
|  |--hello-service             dapeng服务实现
|  |  |--src
|  |  |  |--main
|  |  |  |  |--java
|  |  |  |  |--resources
|  |  |  |  |  |--META-INF
|  |  |  |  |  |  |--spring
|  |  |  |  |  |  |  |--services.xml
|  |  |--pom.xml
|  |  |--logs
|  |  |--docker
|  |  |  |--Dockerfile          
|  |--.gitignore
|  |--pom.xml
|  |--hello-test-clinet         客户端测试
------------------------------------
```

## 本地启动
本地启动需要本地启动 zookeeper ,可使用 docker 启动一个 zookeeper 容器
```bash
docker pull zookeeper
docker run --name zookeeper -p 2181:2181 --restart always -d zookeeper
```
Dapeng 插件启动服务

```bash
cd hello-service
mvn compile dapeng:run
或者
cd hello-service
mvn compile com.github.dapeng:dapeng-maven-plugin:2.0.2:run
```
## 本地测试
- 客户端测试代码在hello-test-client，测试前确保服务已启动服务，运行HelloClientTest即可
- 单元测试代码在hello-service，运行HelloTestCase即可
>服务默认注册端口:9090
默认在线测试文档端口:8080

打开浏览器 http://localhost:8080 访问在线文档进行测试

## 打包docker镜像

```bash
cd hello-service
mvn clean package
```

## 使用docker-compose编排服务
使用docker-compose启动服务容器
```bash
docker-compose up -d 
```
以上命令会一并启动一个依赖的 zookeeper 容器 helloZk ,无需单独启动 zookeeper

> 容器模式下启动服务没有在线测试站点,如果需要测试可以编写客户端服务来进行测试






