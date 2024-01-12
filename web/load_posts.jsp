<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.Likedao"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%
    User user = (User) session.getAttribute("currentUser");

%>
<div class="row">
    <%        PostDao postdao = new PostDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        ArrayList<Post> postList = new ArrayList<>();
        if (cid == 0) {
            postList = postdao.getAllPosts();
        } else {
            postList = postdao.getPostsByCatId(cid);
        }

        if (postList.isEmpty()) {
            out.println("<h3 class='text-center'>No posts in this category</h3>");
            return;
        }
        for (Post p : postList) {
    %>

    <div class="col-md-6">
        <div class="card mt-2" style="border:1px solid dodgerblue">
            <div class="card-body">
                <h3><%= p.getpTitle()%></h3>
            </div>

            <div class="card-footer card-background">
                <% Likedao dao = new Likedao(ConnectionProvider.getConnection());%>

                <a href="#!" onclick="doLike(<%=p.getPid()%>,<%=user.getId()%>)" class="btn btn-outline-primary btn-sm likeButton<%=p.getPid()%>"><i class="fa fa-thumbs-o-up"></i><span class="likeCountSpan<%=p.getPid()%>"><%=dao.countLikesOnPost(p.getPid())%></span></a>


                <a href="#!" class="btn btn-outline-primary btn-sm m-1"><i class="fa fa-commenting-o"></i><span></span></a>
                <a href="show_post_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More...</a>

            </div>
        </div>
    </div>
    <%
        }
    %>

</div>