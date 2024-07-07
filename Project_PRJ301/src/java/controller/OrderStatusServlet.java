/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.OrderDetail;

/**
 *
 * @author admin
 */
@WebServlet(name = "OrderStatusServlet", urlPatterns = {"/orderstatus"})
public class OrderStatusServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderStatusServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderStatusServlet at " + request.getContextPath() + "</h1>");
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
        String key = request.getParameter("key");
        String sort_raw = request.getParameter("sort");
        int sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
        String indexpage = request.getParameter("index");
        if (indexpage == null) {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        OrderDAO odao = new OrderDAO();
        int countP = odao.countOrder(0, index, key, sort);
        int endpage = countP / 5;
        if (countP % 5 != 0) {
            endpage++;
        }        
        List<OrderDetail> list = odao.getOrderDetailByAid(0, index, key, sort);
        request.setAttribute("key", key);
        request.setAttribute("sort", sort);
        request.setAttribute("list", list);
        request.setAttribute("page", index);
        request.setAttribute("countP", countP);
        request.setAttribute("endP", endpage);
        request.getRequestDispatcher("orderstatus.jsp").forward(request, response);
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
        String key = request.getParameter("key");
        String sort_raw = request.getParameter("sort");
        int sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
        String indexpage = request.getParameter("index");
        if (indexpage == null) {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        OrderDAO odao = new OrderDAO();
        int countP = odao.countOrder(0, index, key, sort);
        int endpage = countP / 5;
        if (countP % 5 != 0) {
            endpage++;
        }        
        List<OrderDetail> list = odao.getOrderDetailByAid(0, index, key, sort);
        request.setAttribute("key", key);
        request.setAttribute("sort", sort);
        request.setAttribute("list", list);
        request.setAttribute("page", index);
        request.setAttribute("countP", countP);
        request.setAttribute("endP", endpage);
        request.getRequestDispatcher("orderstatus.jsp").forward(request, response);
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
