<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生首页 - 校园羽毛球场馆预约系统</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px 0;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }
        .header h1 {
            font-size: 24px;
        }
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        .logout-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .welcome-section {
            background: white;
            padding: 30px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .welcome-section h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .menu-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }
        .menu-item {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: transform 0.3s;
        }
        .menu-item:hover {
            transform: translateY(-5px);
        }
        .menu-item h3 {
            color: #333;
            margin-bottom: 15px;
        }
        .menu-item p {
            color: #666;
            margin-bottom: 20px;
        }
        .menu-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s;
        }
        .menu-btn:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>校园羽毛球场馆预约系统</h1>
            <div class="user-info">
                <span>欢迎，${user.realName}（学生）</span>
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">退出登录</a>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="welcome-section">
            <h2>欢迎使用校园羽毛球场馆预约系统</h2>
            <p>您可以在这里预约羽毛球场馆、查看公告、申报异常等。</p>
        </div>

        <div class="menu-grid">
            <div class="menu-item">
                <h3>预约场馆</h3>
                <p>选择场地、日期和时间段进行预约</p>
                <a href="${pageContext.request.contextPath}/student/book" class="menu-btn">立即预约</a>
            </div>

            <div class="menu-item">
                <h3>我的预约</h3>
                <p>查看和管理您的所有预约记录</p>
                <a href="${pageContext.request.contextPath}/student/myBooking" class="menu-btn">查看预约</a>
            </div>

            <div class="menu-item">
                <h3>公告查看</h3>
                <p>查看管理员发布的最新公告</p>
                <a href="${pageContext.request.contextPath}/student/announcements" class="menu-btn">查看公告</a>
            </div>

            <div class="menu-item">
                <h3>异常申报</h3>
                <p>申报场地异常或设备问题</p>
                <a href="${pageContext.request.contextPath}/student/anomaly" class="menu-btn">申报异常</a>
            </div>

            <div class="menu-item">
                <h3>我的申报</h3>
                <p>查看您的异常申报记录和状态</p>
                <a href="${pageContext.request.contextPath}/student/myAnomaly" class="menu-btn">查看申报</a>
            </div>
        </div>
    </div>
</body>
</html> 