<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Lab 3 & Lab 4 - PolyOE</title>
    <style>
        /* Khai báo các biến màu sắc và đổ bóng để dễ quản lý */
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

        /* Nền trang web */
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

        /* Khung chứa nội dung chính */
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

        /* Tiêu đề chính dạng Gradient Text */
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

        /* Tiêu đề từng Lab có đường kẻ ngang đẹp mắt */
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

        /* Khung chứa các nút bấm */
        .menu {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        /* Định dạng các nút bấm */
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

        /* Hiệu ứng mượt mà khi rê chuột vào */
        .menu a:hover { 
            border-color: var(--primary);
            color: var(--primary);
            transform: translateY(-3px); /* Nút nổi lên nhẹ */
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.15);
        }

        /* Căn chỉnh lại icon trong nút */
        .icon {
            margin-right: 12px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>PolyOE - Hệ thống Quản lý Video Online</h2>
        
        <div class="menu">
            <!-- CÁC CHỨC NĂNG CỦA LAB 3 -->
            <h3>LAB 3: Khai thác thực thể kết hợp</h3>
            <a href="${pageContext.request.contextPath}/user-favorites">
                <span class="icon">&#128279;</span> Bài 3: Xem Video Yêu Thích Của Nguyễn Văn Tèo
            </a>
            <a href="${pageContext.request.contextPath}/all-favorites">
                <span class="icon">&#128279;</span> Bài 4: Danh Sách Tất Cả Video Được Yêu Thích
            </a>
            
            <!-- CÁC CHỨC NĂNG CỦA LAB 4 -->
            <h3>LAB 4: Câu lệnh JPQL</h3>
            <a href="${pageContext.request.contextPath}/video-search">
                <span class="icon">&#128269;</span> Bài 3: Tìm kiếm Video theo từ khóa
            </a>
            <a href="${pageContext.request.contextPath}/share-report">
                <span class="icon">&#128202;</span> Bài 4: Thống kê lượt chia sẻ Video
            </a>
        </div>
    </div>
</body>
</html>