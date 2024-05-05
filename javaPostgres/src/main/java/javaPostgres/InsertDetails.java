package javaPostgres;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "InsertDetails", value = "/InsertDetails")
public class InsertDetails extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Class.forName(DbUtil.driver);
        } catch (ClassNotFoundException e) {
            System.out.println("Class not found " + e);
        }
        try {
            Connection conn = DriverManager.getConnection(DbUtil.url, DbUtil.user, DbUtil.password);
            System.out.println("connection successful");

            // Verificar si el ID ya existe en la base de datos
            String id = request.getParameter("id");
            PreparedStatement checkSt = conn.prepareStatement("SELECT * FROM estudiante WHERE est_id = ?");
            checkSt.setInt(1, Integer.valueOf(id));
            ResultSet resultSet = checkSt.executeQuery();
            if (resultSet.next()) {
                // El ID ya existe, mostrar mensaje de error
                response.sendRedirect("Error.jsp?msg=El ID ya está en uso");
                return;
            }

            // El ID no existe, insertar nuevo estudiante
            PreparedStatement insertSt = conn.prepareStatement("INSERT INTO estudiante VALUES (?, ?, ?, ?)");
            insertSt.setInt(1, Integer.valueOf(id));
            insertSt.setString(2, request.getParameter("nombre"));
            insertSt.setString(3, request.getParameter("apellido"));
            insertSt.setString(4, request.getParameter("email"));
            insertSt.executeUpdate();
            insertSt.close();

            conn.close();

            response.sendRedirect("Success.jsp?msg=Insert");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

