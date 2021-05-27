# 综合练习

# 查询 每个班级的名称和总人数
# select cname,COUNT(*) as num from classes c,students s where(c.cid = s.cno) group by cname;

# 2. 查询学生的姓名和学生所选的总课程平均成绩
select s.sname,AVG(sc.score) from students s,stu_course sc where(s.sid = sc.sno) group by sname;

# 3. 查询学生的姓名和学生的选课总数，显示选课超过2门学生姓名
select sname,COUNT(*) from students s,stu_course sc where(s.sid = sc.sno)  group by s.sname having COUNT(*) >= 2;

# 4. 查询平均成绩大于80分的学生的总数
select COUNT(*) from students s where s.sid in(select sno from students s ,stu_course sc where(s.sid = sc.sno) group by sno having (AVG(sc.score)>80));

# 5. 查询学生和平均成绩，但是平均成绩大于01班的任何一个学生的平均成绩
select s.sname,avg(sc.score) from students s,stu_course sc where(s.sid = sc.sno) group by s.sname having(avg(sc.score) > any (select avg(sc.score) from students s,stu_course sc ,classes c where(s.sid=sc.sno and c.cname = '01班') group by s.sname));






















