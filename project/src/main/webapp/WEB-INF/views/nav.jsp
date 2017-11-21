  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="<spring:url value='/resource/image/bun.jpg' />" height="50" width="100"/></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="<%=request.getContextPath()%>">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/post/list">Listing Posts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<%=request.getContextPath()%>/post/add">Adding Posts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="<spring:url value='/logout' />">Logout</a>
            </li>
          </ul>
        </div>
      </div>
      
      <section>
		<div class="pull-right" style="padding-right:50px">
			<a href="?language=en">English</a>|<a href="?language=zh_CN">Chinese</a>
		</div>
	  </section>
      
    </nav>
<br/><br/>
   