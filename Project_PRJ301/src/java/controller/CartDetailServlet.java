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
@WebServlet(name = "CartDetailServlet", urlPatterns = {"/cartdetail"})
public class CartDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet CartDetailServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartDetailServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO odao = new OrderDAO();
        String key = request.getParameter("key");
        String sort_raw = request.getParameter("sort");
        int sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
        String indexpage = request.getParameter("index");
        if (indexpage == null) {
            indexpage = "1";
        }
        int index = Integer.parseInt(indexpage);
        String aid_raw = request.getParameter("aid");
        int aid = Integer.parseInt(aid_raw);
        int countP = odao.countOrder(aid, index, key, sort);
        int endpage = countP / 5;
        if (countP % 5 != 0) {
            endpage++;
        }
        try {
            int totalM = odao.TotalMoney(aid);
            List<OrderDetail> listOD = odao.getOrderDetailByAid(aid, index, key, sort);
            request.setAttribute("totalM", totalM);
            request.setAttribute("page", index);
            request.setAttribute("countP", countP);
            request.setAttribute("endP", endpage);
            request.setAttribute("listOD", listOD);
            request.setAttribute("key", key);
            request.setAttribute("sort", sort);
            request.getRequestDispatcher("cartdetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
        }
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
