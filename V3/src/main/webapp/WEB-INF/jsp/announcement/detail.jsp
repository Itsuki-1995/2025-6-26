<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>公告详情 - 校园羽毛球场馆预约系统</title>
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
        .back-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
        .back-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        .announcement-detail {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .announcement-header {
            background: #f8f9fa;
            padding: 30px;
            border-bottom: 1px solid #dee2e6;
        }
        .announcement-title {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 15px;
        }
        .announcement-meta {
            color: #666;
            font-size: 14px;
        }
        .announcement-content {
            padding: 30px;
            line-height: 1.8;
            color: #333;
        }
        .announcement-content p {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>公告详情</h1>
            <a href="${pageContext.request.contextPath}/student/announcements" class="back-btn">返回列表</a>
        </div>
    </div>

    <div class="container">
        <div class="announcement-detail">
            <div class="announcement-header">
                <div class="announcement-title">${announcement.title}</div>
                <div class="announcement-meta">
                    发布者：${announcement.adminName} | 
                    发布时间：${announcement.createTime}
                </div>
            </div>
            <div class="announcement-content">
                ${announcement.content}
            </div>
        </div>
    </div>
</body>
</html> 