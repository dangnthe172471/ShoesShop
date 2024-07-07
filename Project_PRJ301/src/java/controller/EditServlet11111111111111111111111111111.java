/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to editProduct this template
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
import java.util.Collection;

@MultipartConfig
@WebServlet(name = "EditServlet", urlPatterns = {"/edit"})
public class EditServlet11111111111111111111111111111 extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
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
        // Define the directory relative to the servlet context
        String customDirectory = getServletContext().getRealPath("/images");

        // Get the uploaded file parts from the request
        Collection<Part> parts = request.getParts();

        // Iterate through each part
        for (Part part : parts) {
            // Only process parts that have a filename (ignore form fields without a file)
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (filename != null && !filename.isEmpty()) {
                // Combine the custom directory and filename to create the full path
                Path imagePath = Paths.get(customDirectory, filename);

                // Check if the directory exists, if not, create it
                if (!Files.exists(imagePath.getParent())) {
                    Files.createDirectories(imagePath.getParent());
                }

                // Write the uploaded file to the specified directory
                part.write(imagePath.toString());
            }
        }
        response.getWriter().println("Upload successful!");
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantity = request.getParameter("quantity");
        String sold = request.getParameter("sold");
        String releaseDate = request.getParameter("releaseDate");
        String description = request.getParameter("description");
        String image = request.getParameter("image");
        String price = request.getParameter("price");
        String rate = request.getParameter("rate");
        String category = request.getParameter("category");

        DAO dao = new DAO();
        if (image != null && !image.equals("")) {
            dao.editProduct(id, name, sold, quantity, releaseDate, description, image, price, rate, category);
            response.sendRedirect("manager");
        } else {
            // Define the directory relative to the servlet context
            String customDirectory = getServletContext().getRealPath("/images");
            // Get the uploaded file part from the request
            Part part = request.getPart("avatar");

            // Extract the filename from the uploaded file part
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            // Combine the custom directory and filename to create the full path
            Path imagePath = Paths.get(customDirectory, filename);

            // Check if the directory exists, if not, create it
            if (!Files.exists(Paths.get(customDirectory))) {
               Files.createDirectories(Paths.get(customDirectory));
            }

            // Write the uploaded file to the specified directory
            part.write(imagePath.toString());
            dao.editProduct(id, name, sold, quantity, releaseDate, description, "images/" + filename, price, rate, category);
            response.sendRedirect("manager");
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