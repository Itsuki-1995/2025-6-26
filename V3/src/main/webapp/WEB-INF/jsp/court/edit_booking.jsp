<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>修改预约 - 校园羽毛球场馆预约系统</title>
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
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }
        .form-group input:focus, .form-group select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.2);
        }
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .btn-primary:hover {
            transform: translateY(-1px);
        }
        .btn-secondary {
            background: #95a5a6;
            color: white;
        }
        .btn-secondary:hover {
            background: #7f8c8d;
        }
        .current-info {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 5px;
            margin-bottom: 20px;
            border-left: 4px solid #667eea;
        }
        .current-info h3 {
            color: #333;
            margin-bottom: 10px;
        }
        .current-info p {
            color: #666;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>修改预约</h1>
            <a href="${pageContext.request.contextPath}/student/myBooking" class="back-btn">返回我的预约</a>
        </div>
    </div>

    <div class="container">
        <div class="booking-form">
            <div class="current-info">
                <h3>当前预约信息</h3>
                <p><strong>场地：</strong>${booking.courtName}</p>
                <p><strong>预约日期：</strong>${booking.bookingDate}</p>
                <p><strong>时间段：</strong>
                    <c:choose>
                        <c:when test="${booking.timeSlot == 'morning'}">上午 (8:00-12:00)</c:when>
                        <c:when test="${booking.timeSlot == 'afternoon'}">下午 (14:00-18:00)</c:when>
                        <c:when test="${booking.timeSlot == 'evening'}">晚上 (19:00-22:00)</c:when>
                    </c:choose>
                </p>
            </div>

            <form action="${pageContext.request.contextPath}/student/updateBooking" method="post">
                <input type="hidden" name="id" value="${booking.id}">
                
                <div class="form-group">
                    <label for="courtId">选择场地</label>
                    <select name="courtId" id="courtId" required>
                        <c:forEach items="${courts}" var="court">
                            <option value="${court.id}" ${booking.courtId == court.id ? 'selected' : ''}>${court.courtName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="bookingDate">预约日期</label>
                    <input type="date" name="bookingDate" id="bookingDate" value="${booking.bookingDate}" min="${today}" required>
                </div>

                <div class="form-group">
                    <label for="timeSlot">时间段</label>
                    <select name="timeSlot" id="timeSlot" required>
                        <option value="morning" ${booking.timeSlot == 'morning' ? 'selected' : ''}>上午 (8:00-12:00)</option>
                        <option value="afternoon" ${booking.timeSlot == 'afternoon' ? 'selected' : ''}>下午 (14:00-18:00)</option>
                        <option value="evening" ${booking.timeSlot == 'evening' ? 'selected' : ''}>晚上 (19:00-22:00)</option>
                    </select>
                </div>

                <div class="form-group">
                    <button type="submit" class="btn btn-primary">保存修改</button>
                    <a href="${pageContext.request.contextPath}/student/myBooking" class="btn btn-secondary">取消</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html> 