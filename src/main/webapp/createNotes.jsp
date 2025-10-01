<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Notes</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-r from-blue-100 via-purple-100 to-pink-100 min-h-screen">

<jsp:include page="afterLoginHeader.jsp"></jsp:include>

<div class="max-w-2xl mx-auto mt-10">
    <h3 class="text-lg font-medium text-gray-700 mb-2 animate-pulse">
        Welcome, <span class="text-blue-600 font-semibold">${sessionScope.name}!</span>
    </h3>

    <h1 class="text-4xl font-extrabold text-center text-indigo-700 mb-6 animate-bounce">
        ✨ Create Your Note ✨
    </h1>

    <form action="./NotesController" method="post" enctype="multipart/form-data"
        class="p-8 bg-white shadow-2xl rounded-2xl transform transition duration-500 hover:scale-105">

        <!-- Title -->
        <label class="block mb-2 text-sm font-semibold text-gray-700">Title</label>
        <input type="text" name="t1"
            class="w-full border border-gray-300 rounded-lg p-3 mb-4 focus:ring-2 focus:ring-indigo-400 focus:outline-none">

        <!-- Description -->
        <label class="block mb-2 text-sm font-semibold text-gray-700">Description</label>
        <textarea rows="5" cols="40" name="t2"
            class="w-full border border-gray-300 rounded-lg p-3 mb-4 focus:ring-2 focus:ring-indigo-400 focus:outline-none"></textarea>

        <!-- File Upload -->
        <label class="block mb-2 text-sm font-semibold text-gray-700">Upload Photo</label>
        <input type="file" name="t3"
            class="w-full border border-gray-300 rounded-lg p-3 mb-6 cursor-pointer focus:ring-2 focus:ring-indigo-400 focus:outline-none">

        <!-- Submit Button -->
        <button
            class="w-full bg-gradient-to-r from-green-500 to-blue-500 text-white font-bold py-3 rounded-xl shadow-lg transform transition duration-300 hover:scale-105 hover:from-green-600 hover:to-blue-600">
            🚀 Submit Note
        </button>
    </form>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>