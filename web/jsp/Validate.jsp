
<%@ page import ="java.sql.*" %>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
    Connection conn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk/" + "18agileteam1db", "18agileteam1", "7845.at1.5487");
    PreparedStatement pst = conn.prepareStatement("Select Username,Password from teachers where Username='a' and Password='b'");
    pst.setString(1, "a");
    pst.setString(2, "b");
    ResultSet rs = pst.executeQuery();
    if(rs.next())
       System.out.println("Valid login credentials");
    else
       System.out.println("Invalid login credentials");
}
catch(Exception e){
   out.println("Something went wrong !! Please try again");
}
%>
