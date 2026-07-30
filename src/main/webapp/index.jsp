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
    
    <!-- THANH THÔNG BÁO & ĐĂNG NHẬP -->
    <div class="header-bar">
        <span>
            <c:choose>
                <c:when test="${not empty sessionScope.user}">
                    Xin chào: <strong>${sessionScope.user.fullname}</strong> 
                    <c:if test="${sessionScope.user.admin}">
                        <span style="color: red; font-weight: bold;">[ADMIN]</span>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-logout">Đăng xuất</a>
                </c:when>
                <c:otherwise>
                    <i>Bạn chưa đăng nhập</i> 
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-login">Đăng nhập</a>
                </c:otherwise>
            </c:choose>
        </span>
        <span>Lượt truy cập: <strong>${applicationScope.visitors != null ? applicationScope.visitors : 0}</strong></span>
    </div>

    <h2>Hệ thống Quản lý Video - PolyOE</h2>
    
    <div class="menu">
        <!-- MENU 1: CHỨC NĂNG CÔNG KHAI (Ai cũng xem được) -->
        <div class="menu-section public-menu">
            <h3>&#127760; CHỨC NĂNG CÔNG KHAI</h3>
            <a href="${pageContext.request.contextPath}/video/list">Danh sách Video</a>
            <a href="${pageContext.request.contextPath}/video-search">Tìm kiếm Video theo từ khóa</a>
        </div>

        <!-- MENU 2: CHỨC NĂNG NGƯỜI DÙNG (Chỉ hiện khi đã đăng nhập) -->
        <c:if test="${not empty sessionScope.user}">
            <div class="menu-section user-menu">
                <h3>&#128100; CHỨC NĂNG CÁ NHÂN (USER)</h3>
                <a href="${pageContext.request.contextPath}/account/edit-profile">Cập nhật hồ sơ cá nhân</a>
                <a href="${pageContext.request.contextPath}/account/change-password">Đổi mật khẩu</a>
                <a href="${pageContext.request.contextPath}/user-favorites">Xem Video yêu thích của tôi</a>
            </div>
        </c:if>

        <!-- MENU 3: CHỨC NĂNG QUẢN TRỊ (Chỉ hiện khi đã đăng nhập VÀ là Admin) -->
        <!-- Logic: sessionScope.user.admin tương đương với việc gọi hàm getAdmin() trả về true/false -->
        <c:if test="${not empty sessionScope.user and sessionScope.user.admin}">
            <div class="menu-section admin-menu">
                <h3>&#9881;&#65039; CHỨC NĂNG QUẢN TRỊ (ADMIN)</h3>
                <a href="${pageContext.request.contextPath}/admin/video">Quản lý Video</a>
                <a href="${pageContext.request.contextPath}/admin/user">Quản lý Người dùng</a>
                <a href="${pageContext.request.contextPath}/all-favorites">Thống kê tất cả lượt thích</a>
                <a href="${pageContext.request.contextPath}/share-report">Báo cáo lượt chia sẻ Video</a>
            </div>
        </c:if>
    </div>

</body>
</html>