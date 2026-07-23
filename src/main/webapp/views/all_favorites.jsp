<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách Video được yêu thích - PolyOE</title>
    <style>
        /* Tái sử dụng các biến màu sắc và đổ bóng */
        :root {
            --primary: #4F46E5;
            --bg-gradient: linear-gradient(135deg, #f3f4f6 0%, #e5e7eb 100%);
            --card-bg: rgba(255, 255, 255, 0.95);
            --text-main: #1f2937;
            --text-muted: #6b7280;
            --shadow-sm: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--bg-gradient);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            color: var(--text-main);
        }

        /* Khung chứa bảng */
        .container {
            background-color: var(--card-bg);
            width: 100%;
            max-width: 800px;
            padding: 40px;
            border-radius: 24px;
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        /* Tiêu đề chính */
        h2 {
            text-align: center;
            background: linear-gradient(to right, #4F46E5, #EC4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px;
            font-size: 26px;
            font-weight: 800;
        }

        /* Lớp bọc bảng để bo góc mượt mà */
        .table-wrapper {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid #e5e7eb;
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
        }

        th, td {
            padding: 16px;
            text-align: left;
            border-bottom: 1px solid #f3f4f6;
        }

        /* Định dạng Header bảng */
        th {
            background-color: #f8fafc;
            font-weight: 600;
            color: var(--text-muted);
            text-transform: uppercase;
            font-size: 13px;
            letter-spacing: 0.5px;
        }

        /* Hiệu ứng khi hover từng dòng trong bảng */
        tbody tr {
            transition: background-color 0.2s ease;
        }

        tbody tr:hover {
            background-color: #f8fafc;
        }

        td {
            color: var(--text-main);
            font-size: 15px;
        }

        /* Định dạng nút bấm Quay lại */
        .back-btn-container {
            text-align: center;
        }

        .back-btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 24px;
            background-color: #ffffff;
            color: var(--text-main);
            text-decoration: none;
            border-radius: 10px;
            font-weight: 500;
            font-size: 15px;
            border: 1px solid #e5e7eb;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
        }

        .back-btn:hover {
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.15);
        }

        .back-btn span {
            margin-right: 8px;
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Danh sách các video được yêu thích</h2>
        
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>Video Title</th>
                        <th>Người thích</th>
                        <th>Ngày thích</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="favorite" items="${favorites}">
                        <tr>
                            <td>${favorite.video.title}</td>
                            <td>${favorite.user.fullname}</td>
                            <td>${favorite.likeDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="back-btn-container">
            <a href="${pageContext.request.contextPath}/" class="back-btn">
                <span>&#8592;</span> Quay lại trang chủ
            </a>
        </div>
    </div>
</body>
</html>