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
@WebServlet(name = "StatisticalServlet4", urlPatterns = {"/statistical4"})
public class StatisticalServlet4 extends HttpServlet {

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
            out.println("<title>Servlet StatisticalServlet4</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatisticalServlet4 at " + request.getContextPath() + "</h1>");
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
        String cid = request.getParameter("cid");
        int year = Integer.parseInt(year_raw);
        double t1 = odao.getTotalPByMonth(1, year, "1");
        double t2 = odao.getTotalPByMonth(2, year, "1");
        double t3 = odao.getTotalPByMonth(3, year, "1");
        double t4 = odao.getTotalPByMonth(4, year, "1");
        double t5 = odao.getTotalPByMonth(5, year, "1");
        double t6 = odao.getTotalPByMonth(6, year, "1");
        double t7 = odao.getTotalPByMonth(7, year, "1");
        double t8 = odao.getTotalPByMonth(8, year, "1");
        double t9 = odao.getTotalPByMonth(9, year, "1");
        double t10 = odao.getTotalPByMonth(10, year, "1");
        double t11 = odao.getTotalPByMonth(11, year, "1");
        double t12 = odao.getTotalPByMonth(12, year, "1");
        double t_1 = odao.getTotalPByMonth(1, year, "2");
        double t_2 = odao.getTotalPByMonth(2, year, "2");
        double t_3 = odao.getTotalPByMonth(3, year, "2");
        double t_4 = odao.getTotalPByMonth(4, year, "2");
        double t_5 = odao.getTotalPByMonth(5, year, "2");
        double t_6 = odao.getTotalPByMonth(6, year, "2");
        double t_7 = odao.getTotalPByMonth(7, year, "2");
        double t_8 = odao.getTotalPByMonth(8, year, "2");
        double t_9 = odao.getTotalPByMonth(9, year, "2");
        double t_10 = odao.getTotalPByMonth(10, year, "2");
        double t_11 = odao.getTotalPByMonth(11, year, "2");
        double t_12 = odao.getTotalPByMonth(12, year, "2");
        double t_2_1 = odao.getTotalPByMonth(1, year, "3");
        double t_2_2 = odao.getTotalPByMonth(2, year, "3");
        double t_2_3 = odao.getTotalPByMonth(3, year, "3");
        double t_2_4 = odao.getTotalPByMonth(4, year, "3");
        double t_2_5 = odao.getTotalPByMonth(5, year, "3");
        double t_2_6 = odao.getTotalPByMonth(6, year, "3");
        double t_2_7 = odao.getTotalPByMonth(7, year, "3");
        double t_2_8 = odao.getTotalPByMonth(8, year, "3");
        double t_2_9 = odao.getTotalPByMonth(9, year, "3");
        double t_2_10 = odao.getTotalPByMonth(10, year, "3");
        double t_2_11 = odao.getTotalPByMonth(11, year, "3");
        double t_2_12 = odao.getTotalPByMonth(12, year, "3");
        double t_3_1 = odao.getTotalPByMonth(1, year, "4");
        double t_3_2 = odao.getTotalPByMonth(2, year, "4");
        double t_3_3 = odao.getTotalPByMonth(3, year, "4");
        double t_3_4 = odao.getTotalPByMonth(4, year, "4");
        double t_3_5 = odao.getTotalPByMonth(5, year, "4");
        double t_3_6 = odao.getTotalPByMonth(6, year, "4");
        double t_3_7 = odao.getTotalPByMonth(7, year, "4");
        double t_3_8 = odao.getTotalPByMonth(8, year, "4");
        double t_3_9 = odao.getTotalPByMonth(9, year, "4");
        double t_3_10 = odao.getTotalPByMonth(10, year, "4");
        double t_3_11 = odao.getTotalPByMonth(11, year, "4");
        double t_3_12 = odao.getTotalPByMonth(12, year, "4");
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

        request.setAttribute("month_1", t_1);
        request.setAttribute("month_2", t_2);
        request.setAttribute("month_3", t_3);
        request.setAttribute("month_4", t_4);
        request.setAttribute("month_5", t_5);
        request.setAttribute("month_6", t_6);
        request.setAttribute("month_7", t_7);
        request.setAttribute("month_8", t_8);
        request.setAttribute("month_9", t_9);
        request.setAttribute("month_10", t_10);
        request.setAttribute("month_11", t_11);
        request.setAttribute("month_12", t_12);

        request.setAttribute("month_2_1", t_2_1);
        request.setAttribute("month_2_2", t_2_2);
        request.setAttribute("month_2_3", t_2_3);
        request.setAttribute("month_2_4", t_2_4);
        request.setAttribute("month_2_5", t_2_5);
        request.setAttribute("month_2_6", t_2_6);
        request.setAttribute("month_2_7", t_2_7);
        request.setAttribute("month_2_8", t_2_8);
        request.setAttribute("month_2_9", t_2_9);
        request.setAttribute("month_2_10", t_2_10);
        request.setAttribute("month_2_11", t_2_11);
        request.setAttribute("month_2_12", t_2_12);

        request.setAttribute("month_3_1", t_3_1);
        request.setAttribute("month_3_2", t_3_2);
        request.setAttribute("month_3_3", t_3_3);
        request.setAttribute("month_3_4", t_3_4);
        request.setAttribute("month_3_5", t_3_5);
        request.setAttribute("month_3_6", t_3_6);
        request.setAttribute("month_3_7", t_3_7);
        request.setAttribute("month_3_8", t_3_8);
        request.setAttribute("month_3_9", t_3_9);
        request.setAttribute("month_3_10", t_3_10);
        request.setAttribute("month_3_11", t_3_11);
        request.setAttribute("month_3_12", t_3_12);

        request.setAttribute("year", year);
        request.getRequestDispatcher("statistical4.jsp").forward(request, response);
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
