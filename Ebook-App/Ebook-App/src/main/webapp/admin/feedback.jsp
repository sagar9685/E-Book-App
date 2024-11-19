<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h3 class="text-center">Book Review</h3>

	<c:if test="${not empty succMsg }">
		<h5 class="text-center text-success">${succMsg }</h5>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty failedMsg }">
		<h5 class="text-center text-danger">${failedMsg }</h5>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	<div class="container-fluid">
		<table class="table table-striped">
			<thead style="background-color: #dac292; color:white; text:white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">ISBN No</th>
					<th scope="col">Price</th>
					<th scope="col">Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
				List<BookDtls> list = dao.getAllBooks();
				for (BookDtls b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><img src="../book/<%=b.getPhotoName()%>"
						style="width: 50px; height: 50Px;"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getIsbn()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><%=b.getStatus()%></td>
					<<td>
    <a href="view_feedback.jsp?id=<%=b.getBookId()%>"
       class="btn btn-sm btn-custom"><i class="fas fa-edit"></i> Feedback</a>
</td>
<style>
.btn-custom {
    background-color: #dac292;
    border-color: #dac292;
    color: #ffffff; /* Text color */
}

.btn-custom:hover {
    background-color: #c39a6b; /* Change color on hover if needed */
    border-color: #c39a6b;
    color: #ffffff; /* Text color on hover */
}

</style>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
	</div>
	<div style="margin-top: 430px;">
		<%@include file="footer.jsp"%></div>
</body>
</html>