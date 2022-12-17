/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.desire.ds.servlets;

import com.desire.ds.dao.CategoryDao;
import com.desire.ds.dao.ProductDao;
import com.desire.ds.entities.Category;
import com.desire.ds.entities.Product;
import com.desire.ds.helper.FactoryProvider;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author NUR MOHAMMAD
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            //adding category nd product
            
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory")){
                // add category
                //fetching data
                String name= request.getParameter("categoryName");
                String description = request.getParameter("categoryDescription");
                //storing
                
                Category category = new Category();
                category.setCategoryName(name);
                category.setCategoryDescription(description);
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int categoryId=categoryDao.saveCategory(category);
                
               // out.println("Category SAved");
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Category added successfully : " + categoryId);
                response.sendRedirect("admin.jsp");
                return;
                
            }
            else if(op.trim().equals("addproduct")){
                
                //add product
                String productName = request.getParameter("productName");
                String ProductDescription = request.getParameter("productDescription");
                int productPrice = Integer.parseInt(request.getParameter("productPrice"));
                int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
                int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                Part part = request.getPart("productPhoto");
                
                
                Product p= new Product();
                p.setProductName(productName);
                p.setProductDescription(ProductDescription);
                p.setProductPrice(productPrice);
                p.setProductQuantity(productQuantity);
                p.setProductDiscount(productDiscount);
                p.setProductPhoto(part.getSubmittedFileName());
                
                
                CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory()); 
                Category category = cdoa.getCategoryById(categoryId);
                
                
                p.setCategory(category);
                
                
                //saving product
                
                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
               pDao.saveProduct(p);
                //pic upload
               // find out the path of photo
                
                String path = request.getRealPath("img") + File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println(path);
                //uploading photo
                try{
                    
                    
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is =part.getInputStream();
                //reading data
                byte[] data = new byte[is.available()];
                
                is.read(data);
                
                fos.write(data);
                fos.close();
            }catch(Exception e){
                    e.printStackTrace();
                    }
                //out.println("Product adding success");
                 HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message","Product is added successfully");
                response.sendRedirect("admin.jsp");
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
