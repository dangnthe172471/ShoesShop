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

/**
 *
 * @author admin
 */
@WebServlet(name = "StatisticalServlet3", urlPatterns = {"/statistical3"})
public class StatisticalServlet3 extends HttpServlet {

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
            out.println("<title>Servlet StatisticalServlet3</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticalServlet3 at " + request.getContextPath() + "</h1>");
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
        String year_raw = request.getParameter("year");
        int year = Integer.parseInt(year_raw);
        double t1 = odao.getTotalByMonth(1, year);
        double t2 = odao.getTotalByMonth(2, year);
        double t3 = odao.getTotalByMonth(3, year);
        double t4 = odao.getTotalByMonth(4, year);
        double t5 = odao.getTotalByMonth(5, year);
        double t6 = odao.getTotalByMonth(6, year);
        double t7 = odao.getTotalByMonth(7, year);
        double t8 = odao.getTotalByMonth(8, year);
        double t9 = odao.getTotalByMonth(9, year);
        double t10 = odao.getTotalByMonth(10, year);
        double t11 = odao.getTotalByMonth(11, year);
        double t12 = odao.getTotalByMonth(12, year);
        request.setAttribute("month1", t1);
        request.setAttribute("month2", t2);
        request.setAttribute("month3", t3);
        request.setAttribute("month4", t4);
        request.setAttribute("month5", t5);
        request.setAttribute("month6", t6);
        request.setAttribute("month7", t7);
        request.setAttribute("month8", t8);
        request.setAttribute("month9", t9);
        request.setAttribute("month10", t10);
        request.setAttribute("month11", t11);
        request.setAttribute("month12", t12);
        request.setAttribute("year", year);
        request.getRequestDispatcher("statistical3.jsp").forward(request, response);
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
