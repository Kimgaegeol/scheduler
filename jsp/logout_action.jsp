<%@ page language= "java" contentType="text/html" pageEncoding="utf-8" %>

<%
    if(session.getAttribute("user_idx") == null) {
        session.invalidate();
%>
    <script>
        alert("세션이 만료되었습니다.");
        location.href = "./index.jsp";
    </script>
<%
    }
    session.invalidate();
%>
<script>
    location.href = "./index.jsp";
</script>

