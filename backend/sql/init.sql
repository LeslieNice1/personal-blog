-- 个人博客系统 数据库初始化脚本
CREATE DATABASE IF NOT EXISTS personal_blog
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE personal_blog;

CREATE TABLE article (
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(200) NOT NULL,
    summary      VARCHAR(500),
    content      TEXT,
    author_id    BIGINT,
    category_id  INT         DEFAULT 0,
    views        INT         DEFAULT 0,
    status       INT         DEFAULT 1,
    create_time  DATETIME    DEFAULT CURRENT_TIMESTAMP,
    update_time  DATETIME    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted      INT         DEFAULT 0
);

INSERT INTO article (title, summary, content, author_id, category_id, views, status)
VALUES ('Spring Boot 入门教程', 'Spring Boot 快速入门', 'Spring Boot 是一个快速开发框架...', 1, 1, 120, 1),
       ('Vue 3 实战笔记', 'Vue 3 Composition API 使用心得', 'Vue 3 引入了 Composition API...', 1, 2, 85, 1),
       ('MyBatis-Plus 使用指南', 'MyBatis-Plus 常用功能整理', 'MyBatis-Plus 是 MyBatis 的增强工具...', 1, 1, 96, 1);
