<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>预约场馆 - 校园羽毛球场馆预约系统</title>
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
        .booking-form {
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
        .form-group select, .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group select:focus, .form-group input:focus {
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
        .error-message {
            color: #e74c3c;
            text-align: center;
            margin-bottom: 20px;
            padding: 10px;
            background: #fdf2f2;
            border-radius: 5px;
            border: 1px solid #f5c6cb;
        }
        .info-section {
            background: #e8f4fd;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #667eea;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>预约场馆</h1>
            <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="booking-form">
            <div class="info-section">
                <h3>预约须知：</h3>
                <ul>
                    <li>请至少提前一天预约</li>
                    <li>每个时间段只能预约一个场地</li>
                    <li>预约成功后请按时到场使用</li>
                    <li>如需取消请提前操作</li>
                </ul>
            </div>

            <c:if test="${not empty msg}">
                <div class="error-message">
                    ${msg}
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/student/book" method="post">
                <div class="form-group">
                    <label for="courtId">选择场地：</label>
                    <select id="courtId" name="courtId" required>
                        <option value="">请选择场地</option>
                        <c:forEach items="${courts}" var="court">
                            <c:if test="${court.status == 'available'}">
                                <option value="${court.id}">${court.courtName}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="bookingDate">预约日期：</label>
                    <input type="date" id="bookingDate" name="bookingDate" required 
                           min="${today}">
                </div>

                <div class="form-group">
                    <label for="timeSlot">时间段：</label>
                    <select id="timeSlot" name="timeSlot" required>
                        <option value="">请选择时间段</option>
                        <option value="morning">上午 (8:00-12:00)</option>
                        <option value="afternoon">下午 (14:00-18:00)</option>
                        <option value="evening">晚上 (19:00-22:00)</option>
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn">提交预约</button>
                    <a href="${pageContext.request.contextPath}/student/dashboard" class="btn" style="background: #95a5a6;">取消</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html> 