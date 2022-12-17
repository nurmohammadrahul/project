/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.desire.ds.servlets;

import com.desire.ds.dao.ProductDao;
import com.desire.ds.entities.Product;
import com.desire.ds.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NUR MOHAMMAD
 */
public class AdminProductHandleServlet extends HttpServlet {

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
            String op = request.getParameter("operation");
            ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list =  pDao.getAllProducts();
            if(op.trim().equals("changingproduct")){
                int productNewId= Integer.parseInt(request.getParameter("productNewId"));
                int productNewPrice = Integer.parseInt(request.getParameter("productNewPrice"));
                int productNewQuantity = Integer.parseInt(request.getParameter("productNewQuantity"));
                int productNewDiscount= Integer.parseInt(request.getParameter("productNewDiscount"));
              
                for(Product pr : list){
                   if(pr.getProductId()==productNewId)
                   {
                       out.println(pr.getProductId());
                pr.setProductPrice(productNewPrice);
                pr.setProductQuantity(productNewQuantity);
                pr.setProductDiscount(productNewDiscount);
                pDao.updateProduct(pr);
                   }
                }
              HttpSession httpSession = request.getSession();
                response.sendRedirect("adminproduct.jsp");
                return;

            }
            else if(op.trim().equals("deletingproduct")){
                int productNewId= Integer.parseInt(request.getParameter("productNewId"));
              
                for(Product pr : list){
                   if(pr.getProductId()==productNewId)
                   {
                       out.println(pr.getProductId());
                pDao.deleteProduct(pr);
                   }
                }
              HttpSession httpSession = request.getSession();
                response.sendRedirect("adminproduct.jsp");
                return;

            }
            
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
        processRequest(request, response);
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
