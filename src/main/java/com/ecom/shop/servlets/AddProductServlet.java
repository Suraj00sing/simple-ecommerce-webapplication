
package com.ecom.shop.servlets;

import com.ecom.shop.dao.Userdao;
import com.ecom.shop.entities.Category;
import com.ecom.shop.entities.Product;
import com.ecom.shop.helper.FactoryProvider;
import com.ecom.shop.helper.Fileupload;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class AddProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
          int catId= Integer.parseInt(request.getParameter("catid"));
          String pTitle= request.getParameter("ptitle");
          String pDescription= request.getParameter("pdescription");
          int pPrice= Integer.parseInt(request.getParameter("pprice"));
          Part part = request.getPart("pimage");
          
          Product p= new Product();
          p.setpName(pTitle);
          p.setpDesc(pDescription);
          p.setpPrice(pPrice);
          p.setpPhoto(part.getSubmittedFileName());
          
          String path= request.getRealPath("images")+ File.separator + "product" + File.separator + part.getSubmittedFileName() ;
          
          Userdao dao= new Userdao(FactoryProvider.getFactory());
          Category category = dao.getCategoryById(catId);
          
          p.setCategory(category);
          boolean b= dao.saveProduct(p);
          
          Fileupload.upload(path, part);
          
          if(b){
              out.println("success");
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
