<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập - PolyOE</title>
    <style>
        /* Khai báo các biến màu sắc đồng bộ với index.jsp */
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

        /* Khung chứa form đăng nhập (thu hẹp hơn so với trang index) */
        .container {
            background: var(--card-bg);
            width: 100%;
            max-width: 420px; 
            padding: 40px;
            border-radius: 24px;
            box-shadow: var(--shadow-lg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.5);
        }

        /* Tiêu đề Gradient */
        h2 { 
            text-align: center; 
            background: linear-gradient(to right, #4F46E5, #EC4899);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 20px; 
            font-size: 26px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }

        /* Thông báo lỗi */
        .error-message {
            color: #dc2626;
            text-align: center;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 20px;
            min-height: 20px; /* Giữ khoảng trống kể cả khi không có lỗi */
        }

        /* Bố cục form */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Bố cục từng nhóm input */
        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: var(--text-muted);
        }

        /* Định dạng ô nhập liệu */
        .form-group input {
            padding: 14px 16px;
            border: 1px solid #d1d5db;
            border-radius: 12px;
            font-size: 15px;
            outline: none;
            background: #f9fafb;
            transition: all 0.3s ease;
        }

        /* Hiệu ứng khi click vào ô nhập liệu */
        .form-group input:focus {
            border-color: var(--primary);
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.15);
        }

        /* Nút Đăng nhập */
        .submit-btn {
            margin-top: 10px;
            padding: 16px;
            background-color: var(--primary);
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-sm);
        }

        /* Hiệu ứng hover nút Đăng nhập */
        .submit-btn:hover {
            background-color: var(--primary-hover);
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(79, 70, 229, 0.3);
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h2>Đăng Nhập Hệ Thống</h2>
        
        <!-- Khung hiển thị thông báo lỗi (nếu có) -->
        <div class="error-message">${message}</div>
        
        <form action="${pageContext.request.contextPath}/login" method="POST" class="login-form">
            <div class="form-group">
                <label>Tài khoản</label>
                <input type="text" name="username" placeholder="Nhập tài khoản của bạn..." required>
            </div>
            
            <div class="form-group">
                <label>Mật khẩu</label>
                <input type="password" name="password" placeholder="Nhập mật khẩu..." required>
            </div>
            
            <button type="submit" class="submit-btn">Đăng nhập</button>
        </form>
    </div>

</body>
</html>