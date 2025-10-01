package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.NotesModel;
import model.RegModel;

/**
 * Servlet implementation class NotesController
 */
@WebServlet("/NotesController")

@MultipartConfig(   // enables file upload
	    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
	    maxFileSize = 1024 * 1024 * 10,      // 10MB
	    maxRequestSize = 1024 * 1024 * 50    // 50MB
	)

public class NotesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String UPLOAD_DIR = "uploads";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotesController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String title = request.getParameter("t1");
        String desc  = request.getParameter("t2");

        // get absolute path of the web app
        String appPath = request.getServletContext().getRealPath("");
        // construct path of the directory to save uploaded file
        String savePath = appPath + File.separator + UPLOAD_DIR;
        
        // create uploads folder if not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        // process uploaded file
        Part filePart = request.getPart("t3"); // name="t3" in JSP
        String fileName = extractFileName(filePart);
        
        if(fileName == null || fileName.trim().equals("")) {
            fileName = "Nophoto.jpg"; // default
        } else {
            filePart.write(savePath + File.separator + fileName); // save file
        }
HttpSession session = request.getSession();
        // save data to DB
        NotesModel obj = new NotesModel(title, desc, fileName,
        		session.getAttribute("email").toString());
        try {
            boolean chk = obj.insertData();
            if (chk) {
                response.sendRedirect("dashboard.jsp?t=1");
            } else {
                response.sendRedirect("dashboard.jsp?t=0");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            response.sendRedirect("dashboard.jsp?t=0");
        }
    }

    // utility method to get submitted file name
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String s : contentDisp.split(";")) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    
	}

}