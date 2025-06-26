-- 创建数据库
CREATE DATABASE IF NOT EXISTS badminton_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE badminton_db;

-- 用户表
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `real_name` varchar(50) NOT NULL COMMENT '真实姓名',
  `role` enum('student','admin') NOT NULL DEFAULT 'student' COMMENT '角色',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- 场地表
CREATE TABLE `court` (
  `id` int NOT NULL AUTO_INCREMENT,
  `court_number` varchar(20) NOT NULL COMMENT '场地编号',
  `court_name` varchar(50) NOT NULL COMMENT '场地名称',
  `status` enum('available','maintenance','unavailable') NOT NULL DEFAULT 'available' COMMENT '场地状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_court_number` (`court_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='场地表';

-- 预约表
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '用户ID',
  `court_id` int NOT NULL COMMENT '场地ID',
  `booking_date` date NOT NULL COMMENT '预约日期',
  `time_slot` enum('morning','afternoon','evening') NOT NULL COMMENT '时间段',
  `status` enum('pending','confirmed','cancelled') NOT NULL DEFAULT 'pending' COMMENT '预约状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_court_id` (`court_id`),
  KEY `idx_booking_date` (`booking_date`),
  CONSTRAINT `fk_booking_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_booking_court` FOREIGN KEY (`court_id`) REFERENCES `court` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='预约表';

-- 公告表
CREATE TABLE `announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL COMMENT '公告标题',
  `content` text NOT NULL COMMENT '公告内容',
  `admin_id` int NOT NULL COMMENT '发布管理员ID',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active' COMMENT '公告状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_admin_id` (`admin_id`),
  CONSTRAINT `fk_announcement_admin` FOREIGN KEY (`admin_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='公告表';

-- 异常申报表
CREATE TABLE `anomaly` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '申报用户ID',
  `court_id` int NOT NULL COMMENT '场地ID',
  `description` text NOT NULL COMMENT '异常描述',
  `status` enum('pending','processing','resolved','rejected') NOT NULL DEFAULT 'pending' COMMENT '处理状态',
  `admin_response` text COMMENT '管理员回复',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_court_id` (`court_id`),
  CONSTRAINT `fk_anomaly_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_anomaly_court` FOREIGN KEY (`court_id`) REFERENCES `court` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='异常申报表';

-- 插入初始数据
-- 插入管理员用户
INSERT INTO `user` (`username`, `password`, `real_name`, `role`) VALUES 
('admin', 'admin123', '系统管理员', 'admin');

-- 插入学生用户
INSERT INTO `user` (`username`, `password`, `real_name`, `role`) VALUES 
('student1', 'student123', '张三', 'student'),
('student2', 'student123', '李四', 'student'),
('student3', 'student123', '王五', 'student');

-- 插入场地数据
INSERT INTO `court` (`court_number`, `court_name`, `status`) VALUES 
('1', '一号场地', 'available'),
('2', '二号场地', 'available'),
('3', '三号场地', 'available'),
('4', '四号场地', 'available');

-- 插入示例公告
INSERT INTO `announcement` (`title`, `content`, `admin_id`) VALUES 
('场馆使用须知', '请各位同学在使用羽毛球场馆时注意保持场地整洁，爱护设施设备。', 1),
('场地维护通知', '二号场地将于本周五进行维护，请同学们提前调整预约时间。', 1);

-- 插入示例预约
INSERT INTO `booking` (`user_id`, `court_id`, `booking_date`, `time_slot`, `status`) VALUES 
(2, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), 'morning', 'confirmed'),
(3, 2, DATE_ADD(CURDATE(), INTERVAL 2 DAY), 'afternoon', 'pending');

-- 插入示例异常申报
INSERT INTO `anomaly` (`user_id`, `court_id`, `description`, `status`) VALUES 
(2, 3, '三号场地网子松动，需要维修', 'pending'); 