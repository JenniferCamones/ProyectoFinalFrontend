package Controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import java.io.IOException;



@WebServlet("/listadoPerfiles")
public class ListadoPerfilesServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String apiUrl = "http://localhost:8080/ProyectoFinal/App/Perfil/listar";
        HttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(apiUrl);
        HttpResponse apiResponse = httpClient.execute(httpGet);
        int statusCode = apiResponse.getStatusLine().getStatusCode();

        if (statusCode == 200) {
            String responseBody = EntityUtils.toString(apiResponse.getEntity());
            request.setAttribute("perfiles", responseBody);

            try {
				request.getRequestDispatcher("/listadoPerfil.jsp").forward(request, response);
			} catch (ServletException e) {
				e.printStackTrace();
			}
        } else {
            response.getWriter().println("Error al obtener la lista de perfiles. Código de estado: " + statusCode);
        }
    }

 

}