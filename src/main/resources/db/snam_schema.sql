-- -------------------------------------------------------------
-- TablePlus 5.8.3(529)
--
-- https://tableplus.com/
--
-- Database: snam
-- Generation Time: 2024-01-10 09:54:25.6290
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



DROP TABLE IF EXISTS `sys_business_perm`;
CREATE TABLE `sys_business_perm` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT '主键ID',
  `menu_id` varchar(20)  DEFAULT NULL COMMENT '菜单ID',
  `button_id` varchar(50)  DEFAULT NULL COMMENT '功能按钮ID',
  `perm_name` varchar(20)  DEFAULT NULL COMMENT '权限名称',
  `perm_action` varchar(50)  DEFAULT NULL COMMENT '权限动作(标记)',
  `req_url` varchar(255)  DEFAULT NULL COMMENT '请求URL',
  `req_method` varchar(20)  DEFAULT 'GET' COMMENT '请求方法',
  `note` varchar(200)  DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `action_ref` varchar(50) DEFAULT NULL COMMENT '引用Action',
  PRIMARY KEY (`id`) ,
  KEY `INDEX_URL_METHOD` (`req_url`,`req_method`) ,
  KEY `INDEX_ACTION` (`perm_action`) 
)  COMMENT='系统-业务权限定义';

DROP TABLE IF EXISTS `sys_button`;
CREATE TABLE `sys_button` (
  `id` varchar(50)  NOT NULL DEFAULT '' COMMENT 'id-编码',
  `button_name` varchar(50)  DEFAULT NULL COMMENT '按钮名称',
  `menu_id` varchar(20)  NOT NULL DEFAULT '' COMMENT '菜单ID',
  `note` varchar(50)  DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `be_unauth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不需要权限控制',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `sub_menu` varchar(50)  DEFAULT NULL COMMENT '子菜单名称',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-按钮定义';

DROP TABLE IF EXISTS `sys_cell_meta`;
CREATE TABLE `sys_cell_meta` (
  `id` varchar(20)  NOT NULL DEFAULT '',
  `resource_id` varchar(20)  DEFAULT NULL COMMENT '资源ID',
  `resource_type` varchar(20)  DEFAULT NULL COMMENT '资源类型',
  `cell_meta_name` varchar(50)  DEFAULT NULL COMMENT '列名',
  `cell_comment` varchar(100)  DEFAULT NULL COMMENT '列名描述',
  `cell_meta_type` varchar(50)  DEFAULT NULL COMMENT '列名数据类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-元素资源-列定义';

DROP TABLE IF EXISTS `sys_column_meta`;
CREATE TABLE `sys_column_meta` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'ID',
  `column_name` varchar(40)  DEFAULT NULL COMMENT '列名-',
  `column_type` varchar(30)  DEFAULT NULL COMMENT '列类型',
  `column_comment` varchar(100)  DEFAULT NULL COMMENT '列注解',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-列定义';

DROP TABLE IF EXISTS `sys_data_perm_column`;
CREATE TABLE `sys_data_perm_column` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `column_name` varchar(40) DEFAULT NULL COMMENT '列名',
  `table_name` varchar(50) DEFAULT NULL COMMENT '表名',
  `table_comment` varchar(100) DEFAULT NULL COMMENT '表注解',
  `column_type` varchar(30) DEFAULT NULL COMMENT '列类型',
  `column_comment` varchar(100) DEFAULT NULL COMMENT '列注解',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_dict_child`;
CREATE TABLE `sys_dict_child` (
  `id` varchar(20)  NOT NULL,
  `dict_code` varchar(50)  DEFAULT NULL COMMENT '编号',
  `dict_name` varchar(80)  DEFAULT NULL COMMENT '名称',
  `priority` int DEFAULT NULL COMMENT '优先级(顺序)',
  `state` varchar(20)  DEFAULT NULL COMMENT '状态',
  `be_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `parent_id` varchar(20)  DEFAULT NULL COMMENT '父ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `saerch_index` (`dict_code`,`dict_name`,`state`,`parent_id`) 
)  COMMENT='系统-字典-子项';

DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `id` varchar(20)  NOT NULL,
  `dict_code` varchar(50)  DEFAULT NULL COMMENT '编号',
  `dict_name` varchar(80)  DEFAULT NULL COMMENT '名称',
  `dict_type` varchar(20)  DEFAULT NULL COMMENT '类型(系统SYSTEM|业务BUSINESS)',
  `priority` int DEFAULT NULL COMMENT '优先级(顺序)',
  `state` varchar(20)  DEFAULT NULL COMMENT '状态',
  `be_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `search_index` (`dict_code`,`dict_name`,`state`) 
)  COMMENT='系统-字典项';

DROP TABLE IF EXISTS `sys_dynamic_data_source`;
CREATE TABLE `sys_dynamic_data_source` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `driver_class_name` varchar(200) DEFAULT NULL COMMENT '驱动类名称',
  `url` varchar(500) DEFAULT NULL COMMENT 'url名称',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_gate_limit`;
CREATE TABLE `sys_gate_limit` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(50)  DEFAULT NULL COMMENT '名称',
  `rule_user` varchar(30)  DEFAULT NULL COMMENT '用户名规则',
  `rule_system_tag` varchar(30) DEFAULT NULL COMMENT '系统TAG规则',
  `rule_user_tag` varchar(30) DEFAULT NULL COMMENT '用户TAG规则',
  `rule_url` varchar(30) DEFAULT NULL COMMENT 'URL规则',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `state` varchar(30) DEFAULT NULL COMMENT '状态',
  `duration_in_second` int DEFAULT NULL COMMENT '持续时间',
  `allow_volume` int DEFAULT NULL COMMENT '流量',
  `speed_in_second` int DEFAULT NULL COMMENT '增速',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_gate_limit_request`;
CREATE TABLE `sys_gate_limit_request` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `url` varchar(100) DEFAULT NULL COMMENT '匹配URL',
  `method` varchar(20) DEFAULT NULL COMMENT '请求方法',
  `ip` text  COMMENT '请求IP',
  `limit_id` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `resource_id` varchar(30)  DEFAULT NULL,
  `resource_name` varchar(50)  DEFAULT NULL COMMENT '按钮名称',
  `limit_type` varchar(20) DEFAULT NULL COMMENT '类型',
  `priority` int DEFAULT NULL COMMENT '优先级',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_gate_limit_stag`;
CREATE TABLE `sys_gate_limit_stag` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `system_name` varchar(50)  DEFAULT NULL COMMENT '系统端',
  `system_tag` varchar(30)  DEFAULT NULL COMMENT '系统端名称',
  `limit_id` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_gate_limit_user`;
CREATE TABLE `sys_gate_limit_user` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user_id` varchar(30)  DEFAULT NULL,
  `user_real_cn_name` varchar(50) DEFAULT NULL COMMENT '用户中文名',
  `limit_id` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_gate_limit_utag`;
CREATE TABLE `sys_gate_limit_utag` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `tag_code` varchar(30) DEFAULT NULL COMMENT 'TAG编码',
  `tag_name` varchar(50) DEFAULT NULL COMMENT 'TAG名称',
  `limit_id` varchar(30) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'ID',
  `grht` int DEFAULT NULL COMMENT '右节点',
  `glft` int DEFAULT NULL COMMENT '左节点',
  `group_name` varchar(50)  DEFAULT NULL COMMENT '组织名称',
  `parent_id` varchar(20)  DEFAULT NULL COMMENT '父组织ID',
  `group_level` int DEFAULT NULL COMMENT '组织层级',
  `be_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `group_id` varchar(20)  DEFAULT NULL,
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) ,
  UNIQUE KEY `UNIQUE_GROUP` (`group_name`,`parent_id`)
)  COMMENT='系统-架构组织定义';

DROP TABLE IF EXISTS `sys_group_entrust`;
CREATE TABLE `sys_group_entrust` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `perm_id` varchar(20)  DEFAULT NULL COMMENT '权限ID',
  `group_entrust_id` varchar(20)  DEFAULT NULL COMMENT '代理组织ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`) ,
  KEY `INDEX_GROUP_ENTRUST` (`perm_id`,`user_id`)
)  COMMENT='系统-数据资源-组织委托';

DROP TABLE IF EXISTS `sys_group_except_entrust`;
CREATE TABLE `sys_group_except_entrust` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `group_except_entrust_id` varchar(20) DEFAULT NULL COMMENT '代理组织ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '权限ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20) DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`),
  KEY `INDEX_GROUP_EXCEPT_ENTRUST` (`perm_id`,`user_id`)
) ;

DROP TABLE IF EXISTS `sys_hmac_log`;
CREATE TABLE `sys_hmac_log` (
  `id` varchar(20) NOT NULL,
  `data_from` varchar(50) DEFAULT NULL COMMENT '数据来源',
  `data_to` varchar(50) DEFAULT NULL COMMENT '数据目的地',
  `data_content` text COMMENT '数据内容',
  `exchange_url` varchar(500) DEFAULT NULL COMMENT '传输地址',
  `exchange_method` varchar(30) DEFAULT NULL COMMENT '传输方法',
  `exchange_param` text COMMENT '参数名称',
  `exchange_name` varchar(50) DEFAULT NULL COMMENT '传输名称',
  `exchange_time` timestamp NULL DEFAULT NULL COMMENT '传输时间',
  `exception_msg` text COMMENT '异常信息',
  `state` varchar(30) DEFAULT NULL COMMENT '传输状态',
  `ip_address` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
)  COMMENT='系统-对外接口-日志';

DROP TABLE IF EXISTS `sys_hmac_user`;
CREATE TABLE `sys_hmac_user` (
  `id` varchar(20) NOT NULL,
  `system_name` varchar(80) DEFAULT NULL COMMENT '外部系统名称',
  `app_id` varchar(30) DEFAULT NULL COMMENT '外部应用ID',
  `app_key` varchar(30) DEFAULT NULL COMMENT '秘钥',
  `expire_date` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `white_ips` varchar(200) DEFAULT NULL COMMENT '白名单IP列表(以逗号间隔)',
  `state` varchar(30) DEFAULT 'ACTIVE' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `note` text COMMENT '备注',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '用户对应的组织',
  PRIMARY KEY (`id`),
  KEY `appid_index` (`app_id`) 
)  COMMENT='系统-对外接口-用户';

DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'id-编码',
  `menu_name` varchar(50)  DEFAULT NULL COMMENT '菜单名称',
  `entitle` varchar(50)  DEFAULT NULL COMMENT '英文名称',
  `menu_type` varchar(30)  DEFAULT NULL COMMENT '菜单类型',
  `be_unauth` tinyint(1) NOT NULL DEFAULT '0' COMMENT '不需要权限控制',
  `parent_id` varchar(20)  DEFAULT NULL COMMENT '上级菜单',
  `priority` smallint DEFAULT NULL COMMENT '优先级',
  `redirect` varchar(50)  DEFAULT NULL COMMENT '跳转链接',
  `icon` varchar(30)  DEFAULT NULL COMMENT '图标类名',
  `be_hidden` tinyint(1) DEFAULT '0' COMMENT '是否隐藏',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-菜单定义';

DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'id',
  `message` text  COMMENT '消息内容',
  `receive_user_no` varchar(20)  DEFAULT NULL COMMENT '接收用户账号',
  `state` varchar(20)  NOT NULL DEFAULT 'UNREAD' COMMENT '状态(未读UNREAD/已读READED)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `title` varchar(50) DEFAULT NULL COMMENT '消息主题',
  `message_type` varchar(30)  DEFAULT '待办' COMMENT '消息类型(系统/提单/...)',
  `avatar` varchar(100)  DEFAULT NULL COMMENT '图片',
  `to_url` varchar(500)  DEFAULT NULL COMMENT '跳转url',
  `to_title` varchar(255) DEFAULT NULL COMMENT '跳转标题',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-消息';

DROP TABLE IF EXISTS `sys_param`;
CREATE TABLE `sys_param` (
  `id` varchar(20)  NOT NULL,
  `param_name` varchar(100)  DEFAULT NULL COMMENT '参数名称',
  `param_code` varchar(50)  DEFAULT NULL COMMENT '参数编码',
  `param_value` varchar(50)  DEFAULT NULL COMMENT '参数值',
  `be_delete` tinyint(1) DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `note` text COMMENT '备注',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
)  COMMENT='系统-参数定义';

DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `id` varchar(20)  NOT NULL,
  `post_name` varchar(50)  DEFAULT NULL COMMENT '职位名称',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '对应的组织',
  `be_manager` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为主管',
  `note` varchar(50)  DEFAULT NULL COMMENT '备注',
  `state` varchar(20)  DEFAULT 'ACTIVE' COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `perm_scope` varchar(30)  DEFAULT NULL COMMENT '权限范围',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-岗位定义';

DROP TABLE IF EXISTS `sys_position_group_entrust`;
CREATE TABLE `sys_position_group_entrust` (
  `id` varchar(20)  NOT NULL,
  `position_id` varchar(20)  DEFAULT NULL COMMENT '职位ID',
  `group_entrust_id` varchar(20)  DEFAULT NULL COMMENT '代理组织ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`),
  KEY `INDEX_POSITION_GROUP_ENTRUST` (`position_id`)
)  COMMENT='系统-数据资源-岗位委托';

DROP TABLE IF EXISTS `sys_position_role`;
CREATE TABLE `sys_position_role` (
  `id` varchar(20)  NOT NULL,
  `role_id` varchar(20)  DEFAULT NULL COMMENT '角色ID',
  `position_id` varchar(20)  DEFAULT NULL COMMENT '职位ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`),
  KEY `INDEX_POSITION_ROLE` (`position_id`)
)  COMMENT='系统-岗位-角色关系';

DROP TABLE IF EXISTS `sys_position_user_entrust`;
CREATE TABLE `sys_position_user_entrust` (
  `id` varchar(20)  NOT NULL,
  `position_id` varchar(20)  DEFAULT NULL COMMENT '职位ID',
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`),
  KEY `INDEX_POSITION_USER_ENTRUST` (`position_id`)
)  COMMENT='系统-数据资源-岗位人员委托';

DROP TABLE IF EXISTS `sys_resource_api`;
CREATE TABLE `sys_resource_api` (
  `id` varchar(20)  NOT NULL DEFAULT '',
  `resource_id` varchar(50)  DEFAULT NULL COMMENT '资源ID',
  `resource_type` varchar(20)  DEFAULT 'MENU' COMMENT '资源类型',
  `req_url` varchar(255)  DEFAULT NULL COMMENT '请求URL',
  `req_method` varchar(20)  DEFAULT 'GET' COMMENT '请求方法',
  `state` varchar(30)  DEFAULT 'ACTIVE' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`) ,
  UNIQUE KEY `UNIQUE_RESOURCE_API` (`resource_id`,`resource_type`) ,
  KEY `INDEX_RESOURCE_API` (`req_url`,`req_method`)
)  COMMENT='系统-元素资源-API定义';

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'id',
  `role_name` varchar(50)  DEFAULT NULL COMMENT '角色名称',
  `note` varchar(255)  DEFAULT NULL COMMENT '备注',
  `state` varchar(20)  DEFAULT 'ACTIVE' COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `be_super` tinyint(1) DEFAULT '0' COMMENT '是否超级管理员',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-角色定义';

DROP TABLE IF EXISTS `sys_role_resource`;
CREATE TABLE `sys_role_resource` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT '角色资源关系id',
  `resource_id` varchar(50)  NOT NULL DEFAULT '' COMMENT '资源id',
  `role_id` varchar(20)  NOT NULL DEFAULT '' COMMENT '角色id',
  `resource_type` varchar(50)  NOT NULL COMMENT '资源类型',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`) ,
  UNIQUE KEY `UNIQUE_ROLE_RESOURCE` (`resource_id`,`role_id`,`resource_type`) ,
  KEY `INDEX_ROLE` (`role_id`) 
)  COMMENT='系统-角色-资源关系';

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT 'id',
  `user_no` varchar(20)  DEFAULT NULL COMMENT '工号',
  `user_sex` varchar(4)  DEFAULT NULL COMMENT '性别',
  `user_passwd` varchar(50)  DEFAULT NULL COMMENT '密码',
  `user_mobile` varchar(20)  DEFAULT NULL COMMENT '联系方式',
  `line_phone` varchar(20)  DEFAULT NULL COMMENT '联系方式',
  `user_real_en_name` varchar(16)  DEFAULT NULL COMMENT '英文名',
  `user_real_cn_name` varchar(10)  DEFAULT NULL COMMENT '中文名',
  `user_email` varchar(50)  DEFAULT NULL COMMENT '邮箱',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `secret_key` mediumtext  COMMENT '公钥',
  `avatar` varchar(200)  DEFAULT NULL COMMENT '头像',
  `state` varchar(30)  DEFAULT 'UNACTIVE' COMMENT '状态',
  `note` varchar(500)  DEFAULT NULL COMMENT '备注',
  `qq` varchar(20)  DEFAULT NULL COMMENT 'QQ ',
  `weixin` varchar(50)  DEFAULT NULL COMMENT '微信',
  `user_tag` mediumtext ,
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `pin_yin` varchar(100)  DEFAULT NULL COMMENT '拼音简称',
  `be_search` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可以被搜索',
  `user_email_pwd` varchar(50) DEFAULT NULL COMMENT '邮箱密码',
  `user_email_host` varchar(50) DEFAULT NULL COMMENT '邮箱服务器',
  `user_email_protocol` varchar(50) DEFAULT NULL COMMENT '邮箱协议',
  `full_pin_yin` varchar(100)  DEFAULT NULL,
  `job_no` varchar(50) DEFAULT NULL COMMENT '工号',
  `auth_pass` varchar(50) DEFAULT NULL COMMENT '授权码',
  `auth_pass_start` timestamp NULL DEFAULT NULL COMMENT '授权码生效起始时间',
  `auth_pass_end` timestamp NULL DEFAULT NULL COMMENT '授权码生效结束时间',
  `work_no` varchar(20) DEFAULT NULL COMMENT '工号',
  `be_multi_login` tinyint(1) DEFAULT '0' COMMENT '是否多点登录',
  `expire_policy` varchar(30) DEFAULT NULL COMMENT '过期策略(固定/最后访问)',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) ,
  UNIQUE KEY `unique_user_no` (`user_no`) 
)  COMMENT='系统-用户定义';

DROP TABLE IF EXISTS `sys_user_business_perm`;
CREATE TABLE `sys_user_business_perm` (
  `id` varchar(20)  NOT NULL DEFAULT '' COMMENT '主键ID',
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `perm_id` varchar(20)  DEFAULT NULL COMMENT '权限ID',
  `perm_scope` varchar(30)  DEFAULT NULL COMMENT '权限范围',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '权限失效开始',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '权限失效结束',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`) ,
  KEY `INDEX_USER_BUSINESS_PERM` (`perm_id`,`user_id`)
)  COMMENT='系统-数据资源-用户业务权限关系';

DROP TABLE IF EXISTS `sys_user_column_perm`;
CREATE TABLE `sys_user_column_perm` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `column_express` text  COMMENT '权限列,以逗号间隔',
  `user_id` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `perm_id` varchar(30) DEFAULT NULL COMMENT '权限ID',
  `org_id` varchar(20) DEFAULT '',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_user_data_perm`;
CREATE TABLE `sys_user_data_perm` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user_id` varchar(30) DEFAULT NULL COMMENT '用户ID',
  `perm_id` varchar(30) DEFAULT NULL COMMENT '权限ID',
  `org_id` varchar(20) DEFAULT '',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `perm_express` text  COMMENT '表达式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `be_or_condition` tinyint(1) DEFAULT '0',
  `be_force_condition` tinyint(1) DEFAULT '0' COMMENT '原始SQL有相同条件时忽略',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_user_entrust`;
CREATE TABLE `sys_user_entrust` (
  `id` varchar(20)  NOT NULL COMMENT '主键ID',
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `user_entrust_id` varchar(20)  DEFAULT NULL COMMENT '代理用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `perm_id` varchar(20)  DEFAULT NULL COMMENT '业务权限id',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`) ,
  KEY `INDEX_USER_ENTRUST` (`perm_id`,`user_id`)
)  COMMENT='系统-数据资源-用户委托';

DROP TABLE IF EXISTS `sys_user_except_entrust`;
CREATE TABLE `sys_user_except_entrust` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user_except_entrust_id` varchar(20) DEFAULT NULL COMMENT '代理用户ID',
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '业务权限id',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20) DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`),
  KEY `INDEX_PERM_USER` (`perm_id`,`user_id`) 
) ;

DROP TABLE IF EXISTS `sys_user_group`;
CREATE TABLE `sys_user_group` (
  `id` varchar(20)  NOT NULL,
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`),
  KEY `INDEX_USER_GROUP` (`user_id`)
)  COMMENT='系统-用户-组织关系';

DROP TABLE IF EXISTS `sys_user_log`;
CREATE TABLE `sys_user_log` (
  `id` varchar(20)  NOT NULL,
  `exchange_url` varchar(500)  DEFAULT NULL COMMENT '传输地址',
  `exchange_method` varchar(30)  DEFAULT NULL COMMENT '传输方法',
  `exchange_param` mediumtext  COMMENT '参数名称',
  `exchange_name` varchar(50)  DEFAULT NULL COMMENT '传输名称',
  `exchange_time` timestamp NULL DEFAULT NULL COMMENT '传输时间',
  `exception_msg` mediumtext  COMMENT '异常信息',
  `state` varchar(30)  DEFAULT NULL COMMENT '传输状态',
  `ip_address` varchar(55)  DEFAULT NULL COMMENT 'IP地址',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `execute_method` varchar(100)  DEFAULT NULL COMMENT '执行方法',
  `execute_timer` int DEFAULT NULL COMMENT '耗时[秒]',
  `execute_module_name` varchar(30)  DEFAULT NULL COMMENT '微服务名称',
  `log_type_code` varchar(30)  DEFAULT NULL COMMENT '日志类型编码',
  `browser` varchar(100)  DEFAULT NULL COMMENT 'web浏览器+版本',
  `os` varchar(100)  DEFAULT NULL COMMENT '操作系统+版本',
  `response_data` text COMMENT '返回信息',
  `system_tag` varchar(30)  DEFAULT NULL COMMENT '登录的系统',
  PRIMARY KEY (`id`) 
)  COMMENT='系统-用户-操作日志';

DROP TABLE IF EXISTS `sys_user_position`;
CREATE TABLE `sys_user_position` (
  `id` varchar(20)  NOT NULL,
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `position_id` varchar(20)  DEFAULT NULL COMMENT '职位ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20)  DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20)  DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `create_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50)  DEFAULT NULL COMMENT '更新人姓名',
  `group_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`),
  KEY `INDEX_USER_POSITON` (`user_id`)
)  COMMENT='系统-用户-职位关系';

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(20)  NOT NULL COMMENT '用户ID',
  `role_id` varchar(20)  NOT NULL COMMENT '角色ID',
  `id` varchar(20)  NOT NULL COMMENT 'id',
  `org_id` varchar(20)  DEFAULT NULL COMMENT '组织ID',
  PRIMARY KEY (`id`) ,
  KEY `INDEX_USER_ROLE` (`user_id`)
)  COMMENT='系统-用户-角色关系';

DROP TABLE IF EXISTS `sys_user_uset`;
CREATE TABLE `sys_user_uset` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `uset_id` varchar(20)  DEFAULT NULL COMMENT '用户组ID',
  `user_id` varchar(20)  DEFAULT NULL COMMENT '用户ID',
  `org_id` varchar(20) DEFAULT NULL COMMENT '组织ID(用户所在的组织)',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset`;
CREATE TABLE `sys_uset` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `uset_name` varchar(50) DEFAULT NULL COMMENT '用户组名称',
  `note` varchar(255) DEFAULT NULL COMMENT '备注',
  `state` varchar(20) DEFAULT 'ACTIVE' COMMENT '状态',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `be_lock` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_business_perm`;
CREATE TABLE `sys_uset_business_perm` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `uset_id` varchar(20) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '权限ID',
  `perm_scope` varchar(30) DEFAULT NULL COMMENT '权限范围',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '权限失效开始',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '权限失效结束',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_column_perm`;
CREATE TABLE `sys_uset_column_perm` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `column_express` text  COMMENT '表达式',
  `uset_id` varchar(30) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(30) DEFAULT NULL COMMENT '权限ID',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_data_perm`;
CREATE TABLE `sys_uset_data_perm` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `uset_id` varchar(30) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(30) DEFAULT NULL COMMENT '权限ID',
  `perm_start_time` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `perm_end_time` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `perm_express` text COMMENT '表达式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `be_or_condition` tinyint(1) DEFAULT '0',
  `be_force_condition` tinyint(1) DEFAULT '0' COMMENT '原始SQL有相同条件时忽略',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_group_entrust`;
CREATE TABLE `sys_uset_group_entrust` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `group_entrust_id` varchar(20) DEFAULT NULL COMMENT '代理组织ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `uset_id` varchar(20) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '业务权限id',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_group_except_entrust`;
CREATE TABLE `sys_uset_group_except_entrust` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `group_except_entrust_id` varchar(20) DEFAULT NULL COMMENT '代理组织ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `uset_id` varchar(20) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '业务权限id',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_role`;
CREATE TABLE `sys_uset_role` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `uset_id` varchar(20) DEFAULT NULL,
  `role_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_user_entrust`;
CREATE TABLE `sys_uset_user_entrust` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `user_entrust_id` varchar(20)  DEFAULT NULL COMMENT '代理用户ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `uset_id` varchar(20) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '业务权限id',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `sys_uset_user_except_entrust`;
CREATE TABLE `sys_uset_user_except_entrust` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `user_except_entrust_id` varchar(20) DEFAULT NULL COMMENT '代理用户ID',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `group_id` varchar(20) DEFAULT NULL COMMENT '组织ID',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `uset_id` varchar(20) DEFAULT NULL COMMENT '用户组ID',
  `perm_id` varchar(20) DEFAULT NULL COMMENT '业务权限id',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `wms_class`;
CREATE TABLE `wms_class` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `class_name` varchar(50) DEFAULT NULL COMMENT '分类名称',
  `parent_id` varchar(30) DEFAULT NULL COMMENT '父分类',
  `note` text COMMENT '分类备注',
  `group_id` varchar(30) DEFAULT NULL,
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `class_code` varchar(30) DEFAULT NULL COMMENT '分类编码',
  PRIMARY KEY (`id`)
)  COMMENT='商品分类';

DROP TABLE IF EXISTS `wms_item`;
CREATE TABLE `wms_item` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `code` varchar(30) DEFAULT NULL COMMENT '编码',
  `name` varchar(100)  DEFAULT NULL COMMENT '名称',
  `class_id` varchar(30) DEFAULT NULL COMMENT '分类ID',
  `class_name` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `provider_id` varchar(30)  DEFAULT NULL COMMENT '供应商ID',
  `provider_name` varchar(100)  DEFAULT NULL COMMENT '供应商简称',
  `group_id` varchar(30) DEFAULT NULL,
  `quantity` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `product_time` timestamp NULL DEFAULT NULL COMMENT '生产时间',
  `expire_time` timestamp NULL DEFAULT NULL COMMENT '过期时间',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `note` text COMMENT '备注',
  `keeper` varchar(50) DEFAULT NULL COMMENT '库管',
  `keeper_code` varchar(30) DEFAULT NULL COMMENT '库管编码',
  PRIMARY KEY (`id`)
)  COMMENT='商品项';

DROP TABLE IF EXISTS `wms_order`;
CREATE TABLE `wms_order` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `code` varchar(20) DEFAULT NULL COMMENT '编号',
  `seller_code` varchar(30) DEFAULT NULL COMMENT '销售编码',
  `seller` varchar(50) DEFAULT NULL COMMENT '销售',
  `service_code` varchar(30)  DEFAULT NULL COMMENT '客服编码',
  `service` varchar(50)  DEFAULT NULL COMMENT '客服名称',
  `item_id` varchar(30) DEFAULT NULL COMMENT '商品ID',
  `item_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `quantity` decimal(12,2) DEFAULT NULL COMMENT '数量',
  `price` decimal(12,2) DEFAULT NULL COMMENT '单价',
  `money` decimal(12,2) DEFAULT NULL COMMENT '总金额',
  `buyer` varchar(30) DEFAULT NULL COMMENT '购买人',
  `buyer_address` varchar(200) DEFAULT NULL COMMENT '购买人地址',
  `buyer_tel` varchar(30) DEFAULT NULL COMMENT '购买人电话',
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `note` text COMMENT '备注',
  `group_id` varchar(30) DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`id`)
) ;

DROP TABLE IF EXISTS `wms_provider`;
CREATE TABLE `wms_provider` (
  `id` varchar(30) NOT NULL DEFAULT '',
  `code` varchar(30)  DEFAULT NULL COMMENT '编码',
  `name` varchar(100)  DEFAULT NULL COMMENT '名称',
  `simple_name` varchar(50)  DEFAULT NULL COMMENT '简称',
  `link_man` varchar(30)  DEFAULT NULL COMMENT '联系人',
  `link_phone` varchar(20)  DEFAULT NULL COMMENT '联系电话',
  `group_id` varchar(30) DEFAULT NULL,
  `create_user_cn_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `update_user_cn_name` varchar(50) DEFAULT NULL COMMENT '更新人姓名',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_user` varchar(20) DEFAULT NULL COMMENT '创建人',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新人',
  `note` text COMMENT '备注',
  PRIMARY KEY (`id`)
)  COMMENT='供应商';



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;