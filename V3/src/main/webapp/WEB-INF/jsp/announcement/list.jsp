<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>公告列表 - 校园羽毛球场馆预约系统</title>
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
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }
        .announcement-list {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .announcement-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .announcement-header h2 {
            color: #333;
            margin: 0;
        }
        .announcement-item {
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
            transition: background-color 0.3s;
        }
        .announcement-item:hover {
            background: #f8f9fa;
        }
        .announcement-item:last-child {
            border-bottom: none;
        }
        .announcement-title {
            font-size: 18px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .announcement-title a {
            color: #667eea;
            text-decoration: none;
        }
        .announcement-title a:hover {
            text-decoration: underline;
        }
        .announcement-meta {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .announcement-content {
            color: #555;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .announcement-content-preview {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            max-width: 100%;
        }
        .read-more {
            color: #667eea;
            text-decoration: none;
            font-weight: bold;
        }
        .read-more:hover {
            text-decoration: underline;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>公告列表</h1>
            <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="announcement-list">
            <div class="announcement-header">
                <h2>最新公告</h2>
            </div>

            <c:choose>
                <c:when test="${empty announcements}">
                    <div class="empty-message">
                        <h3>暂无公告</h3>
                        <p>目前没有发布任何公告</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${announcements}" var="announcement">
                        <div class="announcement-item">
                            <div class="announcement-title">
                                <a href="${pageContext.request.contextPath}/student/announcement/${announcement.id}">
                                    ${announcement.title}
                                </a>
                            </div>
                            <div class="announcement-meta">
                                发布者：${announcement.adminName} | 
                                发布时间：${announcement.createTime}
                            </div>
                            <div class="announcement-content">
                                <div class="announcement-content-preview">
                                    ${announcement.content}
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/student/announcement/${announcement.id}" class="read-more">
                                查看详情 →
                            </a>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html> 