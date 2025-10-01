<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
/* Smooth Fade-Up Animation */
@keyframes fadeInUp { 
  from { opacity: 0; transform: translateY(25px); } 
  to { opacity: 1; transform: translateY(0); } 
}
.fade-in-up { animation: fadeInUp .8s ease-out both; }

/* Input Glow */
.input-glow:focus { 
  box-shadow: 0 0 0 4px rgba(167, 139, 250, 0.4);
  outline: none;
}

/* Card floating animation */
@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-6px); }
}
.float { animation: float 3s ease-in-out infinite; }
</style>
</head>

<body class="min-h-screen bg-gradient-to-r from-purple-500 via-pink-500 to-red-400 flex flex-col">

  <!-- Header -->
  <jsp:include page="header.jsp"></jsp:include>

  <!-- Form Section -->
  <div class="flex-grow flex items-center justify-center px-4">
    <div class="w-full max-w-md fade-in-up float">
      <div class="bg-white/95 backdrop-blur-md shadow-2xl rounded-2xl p-8 border border-gray-200">
        
        <!-- Title -->
        <h1 class="text-4xl font-extrabold text-center text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-pink-500 mb-4 animate-pulse">
          New User 🚀
        </h1>
        <p class="text-center text-gray-600 mb-6">Create your account</p>

        <!-- Form -->
        <form action="./RegController" method="post" class="space-y-5">
          
          <div class="fade-in-up" style="animation-delay:0.1s">
            <label class="block text-sm font-medium text-gray-700">Full Name</label>
            <input type="text" name="t1"
                   class="input-glow w-full border border-gray-300 rounded-xl p-3 transition focus:border-purple-500">
          </div>

          <div class="fade-in-up" style="animation-delay:0.2s">
            <label class="block text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="t2"
                   class="input-glow w-full border border-gray-300 rounded-xl p-3 transition focus:border-pink-500">
          </div>

          <div class="fade-in-up" style="animation-delay:0.3s">
            <label class="block text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="t3"
                   class="input-glow w-full border border-gray-300 rounded-xl p-3 transition focus:border-red-400">
          </div>

          <div class="fade-in-up" style="animation-delay:0.4s">
            <label class="block text-sm font-medium text-gray-700">Mobile</label>
            <input type="number" name="t4"
                   class="input-glow w-full border border-gray-300 rounded-xl p-3 transition focus:border-indigo-500">
          </div>

          <button
            class="w-full bg-gradient-to-r from-green-500 to-emerald-600 text-white py-3 rounded-xl font-semibold text-lg shadow-lg transform transition hover:scale-105 hover:from-green-600 hover:to-emerald-700">
            Submit
          </button>
        </form>

        <!-- Login link -->
        <p class="text-center text-sm text-gray-600 mt-6 fade-in-up" style="animation-delay:0.5s">
          Already have an account?
          <a href="login.jsp" class="font-semibold text-purple-600 hover:underline">Login</a>
        </p>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>