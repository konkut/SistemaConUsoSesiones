<%@page import="java.util.ArrayList"%>
<%@page import="com.mycompany.sistemalistatareas.Tareas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
if(session.getAttribute("tareas") == null){
    ArrayList<Tareas> lista = new ArrayList<Tareas>();
    session.setAttribute("tareas",lista);
}
ArrayList<Tareas> tareas = (ArrayList<Tareas>)session.getAttribute("tareas");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <img id="escudo" class="navbar-brand" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6oRlTbvLPtYVAd62ocjengkvclk8f1eHdicuikgr3sUpM70SWsWhhlkXS8A&s"></img>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="http://localhost:8084/SistemaDetectorVisitas/Servlet">HACER CLICK</a>
                </li>
            </ul>

        </div>
    </nav>
    <h1>Tareas Pendientes </h1>
    <form action="Servlet2" method="post">

        <label for="id">Id:</label>
        <input type="text" id="id" name ="id" placeholder="Ingrese el id" required></input>
        
        <label for="tarea">Tarea:</label>
        <textArea id="tarea" name="tarea" placeholder="Ingrese su tarea"></textArea> 
            
        <input type="submit" value="Enviar"></input>
        </form>
    <br><br>
    <table border>
        <tr>
            <th>Id</th>
            <th>Tarea</th>
            <th>Completado</th>
            <th>Eliminar</th>
        </tr>
        <%
        if(tareas != null){
            for(Tareas t : tareas){
                
        %>
        <tr>
            <td><%= t.getId()%></td>
            <td><%= t.getTarea()%></td>
            <td><input type="checkbox" name="check" ></input></td>
            <td><a href="Servlet2?id=<%= t.getId()%>">Eliminar</a><td>
        </tr>
        <%
             }
        }
        %>
    </table>
    </body>
</html>
