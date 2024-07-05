package Controlador;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import com.fasterxml.jackson.databind.ObjectMapper;

import Modelos.Perfil;

import java.io.IOException;



@WebServlet("/PerfilServlet")
public class PerfilServlet extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		String action = request.getParameter("action");
		
	    if (action == null || action.isEmpty() || action.equals("listar")) {
	    	listarPerfils(request,response);
		} else if (action.equals("eliminar")) {
            // Eliminar Perfil
			int id = Integer.parseInt(request.getParameter("id"));
			 HttpClient httpClient = HttpClients.createDefault();
		     HttpDelete httpDelete = new HttpDelete("http://localhost:8080/ProyectoFinal/App/Perfil/eliminar/" + id);

	        // Ejecutar la solicitud
	        HttpResponse apiResponse = httpClient.execute(httpDelete);
	        int statusCode = apiResponse.getStatusLine().getStatusCode();

	        if (statusCode == 200) {
	            // Redirigir a la página de listado después de eliminar exitosamente
	            listarPerfils(request, response);
	        } else {
	            response.getWriter().println("Error al eliminar el Perfil. Código de estado: " + statusCode);
	        }
        }
	 else if (action.equals("editar")) {
		// Obtener el ID del perfil a editar
		    int id = Integer.parseInt(request.getParameter("id"));
		    String nombre = request.getParameter("nombre").toString();

		        Perfil perfil = new Perfil();
		        perfil.setIdPerfil(id);
		        perfil.setNombre(nombre);
		        // Guardar el perfil en los atributos de la solicitud
		        request.setAttribute("perfilEditar", perfil);

		        // Redirigir al JSP de edición
		        request.getRequestDispatcher("/PerfilEdit.jsp").forward(request, response);
		    
    } 
	 
	    
    }

 
	 private void listarPerfils(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 
		 String apiUrl = "http://localhost:8080/ProyectoFinal/App/Perfil/listar";
	        HttpClient httpClient = HttpClients.createDefault();
	        HttpGet httpGet = new HttpGet(apiUrl);
	        HttpResponse apiResponse = httpClient.execute(httpGet);
	        int statusCode = apiResponse.getStatusLine().getStatusCode();
	
	        if (statusCode == 200) {
	            String responseBody = EntityUtils.toString(apiResponse.getEntity());
	            request.setAttribute("perfiles", responseBody);
	
	            try {
					request.getRequestDispatcher("/Perfil.jsp").forward(request, response);
				} catch (ServletException e) {
					e.printStackTrace();
				}
	        } else {
	            response.getWriter().println("Error al obtener la lista de perfiles. Código de estado: " + statusCode);
	        }		 
	 }

	 protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if (action == null || action.isEmpty() || action.equals("registrar")) {
	            // Registrar nuevo Perfil
	            registrarPerfil(request, response);
	        } else if (action.equals("actualizar")) {
			    // Obtener los parámetros del formulario de edición
			    int id = Integer.parseInt(request.getParameter("id"));
			    String nombre = request.getParameter("nomcl3");

			    // Crear objeto Perfil con los datos actualizados
			    Perfil perfilActualizado = new Perfil();
			    perfilActualizado.setIdPerfil(id);
			    perfilActualizado.setNombre(nombre);

			    // Convertir a JSON
			    ObjectMapper mapper = new ObjectMapper();
			    String jsonPerfil = mapper.writeValueAsString(perfilActualizado);

			    // Configurar la solicitud HTTP PUT
			    HttpClient httpClient = HttpClients.createDefault();
			    HttpPut httpPut = new HttpPut("http://localhost:8080/ProyectoFinal/App/Perfil/actualizar/" + id);
			    StringEntity entity = new StringEntity(jsonPerfil);
			    entity.setContentType("application/json");
			    httpPut.setEntity(entity);

			    // Ejecutar la solicitud
			    HttpResponse apiResponse = httpClient.execute(httpPut);
			    int statusCode = apiResponse.getStatusLine().getStatusCode();

			    if (statusCode == 200) {
			        // Redirigir a la página de listado después de actualizar exitosamente
			        listarPerfils(request, response);
			    } else {
			        response.getWriter().println("Error al actualizar el Perfil. Código de estado: " + statusCode);
			    }
			}
	        else {
	            response.getWriter().println("Acción no válida");
	        }
	    }
	 private void registrarPerfil(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String nomcl3 = request.getParameter("nomcl3");
	        
	        HttpClient httpClient = HttpClients.createDefault();
	        HttpPost httpPost = new HttpPost("http://localhost:8080/ProyectoFinal/App/Perfil/registrar");

	        // Crear objeto Perfil
	        Perfil Perfil = new Perfil();
	        Perfil.setNombre(nomcl3);
	        
	        // Convertir a JSON
	        ObjectMapper mapper = new ObjectMapper();
	        String jsonPerfil = mapper.writeValueAsString(Perfil);

	        // Configurar la solicitud HTTP POST
	        StringEntity entity = new StringEntity(jsonPerfil);
	        entity.setContentType("application/json");
	        httpPost.setEntity(entity);

	        // Ejecutar la solicitud
	        HttpResponse apiResponse = httpClient.execute(httpPost);
	        int statusCode = apiResponse.getStatusLine().getStatusCode();

	        if (statusCode == 200 || statusCode == 201) {
	            // Redirigir a la página de listado después de registrar exitosamente
	            listarPerfils(request, response);
	        } else {
	            response.getWriter().println("Error al registrar el Perfil. Código de estado: " + statusCode);
	        }
	    }
	 
	 
}