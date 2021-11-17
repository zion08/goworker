<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.CommentDAO" %>
<%@ page import="bean.CommentDTO" %>

    
<h1> admin_commentUpdate.jsp</h1>    



<%	
	request.setCharacterEncoding("UTF-8");
	String comment_writerid = "관리자";
	String board_name = request.getParameter("board_name");
	String comment_content = "관리자에 의해 삭제된 댓글입니다";
	int board_num = Integer.parseInt(request.getParameter("board_num"));
	int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	int result = 0;
	
	CommentDTO cdto = new CommentDTO();
	cdto.setBoard_name(board_name);
	cdto.setBoard_num(board_num);
	cdto.setComment_num(comment_num);
	cdto.setComment_content(comment_content);
	cdto.setComment_writerid(comment_writerid);
	
	CommentDAO cdao = new CommentDAO();
	
	
	if(board_name !=null){
		if(board_name.equals("멤버찾기")){
			result = cdao.updateSMC(cdto);
		}
		if(board_name.equals("프로젝트찾기")){
			result = cdao.updateSPC(cdto);
		}
		if(board_name.equals("프로젝트만들기")){
			result = cdao.updateMPC(cdto);
		}
	} System.out.println(board_name);
	
	
	if(result ==1) { 
	%>
		 <script type="text/javascript">
			alert("댓글이 블라인드 되었습니다.");
			window.location = "/goworker/admin/admin_comment.jsp";
			
	</script>
	<% }else{%>
		 <script type="text/javascript">
			alert("오류 발생");
			window.location = "/goworker/admin/admin_comment.jsp";
			
	</script>

	<%} %>