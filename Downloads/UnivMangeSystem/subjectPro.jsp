<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");
   String sid = (String)session.getAttribute("s_id");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   Statement stmt1 = null;
   String str = "";
   ResultSet rs = null;
   ResultSet rs1 = null;
   String url = "jdbc:oracle:thin:@localhost:1521:xe";
   String dbId = "c##ysu";
   String dbPass = "1234";
    
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, dbId, dbPass); %>
   
   <% String subids[] = request.getParameterValues("sub_id");
   for(String subid : subids){ 
   
					String sql1 = "select prof_id, sub_id from prof_subject where '"+ subid +"'= sub_id";
    			    stmt = conn.createStatement();
    			    rs = stmt.executeQuery(sql1);	 	  

                        while(rs.next()){
                            String prof_id = rs.getString("prof_id");
                            String sub_id = rs.getString("sub_id");
							String sql2 = "select s_id, registration.sub_id from registration where registration.sub_id = '"+sub_id+"'and s_id='"+sid+"'";
							stmt1 = conn.createStatement();
							rs1 = stmt1.executeQuery(sql2);
								if(rs1.next()){
									%> 
						               <script type="text/javascript">
						               alert("이미 신청된 과목입니다."); 
						               location.href='schedule.jsp';
						                </script>
						            <%
							} 	
								else{			
                                System.out.println(sub_id);		
                                String sql = "insert into registration(sub_id, s_id, prof_id) values (?, ?, ?)";
                                pstmt = conn.prepareStatement(sql);
                                pstmt.setString(1,sub_id);
                                pstmt.setString(2, sid);
                                pstmt.setString(3, prof_id);
                                pstmt.executeUpdate();
                                %> 

                                <script type="text/javascript">
                                alert("과목이 신청됐습니다."); 
                                location.href='schedule.jsp';
                                 </script>
                              <%

							}
                            }

   }
   %>

