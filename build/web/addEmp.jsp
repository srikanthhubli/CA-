<!-- A jsp to insert record through hibernate -->
<%@ page import="mypack.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%!
int empno;double salary;String name; Session session1 = null;
%>
<body>
<%
    String num1=request.getParameter("t1");
if(num1 != null)
{
empno=Integer.parseInt(num1);
name=request.getParameter("t2");
String sal=request.getParameter("t3");
salary=Integer.parseInt(sal);
try
{
Configuration cf=new Configuration();
cf.configure();
//SessionFactory sessionFactory = cf.buildSessionFactory();
//session1 =sessionFactory.openSession();
//Emp e=new Emp(empno,name,salary);
//session1.save(e);
//session1.flush();
//session1.close();
//out.println("<h1> Data Inserted Successfully </h1>");
SessionFactory sessionfactory=new AnnotationConfiguration().configure().buildSessionFactory();
session1=sessionfactory.openSession();
Emp obj_Employee=new Emp(empno,name,salary);
//obj_Employee.setSl_no(2);
//obj_Employee.setEmployee_name("Emplyee One");
//obj_Employee.setMobil_no("111111");
session1.save(obj_Employee);
session1.beginTransaction().commit();
session1.close();
sessionfactory.close();
out.println("<h1> Data Inserted Successfully </h1>");
}
catch(Exception e)
{
System.out.println("e="+e.getMessage());
}
}
%>
<form>
    <table width="352" border="1">
<tr>
<th>Emp Number</th>
<td><input name="t1" type="text"></td>
</tr>
<tr>
<th> Name </th>
<td><input name="t2" type="text"></td>
</tr>
<tr>
<th>Salary </th>
<td><input name="t3" type="text"></td>
</tr>
<tr>
<th colspan="2"><input type="submit"value="Submit" >
</th>
</tr>
</table>
<br/>
<a href="showEmp.jsp"> <input type="button" value="Display Employee" /> </a>
<a href="index.xhtml"> <input type="button" value="Home" /> </a>
</form>
</body>
</html>