/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.sistemalistatareas;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author luis
 */
@WebServlet(name = "Servlet2", urlPatterns = {"/Servlet2"})
public class Servlet2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int pos = -1, buscar = -1;
        HttpSession ses = request.getSession();
        ArrayList<Tareas> listaTareas = (ArrayList<Tareas>) ses.getAttribute("tareas");

        for (Tareas t1 : listaTareas) {
            pos++;
            if (t1.getId() == id) {
                buscar = pos;
            }
        }
        listaTareas.remove(buscar);
        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String tarea = request.getParameter("tarea");
        

        Tareas t = new Tareas();
        t.setId(id);
        t.setTarea(tarea);
       

        HttpSession ses = request.getSession();
        ArrayList<Tareas> listaTareas = (ArrayList<Tareas>) ses.getAttribute("tareas");
        listaTareas.add(t);
        response.sendRedirect("index.jsp");

    }

}
