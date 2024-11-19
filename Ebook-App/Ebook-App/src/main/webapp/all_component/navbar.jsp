<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.entity.User"%>
<%@page import="com.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid" style="height: 5px; background-color: #dac292"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row align-items-center">
        <div class="col-md-3 text-success">
            <a href="index.jsp" style="text-decoration: none; color: #dac292;">
                <h3 style="display: flex; align-items: center;">
                    <img src="all_component/logo.png" style="width: 45px; height: 38px; border-radius: 30%; background-color: #dac292; border: 2px solid #3a2317; box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);">
                    <span style="margin-left: 10px;">Bookify</span>
                </h3>
            </a>
        </div>

        <div class="col-md-6">
            <form class="form-inline" action="search.jsp" method="post">
                <input class="form-control mr-2" type="search" name="ch" placeholder="Search" aria-label="Search">
                <button class="btn btn-primary" type="submit">Search</button>
            </form>
        </div>

        <div class="col-md-3 text-right">
            <a href="checkout.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i> Cart</a>

            <c:if test="${not empty userobj}">
                <a href="#" class="btn btn-success ml-1">${userobj.name}</a>
                <a href="logout" class="btn btn-primary text-white ml-1">Logout</a>
            </c:if>

            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn btn-success ml-1"><i class="fas fa-sign-in-alt"></i> Login</a>
                <a href="register.jsp" class="btn btn-primary text-white ml-1"><i class="fas fa-user-plus"></i> Register</a>
            </c:if>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom" style="background-color: #4f3222; position: relative; z-index: 0;">
    <a class="navbar-brand" href="index.jsp"><i class="fas fa-home"></i></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="index.jsp">Home
                    <span class="sr-only">(current)</span>
            </a></li>
            <!-- <li class="nav-item active"><a class="nav-link"
                href="all_recent_book.jsp"><i class="fas fa-book-open"></i>
                    Recent Book</a></li> -->

            <li class="nav-item dropdown">
                <a class="nav-link active dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Categories </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="all_recent_book.jsp">All</a>

                    <% 
                        BookDAOImpl daox = new BookDAOImpl(DBConnect.getConn());
                        List<Category> listx = daox.getAllCategory();
                        for (Category c : listx) { 
                    %>
                    <a class="dropdown-item" href="catogory_book.jsp?ca=<%=c.getCategoryName()%>"><%=c.getCategoryName()%></a>
                    <% 
                        } 
                    %>
                </div>
            </li>

            <li class="nav-item active"><a class="nav-link disabled" href="all_old_book.jsp"><i class="fas fa-book-open"></i> Old Books</a></li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <a href="setting.jsp" class="btn btn-custom my-2 my-sm-2 " type="submit">
                <i class="fas fa-cog"></i> Settings
            </a>
            <a href="helpline.jsp" class="btn btn-custom my-2 my-sm-0 ml-1" type="submit">
                <i class="fas fa-users"></i> Meet Our Team
            </a>
        </form>
    </div>
</nav>

<style>
    .btn-custom {
        background-color: #dac292;
        border-color: #dac292;
        color: #3a2317; /* Change text color to a darker shade */
    }

    .btn-custom:hover {
        background-color: #3a2317; /* Change background color on hover */
        border-color: #3a2317;
        color: #dac292; /* Change text color on hover */
    }
</style>
