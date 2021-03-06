<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet prefetch'
	href='http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css'>
<link rel="stylesheet" href="member/mp_css/style.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
	<section id="portfolio">
	<div class="container">
		<c:forEach var="f" items="${list }">
			<div class="col-sm-3" style="margin: 20px;">
				<div class="panel panel-default text-center">
					<div class="panel-body">
						<table class="order-table">
							<thead>
								<tr>
									<th>현재가<br><br></th>
									<th>전일대비<br><br></th>
									<th>등락률<br><br></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${f.lastPrice }<br><br></td>
									<td>${f.previousClose }<br><br></td>
									<td>${f.rate}<br><br></td>
								</tr>
							</tbody>
							</table>
							<div class="panel-footer plan">
								<a href="inform_main.do?bno=6"><button class="btn btn-lg" style="font-size: 12px;">${f.name }</button></a>
							</div>
					</div>
				</div>
			</div>

		</c:forEach>
	</div>
	</section>
	<script src="member/mp_js/index.js"></script>

</body>
</html>
