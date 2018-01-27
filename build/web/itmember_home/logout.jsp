

<%   
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
session=request.getSession(false);
session.removeAttribute("username");
session.invalidate();
response.sendRedirect("../login.jsp");
%>
