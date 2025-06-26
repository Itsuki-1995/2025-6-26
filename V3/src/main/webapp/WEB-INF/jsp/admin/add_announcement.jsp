<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>发布公告 - 校园羽毛球场馆预约系统</title>
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
        .announcement-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            font-family: Arial, sans-serif;
        }
        .form-group textarea {
            height: 200px;
            resize: vertical;
        }
        .form-group input:focus, .form-group textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }
        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn:hover {
            transform: translateY(-2px);
        }
        .info-section {
            background: #e8f4fd;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #667eea;
        }
        .info-section h3 {
            margin-bottom: 10px;
            color: #333;
        }
        .info-section ul {
            margin-left: 20px;
        }
        .info-section li {
            margin-bottom: 5px;
            color: #555;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>发布公告</h1>
            <a href="${pageContext.request.contextPath}/admin/announcements" class="back-btn">返回列表</a>
        </div>
    </div>

    <div class="container">
        <div class="announcement-form">
            <div class="info-section">
                <h3>发布说明：</h3>
                <ul>
                    <li>公告标题要简洁明了</li>
                    <li>公告内容要详细清晰</li>
                    <li>发布后学生可以立即看到</li>
                    <li>可以随时编辑或删除公告</li>
                </ul>
            </div>

            <form action="${pageContext.request.contextPath}/admin/addAnnouncement" method="post">
                <div class="form-group">
                    <label for="title">公告标题：</label>
                    <input type="text" id="title" name="title" placeholder="请输入公告标题..." required>
                </div>

                <div class="form-group">
                    <label for="content">公告内容：</label>
                    <textarea id="content" name="content" placeholder="请输入公告内容..." required></textarea>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">发布公告</button>
                    <a href="${pageContext.request.contextPath}/admin/announcements" class="btn" style="background: #95a5a6;">取消</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html> 