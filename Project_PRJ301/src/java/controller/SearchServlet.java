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
import java.sql.Date;
import java.util.List;
import model.Category;
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String[] cid_raw = request.getParameterValues("cid");
        String key = request.getParameter("key");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        String fromdate_raw = request.getParameter("fromdate");
        String todate_raw = request.getParameter("todate");
        Double fromprice = null, toprice = null;
        Date fromdate = null, todate = null;
        int[] cid = null;
        DAO dao = new DAO();
        if (cid_raw != null) {
            cid = new int[cid_raw.length];
            for (int i = 0; i < cid.length; i++) {
                cid[i] = Integer.parseInt(cid_raw[i]);
            }
        }
        String sort_raw = request.getParameter("sort");
        String index_page = request.getParameter("index");
        int sort = 0, index = 0;
        if (index_page == null) {
            index_page = "1";
        }
        try {
            index = Integer.parseInt(index_page);
            sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
            fromprice = (fromprice_raw == null || fromprice_raw.equals(""))
                    ? null : Double.parseDouble(fromprice_raw);
            toprice = (toprice_raw == null || toprice_raw.equals(""))
                    ? null : Double.parseDouble(toprice_raw);
            fromdate = (fromdate_raw == null || fromdate_raw.equals(""))
                    ? null : Date.valueOf(fromdate_raw);
            todate = (todate_raw == null || todate_raw.equals(""))
                    ? null : Date.valueOf(todate_raw);
        } catch (NumberFormatException e) {
        }
        int countP = dao.countSearchProduct(cid, key, fromprice, toprice, fromdate, todate);
        int endpage = countP / 9;
        if (countP % 9 != 0) {
            endpage++;
        }
        List<Category> listC = dao.getAllCategory();
        List<Product> listS = dao.search(cid, key, fromprice, toprice, fromdate, todate, sort, index);
        request.setAttribute("fromdate", fromdate);
        request.setAttribute("todate", todate);
        request.setAttribute("fromprice", fromprice);
        request.setAttribute("toprice", toprice);
        request.setAttribute("key", key);
        request.setAttribute("cid", cid);
        request.setAttribute("listS", listS);
        request.setAttribute("page", index);
        request.setAttribute("listC", listC);
        request.setAttribute("sort", sort);
        request.setAttribute("endP", endpage);
        request.setAttribute("countP", countP);
        request.getRequestDispatcher("index.jsp").forward(request, response);
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
        doGet(request, response);
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
