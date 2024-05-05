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

/**
 * Servlet implementation class DeleteDetails
 */
public class DeleteDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        // Verificar si el ID está vacío
        if (id == null || id.isEmpty()) {
            response.getWriter().println("El ID está vacío");
            return;
        }

        try {
            Class.forName(DbUtil.driver);
            Connection conn = DriverManager.getConnection(DbUtil.url, DbUtil.user, DbUtil.password);

            // Verificar si el ID existe
            PreparedStatement selectStatement = conn.prepareStatement("SELECT * FROM estudiante WHERE est_id = ?");
            selectStatement.setInt(1, Integer.parseInt(id));
            ResultSet resultSet = selectStatement.executeQuery();

            if (!resultSet.next()) {
                // El ID no existe, redirigir a Error.jsp
                response.sendRedirect("Error.jsp?errorMsg=El ID no existe en la base de datos");
                return;
            }

            // Si el ID existe, eliminar el estudiante
            PreparedStatement deleteStatement = conn.prepareStatement("DELETE FROM estudiante WHERE est_id = ?");
            deleteStatement.setInt(1, Integer.parseInt(id));
            deleteStatement.executeUpdate();

            // Cerrar conexiones
            deleteStatement.close();
            selectStatement.close();
            conn.close();

            // Enviar mensaje de éxito
            String successMsg = "El estudiante ha sido eliminado exitosamente";
            response.sendRedirect("Success.jsp?msg=" + java.net.URLEncoder.encode(successMsg, java.nio.charset.StandardCharsets.UTF_8.toString()));

        } catch (ClassNotFoundException | IOException e) {
            System.out.println("Error: " + e.getMessage());
            response.getWriter().println("Error en la aplicación");
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            response.getWriter().println("Error al eliminar el estudiante");
        }
    }
}

