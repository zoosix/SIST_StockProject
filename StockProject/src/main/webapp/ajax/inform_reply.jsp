<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/table.css" /> -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#comment_click").click(function() {
			var msg = "msg=" + $('#msg').val();
			var bno = "bno=" + $('#bno').val();
			var no = "no=" + $('#no').val();
			var en = "en=" + 1;
			var param = msg + "&" + bno + "&" + no + "&" + en;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);

				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		$("#prevpage_button, #nextpage_button").click(function() {
			var msg = "page=" + $(this).attr("name");
			var bno = "bno=" + $('#bno').val();
			var param = msg + "&" + bno;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		//댓글 달기
		$(".comment_comment_button").click(function() {
			var nno = $(this).attr("name");
			var msg = "msg=" + $('#rmsg' + nno).val();
			var bno = "bno=" + $('#bno').val();
			var page = "page=" + $('#page').val();
			var no = "no=" + $(this).attr("name");
			var re = "re=1";
			var param = page + "&" + no + "&" + msg + "&" + bno + "&" + re;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		//댓글수정하기
		$(".comment_update_button").click(function() {
			var nno = $(this).attr("name");
			var page = "page=" + $('#page').val();
			var no = "no=" + $(this).attr("name");
			var msg = "msg=" + $('#umsg' + nno).val();
			var up = "up=" + 1;
			var param = page + "&" + no + "&" + up + "&" + msg;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		//댓글 지우기
		$(".re_del_a").click(function() {
			var page = "page=" + $('#page').val();
			var no = "no=" + $(this).attr("name");
			var del = "del=" + 1;
			var param = page + "&" + no + "&" + del;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		$('.re_re_a').click(function() {
			var no = $(this).attr("name");
			if ($('#re_re_update' + no).is(":visible") == true) {
				$('#re_re_update' + no).toggle();
			}
			$('#re_re_write' + no).toggle();

		});
		$('.re_up_a').click(function() {
			var no = $(this).attr("name");
			if ($("#re_re_write" + no).is(":visible") == true) {
				$('#re_re_write' + no).toggle();
			}
			$('#re_re_update' + no).toggle();
		});
		$("#comment_click").click(function() {
			var msg = "msg=" + $('#msg').val();
			var bno = "bno=" + $('#bno').val();
			var no = "no=" + $('#no').val();
			var en = "en=" + 1;
			var param = msg + "&" + bno + "&" + no + "&" + en;
			$.ajax({
				type : "POST",
				url : "inform_reply.do",
				data : param,
				success : function(result) {
					$('.comment_view').html(result);

				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});
		});
		$("#modal_click").click(function() {
			$('.modal').toggleClass('modal--show');
		});
	});
</script>
</head>
<body>
	<center>

		<table class="mdl-data-table mdl-js-data-table mdl-data-table">
			<h3>한줄코멘트 보기</h3>
			<c:if test="${sessionScope.email!=null }">
				<input type="text" id="msg" size="50"
					style="height: 30px; font-size: 13px;">&nbsp;
		<button class="mdl-button mdl-js-button mdl-button--raised"
					id="comment_click">한줄코멘트등록</button>
				<input type="hidden" id="page" value="${curpage}">
				<input type="hidden" id="bno" value="${bno}">
			</c:if>
			<c:if test="${sessionScope.email==null }">
				<h5>한줄코멘트를 작성하기 위해 로그인이 필요합니다.</h5>
				<button class="mdl-button mdl-js-button mdl-button--raised"
					id="modal_click">로그인하기</button>
			</c:if>
			<br>
			<br>


			<c:forEach var="rDto" items="${list }">
				<tr>
					<td align=left><c:if test="${rDto.group_tab!=0 }">
							<c:forEach var="i" begin="1" end="${rDto.group_tab }">
               &nbsp;&nbsp;
              </c:forEach>
							<img src="image/re_icon.gif">
						</c:if> <font color=blue>${rDto.email }</font> (${rDto.dbday }) <c:if
							test="${rDto.group_tab!=0 }">
							<c:forEach var="i" begin="1" end="${rDto.group_tab }">
               &nbsp;&nbsp;
              </c:forEach>
						</c:if> &nbsp;:&nbsp; ${rDto.msg }</td>
					<td align=right><c:if test="${sessionScope.email!=null }">
							<%--   	<c:if test="${rDto.group_tab==0 }">
            └<a href="#" class="re_re_a" name="${rDto.no }">댓글달기</a>&nbsp;
            	</c:if> --%>
							<c:if test="${sessionScope.email==rDto.email }"> 
             └<a href="#" class="re_up_a" name="${rDto.no }">수정</a>&nbsp;
             └<a href="#" name="${rDto.no}" class="re_del_a">삭제</a>&nbsp;
              </c:if>
						</c:if></td>
				</tr>
				<%--      <tr id="re_re_write${rDto.no }" style="display:none">
	          <td colspan="2">
	          <span style="display: block;float: left;height: 50px">
	          	<textarea rows="3" cols="55" name=rmsg id="rmsg${rDto.no }" style="vertical-align: middle;"></textarea>
	            <input type="button" value="댓글달기" style="height: 50px" class="comment_comment_button" name="${rDto.no }" >
	          </span>
	         </td>
	        </tr> --%>
				<tr id="re_re_update${rDto.no }" style="display: none">
					<td colspan="2"><span
						style="display: block; float: left; height: 50px"> <textarea
								rows="3" cols="55" name=umsg id="umsg${rDto.no }"
								style="vertical-align: middle;">${rDto.msg }</textarea> <input
							type="button" value="수정하기" style="height: 50px"
							class="comment_update_button" name="${rDto.no }">
					</span></td>
				</tr>
			</c:forEach>
		</table>

		<table border=0 width=600>
			<tr>
				<td align=right>
					<center>
						<%-- <input type=button id="prevpage_button" value="prev" name="${curpage>1?curpage-1:curpage}">&nbsp; --%>
						<button class="mdl-button mdl-js-button mdl-button--icon"
							id="prevpage_button" name="${curpage>1?curpage-1:curpage}">
							<i class="material-icons">arrow_back</i>
						</button>
						&nbsp;
						<%-- <input type=button id="nextpage_button" value="next" name="${curpage<totalpage?curpage+1:curpage}">&nbsp;&nbsp; --%>
						<button class="mdl-button mdl-js-button mdl-button--icon"
							id="nextpage_button"
							name="${curpage<totalpage?curpage+1:curpage}">
							<i class="material-icons">arrow_forward</i>
						</button>
						&nbsp;&nbsp;
					</center>
				</td>
			</tr>
		</table>

	</center>
</body>
</html>
