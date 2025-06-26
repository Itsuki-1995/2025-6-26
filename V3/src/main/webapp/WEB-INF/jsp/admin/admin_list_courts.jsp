<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>场地管理 - 校园羽毛球场馆预约系统</title>
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .court-list {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .court-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .court-header h2 {
            color: #333;
            margin: 0;
        }
        .add-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }
        .add-btn:hover {
            transform: translateY(-2px);
        }
        .court-table {
            width: 100%;
            border-collapse: collapse;
        }
        .court-table th,
        .court-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        .court-table th {
            background: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        .court-table tr:hover {
            background: #f8f9fa;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
            margin-right: 5px;
        }
        .btn-edit {
            background: #3498db;
            color: white;
        }
        .btn-edit:hover {
            background: #2980b9;
        }
        .btn-delete {
            background: #e74c3c;
            color: white;
        }
        .btn-delete:hover {
            background: #c0392b;
        }
        .status-available {
            color: #27ae60;
            font-weight: bold;
        }
        .status-maintenance {
            color: #f39c12;
            font-weight: bold;
        }
        .status-unavailable {
            color: #e74c3c;
            font-weight: bold;
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
            <h1>场地管理</h1>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="court-list">
            <div class="court-header">
                <h2>场地列表</h2>
                <a href="${pageContext.request.contextPath}/admin/addCourt" class="add-btn">添加场地</a>
            </div>

            <c:choose>
                <c:when test="${empty courts}">
                    <div class="empty-message">
                        <h3>暂无场地</h3>
                        <p>还没有添加任何场地</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="court-table">
                        <thead>
                            <tr>
                                <th>场地名称</th>
                                <th>场地描述</th>
                                <th>状态</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${courts}" var="court">
                                <tr>
                                    <td>${court.courtName}</td>
                                    <td>${court.description}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${court.status == 'available'}">
                                                <span class="status-available">可用</span>
                                            </c:when>
                                            <c:when test="${court.status == 'maintenance'}">
                                                <span class="status-maintenance">维护中</span>
                                            </c:when>
                                            <c:when test="${court.status == 'unavailable'}">
                                                <span class="status-unavailable">不可用</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${court.createTime}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/editCourt/${court.id}" class="btn btn-edit">编辑</a>
                                        <form action="${pageContext.request.contextPath}/admin/deleteCourt" method="post" style="display: inline;">
                                            <input type="hidden" name="id" value="${court.id}">
                                            <button type="submit" class="btn btn-delete" onclick="return confirm('确定要删除这个场地吗？')">删除</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html> 