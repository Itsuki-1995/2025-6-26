<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>异常申报管理 - 校园羽毛球场馆预约系统</title>
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
        .anomaly-list {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .anomaly-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .anomaly-header h2 {
            color: #333;
            margin: 0;
        }
        .search-form {
            margin-top: 15px;
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .search-form input, .search-form select {
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }
        .search-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .anomaly-item {
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
            transition: background-color 0.3s;
        }
        .anomaly-item:hover {
            background: #f8f9fa;
        }
        .anomaly-item:last-child {
            border-bottom: none;
        }
        .anomaly-title {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }
        .anomaly-meta {
            color: #666;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .anomaly-description {
            color: #555;
            line-height: 1.6;
            margin-bottom: 10px;
            background: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
        }
        .anomaly-response {
            color: #555;
            line-height: 1.6;
            margin-top: 10px;
            background: #e8f4fd;
            padding: 10px;
            border-radius: 5px;
            border-left: 4px solid #667eea;
        }
        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }
        .status-processing {
            color: #3498db;
            font-weight: bold;
        }
        .status-resolved {
            color: #27ae60;
            font-weight: bold;
        }
        .status-rejected {
            color: #e74c3c;
            font-weight: bold;
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
        .btn-process {
            background: #3498db;
            color: white;
        }
        .btn-process:hover {
            background: #2980b9;
        }
        .btn-resolve {
            background: #27ae60;
            color: white;
        }
        .btn-resolve:hover {
            background: #229954;
        }
        .btn-reject {
            background: #e74c3c;
            color: white;
        }
        .btn-reject:hover {
            background: #c0392b;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        .response-form {
            margin-top: 15px;
            display: none;
        }
        .response-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            font-family: Arial, sans-serif;
            resize: vertical;
            height: 80px;
        }
        .response-form .btn {
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>异常申报管理</h1>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="anomaly-list">
            <div class="anomaly-header">
                <h2>异常申报列表</h2>
                <form class="search-form" action="${pageContext.request.contextPath}/admin/anomalies" method="get">
                    <select name="courtId">
                        <option value="">全部场地</option>
                        <c:forEach items="${courts}" var="court">
                            <option value="${court.id}" ${courtId == court.id ? 'selected' : ''}>${court.courtName}</option>
                        </c:forEach>
                    </select>
                    <select name="status">
                        <option value="">全部状态</option>
                        <option value="processing" ${status == 'processing' ? 'selected' : ''}>处理中</option>
                        <option value="resolved" ${status == 'resolved' ? 'selected' : ''}>已解决</option>
                    </select>
                    <button type="submit" class="search-btn">搜索</button>
                </form>
            </div>

            <c:choose>
                <c:when test="${empty anomalies}">
                    <div class="empty-message">
                        <h3>暂无异常申报</h3>
                        <p>目前没有找到符合条件的异常申报</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${anomalies}" var="anomaly">
                        <div class="anomaly-item">
                            <div class="anomaly-title">
                                场地：${anomaly.courtName} - 
                                <c:choose>
                                    <c:when test="${anomaly.status == 'processing'}">
                                        <span class="status-processing">处理中</span>
                                    </c:when>
                                    <c:when test="${anomaly.status == 'resolved'}">
                                        <span class="status-resolved">已解决</span>
                                    </c:when>
                                </c:choose>
                            </div>
                            <div class="anomaly-meta">
                                申报学生：${anomaly.realName} | 申报时间：${anomaly.createTime}
                            </div>
                            <div class="anomaly-description">
                                <strong>问题描述：</strong><br>
                                ${anomaly.description}
                            </div>
                            <c:if test="${not empty anomaly.adminResponse}">
                                <div class="anomaly-response">
                                    <strong>管理员回复：</strong><br>
                                    ${anomaly.adminResponse}
                                </div>
                            </c:if>
                            <c:if test="${anomaly.status == 'processing'}">
                                <div class="anomaly-actions">
                                    <form action="${pageContext.request.contextPath}/admin/resolveAnomaly" method="post" style="display: inline;">
                                        <input type="hidden" name="id" value="${anomaly.id}">
                                        <button type="submit" class="btn btn-resolve">标记为已解决</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        function showResponseForm(id) {
            document.getElementById('responseForm' + id).style.display = 'block';
        }
        
        function hideResponseForm(id) {
            document.getElementById('responseForm' + id).style.display = 'none';
        }
    </script>
</body>
</html> 