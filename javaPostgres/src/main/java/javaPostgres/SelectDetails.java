package javaPostgres;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class SelectDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Class.forName(DbUtil.driver);
        } catch (ClassNotFoundException error) {
            System.out.println("CLASE NO ENCONTRADA " + error);
        }

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DriverManager.getConnection(DbUtil.url, DbUtil.user, DbUtil.password);
            PreparedStatement st = conn.prepareStatement("select * from estudiante where est_id=?");
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Si se encontró el registro, redirige a Result.jsp con los detalles
                response.sendRedirect("Result.jsp?id=" + id + "&nombre=" + rs.getString("est_nombre") + "&apellido=" + rs.getString("est_apellido") + "&email=" + rs.getString("est_email"));
            } else {
                // Si no se encontró el registro, redirige a Error.jsp con un mensaje de error
                response.sendRedirect("Error.jsp?msg=El ID proporcionado no existe");
            }

            rs.close();
            st.close();
            conn.close();
        } catch (Exception error) {
            System.out.println(error);
        }
    }
}
