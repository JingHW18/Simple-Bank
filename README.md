# Simple-Bank
golang docker postgresql 






用dbdiagram设计数据库，直接生成PostgreSQL，把它放在db/query/migration里面。
docker下载postgreSql数据库，使用Tableplus作为界面工具操作数据库，把sql文件放入其中生成各种表。
数据库迁移使用makefile脚本来操作，目的是脚本化创建数据库的功能。
使用sqlc自动生成CRUD golang代码，并为他们做单元测试
实现golang 数据库交易操作
对数据库操作的时候有很多并发的情况，所以要用到锁来避免死锁的发生
交易的isolation等级


                未提交读   已提交的读  重复读  可序列化
脏读                y         n       n       n
不重复的读           y         y       n       n
幻读                y         y       n       n
序列化异常           y         y       y       n


github action golang.需要定义workflow
用gin框架实现httpAPI
用viper写config file和环境变量
为了避免在测试API的时候高度属于真的数据库，使用mock来模拟数据库进行单元测试
自定义验证器
处理一些特定的错误
使用hash来存密码
基于令牌的身份验证 Json Web，Paseto
