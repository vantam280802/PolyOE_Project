<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 3 & Lab 4 - PolyOE</title>
    <style>
        /* Khai báo các biến màu sắc */
        :root {
            --primary: #4F46E5;
            --primary-hover: #4338CA;
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

        /* Nền trang web - Đã thêm flex-direction: column và gap */
        body { 
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
            background: var(--bg-gradient);
            display: flex;
            flex-direction: column; /* Xếp dọc các thành phần */
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            gap: 30px; /* Tạo khoảng cách giữa Header và Container */
            color: var(--text-main);
        }

        /* KHUNG THÔNG BÁO (HEADER BAR) */
        .header-bar {
            width: 100%;
            max-width: 650px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: var(--card-bg);
            padding: 12px 24px;
            border-radius: 16px;
            box-shadow: var(--shadow-sm);
            border: 1px solid rgba(255, 255, 255, 0.5);
            backdrop-filter: blur(10px);
            font-size: 14.5px;
        }

        .header-bar span {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header-bar a {
            text-decoration: none;
            padding: 8px 16px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 8px;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .login-btn {
            color: #ffffff;
            background-color: var(--primary);
            border: 1px solid var(--primary);
            box-shadow: var(--shadow-sm);
        }

        .login-btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px -2px rgba(79, 70, 229, 0.3);
        }

        .logout-btn {
            color: #dc2626;
            background-color: #fef2f2;
            border: 1px solid #fecaca;
            margin-left: 10px;
        }

        .logout-btn:hover {
            background-color: #fee2e2;
            color: #b91c1c;
            border-color: #fca5a5;
            transform: translateY(-2px);
        }

        /* KHUNG CHỨA NỘI DUNG CHÍNH */
        .container {
            background: var(--card-bg);
            width: 100%;
            max-width: 650px;
            padding: 40px;
            border-radius: 24px;
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        h2 { 
            text-align: center; 
            background: linear-gradient(to right, #4F46E5, #EC4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 30px; 
            font-size: 28px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        h3 { 
            margin-top: 30px; 
            color: var(--text-muted); 
            font-size: 14px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }

        h3::after {
            content: "";
            flex: 1;
            height: 1px;
            background: #e5e7eb;
            margin-left: 15px;
        }

        .menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .menu a { 
            display: flex;
            align-items: center;
            padding: 16px 20px; 
            font-size: 16px; 
            font-weight: 500;
            text-decoration: none; 
            color: var(--text-main); 
            background-color: #ffffff; 
            border-radius: 12px; 
            border: 1px solid #e5e7eb;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
        }

        .menu a:hover { 
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.15);
        }
    </style>
</head>
<body>
    
    <!-- THANH THÔNG BÁO -->
    <div class="header-bar">
        <span>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    Xin chào: <strong>${sessionScope.user.fullname}</strong>
                    <!-- Nút đăng xuất hiển thị khi đã đăng nhập -->
                    <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <i>Bạn chưa đăng nhập</i> 
                    <!-- Nút đăng nhập hiển thị khi chưa đăng nhập -->
                    <a href="${pageContext.request.contextPath}/login" class="login-btn" style="margin-left: 10px;">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </span>
        <span>
            Lượt truy cập hệ thống: <strong>${applicationScope.visitors != null ? applicationScope.visitors : 0}</strong>
        </span>
    </div>

    <h2>PolyOE - Hệ thống Quản lý Video Online</h2>
    
    <div class="menu">
        <!-- CÁC CHỨC NĂNG CỦA LAB 3 -->
        <h3>LAB 3: Khai thác thực thể kết hợp</h3>
        <a href="${pageContext.request.contextPath}/user-favorites">&#128279; Bài 3: Xem Video Yêu Thích Của Nguyễn Văn Tèo</a>
        <a href="${pageContext.request.contextPath}/all-favorites">&#128279; Bài 4: Danh Sách Tất Cả Video Được Yêu Thích</a>
        
        <!-- CÁC CHỨC NĂNG CỦA LAB 4 -->
        <h3>LAB 4: Câu lệnh JPQL</h3>
        <a href="${pageContext.request.contextPath}/video-search">&#128269; Bài 3: Tìm kiếm Video theo từ khóa</a>
        <a href="${pageContext.request.contextPath}/share-report">&#128202; Bài 4: Thống kê lượt chia sẻ Video</a>
    </div>
</body>
</html>