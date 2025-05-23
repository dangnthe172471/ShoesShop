/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to editProduct this template
 */
package controller;

import dal.CommentDAO;
import dal.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Category;
import model.Comment;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "DetailServlet", urlPatterns = {"/detail"})
public class DetailServlet extends HttpServlet {

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
            out.println("<title>Servlet DetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DetailServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to editProduct the code.">
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
        String id = request.getParameter("pid");
        DAO dao = new DAO();
        CommentDAO cdao = new CommentDAO();
        String indexpage = request.getParameter("index");
        if (indexpage == null) {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        int countP = cdao.countCommentByPid(id);
        int endpage = countP / 6;
        if (countP % 6 != 0) {
            endpage++;
        }
        List<Comment> listCo = cdao.displayComment(id, index);
        Product p = dao.getProductByID(id);
        List<Product> listP = dao.listProductByPid(id);
        List<Category> listC = dao.getAllCategory();
        Product last = dao.getLast();
        request.setAttribute("detail", p);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("listCo", listCo);
        request.setAttribute("p", last);
        request.setAttribute("page", index);
        request.setAttribute("countP", countP);
        request.setAttribute("endP", endpage);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
       String id = request.getParameter("pid");
        DAO dao = new DAO();
        CommentDAO cdao = new CommentDAO();
        String indexpage = request.getParameter("index");
        if (indexpage == null) {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        int countP = cdao.countCommentByPid(id);
        int endpage = countP / 6;
        if (countP % 6 != 0) {
            endpage++;
        }
        List<Comment> listCo = cdao.displayComment(id, index);
        Product p = dao.getProductByID(id);
        List<Product> listP = dao.listProductByPid(id);
        List<Category> listC = dao.getAllCategory();
        Product last = dao.getLast();
        request.setAttribute("detail", p);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("listCo", listCo);
        request.setAttribute("p", last);
        request.setAttribute("page", index);
        request.setAttribute("countP", countP);
        request.setAttribute("endP", endpage);
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
