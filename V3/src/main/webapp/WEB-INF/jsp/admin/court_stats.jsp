<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>场地预约统计 - 校园羽毛球场馆预约系统</title>
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
        .stats-list {
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .stats-header {
            background: #f8f9fa;
            padding: 20px;
            border-bottom: 1px solid #dee2e6;
        }
        .stats-header h2 {
            color: #333;
            margin: 0;
        }
        .stats-table {
            width: 100%;
            border-collapse: collapse;
        }
        .stats-table th,
        .stats-table td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #dee2e6;
        }
        .stats-table th {
            background: #f8f9fa;
            font-weight: bold;
            color: #333;
        }
        .stats-table tr:hover {
            background: #f8f9fa;
        }
        .court-name {
            font-weight: bold;
            color: #333;
            text-align: left;
        }
        .time-slot {
            font-weight: bold;
            color: #667eea;
        }
        .booking-count {
            font-weight: bold;
            color: #27ae60;
        }
        .empty-message {
            text-align: center;
            padding: 40px;
            color: #666;
        }
        .summary-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }
        .summary-card {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .summary-card h3 {
            color: #333;
            margin-bottom: 10px;
        }
        .summary-card .number {
            font-size: 2em;
            font-weight: bold;
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>场地预约统计</h1>
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="back-btn">返回首页</a>
        </div>
    </div>

    <div class="container">
        <div class="summary-stats">
            <div class="summary-card">
                <h3>总场地数</h3>
                <div class="number">${courts.size()}</div>
            </div>
            <div class="summary-card">
                <h3>今日预约</h3>
                <div class="number">${todayBookings}</div>
            </div>
            <div class="summary-card">
                <h3>本周预约</h3>
                <div class="number">${weekBookings}</div>
            </div>
            <div class="summary-card">
                <h3>本月预约</h3>
                <div class="number">${monthBookings}</div>
            </div>
        </div>

        <div class="stats-list">
            <div class="stats-header">
                <h2>各场地时间段预约统计</h2>
            </div>

            <c:choose>
                <c:when test="${empty courts}">
                    <div class="empty-message">
                        <h3>暂无场地数据</h3>
                        <p>还没有添加任何场地</p>
                    </div>
                </c:when>
                <c:otherwise>
                    <table class="stats-table">
                        <thead>
                            <tr>
                                <th>场地名称</th>
                                <th>上午 (8:00-12:00)</th>
                                <th>下午 (14:00-18:00)</th>
                                <th>晚上 (19:00-22:00)</th>
                                <th>总预约数</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${courts}" var="court">
                                <tr>
                                    <td class="court-name">${court.courtName}</td>
                                    <td class="time-slot">
                                        <c:set var="morningCount" value="0"/>
                                        <c:forEach items="${courtStats}" var="stat">
                                            <c:if test="${stat.courtId == court.id && stat.timeSlot == 'morning'}">
                                                <c:set var="morningCount" value="${stat.count}"/>
                                            </c:if>
                                        </c:forEach>
                                        <span class="booking-count">${morningCount}</span>
                                    </td>
                                    <td class="time-slot">
                                        <c:set var="afternoonCount" value="0"/>
                                        <c:forEach items="${courtStats}" var="stat">
                                            <c:if test="${stat.courtId == court.id && stat.timeSlot == 'afternoon'}">
                                                <c:set var="afternoonCount" value="${stat.count}"/>
                                            </c:if>
                                        </c:forEach>
                                        <span class="booking-count">${afternoonCount}</span>
                                    </td>
                                    <td class="time-slot">
                                        <c:set var="eveningCount" value="0"/>
                                        <c:forEach items="${courtStats}" var="stat">
                                            <c:if test="${stat.courtId == court.id && stat.timeSlot == 'evening'}">
                                                <c:set var="eveningCount" value="${stat.count}"/>
                                            </c:if>
                                        </c:forEach>
                                        <span class="booking-count">${eveningCount}</span>
                                    </td>
                                    <td class="booking-count">
                                        ${morningCount + afternoonCount + eveningCount}
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