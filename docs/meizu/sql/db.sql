-- 保存魅族bbs的数据表定义

-- 主题表
DROP TABLE IF EXISTS `thread`;
CREATE TABLE `thread` (
    `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `t_id` bigint NOT NULL COMMENT '帖子id',
    `title` varchar(255) NOT NULL DEFAULT '' COMMENT '帖子标题',
    `author_id` bigint NOT NULL COMMENT '作者id',
    `create_time` int NOT NULL COMMENT '创建时间',
    `last_update_time` int NOT NULL COMMENT '最后更新时间',
    `update_times` int NOT NULL DEFAULT 0 COMMENT '更新次数',

    UNIQUE KEY `t_id` (`t_id`)

)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题表';

-- 回复表
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
    `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `t_id` bigint NOT NULL COMMENT '帖子id',
    `p_id` bigint NOT NULL COMMENT '回复id',
    `author_id` bigint NOT NULL COMMENT '作者id',
    `create_time` int NOT NULL COMMENT '创建时间',
    `last_update_time` int NOT NULL COMMENT '最后更新时间',
    `update_times` int NOT NULL DEFAULT 0 COMMENT '更新次数',

    KEY `t_id` (`t_id`),
    UNIQUE KEY `p_id` (`p_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='回复表';


-- 用户表
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `u_id` bigint NOT NULL COMMENT '用户id',
    `u_name` varchar(255) NOT NULL COMMENT '用户名',
    `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像地址',
    `img_name` varchar(255) NOT NULL DEFAULT '' COMMENT '保存下来的用户头像文件名称',
    `dl_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态 0 未下载 1 已下载 2 下载失败',
    `create_time` int NOT NULL COMMENT '创建时间',
    `last_update_time` int NOT NULL COMMENT '最后更新时间',
    `update_times` int NOT NULL DEFAULT 0 COMMENT '更新次数',

    KEY `u_name` (`u_name`),
    UNIQUE KEY `u_id` (`u_id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
