package com;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HospitalsAPI
 */
@WebServlet("/HospitalsAPI")
public class HospitalsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Hospital hospitalObj = new Hospital();
       
    
    public HospitalsAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String output = hospitalObj.insertHoapitalDet(request.getParameter("mohCode"),
				   request.getParameter("hospitalName"),
				   request.getParameter("emailAddress"),
				   request.getParameter("managerName"),
				   request.getParameter("address"),
				   request.getParameter("telephoneNo"));

		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		
		 String output = hospitalObj.updateHospitalDet(paras.get("hidHospitalIDSave").toString(),
														 paras.get("mohCode").toString(),
														 paras.get("hospitalName").toString().replace("+"," "),
														 paras.get("emailAddress").toString().replace("%40","@"),
														 paras.get("managerName").toString().replace("+"," "),
														 paras.get("address").toString().replace("+"," "),
														 paras.get("telephoneNo").toString());
		 
		 response.getWriter().write(output); 
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		
		 String output = hospitalObj.deleteHospitalDet(paras.get("hospitalID").toString());
		 
		 response.getWriter().write(output); 
	}
	
	// Convert request parameters to a Map
			private static Map getParasMap(HttpServletRequest request)
			{
			 Map<String, String> map = new HashMap<String, String>();
				try
				 {
				 Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
				 String queryString = scanner.hasNext() ?
				 scanner.useDelimiter("\\A").next() : "";
				 scanner.close();
				 String[] params = queryString.split("&");
					 for (String param : params)
					 {
						 String[] p = param.split("=");
						 map.put(p[0], p[1]);
					 }
					 
				}
				catch (Exception e)
				{
				}
					
				return map;
					
			}
		
		

}
