<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bookify: Home Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
    position: relative;
    height: 50vh;
    width: 100%;
    overflow: hidden; /* Ensure the overflow is hidden to contain the blur */
}

.back-img::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: url("img/b.jpg") center/cover;
    filter: blur(5px); /* Adjust the blur strength as needed */
    z-index: -1; /* Ensure the pseudo-element is behind the text */
}

.back-img h2 {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: #dac292;
    z-index: 1; /* Ensure the text is above the blurred image */
}

.custom-color {
    background-color: #4f3222;
    border-color: #4f3222;
}


.crd-ho:hover {
	background-color: #fcf7f7;
}

.paint-card {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}

.text-center {
    color: brown; /* Desired text color */
    
}

</style>


</head>
<body style="background-color: #f7f7f7;">

	<%
	User u = (User) session.getAttribute("userobj");
	%>



	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
<h2 class="text-center" style="color: #dac292; text-shadow: 2px 2px 4px #4f3222; font-size: 36px; font-weight: bold; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: #3a2317;">Bookify: Online Book Retail Store</h2>


	
	</div>

	
	<!-- Start Recent Book -->

	<div class="container">
    <h3 class="text-center latest-book"><br>Latest Books</h3>
    <div><br></div>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho paint-card">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p><%=b.getAuthor()%></p>
						<p>

							<%
							if (b.getBookCategory().equals("Old")) {
							%>
							Categories:<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-warning btn-sm ml-5">View Details</a> 
								<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} 
							else {
						%>
						Categories:<%=b.getBookCategory()%></p>
						<div class="row">
    <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a> 
    <a href="" class="btn btn-light btn-sm ml-1" style="background-color: #4f3222; color : white;" ><i class="fas fa-rupee-sign"></i> <%=b.getPrice()%></a>
</div>

						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<br>
		<div class="text-center mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white custom-color">View All</a>

		</div>
	</div>

	<hr>

	<%@include file="all_component/footer.jsp"%>

</body>
</html>