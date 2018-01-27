<%@page errorPage="MyError.jsp" %>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="mode.Connection_Pool" %>
<%@page import="beans.News" %>

<%
                                //int id=Integer.parseInt(request.getParameter("picId").toString());
                                //id=Integer.parseInt(request.getAttribute("picID").toString());
                                
                               /*try
                                {
                                    Connection con=Connection_Pool.getPoolConnection();
                                    PreparedStatement pst=con.prepareStatement("select * from news_table where news_id=?");
                                    pst.setInt(1, id);
                                    ResultSet rs=pst.executeQuery();
                                    if(rs.next())
                                    {
                                        Blob blob=rs.getBlob("photo");
                                        response.setContentType("image");
                                        byte []img=blob.getBytes(1,(int)blob.length());
                                        OutputStream o=response.getOutputStream();    
                                        o.write(img) ;
                                        o.flush();
                                        o.close();
                                    }
                                    rs.close();
                                    pst.close();
                                    con.close();
                                }
                                catch(Exception e)
                                {
                                    out.print("<h1>"+e.getMessage()+"</h1>");
                                }*/ 
                                
                                        //News news=(News)request.getAttribute("ns");
                                       News news=(News)session.getAttribute("ns");
                                        Blob blob=news.getPhoto();
                                        response.setContentType("image");
                                        byte []img=blob.getBytes(1,(int)blob.length());
                                        OutputStream o=response.getOutputStream();    
                                        o.write(img) ;
                                        o.flush();
                                        o.close();
                                       %>