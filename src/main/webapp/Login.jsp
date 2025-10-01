<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://cdn.tailwindcss.com"></script>

<style>
/* subtle fade-in animation (no backend impact) */
@keyframes fadeInUp { 
  from { opacity: 0; transform: translateY(10px); } 
  to { opacity: 1; transform: translateY(0); } 
}
.fade-in-up { animation: fadeInUp .6s ease-out both; }

/* soft float for the card */
@keyframes softFloat {
  0% { transform: translateY(0); }
  50% { transform: translateY(-4px); }
  100% { transform: translateY(0); }
}
.soft-float:hover { animation: softFloat 3s ease-in-out infinite; }

/* tiny glow on focus (pure CSS) */
.input-glow:focus { 
  box-shadow: 0 0 0 4px rgba(99,102,241,.25);
  outline: none;
}
</style>
</head>

<body class="min-h-screen bg-gradient-to-tr from-indigo-600 via-purple-600 to-pink-500">
  <jsp:include page="header.jsp"></jsp:include>

  <div class="px-4 py-10 flex items-center justify-center">
    <div class="w-full max-w-md fade-in-up">

      <!-- Heading unchanged text, only styling added -->
      <h1 class="text-4xl font-extrabold text-center text-white drop-shadow mb-6">
        Login!
      </h1>

      <!-- Card wrapper (purely visual) -->
      <div class="bg-white/90 backdrop-blur shadow-2xl rounded-2xl p-7 soft-float">
        <form action="./LoginController" method="post" 
              class="space-y-5">

          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Email</label>
            <input type="email" name="t2"
                   class="input-glow w-full border border-gray-300 rounded-lg p-3 transition focus:border-indigo-500">
          </div>

          <div>
            <label class="block mb-2 text-sm font-medium text-gray-700">Password</label>
            <input type="password" name="t3"
                   class="input-glow w-full border border-gray-300 rounded-lg p-3 transition focus:border-pink-500">
          </div>

          <button
            class="w-full bg-gradient-to-r from-green-500 to-emerald-600 text-white py-3 rounded-lg font-semibold text-lg shadow-lg transition transform hover:scale-[1.02] hover:from-green-600 hover:to-emerald-700">
            Login
          </button>

          <!-- Same server-side logic; bas styling wrapper diya -->
          <div class="text-center text-red-600 font-medium">
            <%
              if(request.getAttribute("msg")!=null) {
                out.println(request.getAttribute("msg"));
              }
            %>
          </div>

        </form>

        <p class="text-center text-sm text-gray-600 mt-5">
          Don’t have an account?
          <a href="signup.jsp" class="font-semibold text-indigo-600 hover:underline">Sign Up</a>
        </p>
      </div>
    </div>
  </div>

  <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>