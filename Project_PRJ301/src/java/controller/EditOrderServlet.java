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
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author admin
 */
@WebServlet(name = "EditOrderServlet", urlPatterns = {"/editorder"})
public class EditOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet EditOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditOrderServlet at " + request.getContextPath() + "</h1>");
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
        String pname = request.getParameter("pname");
        String oid = request.getParameter("oid");
        String pid = request.getParameter("pid");
        String aid = request.getParameter("aid");
        String date = request.getParameter("odate");
        String status = request.getParameter("status");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        double price = Double.parseDouble(price_raw);
        double quantity = Double.parseDouble(quantity_raw);
        OrderDAO odao = new OrderDAO();
        HttpSession session = request.getSession(true);
        Account account = (Account) session.getAttribute("account");
        odao.editOrder(quantity, price, oid, date, status, phone, email, address, aid, pname, pid);
        response.sendRedirect("cartdetail?aid=" + account.getId());
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
        String pname = request.getParameter("pname");
        String oid = request.getParameter("oid");
        String pid = request.getParameter("pid");
        String aid = request.getParameter("aid");
        String date = request.getParameter("odate");
        String status = request.getParameter("status");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        double price = Double.parseDouble(price_raw);
        double quantity = Double.parseDouble(quantity_raw);
        OrderDAO odao = new OrderDAO();
        odao.editOrder(quantity, price, oid, date, status, phone, email, address, aid, pname, pid);
        response.sendRedirect("orderstatus");
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
