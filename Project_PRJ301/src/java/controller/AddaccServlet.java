/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig
@WebServlet(name = "AddaccServlet", urlPatterns = {"/addacc"})
public class AddaccServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddaccServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddaccServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String avatar = request.getParameter("avatarU");
        String user = request.getParameter("user");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String bought = request.getParameter("bought");
        String address = request.getParameter("address");
        String isAdmin = request.getParameter("isAdmin");
        String amount_raw = request.getParameter("amount");
        DAO dao = new DAO();
        double amount = Double.parseDouble(amount_raw);
        if (avatar != null && !avatar.equals("")) {
            dao.addAccount(avatar, user, pass, email, phone, amount, bought, address, isAdmin);
            response.sendRedirect("loadacc");
        } else {
            String customDirectory = "D:\\A\\Ky4\\SE1804-PRJ\\Project\\Project_PRJ301\\Project_PRJ301\\web\\images";
            Part part = request.getPart("avatar");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            Path imagePath = Paths.get(customDirectory, filename);
            if (!Files.exists(Paths.get(customDirectory))) {
                Files.createDirectories(Paths.get(customDirectory));
            }
            part.write(imagePath.toString());
            dao.addAccount("images/" + filename, user, pass, email, phone, amount, bought, address, isAdmin);
            response.sendRedirect("loadacc");
        }
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
