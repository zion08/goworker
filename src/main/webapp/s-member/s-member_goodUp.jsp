<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.SmemberDAO" %>
<jsp:useBean class="bean.SmemberDTO"  id="dto" />
<jsp:setProperty property="num" name="dto" /> 

<script type="text/javascript">
function bttn() {
		opener.document.location.reload();
		self.close();
}
	</script>


<h1>좋아요를 눌렀습니다!</h1>
<% SmemberDAO dao = new SmemberDAO();
	dao.goodUp(dto);
%>
<center>
	<input type="button" value="닫기" onclick="bttn()" />
</center>	