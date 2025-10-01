<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-gray-100 via-gray-200 to-gray-100 min-h-screen">

<!-- Include Header -->
<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<!-- Welcome Section -->
<div class="max-w-4xl mx-auto text-center mt-12">
    <h1 class="text-4xl font-extrabold text-gray-800 drop-shadow-sm">
        Welcome, <span class="text-purple-600">${sessionScope.name}!</span> 🎉
    </h1>
    <p class="text-lg text-gray-600 mt-3">This is your personal dashboard where you can manage your notes.</p>
</div>

<!-- Success Message -->
<%
if(request.getParameter("t") != null) {
%>
<div class="max-w-lg mx-auto mt-8">
    <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 rounded-lg shadow-md animate-bounce">
        <strong class="font-bold">Success!</strong> 
        <span class="block">Note created successfully ✅</span>
    </div>
</div>
<%
}
%>

<!-- Quick Actions -->
<div class="max-w-5xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8 mt-14 px-6">
    
    <!-- Create Notes -->
    <a href="createNotes.jsp" 
       class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white rounded-2xl p-6 text-center shadow-lg hover:scale-105 transform transition">
       <h2 class="text-xl font-bold mb-2">✍ Create Notes</h2>
       <p class="text-sm">Start writing and save your thoughts instantly.</p>
    </a>

    <!-- View Notes -->
    <a href="ViewNotes.jsp" 
       class="bg-gradient-to-r from-pink-500 to-red-500 text-white rounded-2xl p-6 text-center shadow-lg hover:scale-105 transform transition">
       <h2 class="text-xl font-bold mb-2">📑 View Notes</h2>
       <p class="text-sm">Check all your saved notes at one place.</p>
    </a>

    <!-- Logout -->
    <a href="logout.jsp" 
       class="bg-gradient-to-r from-gray-600 to-black text-white rounded-2xl p-6 text-center shadow-lg hover:scale-105 transform transition">
       <h2 class="text-xl font-bold mb-2">🚪 Logout</h2>
       <p class="text-sm">Exit securely from your session.</p>
    </a>

</div>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>