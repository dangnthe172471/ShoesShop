/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Product;

/**
 *
 * @author admin
 */
@WebServlet(name = "SearchByAjaxServlet", urlPatterns = {"/searchbyajax"})
public class SearchByAjaxServlet extends HttpServlet {

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
            out.println("<title>Servlet SearchByAjaxServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchByAjaxServlet at " + request.getContextPath() + "</h1>");
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
        String[] cid_raw = request.getParameterValues("cid");
        String key = request.getParameter("key");
        String fromprice_raw = request.getParameter("fromprice");
        String toprice_raw = request.getParameter("toprice");
        String fromdate_raw = request.getParameter("fromdate");
        String todate_raw = request.getParameter("todate");
        Double fromprice, toprice;
        Date fromdate, todate;
        int[] cid = null;
        DAO dao = new DAO();
        if (cid_raw != null) {
            cid = new int[cid_raw.length];
            for (int i = 0; i < cid.length; i++) {
                cid[i] = Integer.parseInt(cid_raw[i]);
            }
        }
        String sort_raw = request.getParameter("sort");
        String indexpage = request.getParameter("index");
        int sort, index;
        if (indexpage == null) {
            indexpage = "1";
        }
        index = Integer.parseInt(indexpage);
        sort = (sort_raw == null) ? 0 : Integer.parseInt(sort_raw);
        fromprice = ((fromprice_raw == null || fromprice_raw.equals("")))
                ? null : Double.parseDouble(fromprice_raw);
        toprice = ((toprice_raw == null || toprice_raw.equals("")))
                ? null : Double.parseDouble(toprice_raw);
        fromdate = ((fromdate_raw == null || fromdate_raw.equals("")))
                ? null : Date.valueOf(fromdate_raw);
        todate = ((todate_raw == null || todate_raw.equals("")))
                ? null : Date.valueOf(todate_raw);
        int countP = dao.countSearchProduct(cid, key, fromprice, toprice, fromdate, todate);
        int endpage = countP / 9;
        if (countP % 9 != 0) {
            endpage++;
        }
        List<Product> listS = dao.search(cid, key, fromprice, toprice, fromdate, todate, sort, index);
        PrintWriter out = response.getWriter();
        for (Product o : listS) {
            out.print("<div class=\"col-12 col-md-4 col-lg-4\">\n"
                    + "                                        <div class=\"card\" >\n"
                    + "                                            <img src=\"" + o.getImage() + "\" alt=\"Card image cap\" style=\"height: 250px;\">\n"
                    + "                                            <div class=\"card-body\">\n"
                    + "                                                <h4 class=\"card-title show_txt\" style=\"font-size: 18px;\"><a href=\"detail?pid=" + o.getId() + "\" title=\"${o.name}\">" + o.getName() + "</a></h4>\n"
                    + "                                                <div class=\"row\">\n"
                    + "                                                    <span class=\"card-text show_txt\" style=\"width: 40%; padding-left: 20px;\">" + o.getRate() + "&#9733;</span>\n"
                    + "                                                    <p class=\"card-text show_txt\" title=\"" + o.getSold() + "\" style=\"width: 40%;font-size: 12px;text-align: right; margin-left: 30px;margin-top: 5px;\">Đã bán:" + o.getSold() + "</p><br><br>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"row\" style=\"width: 100%;margin: -20px auto;\">\n"
                    + "                                                    <div class=\"col\" style=\"width: 100%\">\n"
                    + "                                                        <p style=\"text-align: center; color: black;font-size: 12px;margin-bottom: 0px;\"><del>Price: " + o.getPrice() + " $</del></p>\n"
                    + "                                                        <p style=\"text-align: center; color: red;font-size: 16px;font-weight: bold\">Price: " + o.getPrice() + "$</p>\n"
                    + "                                                    </div>\n"
                    + "                                                    <div class=\"col\" style=\"width: 100%; padding-bottom: 15px;\">\n"
                    + "                                                        <a href=\"detail?pid=" + o.getId() + "\" class=\"btn btn-success btn-block fa fa-shopping-cart btn-outline-success\" style=\"text-align: center; margin: 0 30px;width: 60%;\">&nbsp;&nbsp; Detail</a>\n"
                    + "                                                    </div>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                        </div>\n"
                    + "                                    </div>      ");
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
