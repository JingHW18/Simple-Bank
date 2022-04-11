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


缓存雪崩：因为redis缓存失效，数以万计的请求直接打到数据库上导致数据库失效（解决方案，设置缓存时间不要在同一时间失效，redis都是集群部署，热点的key放在不同节点上，跑定时任务不让redis失效）


缓存穿透：大量的请求中传入不符合要求的参数，导致redis中不存在数据以至于要去数据库中找，倒是redis失效，数据库垮掉。解决方案；请求打到数据库后把结果返回给redis（无论什么结果），对参数合法性进行判断，使用布隆过滤器。

缓存击穿：在单个数据的大量请求发生时，这个数据突然失效，导致请求打到数据库上。解决方案，redis到数据库的请求上锁，完了其他请求直接去redis中查找。

数据库最左原则：对a,b,c三个列联合索引时，只有在选择a，ab，abc时所引才回生效。


