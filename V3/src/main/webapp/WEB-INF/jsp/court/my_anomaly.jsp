<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的申报 - 校园羽毛球场馆预约系统</title>
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
            <h1>我的申报</h1>
            <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="anomaly-list">
            <div class="anomaly-header">
                <h2>我的异常申报记录</h2>
            </div>

            <c:choose>
                <c:when test="${empty anomalies}">
                    <div class="empty-message">
                        <h3>暂无申报记录</h3>
                        <p>您还没有提交任何异常申报，<a href="${pageContext.request.contextPath}/student/anomaly">立即申报</a></p>
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
                                申报时间：${anomaly.createTime}
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
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html> 