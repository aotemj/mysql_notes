use db3;

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

# rollback 如果有错误则回滚事务
rollback;
