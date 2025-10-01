<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
/* Fade-in animation */
@keyframes fadeInUp {
  from { opacity: 0; transform: translateY(15px); }
  to { opacity: 1; transform: translateY(0); }
}
.fade-in-up { animation: fadeInUp 1s ease-in-out both; }
</style>
</head>
<body>

<footer class="bg-black text-white text-center py-5 mt-10 shadow-lg fade-in-up">
  <p class="text-sm md:text-base tracking-wide">
    &copy; 2025 <span class="font-bold text-gray-200">TechNova IT Solutions</span> 🚀 | All Rights Reserved
  </p>
  
  <div class="mt-3 flex justify-center space-x-6 text-gray-400">
   
  </div>
</footer>

</body>
</html>