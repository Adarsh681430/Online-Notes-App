<%@page import="dao.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Notes</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-50 to-indigo-100 min-h-screen">

<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy"); 
%>

<div class="container mx-auto p-8">
    <!-- Heading -->
    <h2 class="text-4xl font-extrabold mb-6 text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-blue-500 animate-pulse text-center">
        📒 Your Notes
    </h2>

    <!-- Notes Table Card -->
    <div class="bg-white/80 backdrop-blur-lg shadow-xl rounded-2xl overflow-hidden border border-gray-200">
        <table class="table-auto w-full text-left">
            <thead>
                <tr class="bg-gradient-to-r from-indigo-500 to-blue-600 text-white text-sm uppercase tracking-wide">
                    <th class="px-5 py-3">ID</th>
                    <th class="px-5 py-3">Title</th>
                    <th class="px-5 py-3">Description</th>
                    <th class="px-5 py-3 text-center">Photo</th>
                    <th class="px-5 py-3">Created Date</th>
                    <th class="px-5 py-3 text-center">Action</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
            <%
                try (DBConnect d = new DBConnect();
                     ResultSet rs = d.QueryReturner("SELECT * FROM notes where email='"+ session.getAttribute("email")+"'")) {
                    while (rs.next()) {
            %>
                <tr class="hover:bg-indigo-50 transition duration-200 ease-in-out">
                    <td class="px-5 py-3 font-semibold text-gray-700"><%= rs.getInt("noteid") %></td>
                    <td class="px-5 py-3 text-gray-800"><%= rs.getString("title") %></td>
                    <td class="px-5 py-3 text-gray-600"><%= rs.getString("description") %></td>
                    <td class="px-5 py-3 text-center">
                        <img src="uploads/<%= rs.getString("photo") %>" 
                             width="80" class="rounded-lg shadow-md cursor-pointer transform hover:scale-110 transition duration-300"
                             onclick="showImage('uploads/<%= rs.getString("photo") %>')">
                    </td>
                    <td class="px-5 py-3 text-gray-500"><%= sdf.format(rs.getTimestamp("createdate")) %></td>
                    <td class="px-5 py-3 text-center">
                        <a href="deleteNote.jsp?id=<%= rs.getInt("noteid") %>" 
                           class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg shadow-md transition transform hover:scale-105"
                           onclick="return confirm('Are you sure to delete this note?');">
                           🗑 Delete
                        </a>
                    </td>
                </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<tr><td colspan='6' class='text-center text-red-500 py-4'>Error: " + e.getMessage() + "</td></tr>");
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>

<!-- Modal -->
<div id="imgModal" 
     class="fixed inset-0 bg-black bg-opacity-80 hidden flex items-center justify-center z-50 transition">
    <span class="absolute top-6 right-8 text-white text-4xl cursor-pointer hover:text-gray-300 transition" onclick="closeImage()">&times;</span>
    <img id="modalImage" src="" class="max-h-[90%] max-w-[90%] rounded-xl shadow-2xl border-4 border-white transform scale-95 transition duration-300">
</div>

<script>
function showImage(src) {
    document.getElementById("modalImage").src = src;
    const modal = document.getElementById("imgModal");
    modal.classList.remove("hidden");
    setTimeout(() => {
        document.getElementById("modalImage").classList.add("scale-100");
    }, 100);
}
function closeImage() {
    document.getElementById("imgModal").classList.add("hidden");
    document.getElementById("modalImage").classList.remove("scale-100");
}
</script>

</body>
</html>