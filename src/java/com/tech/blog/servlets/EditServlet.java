package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //fetch data from request
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userGender = request.getParameter("user_gender");

            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");

            //update user details
            user.setName(userName);
            user.setPassword(userPassword);
            user.setGender(userGender);

            UserDao userdao = new UserDao(ConnectionProvider.getConnection());

            if (userdao.updateUserProfile(user)) {
//                out.println("Updated the profile");
                Message msg = new Message("Updated the profile.", "success", "alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            } else {
//                out.println("Error occured while updating the details.");
                Message msg = new Message("Error occured while updating the details.", "error", "alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
