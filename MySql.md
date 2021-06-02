# MySql

## 概述

### 在数据库服务器的内部，通过数据库存储数据，通常情况下一个应用创建一个数据库

### 在数据库中，一般用表存储数据，在一个系统中，通常为每个实体创建一个表

### 在一个表中，往往会有很多条记录，一个实体的实例，会创建一条新的记录

## 服务器

### 服务器要从硬件和软件两个方面来说

- 硬件

	- 指的就是一台计算机

- 软件

	- 需要在这台电脑上安装数据库服务器

### 链接mysql 服务器

- mysql -u root -p
- 默认链接本地服务器： 省略了两个参数

	- -h

		- hostname

			- 主机名

	- -P

		- port

			- 端口

## SQL

### 结构化查询语言

### SQL 的分类

- DDL

	- 数据定义语言
	- Create

		- 创建

	- Drop

		- 删除

	- Alter

		- 子主题 1

- DCL

	- 数据控制语言
	- Grant

- DML

	- 数据操纵语言
	- insert
	- update
	- delete

- DQL

	- 数据查询语言
	- select

### SQL 的使用

- SQL 对数据库进行操作

	- 创建数据库

		- 语法

			- create database 数据库名称 [character set 字符集 collate 字符集校对规则]

				- 字符集校对规则

					- 主要用来对数据库的排序操作（定论陈数据库的排序规则）
					- 常用字符集校对规则

						- utf8_general_ci

	- 查看数据库

		- 语法

			- show databases;

		- 查看某个数据库的定义信息：

			- show create database 数据库名称；

	- 修改数据库

		- 语法

			- alter database 数据库名称 character set 字符集 collate 校对规则；

	- 删除数据库

		- 语法

			- drop database 数据库名称；

	- 其他数据库操作

		- 切换 数据库

			- 语法

				- use 数据库名称；

		- 查看当前正在使用的数据库

			- 语法

				- select database();

- SQL对数据库表进行操作

	- 创建表

		- 语法

			- create table  表名称(字段名称 字段类型(长度) 约束，字段名称 字段类型（长度） 约束...);
			- 约束

				- 约束的作用

					- 保证数据的完整性

				- 约束的分类

					- 单表约束

						- 主键约束

							- primary key
							- 主键约束默认就是唯一 非空的

						- 唯一约束

							- unique

						- 非空约束

							- not null

		- 字段类型

			- 一个实体对应一个表，一个实体属性对应表的一个字段。
			- 字段对应

				- java 

					- byte/short/int/long
					- float
					- double
					- boolean
					- char/String
					- Date

				- MySQL 中的类型

					- tinyint/smallint/int/bigint
					- float
					- double
					- bit
					- char和varchar

						- 区别

							- char 类型代表是固定长度的字符或字符串

								- 定义类型char(8),向这个字段存入字符串hello，那么数据库使用三个空格将其补全

							- varchar 代表的是可变长度的字符串

								- 定义类型varchar(8),向这个字段存入字符串hello,那么存入到数据库的就是 hello

					- date/time/datetime/timestamp

						- 区别

							- datetime 就是既有日期又有时间的日期类型，如果没有向这个字段中存执，数据库使用null 存入
							- timestamp 也是既有日期又有时间的日期类型，如果没有向这个字段中存值，数据库使用当前的系统时间存入

		- 实例

			- 1. 创建 web_test1 数据库，并在当前数据库下创建user表

				- create database web_test1;
				- use web_test1;
				- create table user (
    id int primary key auto_increment,
    username varchar(20) unique,
    password varchar(20) not null,
    age int,
    birthaday date
);

	- 查看表

		- 查看某个数据库里所有的表

			- 语法

				- show tables;

		- 查看某个表的结构信息

			- 语法

				- desc 表名;

	- 删除表

		- 语法

			- drop table 表名;

	- 修改表

		- 添加列

			- 语法

				- alter talbe 表名 add  列名 类型（长度） 约束;

		- 修改列类型，长度和约束

			- 语法

				- alter table 表名 modify 列名 类型（长度） 约束;

		- 删除列

			- 语法

				- alter table 表名 drop 列名;

		- 修改列名称

			- 语法

				- alter table 表名 change 旧列名 新列名 类型（长度） 约束；

		- 修改表名

			- 语法

				- rename table 表名 to 新的表名;

		- 修改表的字符集

			- 语法

				- alter table 表名 character set 字符集;

- SQL 对数据库表的记录进行操作

	- 添加表的记录

		- 语法

			- 向表中插入某些列

				- insert into 表名 （列名1，列名2,列名3...） values(值1，值2，值3...);

			- 向表中插入所有列

				- insert into 表名 values(值1，值2，值3...);

		- 注意

			- 1. 值的类型与数据库中表列的类型一致
			- 2. 值的顺序与数据库中表列的顺序相同
			- 3. 值的最大长度不能超过列设置最大长度
			- 4. 值的类型是字符串或者是日期类型，使用单引号引起来

		- 实例

			- 1.添加某几列

				- insert into user（id,username,password） values(null,"zhangsan","123234",12);

			- 2.添加所有列

				- insert into user values(null,"zhangsan","123234",12);

	- 修改表的记录

		- 语法

			- update 表名 set 列名=值，列名=值 [where 条件];

		- 注意

			- 1. 指的类型与列的类型一致
			- 2. 值的最大长度不能超过列设置的最大长度
			- 3. 字符串类型和日期类型添加单引号；

		- 实例

			- 修改某一列的所有值

				- update user set password = 'abc';

			- 按条件修改数据

				- update user set password = 'xyz' where username = 'bbb';

			- 修改多个列

				- update  user set password ='123',age = 34 where username = 'zhangsan';

	- 删除表的记录

		- 语法

			- delete from 表名 [where  条件]；

		- 注意

			- 1. 删除表的记录，指的是删除表中的一行记录
			- 2. 删除如果没有条件，则表示删除所有记录
			- 3. 删除表中的记录有两种方式

				- 1. delete from user;

					- 删除所有记录，属于DML 语句，一条记录一条记录删除，事务可以作用在DML 语句上

				- 2.truncate table user;

					- 删除所有记录，属于DDL 语句，将表删除，然后重新创建一个结构一样的表，事务不能控制DDL

		- 实例

			- 1. 删除某一条记录

				- delete from user where id =2;

			- 2.删除所有记录

				- delete from user;

	- 查看表的记录

		- 资料准备

			- 考试表准备

				- create table exam(
	id int primary key auto_increment,
	name varchar(20),
	english int,
	chinese int,
	math	int
);

insert into exam values (null,'张三',85,74,91);
insert into exam values (null,'李四',95,90,83);
insert into exam values (null,'王五',85,84,59);
insert into exam values (null,'赵六',75,79,76);
insert into exam values (null,'田七',69,63,98);
insert into exam values (null,'李老八',89,90,83);


		- 基本查询

			- 语法

				- select [distinct] * | 列名 from 表名 [条件];

			- 实例

				- 查询 exam 表的所有数据

					- select * from exam;

				- 查询所有学生的姓名和英语成绩

					- select name,english from exam;

				- 查询英语成绩信息（不显示重复值）

					- select distinct english from exam;

				- 查询所有学生的姓名和总成绩

					- select name, english + chinese + math from exam;
					- 使用别名显示

						- select name, english + chinese +math as sum from exam;

		- 条件查询

			- 可以使用where 加上查询条件

				- >,<,>=,<=,<>,=
				- like 

					- 模糊查询

				- in

					- 范围查询

				- and,or,not

					- 条件关联

			- 实例

				- 1. 查询李四学生的成绩

					- select * from exam where name = "李四"；

				- 2. 查询名称叫李四并且英文大于90分的同学

					- select * from exam where name = "李四" and english >90;

				- 3. 查询 姓李的学生 的信息

					- select * from exam where name  like "李%";

						- % 表示占位符，表示李后面有一个或多个其他字符

					- select * from exam where name like "李_"；

						- _ 也表示占位符，表示李后面有一个字符

				- 4. 查询英语成绩是 69，75，89 学生的信息

					- select * from exam where english in (69,75,89);

		- 排序查询

			- 使用 order by 字段 名称 

				- asc 升序
				- desc 降序

			- 实例

				- 查询所有学生信息并根据英语成绩降序排列

					- select * from exam  order by english desc;

				- 查询所有学生信息，先按照语文进行倒序排序，如果成绩相同再按照英语成绩升序排序

					- select * from exam order by chinese desc, english asc;

				- 查询姓李的学生信息，按照英语成绩降序排序

					- select  * from exam where name like "李%" order by english desc;

		- 分组统计查询

			- 聚合函数

				- sum()

					- 求和
					- 实例

						- 1.获取所有学生的英语成绩的总和

							- select sum(english) from exam;

						- 2. 获取所有学生的英语成绩的总和和数学成绩的综合

							- select sum (english) ,sum(math) from exam;

						- 3. 查询姓李的学生的英语成绩的总和

							- select sum(english) from exam where name like “李%”;

						- 4. 查询所有学生各科的总成绩

							- 方式1

								- select sum(english) + sum(chinese) + sum(math) from exam;

							- 方式2

								- select  sum(english + chinese +math) from exam;

				- count()

					- 求个数
					- 实例

						- 获得学生的总数

							- select count(*) from exam;

						- 获得姓李的学生的个数

							- select count(*) from exam where name like "李%"；

				- max()

					- 求最大值
					- 实例

						- 获得学生数学成绩的最高分

							- select max(math) from exam;

				- min()

					- 求最小值，和max 用法相似
					- 实例

						- 获得学生语文成绩的最小值

							- select min(chinese) from exam;

				- avg()

					- 求平均值
					- 实例

						- 获取语文平均值

							- select avg(chinese) from exam;

			- 语法

				- 使用group by  字段名称

			- 实例

				- 数据准备

					- create table orderitem (id int primary key auto_increment, product varchar(20), price double);
insert into orderitem values(null,"电视机",2999);
insert into orderitem values(null,"电视机",2999);
insert into orderitem values(null,"洗衣机",1999);
insert into orderitem values(null,"洗衣机",2999);
insert into orderitem values(null,"冰箱",2999);
insert into orderitem values(null,"冰箱",3999);
insert into orderitem values(null,"冰箱",4999);
insert into orderitem values(null,"空调",1999);
insert into orderitem values(null,"空调",2999);
insert into orderitem values(null,"空调",3999);
insert into orderitem values(null,"空调",2999);

				- 1.按商品名称统计，每类商品所购买的个数：

					- select product ,count(*) from orderitem group by product;

				- 2. 按商品名称统计，每类商品所花费总金额

					- select product,sum(price) from orderitem group by product; 

				- 3. 按商品名称统计，统计每类商品花费的总金额在5000 元以上的商品

					- select product,sum(price) from orderitem group by product having sum(price)>5000;
					- 注意

						- where 的子句后面不能跟着聚合函数，如果现在使用带有聚合函数的条件过滤（分组后条件过滤） 需要使用一个关键字 having

				- 4. 按商品名称统计，统计每类商品花费的总金额在5000 元以上的商品，并且按照总金额升序排列

					- select product,sum(price) from orderitem group by product having sum(price)>5000 order by sum(price) asc;

		- 总结

			- S(select)...F(from)...W(where)...G(group by) ... H(having)...O(order by);
			- 顺序不可以颠倒

## 重置密码

### 忘记密码重置

- 1. 关闭mysql 服务

	- windows

		- 运行 services.msc
		- 找到mysql
		- 停止并重新开始即可

- 2. 终端运行

	- mysqld --skip-grant-tables

		- 跳过权限认证登录

- 3. 打开新的终端

	- mysql -u -root -p

		- 直接回车登录

- 4. 修改root密码

	- 1. use mysql;
	- 2. update user set password  = pasasword("新密码") where  user = 'root';

- 5. 结束mysqld 的进程
- 6. 重新启动mysql 服务即可

### 重置初始密码

- set password for 用户名@localhost = password('新密码');  

## 备份和还原

### 备份

- 1. 终端运行

	- mysqldump -u root -p 数据库名 > 备份路径
	- 实例

		- mysqldump -u root -p db1 > D:/mysqlbak/db1.sql

			- 注意

				- 末尾不加分号；

### 还原

- 方式1

	- 1.新建要还原的数据库表
	- 2. 终端执行命令

		- mysql -u root -p 要恢复数据库表名 < 已备份的数据库文件

	- 实例

		- 登录数据库

			- mysql -u root -p 

		- 创建要还原的数据库

			- create database db1;

		- 重新打开终端，执行还原命令

			- mysql -u root -p db1 < D:/mysqlbak/db1.sql

- 方式2

	- 1. 登录mysql

		- mysql -u root -p

	- 2. 新建要还原的数据库表

		- create database db1;

	- 3. 切换到当前数据库

		- use db1;

	- 3. 还原数据库

		- source D:/mysqlbak/db1.sql

## 多表设计

### 外键约束

- 作用

	- 用来保证数据的完整性
	- 实例

		- 当某两个表之间有关联关系时，不应该使得有关系的表进行删除操作成功
		- 当前有员工表 和 部门表 之间相关联，当员工中的部门字段有值时，进行部门表中相应数据的删除操作不应该成功

### 添加外键约束

- 实例

	- alter table employee add foreign key (dno) references dept(did);

		- 将当前员工表的dno（部门编号）字段添加外键约束，约束为 dept(部门表) 内的did(部门id)字段

	- alter table employee modify dno int not null;

		- 修改当前员工表内的 dno（部门编号） 不能为空

### 删除外键约束

- alter table 表名 drop foreigh key 外键约束名称；
- 实例

	- 查询外键约束名称

		- show create table crouse;

	- 删除外键约束

		- alter table course drop foreign key course_ibfk_1;

### 表与表之间的关系

- 一对多的关系

	- eg

		- 一个部门下可以有多个员工，一个员工只可以属于一个部门

	- 建表原则

		- 
		- 在多的一方创建外键指向一的一方的主键

	- 实例

		- 员工表(多)和部门表（一）

			- alter table employee add foreign key (dno) references dept(did);

				- 将当前员工表的dno（部门编号）字段添加外键约束，约束为 dept(部门表) 内的did(部门id)字段

			- alter table employee modify dno int not null;

				- 修改当前员工表内的 dno（部门编号） 不能为空

- 多对多的关系

	- eg

		- 一个课程可以有多个学生选择，一个学生也可以选择多个课程

	- 建表原则

		- 
		- 需要创建第三张表（中间表），在中间表中至少两个字段分别作为外键，指向多对多双方的主键

- 一对一的关系

	- 通常情况下会将符合一对一的关系的字段放在同一个表中
	- 建表原则

		- 
		- 唯一外键对应

			- 假设是一对多，在多的一方创建外键指向一的一方的主键，将外键设置为 unique;

		- 主键对应

			- 将两个表的主键建立对应关系即可

### 实例

- 实例1

	- 需求

		- 完成一个学校的选课系统，在选课系统中包含班级，学生，课程这些实体
		- 班级和学生之间是有关系存在：

			- 一个班级包含多个学生，一个学生只能属于一个班级

				- 一对多关系

		- 学生和课程之间的关系

			- 一个学生可以选择多门课程
			- 一个课程可以由多个学生选择

	- 多表的创建

		- 创建表

			- 

- 实例2

	- 实现一个网上商城案例，在商城中会有用户，商品，订单，商品分类

		- 商品和用户的关系

			- 一个商品可以有被多个用户购买
			- 一个用户可以购买多个商品

		- 商品和订单的关系

			- 一个订单里可以有多个商品
			- 一个商品只可能属于一个订单

		- 订单和用户的关系

			- 一个用户可以有多个订单
			- 一个订单只会属于一个用户

	- 

## 查询

### 多表查询

- 多表查询的分类

	- 链接查询

		- 交叉链接(cross join)

			- 查询到的是两个表的笛卡尔积
			- 语法

				- 写法1：

					- select * from 表1 cross join 表2

				- 写法2：

					- select * from 表1,表2

		- 内链接inner join(inner 是可以省略的)

			- 显式内连接

				- 在SQL 中显式的调用 inner join 关键字
				- 语法

					- select * from 表1 inner join 表2 on 关联条件；

			- 隐式内连接

				- 在SQL 中没有调用inner join 关键字
				- 语法

					- select * from  表1, 表2  where 关联条件；

		- 外连接

			- 左外连接

				- 语法

					- select * from 表1 left outer join 表2 on 关联条件；

			- 右外连接

				- 语法

					- select * from right outer join 表2  on  关联条件；

	- 子查询

		- 指一个查询语句条件需要依赖另一个查询语句的结果。

- 实例

	- 数据准备

		- 班级表数据准备

			- 

		- 学生表数据准备

			- 

		- 课程表数据准备

			- 

		- 学生选课表数据准备

- 交叉链接查询（了解）

	- 交叉链接又叫笛卡尔积，它指不使用任何条件，直接将一个表的数据和另一个表的数据一一匹配
	- 使用 cross join 关键字

		- select * from classes cross join student;
		- 查询结果

			- 

	- 不使用 cross join 关键字

		- select * from classes,student;

- 内连接查询

	- 内连接可以得到两个表交集的部分
	- 显式内连接查询(使用 inner join 关键字，inner 可以省略)

		- select * from classes c inner join student s on  c.cid =s.sno;
		- select * from classes c join student s on c.cid =s.sno;

	- 隐式内连接查询

		- select * from classes c ,students s where c.cid=s.sno;

	- 查询结果

		- 

- 外连接查询

	- 外连接其结果集中不仅包含符合链接条件的行，而且还会包括左表、右表或两个表中的所有数据行，这三种情况一次称之为左连接、右链接和全外连接
	- 分类

		- 左外连接（关键字为 left outer join,其中 outer 可以省略 ）

			- 左外连接，也称左连接，左表为主表，左表中的所有记录都会出现在结果集中，对于那些在右表中并没有匹配的记录，仍然要显示，右表对应的那些字段值以null 来填充
			- 以students 表为左外连接
			- select * from classes c left outer join students s on c.cid = s.sno;

		- 右外连接（关键字为 right outer join ，其中 outer 可以省略）

			- 右外连接，也称右链接，右表为主表，右表中的所有记录都会出现在结果集中，左连接和右链接可以互换，maysql 目前还不支持全外连接
			- select * from classes c right outer join students s on c.cid = s.sno;

### 子查询

- 带in 的子查询

	- 实例

		- 查询 学生生日在91 年之后的班级的信息
		- select * from classes where cid in (select cno from student where birthday >'1991-01-01');

			- 

- 带 exists 的子查询

	- 实例

		- 查询学生生日大于 91 年1月1日，如果记录存在，前面的SQL就会执行
		- select * from classes exists (select cno from stuents where birthday = '1991-01-01')

			- 

- 带 any的子查询

	- 实例

		- 查询任意一个大于当前 cno 的学生所在的班级
		- select * from classes where cid >any (select cno from student);

			- 

- 带all的子查询

	- 实例

		- 查询比所有学生所在的班级数字大的班级
		- select * from classes where cid > all (select cno from students);

			- 

- 综合实例

	- 1. 查询班级的名称和总人数

		- select cname ,COUNT(*) from classes c, students s where(c.cid = s.cno) group by cname;
		- 

	- 2. 查询学生的姓名和学生所选的总课程平均成绩

		- select s.sname ,AVG(sc.score) from students s,stu_score sc where(s.sid = sc.sno) group by s.sname;
		- 

	- 3. 查询学生的姓名和学生的选课总数，显示选课超过2门学生姓名

		- select s.name, COUNT(*) from students s ,stu_score sc where(s.sid = sc.sno) group by s.sname having COUNT(*) >=2;
		- 

	- 4. 查询平均乘积大于80分的学生的总数

		- select COUNT(*) from students s where s.sid in(select sno from students s ,stu_course sc where(s.sid = sc.sno) group by sno having (AVG(sc.score)>80));
		- 

	- 5. 查询学生和平均成绩，但是平均成绩大于01班的任何一个学生的平均成绩

		- 思路

			- 1.先查询出01班的平均成绩

				- select avg(sc.score) from students s,stu_course sc ,classes c where(s.sid=sc.sno and c.cname = '01班') group by s.sname

			- 2. 查询所有班级的平均成绩并和 01班的平均成绩比较

				- select s.sname,avg(sc.score) from students s,stu_course sc where(s.sid = sc.sno) group by s.sname having(avg(sc.score) > any (select avg(sc.score) from students s,stu_course sc ,classes c where(s.sid=sc.sno and c.cname = '01班') group by s.sname));

			- 

## 事务

### 概述

- 指的是逻辑上的一组操作，组成这组操作的各个逻辑单元，要么全部成功，要么全部失败

### 事务管理（mysql）

- 环境准备

	- 创建账户（account）表

		- 
# 创建账户表
create table account (
  id int primary key auto_increment,
  name varchar(20),
  money int
);

#  插入数据
insert into account values(null,'张三',10000);
insert into account values(null,'李四',10000);

#  模拟转账
#  开启事务
start transaction;
# 执行操作
update account set money = money-1000 where name='张三';
update account set money = money+1000 where name='李四';
#  提交事务
commit;

### 事务的特性

- 原子性

	- 强调事务的不可分割，组成事务的各个逻辑单元不可分割

- 一致性

	- 事务执行的前后，数据完整性保持一致

- 隔离性

	- 事务执行不应该受到其他事务的干扰

- 持久性

	- 事务一旦结束（commit 或rollback）,数据就持久化到数据库中

### 事务的隔离级别

- 如果不考虑隔离性，会引发一些安全问题，主要体现在读数据上

	- 1.脏读

		- 一个事务读到了另一个事务未提交的数据，导致查询结果不一致

	- 2. 不可重复读

		- 一个事务读到了另一个事务已经提交的update 的数据，导致多次查询结果不一致

	- 3. 虚读/幻读

		- 一个事务读到了另一个事务已经提交的insert 的数据，导致多次查询结果不一致

- 解决安全性问题的办法： 设置事务的隔离级别

	- read uncommitted

		- 脏读、不可重复读，虚读都有可能发生

	- read committed

		- 避免脏读，但是不可重复读和虚读是有可能发生的

	- repeatable read

		- 避免脏读和不可重复读，但是虚读有坑发生

	- serializable

		- 避免脏读、不可重复读、虚读

- 实例

	- 脏读

		- 脏读演示

			- 准备

				- 设置事务的隔离级别

					- 临时生效

						- SET SESSION TRANSACTION ISOLATION LEVEL 隔离级别

					- 永久生效

						- 修改my.cnf 配置文件

							- [mysqld]
transaction-isolation = REPEATBLE-READ

				- 查看当前的隔离级别

					- SELECT @@tx_isolation;

			- 1.开启两个窗口A,B
			- 2. 设置A窗口的隔离级别为 read uncommitted;

				- SET SESSION TRANSACTION ISOLATION LEVEL read uncommited;

			- 3. 在A,B 两个窗口中开启事务

				- start transatction; 或 begin;

			- 4. 在B窗口中完成转账的功能；

				-  update account set money = money-1000 where id = 1;
				- update account set money = money+1000 where id = 2;
				- 注意： 当前事务还未提交

			- 5. 在A窗口中进行查询

				- 
				- 发现A窗口中已经查到另一个事务中未提交的数据，发生了脏读

	- 避免脏读，演示不可重复读发生

		- 1.开启两个窗口A,B
		- 2. 设置A窗口的隔离级别为 read committed;

			- SET SESSION TRANSACTION ISOLATION LEVEL read commited;

		- 3. 在A、B两个窗口中开启事务

			- start transaction; 或 begin;

		- 4. 在B窗口中完成转账

### 开启事务

- start transaction;

### 回滚事务

- rollback;

## 常见错误

### Server returns invalid timezone. Need to set ‘serverTimezone‘ property.

- 原因

	- 没有为当前数据库设置时区

- 打开mysql命令行，输入show variables like’%time_zone’;
- 解决办法

	- set global time_zone=’+8:00’;

- 重新链接数据库即可

### 添加中文数据报错

-  insert into user values(null,"张三","123123",12);
ERROR 1366 (HY000): Incorrect string value: '\xD5\xC5\xC8\xFD' for column 'username' at row 1
- 产生原因： 当前mySql 内部的客户端和服务器端的字符集为 utf8，但是命令行客户端的字符集编码是 gbk，则此时命令行客户端和 mysql内部客户端的字符集无法匹配，所以出现了乱码
- 解决方案

	- 由于 mysql客户端 既可以识别 utf8 ，又可以识别 gbk,则此时只需要将当前mysql 客户端的字符集改为 gbk即可
	- 查看当前字符集

## 重启mysql

### windows

- 运行 services.msc
- 找到mysql
- 停止并重新开始即可

