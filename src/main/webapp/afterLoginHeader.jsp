<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>After Login Header</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
/* underline hover animation */
.nav-link {
  position: relative;
}
.nav-link::after {
  content: '';
  position: absolute;
  width: 0%;
  height: 2px;
  left: 0;
  bottom: -3px;
  background: white;
  transition: width 0.3s ease-in-out;
}
.nav-link:hover::after {
  width: 100%;
}
</style>
</head>
<body>

<nav class="bg-gradient-to-r from-indigo-700 via-purple-700 to-pink-600 shadow-lg sticky top-0 z-50">
  <div class="max-w-7xl mx-auto px-6">
    <div class="flex items-center justify-between h-16">
      
      <!-- Brand -->
      <a href="dashboard.jsp" class="text-white font-extrabold text-xl tracking-wide hover:scale-105 transition">
        My Notes 📝
      </a>
      
      <!-- Links -->
      <div class="flex space-x-6 text-white font-medium">
        <a href="dashboard.jsp" class="nav-link hover:text-yellow-300 transition">Home</a>
        <a href="createNotes.jsp" class="nav-link hover:text-yellow-300 transition">Create Notes</a>
        <a href="ViewNotes.jsp" class="nav-link hover:text-yellow-300 transition">View Notes</a>
        <a href="logout.jsp" class="nav-link hover:text-red-300 transition">Logout</a>
      </div>
    </div>
  </div>
</nav>

</body>
</html>