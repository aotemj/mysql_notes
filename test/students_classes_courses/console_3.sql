# 使用 cross join 进行交叉查询
select * from classes cross join students;
#  不使用 cross join 进行交叉查询
select * from classes ,students;

#  内连接查询
#  显式内连接查询
select * from classes c inner join students s on c.cid = s.cno;
#  省略 inner
select * from classes c join students s on c.cid = s.cno;


# 外连接查询
#  左外连接查询
select * from classes c left join students s on c.cid = s.cno;

#  子查询
#  带 in 的子查询
use db2;
select * from students where birthday > '1990-10-01';
# 带in子查询
select * from classes where cid in (select cno from students where birthday > '1990-10-01');

# 带exists  子查询
select * from classes where exists(select cno from students where birthday > '1990-10-01');

#  带any 子查询
select * from classes where cid > any (select cno from students);

# 带 all 子查询
select * from classes where cid > all (select cno from students);


