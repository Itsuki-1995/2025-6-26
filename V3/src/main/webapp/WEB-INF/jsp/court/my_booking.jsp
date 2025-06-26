<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>我的预约 - 校园羽毛球场馆预约系统</title>
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
        .booking-list {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .booking-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .booking-header h2 {
            color: #333;
            margin: 0;
        }
        .booking-table {
            width: 100%;
            border-collapse: collapse;
        }
        .booking-table th,
        .booking-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        .booking-table th {
            background: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        .booking-table tr:hover {
            background: #f8f9fa;
        }
        .status-pending {
            color: #f39c12;
            font-weight: bold;
        }
        .status-confirmed {
            color: #27ae60;
            font-weight: bold;
        }
        .status-cancelled {
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
        .btn-cancel {
            background: #e74c3c;
            color: white;
        }
        .btn-cancel:hover {
            background: #c0392b;
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
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        .time-slot {
            font-weight: bold;
        }
        .search-form {
            margin-top: 15px;
            display: flex;
            gap: 10px;
            align-items: center;
            flex-wrap: wrap;
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
        .search-btn:hover {
            transform: translateY(-1px);
        }
        .clear-btn {
            background: #95a5a6;
            color: white;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .clear-btn:hover {
            background: #7f8c8d;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>我的预约</h1>
            <a href="${pageContext.request.contextPath}/student/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="booking-list">
            <div class="booking-header">
                <h2>我的预约记录</h2>
                <form class="search-form" action="${pageContext.request.contextPath}/student/myBooking" method="get">
                    <select name="courtId">
                        <option value="">全部场地</option>
                        <c:forEach items="${courts}" var="court">
                            <option value="${court.id}" ${param.courtId == court.id ? 'selected' : ''}>${court.courtName}</option>
                        </c:forEach>
                    </select>
                    <select name="timeSlot">
                        <option value="">全部时间段</option>
                        <option value="morning" ${param.timeSlot == 'morning' ? 'selected' : ''}>上午 (8:00-12:00)</option>
                        <option value="afternoon" ${param.timeSlot == 'afternoon' ? 'selected' : ''}>下午 (14:00-18:00)</option>
                        <option value="evening" ${param.timeSlot == 'evening' ? 'selected' : ''}>晚上 (19:00-22:00)</option>
                    </select>
                    <input type="date" name="bookingDate" value="${param.bookingDate}" placeholder="选择日期">
                    <button type="submit" class="search-btn">搜索</button>
                    <a href="${pageContext.request.contextPath}/student/myBooking" class="clear-btn">清空</a>
                </form>
            </div>

            <c:choose>
                <c:when test="${empty bookings}">
                    <div class="empty-message">
                        <h3>暂无预约记录</h3>
                        <p>您还没有预约任何场地，<a href="${pageContext.request.contextPath}/student/book">立即预约</a></p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="booking-table">
                        <thead>
                            <tr>
                                <th>场地</th>
                                <th>预约日期</th>
                                <th>时间段</th>
                                <th>预约时间</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${bookings}" var="booking">
                                <tr>
                                    <td>${booking.courtName}</td>
                                    <td>${booking.bookingDate}</td>
                                    <td class="time-slot">
                                        <c:choose>
                                            <c:when test="${booking.timeSlot == 'morning'}">上午 (8:00-12:00)</c:when>
                                            <c:when test="${booking.timeSlot == 'afternoon'}">下午 (14:00-18:00)</c:when>
                                            <c:when test="${booking.timeSlot == 'evening'}">晚上 (19:00-22:00)</c:when>
                                        </c:choose>
                                    </td>
                                    <td>${booking.createTime}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/student/editBooking/${booking.id}" class="btn btn-edit">修改</a>
                                        <form action="${pageContext.request.contextPath}/student/deleteBooking" method="post" style="display: inline;">
                                            <input type="hidden" name="id" value="${booking.id}">
                                            <button type="submit" class="btn btn-delete" onclick="return confirm('确定要删除这个预约吗？')">删除</button>
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