/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAO;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.Account;
import model.Cart;
import model.Email;

/**
 *
 * @author admin
 */
@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

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
            out.println("<title>Servlet CheckoutServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckoutServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(true);
        OrderDAO odao = new OrderDAO();
        LocalDateTime currentDateTime = LocalDateTime.now();
        Cart cart = (Cart) session.getAttribute("cart");
        Account acount = (Account) session.getAttribute("account");
        if (acount != null) {
            odao.addOrder(acount, cart);
            Email handleEmail = new Email();
            String sub = handleEmail.subjectOrder(acount.getUser());
            String msg = handleEmail.messageOrder(currentDateTime, cart.getTotalMoney(), acount.getPhone(), acount.getUser(), acount.getAddress());
            handleEmail.sendEmail(sub, msg, acount.getEmail());
            session.removeAttribute("cart");
            session.setAttribute("size", 0);
            response.sendRedirect("home");
        } else {
            response.sendRedirect("login");
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
        String action = request.getParameter("vnpay");
        if (action == null) {
            action = "0";
        }
        if (action.equals("1")) {
            request.getRequestDispatcher("detail").forward(request, response);
        }

        HttpSession session = request.getSession(true);
        Cart cart = null;
        Object o = session.getAttribute("cart");
        DAO dao = new DAO();
        OrderDAO odao = new OrderDAO();
        LocalDateTime currentDateTime = LocalDateTime.now();
        String mgg = request.getParameter("mgg");
        // có rồi
        if (o != null) {
            cart = (Cart) o;
            Account acount = null;
            Object a = session.getAttribute("account");
            if (a != null) {
                acount = (Account) a;
                odao.addOrder(acount, cart);
                if (acount.getAmount() >= cart.getTotalMoney()) {
                    Email handleEmail = new Email();
                    String sub = handleEmail.subjectOrder(acount.getUser());
                    String msg = handleEmail.messageOrder(currentDateTime, cart.getTotalMoney(), acount.getPhone(), acount.getUser(), acount.getAddress());
                    handleEmail.sendEmail(sub, msg, acount.getEmail());
                    session.removeAttribute("cart");
                    session.setAttribute("size", 0);
                    response.sendRedirect("home");
                } else {
                    request.setAttribute("mess", "Tài khoản của bạn không đủ");
                    request.getRequestDispatcher("cart.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("login");
            }
        } else {
            request.setAttribute("mess", "Giỏ hàng của bạn trống hãy mua thêm sản phẩm <a href=\"home\"style=\"color: red;text-decoration: underline\">tại đây</a>");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
