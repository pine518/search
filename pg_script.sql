DROP TABLE IF EXISTS "sys_announcement";
CREATE TABLE "sys_announcement" (
"id" varchar(32) NOT NULL,
"titile" varchar(100) NULL DEFAULT NULL,
"msg_content" text NULL,
"start_time" TIMESTAMP NULL DEFAULT NULL,
"end_time" TIMESTAMP NULL DEFAULT NULL,
"sender" varchar(100) NULL DEFAULT NULL,
"priority" varchar(255) NULL DEFAULT NULL,
"msg_category" varchar(10) NOT NULL DEFAULT '2',
"msg_type" varchar(10) NULL DEFAULT NULL,
"send_status" varchar(10) NULL DEFAULT NULL,
"send_time" TIMESTAMP NULL DEFAULT NULL,
"cancel_time" TIMESTAMP NULL DEFAULT NULL,
"del_flag" varchar(1) NULL DEFAULT NULL,
"bus_type" varchar(20) NULL DEFAULT NULL,
"bus_id" varchar(50) NULL DEFAULT NULL,
"open_type" varchar(20) NULL DEFAULT NULL,
"open_page" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"user_ids" text NULL,
"msg_abstract" text NULL,
"dt_task_id" varchar(100) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
"files" text NULL,
"visits_num" INTEGER NULL DEFAULT NULL,
"iz_top" INTEGER NULL DEFAULT 0,
"iz_approval" varchar(10) NULL DEFAULT NULL,
"bpm_status" varchar(10) NULL DEFAULT NULL,
"msg_classify" varchar(255) NULL DEFAULT NULL,
"notice_type" varchar(10) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sanno_endtime"("end_time"),
INDEX "idx_sanno_start_time"("start_time"),
INDEX "idx_sanno_msg_type"("msg_type"),
INDEX "idx_sanno_send_status"("send_status"),
INDEX "idx_sanno_del_flag"("del_flag"),
INDEX "idx_sanno_tenant_id"("tenant_id"),
INDEX "idx_sanno_sender"("sender"),
INDEX "idx_sanno_create_time"("create_time")
) ;

-- ----------------------------
-- Records of sys_announcement
-- ----------------------------
INSERT INTO "sys_announcement" VALUES ('1950442031319511042', '要放假了', '<p>我们都知道, 只要有意义, 那么就必须慎重考虑.既然如何, 带着这些问题, 我们来审视一下随机一段废话. 从这个角度来看, 在这种不可避免的冲突下，我们必须解决这个问题. 本人也是经过了深思熟虑,在每个日日夜夜思考这个问题. 随机一段废话因何而发生?<br>我们都知道, 只要有意义, 那么就必须慎重考虑.从这个角度来看, 从这个角度来看,&nbsp;<br>现在, 解决随机一段废话的问题, 是非常非常重要的. 所以</p>', NULL, NULL, 'admin', 'H', '1', 'ALL', '1', '2025-07-30 14:23:14', NULL, '0', NULL, NULL, NULL, NULL, 'admin', '2025-07-30 14:23:12', 'admin', '2025-07-30 14:23:14', '', '我们都知道, 只要有意义, 那么就必须慎重考虑', NULL, 0, NULL, NULL, 0, '0', '1', NULL, 'system');

-- ----------------------------
-- Table structure for sys_announcement_send
-- ----------------------------
DROP TABLE IF EXISTS "sys_announcement_send";
CREATE TABLE "sys_announcement_send" (
"id" varchar(32) NOT NULL,
"annt_id" varchar(32) NULL DEFAULT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"read_flag" INTEGER NULL DEFAULT NULL,
"read_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"star_flag" varchar(10) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sacm_annt_id"("annt_id"),
INDEX "idx_sacm_user_id"("user_id"),
INDEX "idx_sacm_read_flag"("read_flag"),
INDEX "idx_sacm_star_flag"("star_flag")
) ;

-- ----------------------------
-- Records of sys_announcement_send
-- ----------------------------
-- INSERT INTO "sys_announcement_send" VALUES ('1950442039812976642', '1950442031319511042', '1714471285016895490', 0, NULL, 'admin', '2025-07-30 14:23:14', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_category
-- ----------------------------

-- ----------------------------
-- Table structure for sys_check_rule
-- ----------------------------
DROP TABLE IF EXISTS "sys_check_rule";
CREATE TABLE "sys_check_rule" (
"id" varchar(32) NOT NULL,
"rule_name" varchar(100) NULL DEFAULT NULL,
"rule_code" varchar(100) NULL DEFAULT NULL,
"rule_json" varchar(1024) NULL DEFAULT NULL,
"rule_description" varchar(200) NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uk_scr_rule_code"("rule_code")
) ;

-- ----------------------------
-- Records of sys_check_rule
-- ----------------------------
INSERT INTO "sys_check_rule" VALUES ('1224980593992388610', '通用编码规则', 'common', '[{\"digits\":1,\"pattern\":\"^[a-z|A-Z]$\",\"message\":\"第一位只能是字母\"},{\"digits\":\"*\",\"pattern\":\"^[0-9|a-z|A-Z|_]{0,}$\",\"message\":\"只能填写数字、大小写字母、下划线\"},{\"digits\":\"*\",\"pattern\":\"^.{3,}$\",\"message\":\"最少输入3位数\"},{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"最多输入12位数\"}]', '规则：1、首位只能是字母；2、只能填写数字、大小写字母、下划线；3、最少3位数，最多12位数。', 'admin', '2025-09-13 18:54:19', 'admin', '2020-02-05 16:58:27');
INSERT INTO "sys_check_rule" VALUES ('1225001845524004866', '负责的功能测试', 'test', '[{\"digits\":\"*\",\"pattern\":\"^.{3,12}$\",\"message\":\"只能输入3-12位字符\"},{\"digits\":3,\"pattern\":\"^\\\\d{3}$\",\"message\":\"前3位必须是数字\"},{\"digits\":4,\"pattern\":\"^@{4}$\",\"message\":\"第4-7位必须都为 @\"},{\"digits\":2,\"pattern\":\"^#=$\",\"message\":\"第8-9位必须是 #=\"},{\"digits\":1,\"pattern\":\"^O$\",\"message\":\"第10位必须为大写的O\"},{\"digits\":\"*\",\"pattern\":\"^[^pP]*$\",\"message\":\"不能输入P\"},{\"digits\":\"*\",\"pattern\":\"^.*。$\",\"message\":\"必须以。结尾\"}]', '包含长度校验、特殊字符校验等', 'admin', '2026-01-21 09:55:31', 'admin', '2020-02-05 18:22:54');

-- ----------------------------
-- Table structure for sys_comment
-- ----------------------------
DROP TABLE IF EXISTS "sys_comment";
CREATE TABLE "sys_comment" (
"id" varchar(32) NOT NULL,
"table_name" varchar(50) NOT NULL,
"table_data_id" varchar(32) NOT NULL,
"from_user_id" varchar(32) NOT NULL,
"to_user_id" varchar(32) NULL DEFAULT NULL,
"comment_id" varchar(32) NULL DEFAULT NULL,
"comment_content" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_table_data_id"("table_name", "table_data_id")
) ;

-- ----------------------------
-- Records of sys_comment
-- ----------------------------
-- INSERT INTO "sys_comment" VALUES ('1580814554312093698', 'v3_hello', '1580529718871674882', 'e9ca23d68d884d4ebb19d07889727dae', '', '', '1212\n:open_mouth:', 'admin', '2022-10-14 14:55:35', NULL, NULL);

-- ----------------------------
-- Table structure for sys_data_log
-- ----------------------------
DROP TABLE IF EXISTS "sys_data_log";
CREATE TABLE "sys_data_log" (
"id" varchar(32) NOT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_name" varchar(100) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"data_table" varchar(200) NULL DEFAULT NULL,
"data_id" varchar(32) NULL DEFAULT NULL,
"data_content" text NULL,
"data_version" INTEGER NULL DEFAULT NULL,
"type" varchar(20) NULL DEFAULT 'json',
PRIMARY KEY ("id"),
INDEX "idx_sdl_data_table_id"("data_table", "data_id")
) ;

-- ----------------------------
-- Records of sys_data_log
-- ----------------------------
-- INSERT INTO "sys_data_log" VALUES ('1942113821121011714', 'admin', '管理员', '2025-07-07 14:49:52', NULL, NULL, 'test_order_main', '1833472350097121281', '子表[订单产品明细]：修改了1条数据', 1, 'comment');

-- ----------------------------
-- Table structure for sys_data_source
-- ----------------------------
DROP TABLE IF EXISTS "sys_data_source";
CREATE TABLE "sys_data_source" (
"id" varchar(36) NOT NULL,
"code" varchar(100) NULL DEFAULT NULL,
"name" varchar(100) NULL DEFAULT NULL,
"remark" varchar(200) NULL DEFAULT NULL,
"db_type" varchar(10) NULL DEFAULT NULL,
"db_driver" varchar(100) NULL DEFAULT NULL,
"db_url" varchar(500) NULL DEFAULT NULL,
"db_name" varchar(100) NULL DEFAULT NULL,
"db_username" varchar(100) NULL DEFAULT NULL,
"db_password" varchar(100) NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"sys_org_code" varchar(64) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
PRIMARY KEY ("id"),
UNIQUE INDEX "uk_sdc_rule_code"("code")
) ;

-- ----------------------------
-- Records of sys_data_source
-- ----------------------------
INSERT INTO "sys_data_source" VALUES ('1209779538310004737', 'local_mysql', '本地测试库', '本地数据库MySQL5.7', '4', 'com.mysql.cj.jdbc.Driver', 'jdbc:mysql://127.0.0.1:3306/jeecg-boot?characterEncoding=UTF-8&useUnicode=true&useSSL=false&tinyInt1isBit=false&allowPublicKeyRetrieval=true&serverTimezone=Asia/Shanghai', 'jeecg-boot', 'root', 'f5b6775e8d1749483f2320627de0e706', 'admin', '2019-12-25 18:14:53', 'admin', '2025-09-13 18:46:43', 'A01', 0);

-- ----------------------------
-- Table structure for sys_depart
-- ----------------------------
DROP TABLE IF EXISTS "sys_depart";
CREATE TABLE "sys_depart" (
"id" varchar(32) NOT NULL,
"parent_id" varchar(32) NULL DEFAULT NULL,
"depart_name" varchar(100) NOT NULL,
"depart_name_en" varchar(500) NULL DEFAULT NULL,
"depart_name_abbr" varchar(500) NULL DEFAULT NULL,
"depart_order" INTEGER NULL DEFAULT 0,
"description" varchar(500) NULL DEFAULT NULL,
"org_category" varchar(10) NOT NULL DEFAULT '1',
"org_type" varchar(10) NULL DEFAULT NULL,
"org_code" varchar(64) NOT NULL,
"mobile" varchar(32) NULL DEFAULT NULL,
"fax" varchar(32) NULL DEFAULT NULL,
"address" varchar(100) NULL DEFAULT NULL,
"memo" varchar(500) NULL DEFAULT NULL,
"status" varchar(1) NULL DEFAULT NULL,
"del_flag" varchar(1) NULL DEFAULT NULL,
"qywx_identifier" varchar(100) NULL DEFAULT NULL,
"ding_identifier" varchar(100) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
"iz_leaf" SMALLINT NULL DEFAULT 0,
"position_id" varchar(32) NULL DEFAULT NULL,
"dep_post_parent_id" varchar(32) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_depart_org_code"("org_code"),
INDEX "idx_sd_parent_id"("parent_id"),
INDEX "idx_sd_depart_order"("depart_order"),
INDEX "idx_sd_position_id"("position_id"),
INDEX "idx_sd_dep_post_parent_id"("dep_post_parent_id")
) ;

-- ----------------------------
-- Records of sys_depart
-- ----------------------------
INSERT INTO "sys_depart" VALUES ('1582683631414632450', 'c6d7cb4deeac411cb3384b1b31278596', '销售公关岗位', NULL, NULL, 0, NULL, '3', '2', 'A01A06', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2022-10-19 18:42:37', NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958496243038556161', '', '控股集团', NULL, NULL, 0, NULL, '2', '1', 'A05', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:47:48', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958496444470005762', '1958496243038556161', '投资控股集团有限公司', NULL, NULL, 0, NULL, '4', '2', 'A05A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:48:34', 'admin', '2025-08-21 19:49:57', 0, 0, NULL, '');
INSERT INTO "sys_depart" VALUES ('1958496759810363394', '1958496243038556161', '城市运营管理集团有限公司', NULL, NULL, 1, NULL, '4', '2', 'A05A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:49:49', 'admin', '2025-08-21 20:30:23', 0, 0, NULL, '');
INSERT INTO "sys_depart" VALUES ('1958496836318662658', '1958496444470005762', '领导班子', NULL, NULL, 0, NULL, '2', '3', 'A05A01A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:50:08', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958496891561840641', '1958496444470005762', '办公室', NULL, NULL, 2, NULL, '2', '3', 'A05A01A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:50:21', 'admin', '2025-08-21 19:50:36', 0, 0, NULL, '');
INSERT INTO "sys_depart" VALUES ('1958496943017562114', '1958496444470005762', '财务管理中心', NULL, NULL, 3, NULL, '2', '3', 'A05A01A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:50:33', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958497020528300033', '1958496444470005762', '投资发展部', NULL, NULL, 4, NULL, '2', '3', 'A05A01A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:50:51', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958497164103520258', '1958496836318662658', '董事长', NULL, NULL, 0, NULL, '3', '4', 'A05A01A01A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:51:26', NULL, NULL, 0, 1, '1958471111989067778', '');
INSERT INTO "sys_depart" VALUES ('1958497256772472834', '1958496836318662658', '党委书记', NULL, NULL, 1, NULL, '3', '4', 'A05A01A01A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:51:48', 'admin', '2025-08-21 19:54:53', 0, 1, '1958471030867034113', '1958497164103520258');
INSERT INTO "sys_depart" VALUES ('1958497591230468098', '1958496836318662658', '控股总经理', NULL, NULL, 3, NULL, '3', '4', 'A05A01A01A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:53:08', 'admin', '2025-08-21 19:54:42', 0, 1, '1958471074953363458', '1958497164103520258');
INSERT INTO "sys_depart" VALUES ('1958497769387724802', '1958496836318662658', '纪委书记', NULL, NULL, 4, NULL, '3', '4', 'A05A01A01A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:53:50', 'admin', '2025-08-21 19:54:06', 0, 1, '1958471030867034113', '1958497591230468098');
INSERT INTO "sys_depart" VALUES ('1958498187287203841', '1958496891561840641', '控股办公室主任', NULL, NULL, 1, NULL, '3', '4', 'A05A01A02A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:55:30', 'admin', '2025-08-21 19:55:50', 0, 1, '1958470912214368258', '1958497164103520258');
INSERT INTO "sys_depart" VALUES ('1958498716927135745', '1958496891561840641', '副主任', NULL, NULL, 2, NULL, '3', '4', 'A05A01A02A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 19:57:36', 'admin', '2025-08-21 19:57:50', 0, 1, '1958470865577902082', '1958498187287203841');
INSERT INTO "sys_depart" VALUES ('1958502219078733826', '1958496891561840641', '职员', NULL, NULL, 3, NULL, '3', '4', 'A05A01A02A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:11:31', NULL, NULL, 0, 1, '1958470823064436737', '1958498187287203841');
INSERT INTO "sys_depart" VALUES ('1958502381062754305', '1958496943017562114', '主任', NULL, NULL, 1, NULL, '3', '4', 'A05A01A03A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:12:10', 'admin', '2025-08-21 20:13:13', 0, 1, '1958470912214368258', '1958502611426512898');
INSERT INTO "sys_depart" VALUES ('1958502611426512898', '1958496836318662658', '控股副总经理', NULL, NULL, 5, NULL, '3', '4', 'A05A01A01A05', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:13:04', 'admin', '2025-08-21 20:27:14', 0, 1, '1958471030867034113', '1958497591230468098');
INSERT INTO "sys_depart" VALUES ('1958502810966331393', '1958496943017562114', '副主任', NULL, NULL, 2, NULL, '3', '4', 'A05A01A03A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:13:52', 'admin', '2025-08-21 20:14:40', 0, 1, '1958470865577902082', '1958502381062754305');
INSERT INTO "sys_depart" VALUES ('1958502942289989634', '1958496943017562114', '职员', NULL, NULL, 2, NULL, '3', '4', 'A05A01A03A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:14:23', 'admin', '2025-08-21 20:14:28', 0, 1, '1958470823064436737', '1958502810966331393');
INSERT INTO "sys_depart" VALUES ('1958503159999533057', '1958497020528300033', '部长', NULL, NULL, 1, NULL, '3', '4', 'A05A01A04A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:15:15', NULL, NULL, 0, 1, '1958470912214368258', '1958502611426512898');
INSERT INTO "sys_depart" VALUES ('1958503409933914114', '1958497020528300033', '副部长', NULL, NULL, 2, NULL, '3', '4', 'A05A01A04A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:16:15', NULL, NULL, 0, 1, '1958470865577902082', '1958503159999533057');
INSERT INTO "sys_depart" VALUES ('1958503468805165058', '1958497020528300033', '员工', NULL, NULL, 3, NULL, '3', '4', 'A05A01A04A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:16:29', NULL, NULL, 0, 1, '1958470823064436737', '1958503409933914114');
INSERT INTO "sys_depart" VALUES ('1958507136782733313', '1958496759810363394', '领导班子', NULL, NULL, 1, NULL, '2', '3', 'A05A02A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:31:03', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958507356253884418', '1958496759810363394', '信息技术发展有限公司', NULL, NULL, 4, NULL, '4', '3', 'A05A02A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:31:56', 'admin', '2025-08-21 21:12:57', 0, 0, NULL, '');
INSERT INTO "sys_depart" VALUES ('1958507448138502146', '1958507136782733313', '董事长', NULL, NULL, 1, NULL, '3', '4', 'A05A02A01A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:32:18', 'admin', '2025-08-21 20:33:24', 0, 1, '1958471111989067778', '');
INSERT INTO "sys_depart" VALUES ('1958507542866857985', '1958507136782733313', '副总经理', NULL, NULL, 3, NULL, '3', '4', 'A05A02A01A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:32:40', 'admin', '2025-08-21 20:33:26', 0, 1, '1958471030867034113', '');
INSERT INTO "sys_depart" VALUES ('1958507650828242946', '1958507136782733313', '总经理', NULL, NULL, 2, NULL, '3', '4', 'A05A02A01A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 20:33:06', 'admin', '2025-08-21 20:33:20', 0, 1, '1958471074953363458', '');
INSERT INTO "sys_depart" VALUES ('1958518943542972418', '1958507356253884418', '领导班子', NULL, NULL, 1, NULL, '2', '4', 'A05A02A03A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:17:58', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958519010207240193', '1958507356253884418', '综合管理部', NULL, NULL, 2, NULL, '2', '4', 'A05A02A03A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:18:14', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958519045623943169', '1958507356253884418', '财务部', NULL, NULL, 3, NULL, '2', '4', 'A05A02A03A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:18:23', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958519097058693121', '1958507356253884418', '软件研发部', NULL, NULL, 4, NULL, '2', '4', 'A05A02A03A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:18:35', NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('1958520331257810945', '1958496891561840641', '总工程师', NULL, NULL, 2, NULL, '3', '4', 'A05A01A02A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:23:29', 'admin', '2025-08-21 21:23:52', 0, 1, '1958471030867034113', '1958497164103520258');
INSERT INTO "sys_depart" VALUES ('1958520788395003906', '1958496759810363394', '办公室', NULL, NULL, 2, NULL, '2', '3', 'A05A02A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:25:18', 'admin', '2025-08-21 21:26:51', 0, 0, NULL, '');
INSERT INTO "sys_depart" VALUES ('1958520876810932225', '1958520788395003906', '总工程师', NULL, NULL, 1, NULL, '3', '4', 'A05A02A04A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:25:39', 'admin', '2025-08-21 21:26:25', 0, 1, '1958471030867034113', '1958507650828242946');
INSERT INTO "sys_depart" VALUES ('1958521034948775937', '1958518943542972418', '执行董事兼总经理', NULL, NULL, 1, NULL, '3', '5', 'A05A02A03A01A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:26:17', NULL, NULL, 0, 1, '1958471111989067778', '1958520876810932225');
INSERT INTO "sys_depart" VALUES ('1958521513564999681', '1958518943542972418', '副总经理', NULL, NULL, 2, NULL, '3', '5', 'A05A02A03A01A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:28:11', NULL, NULL, 0, 1, '1958471030867034113', '1958521034948775937');
INSERT INTO "sys_depart" VALUES ('1958521634549698561', '1958519010207240193', '副部长', NULL, NULL, 1, NULL, '3', '5', 'A05A02A03A02A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:28:40', 'admin', '2025-08-21 21:30:15', 0, 1, '1958470865577902082', '1958521034948775937');
INSERT INTO "sys_depart" VALUES ('1958523766002716674', '1958519010207240193', '信息归档员', NULL, NULL, 2, NULL, '3', '5', 'A05A02A03A02A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:37:08', NULL, NULL, 0, 1, '1958470823064436737', '1958521634549698561');
INSERT INTO "sys_depart" VALUES ('1958524282631917570', '1958519045623943169', '部长', NULL, NULL, 1, NULL, '3', '5', 'A05A02A03A03A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:39:11', NULL, NULL, 0, 1, '1958470912214368258', '1958521034948775937');
INSERT INTO "sys_depart" VALUES ('1958524369311404033', '1958519045623943169', '出纳', NULL, NULL, 2, NULL, '3', '5', 'A05A02A03A03A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:39:32', NULL, NULL, 0, 1, '1958470823064436737', '1958524282631917570');
INSERT INTO "sys_depart" VALUES ('1958524471841165313', '1958519097058693121', '项目经理', NULL, NULL, 1, NULL, '3', '5', 'A05A02A03A04A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:39:56', NULL, NULL, 0, 1, '1958470912214368258', '1958521513564999681');
INSERT INTO "sys_depart" VALUES ('1958524565596442626', '1958519097058693121', '软件工程师', NULL, NULL, 2, NULL, '3', '5', 'A05A02A03A04A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2025-08-21 21:40:19', NULL, NULL, 0, 1, '1958470823064436737', '1958524471841165313');
INSERT INTO "sys_depart" VALUES ('4f1765520d6346f9bd9c79e2479e5b12', 'c6d7cb4deeac411cb3384b1b31278596', '市场部', NULL, NULL, 0, NULL, '2', '2', 'A01A03', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-20 17:15:34', 'admin', '2019-02-26 16:36:18', 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('5159cde220114246b045e574adceafe9', '6d35e179cd814e3299bd588ea7daed3f', '研发部', NULL, NULL, 0, NULL, '2', '2', 'A02A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-26 16:44:38', 'admin', '2019-03-07 09:36:53', 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('57197590443c44f083d42ae24ef26a2c', 'c6d7cb4deeac411cb3384b1b31278596', '研发部', NULL, NULL, 0, NULL, '2', '2', 'A01A05', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-21 16:14:41', 'admin', '2019-03-27 19:05:49', 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('63775228b7b041a99825f79760590b7d', '57197590443c44f083d42ae24ef26a2c', '研发经理', NULL, NULL, 0, NULL, '3', '3', 'A01A05A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2020-05-02 15:29:09', NULL, NULL, 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('67fc001af12a4f9b8458005d3f19934a', 'c6d7cb4deeac411cb3384b1b31278596', '财务部', NULL, NULL, 0, NULL, '2', '2', 'A01A04', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-21 16:14:35', 'admin', '2019-02-25 12:49:41', 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('6d35e179cd814e3299bd588ea7daed3f', '', '北京卓尔互动', NULL, NULL, 0, NULL, '2', '1', 'A02', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-26 16:36:39', 'admin', '2020-05-02 18:21:22', 0, 0, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('a7d7e77e06c84325a40932163adcdaa6', '6d35e179cd814e3299bd588ea7daed3f', '财务部', NULL, NULL, 0, NULL, '2', '2', 'A02A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-26 16:36:47', 'admin', '2022-10-14 18:57:56', 0, 1, NULL, NULL);
INSERT INTO "sys_depart" VALUES ('c6d7cb4deeac411cb3384b1b31278596', '', '北京国炬软件', NULL, NULL, 0, NULL, '2', '1', 'A01', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, 'admin', '2019-02-11 14:21:51', 'admin', '2020-05-02 18:21:27', 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for sys_depart_permission
-- ----------------------------
DROP TABLE IF EXISTS "sys_depart_permission";
CREATE TABLE "sys_depart_permission" (
"id" varchar(32) NOT NULL,
"depart_id" varchar(32) NULL DEFAULT NULL,
"permission_id" varchar(32) NULL DEFAULT NULL,
"data_rule_ids" varchar(1000) NULL DEFAULT NULL,
PRIMARY KEY ("id")
) ;

-- ----------------------------
-- Records of sys_depart_permission
-- ----------------------------
INSERT INTO "sys_depart_permission" VALUES ('1260925131934519297', '6d35e179cd814e3299bd588ea7daed3f', 'f0675b52d89100ee88472b6800754a08', NULL);
INSERT INTO "sys_depart_permission" VALUES ('1260925131947102209', '6d35e179cd814e3299bd588ea7daed3f', '2aeddae571695cd6380f6d6d334d6e7d', NULL);
INSERT INTO "sys_depart_permission" VALUES ('1260925131955490818', '6d35e179cd814e3299bd588ea7daed3f', '020b06793e4de2eee0007f603000c769', NULL);
INSERT INTO "sys_depart_permission" VALUES ('1260925131959685121', '6d35e179cd814e3299bd588ea7daed3f', '1232123780958064642', NULL);
INSERT INTO "sys_depart_permission" VALUES ('1694946354772217858', '1582683631414632450', '1588513553652436993', NULL);
INSERT INTO "sys_depart_permission" VALUES ('1694946354784800769', '1582683631414632450', '1592114574275211265', NULL);

-- ----------------------------
-- Table structure for sys_depart_role
-- ----------------------------
DROP TABLE IF EXISTS "sys_depart_role";
CREATE TABLE "sys_depart_role" (
"id" varchar(32) NOT NULL,
"depart_id" varchar(32) NULL DEFAULT NULL,
"role_name" varchar(200) NULL DEFAULT NULL,
"role_code" varchar(100) NULL DEFAULT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id")
) ;

-- ----------------------------
-- Records of sys_depart_role
-- ----------------------------
INSERT INTO "sys_depart_role" VALUES ('1260925293226479618', '6d35e179cd814e3299bd588ea7daed3f', 'roless', 'ssss', NULL, 'admin', '2020-05-14 21:29:51', NULL, NULL);

-- ----------------------------
-- Table structure for sys_depart_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "sys_depart_role_permission";
CREATE TABLE "sys_depart_role_permission" (
"id" varchar(32) NOT NULL,
"depart_id" varchar(32) NULL DEFAULT NULL,
"role_id" varchar(32) NULL DEFAULT NULL,
"permission_id" varchar(32) NULL DEFAULT NULL,
"data_rule_ids" varchar(1000) NULL DEFAULT NULL,
"operate_date" TIMESTAMP NULL DEFAULT NULL,
"operate_ip" varchar(20) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sdrp_role_per_id"("role_id", "permission_id"),
INDEX "idx_sdrp_role_id"("role_id"),
INDEX "idx_sdrp_per_id"("permission_id")
) ;

-- ----------------------------
-- Records of sys_depart_role_permission
-- ----------------------------
INSERT INTO "sys_depart_role_permission" VALUES ('1260925328689319938', NULL, '1260925293226479618', '2aeddae571695cd6380f6d6d334d6e7d', NULL, NULL, NULL);
INSERT INTO "sys_depart_role_permission" VALUES ('1260925328706097153', NULL, '1260925293226479618', '020b06793e4de2eee0007f603000c769', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_depart_role_user
-- ----------------------------
DROP TABLE IF EXISTS "sys_depart_role_user";
CREATE TABLE "sys_depart_role_user" (
"id" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"drole_id" varchar(32) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sdr_user_id"("user_id"),
INDEX "idx_sdr_role_id"("drole_id")
) ;

-- ----------------------------
-- Records of sys_depart_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "sys_dict";
CREATE TABLE "sys_dict" (
"id" varchar(32) NOT NULL,
"dict_name" varchar(100) NOT NULL,
"dict_code" varchar(100) NOT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"del_flag" INTEGER NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"type" INTEGER UNSIGNED ZEROFILL NULL DEFAULT 0,
"tenant_id" INTEGER NULL DEFAULT 0,
"low_app_id" varchar(32) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uk_sd_dict_code"("dict_code"),
INDEX "uk_sd_tenant_id"("tenant_id")
) ;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "sys_dict" VALUES ('0b5d19e1fce4b2e6647e6b4a17760c14', '通告类型', 'msg_category', '消息类型1:通知公告2:系统消息', 0, 'admin', '2019-04-22 18:01:35', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1174509082208395266', '职务职级', 'position_rank', '职务表职级字典', 0, 'admin', '2019-09-19 10:22:41', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1174511106530525185', '机构类型', 'org_category', '机构类型 1公司，2部门，3岗位，4子公司', 0, 'admin', '2019-09-19 10:30:43', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1178295274528845826', '表单权限策略', 'form_perms_type', '', 0, 'admin', '2019-09-29 21:07:39', 'admin', '2019-09-29 21:08:26', NULL, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1199517671259906049', '紧急程度', 'urgent_level', '日程计划紧急程度', 0, 'admin', '2019-11-27 10:37:53', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1199518099888414722', '日程计划类型', 'eoa_plan_type', '', 0, 'admin', '2019-11-27 10:39:36', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1199520177767587841', '分类栏目类型', 'eoa_cms_menu_type', '', 0, 'admin', '2019-11-27 10:47:51', 'admin', '2019-11-27 10:49:35', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1199525215290306561', '日程计划状态', 'eoa_plan_status', '', 0, 'admin', '2019-11-27 11:07:52', 'admin', '2019-11-27 11:10:11', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1209733563293962241', '数据库类型', 'database_type', '', 0, 'admin', '2019-12-25 15:12:12', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1232913193820581889', 'Online表单业务分类', 'ol_form_biz_type', '', 0, 'admin', '2020-02-27 14:19:46', 'admin', '2020-02-27 14:20:23', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1242298510024429569', '提醒方式', 'remindMode', '', 0, 'admin', '2020-03-24 11:53:40', 'admin', '2020-03-24 12:03:22', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1250687930947620866', '定时任务状态', 'quartz_status', '', 0, 'admin', '2020-04-16 15:30:14', '', NULL, NULL, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1280401766745718786', '租户状态', 'tenant_status', '租户状态', 0, 'admin', '2020-07-07 15:22:25', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1356445645198135298', '开关', 'is_open', '', 0, 'admin', '2021-02-02 11:33:38', 'admin', '2021-02-02 15:28:12', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1600042215909134338', '所属行业', 'trade', '行业', 0, 'admin', '2022-12-06 16:19:26', 'admin', '2022-12-06 16:20:50', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1600044537800331266', '公司规模', 'company_size', '公司规模', 0, 'admin', '2022-12-06 16:28:40', 'admin', '2022-12-06 16:30:23', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1606645341269299201', '职级', 'company_rank', '公司职级', 0, 'admin', '2022-12-24 21:37:54', 'admin', '2022-12-24 21:38:25', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1606646440684457986', '公司部门', 'company_department', '公司部门', 0, 'admin', '2022-12-24 21:42:16', 'admin', '2024-03-18 14:21:56', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1693196536609755137', 'ddd', 'ddd', NULL, 1, 'admin', '2023-08-20 17:41:27', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1784843187992084482', '客户终端类型', 'client_type', NULL, 0, 'jeecg', '2024-04-29 15:12:31', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1890229208685322242', '模型提供者', 'model_provider', NULL, 0, 'jeecg', '2025-02-14 10:38:57', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1891456510739890177', '模型类型', 'model_type', NULL, 0, 'jeecg', '2025-02-17 19:55:48', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1891671216561975297', '知识库类型', 'airag_know_type', NULL, 1, 'jeecg', '2025-02-18 10:08:58', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1891672414555860993', '知识库文档类型', 'know_doc_type', NULL, 0, 'jeecg', '2025-02-18 10:13:44', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1894701158027554818', 'AI应用类型', 'ai_app_type', NULL, 0, 'jeecg', '2025-02-26 18:48:53', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1934846825077878786', '公告分类', 'notice_type', NULL, 0, 'admin', '2025-06-17 13:33:25', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1937393911539384322', '模版分类', 'msgCategory', NULL, 0, 'admin', '2025-06-24 14:14:38', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1939572486447292418', '首页关联', 'relation_type', NULL, 0, 'admin', '2025-06-30 14:31:31', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('1964944899916697602', '用户职务', 'user_position', '用户职务', 0, 'admin', '2025-09-08 14:52:26', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('236e8a4baff0db8c62c00dd95632834f', '同步工作流引擎', 'activiti_sync', '同步工作流引擎', 0, 'admin', '2019-05-15 15:27:33', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('2e02df51611a4b9632828ab7e5338f00', '权限策略', 'perms_type', '权限策略', 0, 'admin', '2019-04-26 18:26:55', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('2f0320997ade5dd147c90130f7218c3e', '推送类别', 'msg_type', '', 0, 'admin', '2019-03-17 21:21:32', 'admin', '2019-03-26 19:57:45', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('3486f32803bb953e7155dab3513dc68b', '删除状态', 'del_flag', NULL, 0, 'admin', '2019-01-18 21:46:26', 'admin', '2019-03-30 11:17:11', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('3d9a351be3436fbefb1307d4cfb49bf2', '性别', 'sex', NULL, 0, NULL, '2019-01-04 14:56:32', 'admin', '2019-03-30 11:28:27', 1, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4274efc2292239b6f000b153f50823ff', '全局权限策略', 'global_perms_type', '全局权限策略', 0, 'admin', '2019-05-10 17:54:05', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4c03fca6bf1f0299c381213961566349', 'Online图表展示模板', 'online_graph_display_template', 'Online图表展示模板', 0, 'admin', '2019-04-12 17:28:50', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4c753b5293304e7a445fd2741b46529d', '字典状态', 'dict_item_status', NULL, 0, 'admin', '2020-06-18 23:18:42', 'admin', '2019-03-30 19:33:52', 1, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4d7fec1a7799a436d26d02325eff295e', '优先级', 'priority', '优先级', 0, 'admin', '2019-03-16 17:03:34', 'admin', '2019-04-16 17:39:23', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4e4602b3e3686f0911384e188dc7efb4', '条件规则', 'rule_conditions', '', 0, 'admin', '2019-04-01 10:15:03', 'admin', '2019-04-01 10:30:47', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('4f69be5f507accea8d5df5f11346181a', '发送消息类型', 'msgType', NULL, 0, 'admin', '2019-04-11 14:27:09', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('68168534ff5065a152bfab275c2136f8', '有效无效状态', 'valid_status', '有效无效状态', 0, 'admin', '2020-09-26 19:21:14', 'admin', '2019-04-26 19:21:23', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('6b78e3f59faec1a4750acff08030a79b', '用户类型', 'user_type', NULL, 0, NULL, '2019-01-04 14:59:01', 'admin', '2019-03-18 23:28:18', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('72cce0989df68887546746d8f09811aa', 'Online表单类型', 'cgform_table_type', '', 0, 'admin', '2019-01-27 10:13:02', 'admin', '2019-03-30 11:37:36', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('78bda155fe380b1b3f175f1e88c284c6', '流程状态', 'bpm_status', '流程状态', 0, 'admin', '2019-05-09 16:31:52', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('83bfb33147013cc81640d5fd9eda030c', '日志类型', 'log_type', NULL, 0, 'admin', '2019-03-18 23:22:19', NULL, NULL, 1, 0, NULL);
INSERT INTO "sys_dict" VALUES ('845da5006c97754728bf48b6a10f79cc', '状态', 'status', NULL, 0, 'admin', '2019-03-18 21:45:25', 'admin', '2019-03-18 21:58:25', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('880a895c98afeca9d9ac39f29e67c13e', '操作类型', 'operate_type', '操作类型', 0, 'admin', '2019-07-22 10:54:29', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('8dfe32e2d29ea9430a988b3b558bf233', '发布状态', 'send_status', '发布状态', 0, 'admin', '2019-04-16 17:40:42', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('a7adbcd86c37f7dbc9b66945c82ef9e6', '1是0否', 'yn', '', 0, 'admin', '2019-05-22 19:29:29', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('a9d9942bd0eccb6e89de92d130ec4c4a', '消息发送状态', 'msgSendStatus', NULL, 0, 'admin', '2019-04-12 18:18:17', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('ac2f7c0c5c5775fcea7e2387bcb22f01', '菜单类型', 'menu_type', NULL, 0, 'admin', '2020-12-18 23:24:32', 'admin', '2019-04-01 15:27:06', 1, 0, NULL);
INSERT INTO "sys_dict" VALUES ('ad7c65ba97c20a6805d5dcdf13cdaf36', 'onlineT类型', 'ceshi_online', NULL, 0, 'admin', '2019-03-22 16:31:49', 'admin', '2019-03-22 16:34:16', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('bd1b8bc28e65d6feefefb6f3c79f42fd', 'Online图表数据类型', 'online_graph_data_type', 'Online图表数据类型', 0, 'admin', '2019-04-12 17:24:24', 'admin', '2019-04-12 17:24:57', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('c36169beb12de8a71c8683ee7c28a503', '部门状态', 'depart_status', NULL, 0, 'admin', '2019-03-18 21:59:51', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('c5a14c75172783d72cbee6ee7f5df5d1', 'Online图表类型', 'online_graph_type', 'Online图表类型', 0, 'admin', '2019-04-12 17:04:06', NULL, NULL, 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('d6e1152968b02d69ff358c75b48a6ee1', '流程类型', 'bpm_process_type', NULL, 0, 'admin', '2021-02-22 19:26:54', 'admin', '2019-03-30 18:14:44', 0, 0, NULL);
INSERT INTO "sys_dict" VALUES ('fc6cd58fde2e8481db10d3a1e68ce70c', '用户状态', 'user_status', NULL, 0, 'admin', '2019-03-18 21:57:25', 'admin', '2019-03-18 23:11:58', 1, 0, NULL);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS "sys_dict_item";
CREATE TABLE "sys_dict_item" (
"id" varchar(32) NOT NULL,
"dict_id" varchar(32) NULL DEFAULT NULL,
"item_text" varchar(100) NOT NULL,
"item_value" varchar(100) NOT NULL,
"item_color" varchar(10) NULL DEFAULT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"sort_order" INTEGER NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sditem_role_dict_id"("dict_id"),
INDEX "idx_sditem_role_sort_order"("sort_order"),
INDEX "idx_sditem_status"("status"),
INDEX "idx_sditem_dict_val"("dict_id", "item_value")
) ;

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO "sys_dict_item" VALUES ('0072d115e07c875d76c9b022e2179128', '4d7fec1a7799a436d26d02325eff295e', '低', 'L', NULL, '低', 3, 1, 'admin', '2019-04-16 17:04:59', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('05a2e732ce7b00aa52141ecc3e330b4e', '3486f32803bb953e7155dab3513dc68b', '已删除', '1', NULL, NULL, NULL, 1, 'admin', '2025-10-18 21:46:56', 'admin', '2019-03-28 22:23:20');
INSERT INTO "sys_dict_item" VALUES ('096c2e758d823def3855f6376bc736fb', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'SQL', 'sql', NULL, NULL, 1, 1, 'admin', '2019-04-12 17:26:26', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('0c9532916f5cd722017b46bc4d953e41', '2f0320997ade5dd147c90130f7218c3e', '指定用户', 'USER', NULL, NULL, NULL, 1, 'admin', '2019-03-17 21:22:19', 'admin', '2019-03-17 21:22:28');
INSERT INTO "sys_dict_item" VALUES ('0ca4beba9efc4f9dd54af0911a946d5c', '72cce0989df68887546746d8f09811aa', '附表', '3', NULL, NULL, 3, 1, 'admin', '2019-03-27 10:13:43', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1030a2652608f5eac3b49d70458b8532', '2e02df51611a4b9632828ab7e5338f00', '禁用', '2', NULL, '禁用', 2, 1, 'admin', '2021-03-26 18:27:28', 'admin', '2019-04-26 18:39:11');
INSERT INTO "sys_dict_item" VALUES ('1174509082208395266', '1174511106530525185', '岗位', '3', NULL, '岗位', 1, 1, 'admin', '2019-09-19 10:31:16', '', NULL);
INSERT INTO "sys_dict_item" VALUES ('1174509601047994369', '1174509082208395266', '员级', '1', NULL, '', 1, 1, 'admin', '2019-09-19 10:24:45', 'admin', '2019-09-23 11:46:39');
INSERT INTO "sys_dict_item" VALUES ('1174509667297026049', '1174509082208395266', '助级', '2', NULL, '', 2, 1, 'admin', '2019-09-19 10:25:01', 'admin', '2019-09-23 11:46:47');
INSERT INTO "sys_dict_item" VALUES ('1174509713568587777', '1174509082208395266', '中级', '3', NULL, '', 3, 1, 'admin', '2019-09-19 10:25:12', 'admin', '2019-09-23 11:46:56');
INSERT INTO "sys_dict_item" VALUES ('1174509788361416705', '1174509082208395266', '副高级', '4', NULL, '', 4, 1, 'admin', '2019-09-19 10:25:30', 'admin', '2019-09-23 11:47:06');
INSERT INTO "sys_dict_item" VALUES ('1174509835803189250', '1174509082208395266', '正高级', '5', NULL, '', 5, 1, 'admin', '2019-09-19 10:25:41', 'admin', '2019-09-23 11:47:12');
INSERT INTO "sys_dict_item" VALUES ('1174511197735665665', '1174511106530525185', '公司', '1', NULL, '公司', 1, 1, 'admin', '2019-09-19 10:31:05', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1174511244036587521', '1174511106530525185', '部门', '2', NULL, '部门', 1, 1, 'admin', '2019-09-19 10:31:16', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1178295553450061826', '1178295274528845826', '可编辑(未授权禁用)', '2', NULL, '', 2, 1, 'admin', '2019-09-29 21:08:46', 'admin', '2019-09-29 21:09:18');
INSERT INTO "sys_dict_item" VALUES ('1178295639554928641', '1178295274528845826', '可见(未授权不可见)', '1', NULL, '', 1, 1, 'admin', '2019-09-29 21:09:06', 'admin', '2019-09-29 21:09:24');
INSERT INTO "sys_dict_item" VALUES ('1199517884758368257', '1199517671259906049', '一般', '1', NULL, '', 1, 1, 'admin', '2019-11-27 10:38:44', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199517914017832962', '1199517671259906049', '重要', '2', NULL, '', 1, 1, 'admin', '2019-11-27 10:38:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199517941339529217', '1199517671259906049', '紧急', '3', NULL, '', 1, 1, 'admin', '2019-11-27 10:38:58', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199518186144276482', '1199518099888414722', '日常记录', '1', NULL, '', 1, 1, 'admin', '2019-11-27 10:39:56', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199518214858481666', '1199518099888414722', '本周工作', '2', NULL, '', 1, 1, 'admin', '2019-11-27 10:40:03', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199518235943247874', '1199518099888414722', '下周计划', '3', NULL, '', 1, 1, 'admin', '2019-11-27 10:40:08', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199520817285701634', '1199520177767587841', '列表', '1', NULL, '', 1, 1, 'admin', '2019-11-27 10:50:24', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199520835035996161', '1199520177767587841', '链接', '2', NULL, '', 1, 1, 'admin', '2019-11-27 10:50:28', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199525468672405505', '1199525215290306561', '未开始', '0', NULL, '', 1, 1, 'admin', '2019-11-27 11:08:52', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199525490575060993', '1199525215290306561', '进行中', '1', NULL, '', 1, 1, 'admin', '2019-11-27 11:08:58', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1199525506429530114', '1199525215290306561', '已完成', '2', NULL, '', 1, 1, 'admin', '2019-11-27 11:09:02', 'admin', '2019-11-27 11:10:02');
INSERT INTO "sys_dict_item" VALUES ('1209733775114702850', '1209733563293962241', 'MySQL5.5', '1', NULL, '', 1, 1, 'admin', '2019-12-25 15:13:02', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1209733839933476865', '1209733563293962241', 'Oracle', '2', NULL, '', 3, 1, 'admin', '2019-12-25 15:13:18', 'admin', '2021-07-15 13:44:08');
INSERT INTO "sys_dict_item" VALUES ('1209733903020003330', '1209733563293962241', 'SQLServer', '3', NULL, '', 4, 1, 'admin', '2019-12-25 15:13:33', 'admin', '2021-07-15 13:44:11');
INSERT INTO "sys_dict_item" VALUES ('1232913424813486081', '1232913193820581889', '官方示例', 'demo', NULL, '', 1, 1, 'admin', '2020-02-27 14:20:42', 'admin', '2020-02-27 14:21:37');
INSERT INTO "sys_dict_item" VALUES ('1232913493717512194', '1232913193820581889', '流程表单', 'bpm', NULL, '', 2, 1, 'admin', '2020-02-27 14:20:58', 'admin', '2020-02-27 14:22:20');
INSERT INTO "sys_dict_item" VALUES ('1232913605382467585', '1232913193820581889', '测试表单', 'temp', NULL, '', 4, 1, 'admin', '2020-02-27 14:21:25', 'admin', '2020-02-27 14:22:16');
INSERT INTO "sys_dict_item" VALUES ('1232914232372195330', '1232913193820581889', '导入表单', 'bdfl_include', NULL, '', 5, 1, 'admin', '2020-02-27 14:23:54', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1234371726545010689', '4e4602b3e3686f0911384e188dc7efb4', '左模糊', 'LEFT_LIKE', NULL, '左模糊', 7, 1, 'admin', '2020-03-02 14:55:27', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1234371809495760898', '4e4602b3e3686f0911384e188dc7efb4', '右模糊', 'RIGHT_LIKE', NULL, '右模糊', 7, 1, 'admin', '2020-03-02 14:55:47', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1242300779390357505', '1242298510024429569', '短信提醒', '2', NULL, '', 2, 1, 'admin', '2020-03-24 12:02:41', 'admin', '2020-03-30 18:21:33');
INSERT INTO "sys_dict_item" VALUES ('1242300814383435777', '1242298510024429569', '邮件提醒', '1', NULL, '', 1, 1, 'admin', '2020-03-24 12:02:49', 'admin', '2020-03-30 18:21:26');
INSERT INTO "sys_dict_item" VALUES ('1242300887343353857', '1242298510024429569', '系统消息', '4', NULL, '', 4, 1, 'admin', '2020-03-24 12:03:07', 'admin', '2020-03-30 18:21:43');
INSERT INTO "sys_dict_item" VALUES ('1250688147579228161', '1250687930947620866', '正常', '0', NULL, '', 1, 1, 'admin', '2020-04-16 15:31:05', '', NULL);
INSERT INTO "sys_dict_item" VALUES ('1250688201064992770', '1250687930947620866', '停止', '-1', NULL, '', 1, 1, 'admin', '2020-04-16 15:31:18', '', NULL);
INSERT INTO "sys_dict_item" VALUES ('1280401815068295170', '1280401766745718786', '正常', '1', NULL, '', 1, 1, 'admin', '2020-07-07 15:22:36', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1280401847607705602', '1280401766745718786', '冻结', '0', NULL, '', 1, 1, 'admin', '2020-07-07 15:22:44', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1305827309355302914', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'API', 'api', NULL, '', 3, 1, 'admin', '2020-09-15 19:14:26', 'admin', '2020-09-15 19:14:41');
INSERT INTO "sys_dict_item" VALUES ('1334440962954936321', '1209733563293962241', 'MYSQL5.7+', '4', NULL, '', 2, 1, 'admin', '2020-12-03 18:16:02', 'admin', '2021-07-15 13:44:29');
INSERT INTO "sys_dict_item" VALUES ('1356445705549975553', '1356445645198135298', '是', 'Y', NULL, '', 1, 1, 'admin', '2021-02-02 11:33:52', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1356445754212290561', '1356445645198135298', '否', 'N', NULL, '', 1, 1, 'admin', '2021-02-02 11:34:04', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1414837074500976641', '1209733563293962241', 'postgresql', '6', NULL, '', 5, 1, 'admin', '2021-07-13 14:40:20', 'admin', '2021-07-15 13:44:15');
INSERT INTO "sys_dict_item" VALUES ('1415547541091504129', '1209733563293962241', 'marialDB', '5', NULL, '', 6, 1, 'admin', '2021-07-15 13:43:28', 'admin', '2021-07-15 13:44:23');
INSERT INTO "sys_dict_item" VALUES ('1418049969003089922', '1209733563293962241', '达梦', '7', NULL, '', 7, 1, 'admin', '2021-07-22 11:27:13', 'admin', '2021-07-22 11:27:30');
INSERT INTO "sys_dict_item" VALUES ('1418050017053036545', '1209733563293962241', '人大金仓', '8', NULL, '', 8, 1, 'admin', '2021-07-22 11:27:25', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418050075555188737', '1209733563293962241', '神通', '9', NULL, '', 9, 1, 'admin', '2021-07-22 11:27:39', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418050110669901826', '1209733563293962241', 'SQLite', '10', NULL, '', 10, 1, 'admin', '2021-07-22 11:27:47', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418050149475602434', '1209733563293962241', 'DB2', '11', NULL, '', 11, 1, 'admin', '2021-07-22 11:27:56', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418050209823248385', '1209733563293962241', 'Hsqldb', '12', NULL, '', 12, 1, 'admin', '2021-07-22 11:28:11', 'admin', '2021-07-22 11:28:27');
INSERT INTO "sys_dict_item" VALUES ('1418050323111399425', '1209733563293962241', 'Derby', '13', NULL, '', 13, 1, 'admin', '2021-07-22 11:28:38', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418117316707590146', '1209733563293962241', 'H2', '14', NULL, '', 14, 1, 'admin', '2021-07-22 15:54:50', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1418491604048449537', '1209733563293962241', '其他数据库', '15', NULL, '', 15, 1, 'admin', '2021-07-23 16:42:07', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('147c48ff4b51545032a9119d13f3222a', 'd6e1152968b02d69ff358c75b48a6ee1', '测试流程', 'test', NULL, NULL, 1, 1, 'admin', '2019-03-22 19:27:05', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1543fe7e5e26fb97cdafe4981bedc0c8', '4c03fca6bf1f0299c381213961566349', '单排布局', 'single', NULL, NULL, 2, 1, 'admin', '2022-07-12 17:43:39', 'admin', '2019-04-12 17:43:57');
INSERT INTO "sys_dict_item" VALUES ('1600042651777011713', '1600042215909134338', '信息传输、软件和信息技术服务业', '1', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:21:10', 'admin', '2022-12-06 16:21:27');
INSERT INTO "sys_dict_item" VALUES ('1600042736254488578', '1600042215909134338', '制造业', '2', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:21:30', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600042785646612481', '1600042215909134338', '租赁和商务服务业', '3', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:21:42', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600042835433000961', '1600042215909134338', '教育', '4', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:21:54', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600042892072882177', '1600042215909134338', '金融业', '5', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:22:07', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600042975539531778', '1600042215909134338', '建筑业', '6', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:22:27', 'admin', '2022-12-06 16:22:32');
INSERT INTO "sys_dict_item" VALUES ('1600043052177854466', '1600042215909134338', '科学研究和技术服务业', '7', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:22:46', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043101976825857', '1600042215909134338', '批发和零售业', '8', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:22:58', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043157069008898', '1600042215909134338', '住宿和餐饮业', '9', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:23:11', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043203105689601', '1600042215909134338', '电子商务', '10', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:23:22', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043277504253953', '1600042215909134338', '线下零售与服务业', '11', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:23:39', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043334618091521', '1600042215909134338', '文化、体育和娱乐业', '12', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:23:53', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043401030701058', '1600042215909134338', '房地产业', '13', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:24:09', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043476440092673', '1600042215909134338', '交通运输、仓储和邮政业', '14', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:24:27', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043553837584386', '1600042215909134338', '卫生和社会工作', '15', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:24:45', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043628793991170', '1600042215909134338', '公共管理、社会保障和社会组织', '16', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:03', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043675329794050', '1600042215909134338', '电力、热力、燃气及水生产和供应业', '18', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:14', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043734607892482', '1600042215909134338', '水利、环境和公共设施管理业', '19', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:28', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043783068880897', '1600042215909134338', '居民服务、修理和其他服务业', '20', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:40', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043822679887874', '1600042215909134338', '政府机构', '21', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:49', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043859539431426', '1600042215909134338', '农、林、牧、渔业', '22', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:25:58', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043907551629313', '1600042215909134338', '采矿业', '23', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:26:10', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043955731599362', '1600042215909134338', '国际组织', '24', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:26:21', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600043991685173249', '1600042215909134338', '其他', '25', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:26:30', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044644096577538', '1600044537800331266', '20人以下', '1', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:29:05', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044698618335233', '1600044537800331266', '21-99人', '2', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:29:18', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044744172670978', '1600044537800331266', '100-499人', '3', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:29:29', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044792306503681', '1600044537800331266', '500-999人', '4', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:29:41', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044861302804481', '1600044537800331266', '1000-9999人', '5', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:29:57', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1600044924313833473', '1600044537800331266', '10000人以上', '6', NULL, NULL, 1, 1, 'admin', '2022-12-06 16:30:12', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606645562573361153', '1606645341269299201', '总裁/总经理/CEO', '1', NULL, NULL, 1, 1, 'admin', '2022-12-24 21:38:47', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606645619930468354', '1606645341269299201', '副总裁/副总经理/VP', '2', NULL, NULL, 2, 1, 'admin', '2022-12-24 21:39:00', 'admin', '2022-12-24 21:40:00');
INSERT INTO "sys_dict_item" VALUES ('1606645660241924097', '1606645341269299201', '总监/主管/经理', '3', NULL, NULL, 3, 1, 'admin', '2022-12-24 21:39:10', 'admin', '2022-12-24 21:39:41');
INSERT INTO "sys_dict_item" VALUES ('1606645696715591682', '1606645341269299201', '员工/专员/执行', '4', NULL, NULL, 4, 1, 'admin', '2022-12-24 21:39:19', 'admin', '2022-12-24 21:39:37');
INSERT INTO "sys_dict_item" VALUES ('1606645744023146497', '1606645341269299201', '其他', '5', NULL, NULL, 5, 1, 'admin', '2022-12-24 21:39:30', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647668965412866', '1606646440684457986', '总经办', '1', NULL, NULL, 1, 1, 'admin', '2022-12-24 21:47:09', 'admin', '2023-10-18 13:54:03');
INSERT INTO "sys_dict_item" VALUES ('1606647703098658817', '1606646440684457986', '技术/IT/研发', '2', NULL, NULL, 2, 1, 'admin', '2022-12-24 21:47:17', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647737919770625', '1606646440684457986', '产品/设计', '3', NULL, NULL, 3, 1, 'admin', '2022-12-24 21:47:25', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647789614567425', '1606646440684457986', '销售/市场/运营', '4', NULL, '', 4, 1, 'admin', '2022-12-24 21:47:38', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647827921145857', '1606646440684457986', '人事/财务/行政', '5', NULL, NULL, 5, 1, 'admin', '2022-12-24 21:47:47', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647860955484162', '1606646440684457986', '资源/仓储/采购', '6', NULL, NULL, 6, 1, 'admin', '2022-12-24 21:47:55', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1606647915473047553', '1606646440684457986', '其他', '7', NULL, NULL, 7, 1, 'admin', '2022-12-24 21:48:08', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1782325511230337025', '83bfb33147013cc81640d5fd9eda030c', '租户操作日志', '3', NULL, NULL, 1, 1, 'admin', '2024-04-22 16:28:11', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1783383857978970114', '83bfb33147013cc81640d5fd9eda030c', '异常日志', '4', NULL, NULL, 3, 1, 'jeecg', '2024-04-25 14:33:40', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1784843259509161986', '1784843187992084482', '电脑终端', 'pc', NULL, NULL, 1, 1, 'jeecg', '2024-04-29 15:12:49', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1784843314429378562', '1784843187992084482', '手机APP端', 'app', NULL, NULL, 1, 1, 'jeecg', '2024-04-29 15:13:02', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1784843380502249474', '1784843187992084482', '移动网页端', 'h5', NULL, NULL, 1, 1, 'jeecg', '2024-04-29 15:13:17', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1890229967585910786', '1890229208685322242', 'OpenAI', 'OPENAI', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:41:58', 'jeecg', '2025-02-14 10:42:48');
INSERT INTO "sys_dict_item" VALUES ('1890230018852888577', '1890229208685322242', '智谱AI', 'ZHIPU', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:42:10', 'jeecg', '2025-02-14 10:42:42');
INSERT INTO "sys_dict_item" VALUES ('1890230107835047937', '1890229208685322242', '千帆大模型', 'QIANFAN', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:42:31', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1890230305948803073', '1890229208685322242', '通义千问', 'QWEN', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:43:18', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1890230384159989762', '1890229208685322242', 'DeepSeek', 'DEEPSEEK', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:43:37', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1890230437670920194', '1890229208685322242', 'Ollama', 'OLLAMA', NULL, NULL, 1, 1, 'jeecg', '2025-02-14 10:43:50', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1891456733029613569', '1891456510739890177', '语言模型', 'LLM', NULL, NULL, 1, 1, 'jeecg', '2025-02-17 19:56:41', 'jeecg', '2025-02-17 20:02:15');
INSERT INTO "sys_dict_item" VALUES ('1891458099609354241', '1891456510739890177', '向量模型', 'EMBED', NULL, NULL, 1, 1, 'jeecg', '2025-02-17 20:02:07', 'jeecg', '2025-02-17 20:39:01');
INSERT INTO "sys_dict_item" VALUES ('1891672501432479746', '1891672414555860993', '文本', 'text', NULL, NULL, 1, 1, 'jeecg', '2025-02-18 10:14:05', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1891672540963794946', '1891672414555860993', '文件', 'file', NULL, NULL, 1, 1, 'jeecg', '2025-02-18 10:14:14', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1891672567924781058', '1891672414555860993', '网页', 'web', NULL, NULL, 1, 1, 'jeecg', '2025-02-18 10:14:20', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1894701277019959298', '1894701158027554818', '智能体', 'chatSimple', NULL, NULL, 1, 1, 'jeecg', '2025-02-26 18:49:21', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1894701332930031618', '1894701158027554818', '高级编排', 'chatFLow', NULL, NULL, 2, 1, 'jeecg', '2025-02-26 18:49:34', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934846897383485441', '1934846825077878786', '发布性通知', '1', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:33:43', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934846933030875138', '1934846825077878786', '转发性通知', '2', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:33:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934846963749957633', '1934846825077878786', '指示性通知', '3', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:33:59', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934846993449824257', '1934846825077878786', '任免性通知', '4', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:34:06', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934847047262744577', '1934846825077878786', '事务性（周知）通知', '5', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:34:18', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934847082905939969', '1934846825077878786', '会议通知', '6', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:34:27', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1934847117039185921', '1934846825077878786', '其他通知', '7', NULL, NULL, 1, 1, 'admin', '2025-06-17 13:34:35', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1937394006326460418', '1937393911539384322', '通知公告', 'notice', NULL, NULL, 1, 1, 'admin', '2025-06-24 14:15:01', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1937394038412886018', '1937393911539384322', '其他', 'other', NULL, NULL, 1, 1, 'admin', '2025-06-24 14:15:08', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1939572554533429250', '1939572486447292418', '角色', 'ROLE', NULL, NULL, 1, 1, 'admin', '2025-06-30 14:31:47', 'admin', '2025-06-30 15:04:18');
INSERT INTO "sys_dict_item" VALUES ('1939572602289774594', '1939572486447292418', '用户', 'USER', NULL, NULL, 2, 1, 'admin', '2025-06-30 14:31:59', 'admin', '2025-06-30 15:04:21');
INSERT INTO "sys_dict_item" VALUES ('1955230463631126529', '1174511106530525185', '子公司', '4', NULL, NULL, 1, 1, 'admin', '2025-08-12 19:30:44', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1963079150651305985', '1939572486447292418', '全局默认', 'DEFAULT', NULL, NULL, 3, 1, 'admin', '2025-09-03 11:18:36', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1964944982842281986', '1964944899916697602', '董事长', '0', NULL, NULL, 0, 1, 'admin', '2025-09-08 14:52:45', 'admin', '2025-09-08 14:53:54');
INSERT INTO "sys_dict_item" VALUES ('1964945020519714817', '1964944899916697602', '总经理', '1', NULL, NULL, 1, 1, 'admin', '2025-09-08 14:52:54', 'admin', '2025-09-13 18:50:37');
INSERT INTO "sys_dict_item" VALUES ('1964945061850386434', '1964944899916697602', '副总经理', '2', NULL, NULL, 2, 1, 'admin', '2025-09-08 14:53:04', 'admin', '2025-09-08 14:53:46');
INSERT INTO "sys_dict_item" VALUES ('1964945100802887681', '1964944899916697602', '部长', '3', NULL, NULL, 3, 1, 'admin', '2025-09-08 14:53:14', 'admin', '2025-09-08 14:53:43');
INSERT INTO "sys_dict_item" VALUES ('1964945142854979586', '1964944899916697602', '副部长', '4', NULL, NULL, 4, 1, 'admin', '2025-09-08 14:53:24', 'admin', '2025-09-08 14:53:40');
INSERT INTO "sys_dict_item" VALUES ('1964945196395270146', '1964944899916697602', '职员', '5', NULL, NULL, 5, 1, 'admin', '2025-09-08 14:53:36', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1ce390c52453891f93514c1bd2795d44', 'ad7c65ba97c20a6805d5dcdf13cdaf36', '000', '00', NULL, NULL, 1, 1, 'admin', '2019-03-22 16:34:34', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('1db531bcff19649fa82a644c8a939dc4', '4c03fca6bf1f0299c381213961566349', '组合布局', 'combination', NULL, '', 4, 1, 'admin', '2019-05-11 16:07:08', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('2008087927907045378', '1891456510739890177', '图像模型', 'IMAGE', NULL, NULL, 3, 1, 'admin', '2026-01-05 16:07:25', 'admin', '2026-01-05 16:07:31');
INSERT INTO "sys_dict_item" VALUES ('222705e11ef0264d4214affff1fb4ff9', '4f69be5f507accea8d5df5f11346181a', '文本', '1', NULL, '', 1, 1, 'admin', '2023-02-28 10:50:36', 'admin', '2022-07-04 16:29:21');
INSERT INTO "sys_dict_item" VALUES ('23a5bb76004ed0e39414e928c4cde155', '4e4602b3e3686f0911384e188dc7efb4', '不等于', '!=', NULL, '不等于', 3, 1, 'admin', '2019-04-01 16:46:15', 'admin', '2019-04-01 17:48:40');
INSERT INTO "sys_dict_item" VALUES ('25847e9cb661a7c711f9998452dc09e6', '4e4602b3e3686f0911384e188dc7efb4', '小于等于', '<=', NULL, '小于等于', 6, 1, 'admin', '2019-04-01 16:44:34', 'admin', '2019-04-01 17:49:10');
INSERT INTO "sys_dict_item" VALUES ('2d51376643f220afdeb6d216a8ac2c01', '68168534ff5065a152bfab275c2136f8', '有效', '1', NULL, '有效', 2, 1, 'admin', '2019-04-26 19:22:01', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('308c8aadf0c37ecdde188b97ca9833f5', '8dfe32e2d29ea9430a988b3b558bf233', '已发布', '1', NULL, '已发布', 2, 1, 'admin', '2019-04-16 17:41:24', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('333e6b2196e01ef9a5f76d74e86a6e33', '8dfe32e2d29ea9430a988b3b558bf233', '未发布', '0', NULL, '未发布', 1, 1, 'admin', '2019-04-16 17:41:12', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('337ea1e401bda7233f6258c284ce4f50', 'bd1b8bc28e65d6feefefb6f3c79f42fd', 'JSON', 'json', NULL, NULL, 1, 1, 'admin', '2019-04-12 17:26:33', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('33bc9d9f753cf7dc40e70461e50fdc54', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送失败', '2', NULL, NULL, 3, 1, 'admin', '2019-04-12 18:20:02', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('3fbc03d6c994ae06d083751248037c0e', '78bda155fe380b1b3f175f1e88c284c6', '已完成', '3', NULL, '已完成', 3, 1, 'admin', '2019-05-09 16:33:25', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('41d7aaa40c9b61756ffb1f28da5ead8e', '0b5d19e1fce4b2e6647e6b4a17760c14', '通知公告', '1', NULL, NULL, 1, 1, 'admin', '2019-04-22 18:01:57', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('41fa1e9571505d643aea87aeb83d4d76', '4e4602b3e3686f0911384e188dc7efb4', '等于', '=', NULL, '等于', 4, 1, 'admin', '2019-04-01 16:45:24', 'admin', '2019-04-01 17:49:00');
INSERT INTO "sys_dict_item" VALUES ('43d2295b8610adce9510ff196a49c6e9', '845da5006c97754728bf48b6a10f79cc', '正常', '1', NULL, NULL, NULL, 1, 'admin', '2019-03-18 21:45:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('4f05fb5376f4c61502c5105f52e4dd2b', '83bfb33147013cc81640d5fd9eda030c', '操作日志', '2', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:22:49', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('50223341bfb5ba30bf6319789d8d17fe', 'd6e1152968b02d69ff358c75b48a6ee1', '业务办理', 'business', NULL, NULL, 3, 1, 'admin', '2023-04-22 19:28:05', 'admin', '2019-03-22 23:24:39');
INSERT INTO "sys_dict_item" VALUES ('51222413e5906cdaf160bb5c86fb827c', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '是', '1', NULL, '', 1, 1, 'admin', '2019-05-22 19:29:45', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('538fca35afe004972c5f3947c039e766', '2e02df51611a4b9632828ab7e5338f00', '显示', '1', NULL, '显示', 1, 1, 'admin', '2025-03-26 18:27:13', 'admin', '2019-04-26 18:39:07');
INSERT INTO "sys_dict_item" VALUES ('5584c21993bde231bbde2b966f2633ac', '4e4602b3e3686f0911384e188dc7efb4', '自定义SQL表达式', 'USE_SQL_RULES', NULL, '自定义SQL表达式', 9, 1, 'admin', '2019-04-01 10:45:24', 'admin', '2019-04-01 17:49:27');
INSERT INTO "sys_dict_item" VALUES ('58b73b344305c99b9d8db0fc056bbc0a', '72cce0989df68887546746d8f09811aa', '主表', '2', NULL, NULL, 2, 1, 'admin', '2019-03-27 10:13:36', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('5b65a88f076b32e8e69d19bbaadb52d5', '2f0320997ade5dd147c90130f7218c3e', '全体用户', 'ALL', NULL, NULL, NULL, 1, 'admin', '2020-10-17 21:22:43', 'admin', '2019-03-28 22:17:09');
INSERT INTO "sys_dict_item" VALUES ('5d833f69296f691843ccdd0c91212b6b', '880a895c98afeca9d9ac39f29e67c13e', '修改', '3', NULL, '', 3, 1, 'admin', '2019-07-22 10:55:07', 'admin', '2019-07-22 10:55:41');
INSERT INTO "sys_dict_item" VALUES ('5d84a8634c8fdfe96275385075b105c9', '3d9a351be3436fbefb1307d4cfb49bf2', '女', '2', '#08C9C9', NULL, 2, 1, NULL, '2019-01-04 14:56:56', 'admin', '2026-01-21 23:15:36');
INSERT INTO "sys_dict_item" VALUES ('66c952ae2c3701a993e7db58f3baf55e', '4e4602b3e3686f0911384e188dc7efb4', '大于', '>', NULL, '大于', 1, 1, 'admin', '2019-04-01 10:45:46', 'admin', '2019-04-01 17:48:29');
INSERT INTO "sys_dict_item" VALUES ('6937c5dde8f92e9a00d4e2ded9198694', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'easyui', '3', NULL, NULL, 1, 1, 'admin', '2019-03-22 16:32:15', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('69cacf64e244100289ddd4aa9fa3b915', 'a9d9942bd0eccb6e89de92d130ec4c4a', '未发送', '0', NULL, NULL, 1, 1, 'admin', '2019-04-12 18:19:23', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('6a7a9e1403a7943aba69e54ebeff9762', '4f69be5f507accea8d5df5f11346181a', '富文本', '2', NULL, '', 2, 1, 'admin', '2031-02-28 10:50:44', 'admin', '2022-07-04 16:29:30');
INSERT INTO "sys_dict_item" VALUES ('6c682d78ddf1715baf79a1d52d2aa8c2', '72cce0989df68887546746d8f09811aa', '单表', '1', NULL, NULL, 1, 1, 'admin', '2019-03-27 10:13:29', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('6d404fd2d82311fbc87722cd302a28bc', '4e4602b3e3686f0911384e188dc7efb4', '模糊', 'LIKE', NULL, '模糊', 7, 1, 'admin', '2019-04-01 16:46:02', 'admin', '2019-04-01 17:49:20');
INSERT INTO "sys_dict_item" VALUES ('6d4e26e78e1a09699182e08516c49fc4', '4d7fec1a7799a436d26d02325eff295e', '高', 'H', NULL, '高', 1, 1, 'admin', '2019-04-16 17:04:24', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('700e9f030654f3f90e9ba76ab0713551', '6b78e3f59faec1a4750acff08030a79b', '333', '333', NULL, NULL, NULL, 1, 'admin', '2019-02-21 19:59:47', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('7050c1522702bac3be40e3b7d2e1dfd8', 'c5a14c75172783d72cbee6ee7f5df5d1', '柱状图', 'bar', NULL, NULL, 1, 1, 'admin', '2019-04-12 17:05:17', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('71b924faa93805c5c1579f12e001c809', 'd6e1152968b02d69ff358c75b48a6ee1', 'OA办公', 'oa', NULL, NULL, 2, 1, 'admin', '2021-03-22 19:27:17', 'admin', '2023-10-18 13:54:29');
INSERT INTO "sys_dict_item" VALUES ('75b260d7db45a39fc7f21badeabdb0ed', 'c36169beb12de8a71c8683ee7c28a503', '不启用', '0', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:29:41', 'admin', '2019-03-18 23:29:54');
INSERT INTO "sys_dict_item" VALUES ('7688469db4a3eba61e6e35578dc7c2e5', 'c36169beb12de8a71c8683ee7c28a503', '启用', '1', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:29:28', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('78ea6cadac457967a4b1c4eb7aaa418c', 'fc6cd58fde2e8481db10d3a1e68ce70c', '正常', '1', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:30:28', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('7ccf7b80c70ee002eceb3116854b75cb', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '按钮权限', '2', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:25:40', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('81fb2bb0e838dc68b43f96cc309f8257', 'fc6cd58fde2e8481db10d3a1e68ce70c', '冻结', '2', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:30:37', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('83250269359855501ec4e9c0b7e21596', '4274efc2292239b6f000b153f50823ff', '可见/可访问(授权后可见/可访问)', '1', NULL, '', 1, 1, 'admin', '2019-05-10 17:54:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('84778d7e928bc843ad4756db1322301f', '4e4602b3e3686f0911384e188dc7efb4', '大于等于', '>=', NULL, '大于等于', 5, 1, 'admin', '2019-04-01 10:46:02', 'admin', '2019-04-01 17:49:05');
INSERT INTO "sys_dict_item" VALUES ('848d4da35ebd93782029c57b103e5b36', 'c5a14c75172783d72cbee6ee7f5df5d1', '饼图', 'pie', NULL, NULL, 3, 1, 'admin', '2019-04-12 17:05:49', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('84dfc178dd61b95a72900fcdd624c471', '78bda155fe380b1b3f175f1e88c284c6', '处理中', '2', NULL, '处理中', 2, 1, 'admin', '2019-05-09 16:33:01', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('86f19c7e0a73a0bae451021ac05b99dd', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '子菜单', '1', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:25:27', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('8c618902365ca681ebbbe1e28f11a548', '4c753b5293304e7a445fd2741b46529d', '启用', '1', NULL, '', 0, 1, 'admin', '2020-07-18 23:19:27', 'admin', '2019-05-17 14:51:18');
INSERT INTO "sys_dict_item" VALUES ('8cdf08045056671efd10677b8456c999', '4274efc2292239b6f000b153f50823ff', '可编辑(未授权时禁用)', '2', NULL, '', 2, 1, 'admin', '2019-05-10 17:55:38', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('8ff48e657a7c5090d4f2a59b37d1b878', '4d7fec1a7799a436d26d02325eff295e', '中', 'M', NULL, '中', 2, 1, 'admin', '2019-04-16 17:04:40', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('948923658baa330319e59b2213cda97c', '880a895c98afeca9d9ac39f29e67c13e', '添加', '2', NULL, '', 2, 1, 'admin', '2019-07-22 10:54:59', 'admin', '2019-07-22 10:55:36');
INSERT INTO "sys_dict_item" VALUES ('9a96c4a4e4c5c9b4e4d0cbf6eb3243cc', '4c753b5293304e7a445fd2741b46529d', '不启用', '0', NULL, NULL, 1, 1, 'admin', '2019-03-18 23:19:53', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('a1e7d1ca507cff4a480c8caba7c1339e', '880a895c98afeca9d9ac39f29e67c13e', '导出', '6', NULL, '', 6, 1, 'admin', '2019-07-22 12:06:50', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('a2be752dd4ec980afaec1efd1fb589af', '8dfe32e2d29ea9430a988b3b558bf233', '已撤销', '2', NULL, '已撤销', 3, 1, 'admin', '2019-04-16 17:41:39', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('aa0d8a8042a18715a17f0a888d360aa4', 'ac2f7c0c5c5775fcea7e2387bcb22f01', '一级菜单', '0', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:24:52', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('adcf2a1fe93bb99a84833043f475fe0b', '4e4602b3e3686f0911384e188dc7efb4', '包含', 'IN', NULL, '包含', 8, 1, 'admin', '2019-04-01 16:45:47', 'admin', '2019-04-01 17:49:24');
INSERT INTO "sys_dict_item" VALUES ('b029a41a851465332ee4ee69dcf0a4c2', '0b5d19e1fce4b2e6647e6b4a17760c14', '系统消息', '2', NULL, NULL, 1, 1, 'admin', '2019-02-22 18:02:08', 'admin', '2019-04-22 18:02:13');
INSERT INTO "sys_dict_item" VALUES ('b2a8b4bb2c8e66c2c4b1bb086337f393', '3486f32803bb953e7155dab3513dc68b', '正常', '0', NULL, NULL, NULL, 1, 'admin', '2022-10-18 21:46:48', 'admin', '2019-03-28 22:22:20');
INSERT INTO "sys_dict_item" VALUES ('b57f98b88363188daf38d42f25991956', '6b78e3f59faec1a4750acff08030a79b', '22', '222', NULL, NULL, NULL, 0, 'admin', '2019-02-21 19:59:43', 'admin', '2019-03-11 21:23:27');
INSERT INTO "sys_dict_item" VALUES ('b5f3bd5f66bb9a83fecd89228c0d93d1', '68168534ff5065a152bfab275c2136f8', '无效', '0', NULL, '无效', 1, 1, 'admin', '2019-04-26 19:21:49', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('b9fbe2a3602d4a27b45c100ac5328484', '78bda155fe380b1b3f175f1e88c284c6', '待提交', '1', NULL, '待提交', 1, 1, 'admin', '2019-05-09 16:32:35', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('ba27737829c6e0e582e334832703d75e', '236e8a4baff0db8c62c00dd95632834f', '同步', '1', NULL, '同步', 1, 1, 'admin', '2019-05-15 15:28:15', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('bcec04526b04307e24a005d6dcd27fd6', '880a895c98afeca9d9ac39f29e67c13e', '导入', '5', NULL, '', 5, 1, 'admin', '2019-07-22 12:06:41', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('c53da022b9912e0aed691bbec3c78473', '880a895c98afeca9d9ac39f29e67c13e', '查询', '1', NULL, '', 1, 1, 'admin', '2019-07-22 10:54:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('c5700a71ad08994d18ad1dacc37a71a9', 'a7adbcd86c37f7dbc9b66945c82ef9e6', '否', '0', NULL, '', 1, 1, 'admin', '2019-05-22 19:29:55', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('cbfcc5b88fc3a90975df23ffc8cbe29c', 'c5a14c75172783d72cbee6ee7f5df5d1', '曲线图', 'line', NULL, NULL, 2, 1, 'admin', '2019-05-12 17:05:30', 'admin', '2019-04-12 17:06:06');
INSERT INTO "sys_dict_item" VALUES ('d217592908ea3e00ff986ce97f24fb98', 'c5a14c75172783d72cbee6ee7f5df5d1', '数据列表', 'table', NULL, NULL, 4, 1, 'admin', '2019-04-12 17:05:56', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('df168368dcef46cade2aadd80100d8aa', '3d9a351be3436fbefb1307d4cfb49bf2', '男', '1', '#FF9300', NULL, 1, 1, NULL, '2027-08-04 14:56:49', 'admin', '2026-01-21 23:15:33');
INSERT INTO "sys_dict_item" VALUES ('e6329e3a66a003819e2eb830b0ca2ea0', '4e4602b3e3686f0911384e188dc7efb4', '小于', '<', NULL, '小于', 2, 1, 'admin', '2019-04-01 16:44:15', 'admin', '2019-04-01 17:48:34');
INSERT INTO "sys_dict_item" VALUES ('e94eb7af89f1dbfa0d823580a7a6e66a', '236e8a4baff0db8c62c00dd95632834f', '不同步', '0', NULL, '不同步', 2, 1, 'admin', '2019-05-15 15:28:28', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('f0162f4cc572c9273f3e26b2b4d8c082', 'ad7c65ba97c20a6805d5dcdf13cdaf36', 'booostrap', '1', NULL, NULL, 1, 1, 'admin', '2021-08-22 16:32:04', 'admin', '2019-03-22 16:33:57');
INSERT INTO "sys_dict_item" VALUES ('f16c5706f3ae05c57a53850c64ce7c45', 'a9d9942bd0eccb6e89de92d130ec4c4a', '发送成功', '1', NULL, NULL, 2, 1, 'admin', '2019-04-12 18:19:43', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('f2a7920421f3335afdf6ad2b342f6b5d', '845da5006c97754728bf48b6a10f79cc', '冻结', '2', NULL, NULL, NULL, 1, 'admin', '2019-03-18 21:46:02', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('f37f90c496ec9841c4c326b065e00bb2', '83bfb33147013cc81640d5fd9eda030c', '登录日志', '1', NULL, NULL, NULL, 1, 'admin', '2019-03-18 23:22:37', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('f753aff60ff3931c0ecb4812d8b5e643', '4c03fca6bf1f0299c381213961566349', '双排布局', 'NUMERIC', NULL, NULL, 3, 1, 'admin', '2019-04-12 17:43:51', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('f80a8f6838215753b05e1a5ba3346d22', '880a895c98afeca9d9ac39f29e67c13e', '删除', '4', NULL, '', 4, 1, 'admin', '2019-07-22 10:55:14', 'admin', '2019-07-22 10:55:30');
INSERT INTO "sys_dict_item" VALUES ('fcec03570f68a175e1964808dc3f1c91', '4c03fca6bf1f0299c381213961566349', 'Tab风格', 'tab', NULL, NULL, 1, 1, 'admin', '2019-04-12 17:43:31', NULL, NULL);
INSERT INTO "sys_dict_item" VALUES ('fe50b23ae5e68434def76f67cef35d2d', '78bda155fe380b1b3f175f1e88c284c6', '已作废', '4', NULL, '已作废', 4, 1, 'admin', '2021-09-09 16:33:43', 'admin', '2019-05-09 16:34:40');

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS "sys_files";
CREATE TABLE "sys_files" (
"id" varchar(32) NOT NULL,
"file_name" varchar(255) NULL DEFAULT NULL,
"url" varchar(1000) NULL DEFAULT NULL,
"file_type" varchar(20) NULL DEFAULT NULL,
"store_type" varchar(20) NULL DEFAULT NULL,
"parent_id" varchar(32) NULL DEFAULT NULL,
"tenant_id" varchar(100) NULL DEFAULT NULL,
"file_size" NUMERIC(13, 2) NULL DEFAULT NULL,
"iz_folder" varchar(2) NULL DEFAULT NULL,
"iz_root_folder" varchar(2) NULL DEFAULT NULL,
"iz_star" varchar(2) NULL DEFAULT NULL,
"down_count" INTEGER NULL DEFAULT NULL,
"read_count" INTEGER NULL DEFAULT NULL,
"share_url" varchar(255) NULL DEFAULT NULL,
"share_perms" varchar(2) NULL DEFAULT NULL,
"enable_down" varchar(2) NULL DEFAULT NULL,
"enable_updat" varchar(2) NULL DEFAULT NULL,
"del_flag" varchar(2) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "index_tenant_id"("tenant_id"),
INDEX "index_del_flag"("del_flag")
) ;

-- ----------------------------
-- Records of sys_files
-- ----------------------------
INSERT INTO "sys_files" VALUES ('1580814573568143361', '11.jpg', 'comment/11_1665730539114.jpg', 'image', 'temp', NULL, NULL, 10956.00, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2022-10-14 14:55:39', NULL, NULL);
INSERT INTO "sys_files" VALUES ('1584493984691740674', 'jeecg-boot漏洞.pdf', 'comment/jeecg-boot漏洞_1666607779077.pdf', 'pdf', 'temp', NULL, NULL, 842789.00, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2022-10-24 18:36:19', NULL, NULL);
INSERT INTO "sys_files" VALUES ('1714455459928985601', '低代码平台.png', 'comment/低代码平台_1697593009343.png', 'image', 'temp', NULL, '1000', 1249631.00, '0', '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, '0', 'admin', '2023-10-18 09:36:49', NULL, NULL);

-- ----------------------------
-- Table structure for sys_fill_rule
-- ----------------------------
DROP TABLE IF EXISTS "sys_fill_rule";
CREATE TABLE "sys_fill_rule" (
"id" varchar(32) NOT NULL,
"rule_name" varchar(100) NULL DEFAULT NULL,
"rule_code" varchar(100) NULL DEFAULT NULL,
"rule_class" varchar(100) NULL DEFAULT NULL,
"rule_params" varchar(200) NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uk_sfr_rule_code"("rule_code")
) ;

-- ----------------------------
-- Records of sys_fill_rule
-- ----------------------------
INSERT INTO "sys_fill_rule" VALUES ('1202551334738382850', '机构编码生成', 'org_num_role', 'org.jeecg.modules.system.rule.OrgCodeRule', '{\"parentId\":\"c6d7cb4deeac411cb3384b1b31278596\"}', 'admin', '2019-12-09 10:37:06', 'admin', '2019-12-05 19:32:35');
INSERT INTO "sys_fill_rule" VALUES ('1202787623203065858', '分类字典编码生成', 'category_code_rule', 'org.jeecg.modules.system.rule.CategoryCodeRule', '{\"pid\":\"\"}', 'admin', '2022-10-13 16:47:52', 'admin', '2019-12-06 11:11:31');
INSERT INTO "sys_fill_rule" VALUES ('1260134137920090113', '订单流水号', 'shop_order_num', 'org.jeecg.modules.online.cgform.rule.OrderNumberRule', '{}', 'admin', '2020-12-07 18:29:50', 'admin', '2020-05-12 17:06:05');

-- ----------------------------
-- Table structure for sys_form_file
-- ----------------------------
DROP TABLE IF EXISTS "sys_form_file";
CREATE TABLE "sys_form_file" (
"id" varchar(32) NOT NULL,
"table_name" varchar(50) NOT NULL,
"table_data_id" varchar(32) NOT NULL,
"file_id" varchar(32) NULL DEFAULT NULL,
"file_type" varchar(20) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_table_form"("table_name", "table_data_id"),
INDEX "index_file_id"("file_id")
) ;

-- ----------------------------
-- Records of sys_form_file
-- ----------------------------
INSERT INTO "sys_form_file" VALUES ('1580814573635252225', 'sys_comment', '1580814573433925634', '1580814573568143361', 'image', 'admin', '2022-10-14 14:55:39');
INSERT INTO "sys_form_file" VALUES ('1584493984716906497', 'sys_comment', '1584493984364584961', '1584493984691740674', 'pdf', 'admin', '2022-10-24 18:36:19');
INSERT INTO "sys_form_file" VALUES ('1714455459928985602', 'sys_comment', '1714455459606024193', '1714455459928985601', 'image', 'admin', '2023-10-18 09:36:49');
INSERT INTO "sys_form_file" VALUES ('1800557956199825409', 'sys_comment', '1800557955415490562', '1800557956132716545', 'image', 'admin', '2024-06-11 23:57:24');
INSERT INTO "sys_form_file" VALUES ('1800558014597120003', 'sys_comment', '1800558013942808578', '1800558014597120002', 'image', 'admin', '2024-06-11 23:57:38');
INSERT INTO "sys_form_file" VALUES ('1805421721449791490', 'sys_comment', '1805421721126830082', '1805421721449791489', 'image', 'admin', '2024-06-25 10:04:16');

-- ----------------------------
-- Table structure for sys_gateway_route
-- ----------------------------
DROP TABLE IF EXISTS "sys_gateway_route";
CREATE TABLE "sys_gateway_route" (
"id" varchar(36) NOT NULL,
"router_id" varchar(50) NULL DEFAULT NULL,
"name" varchar(64) NULL DEFAULT NULL,
"uri" varchar(32) NULL DEFAULT NULL,
"predicates" text NULL,
"filters" text NULL,
"retryable" INTEGER NULL DEFAULT NULL,
"strip_prefix" INTEGER NULL DEFAULT NULL,
"persistable" INTEGER NULL DEFAULT NULL,
"show_api" INTEGER NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"sys_org_code" varchar(64) NULL DEFAULT NULL,
"del_flag" INTEGER NULL DEFAULT NULL,
PRIMARY KEY ("id")
) ;

-- ----------------------------
-- Records of sys_gateway_route
-- ----------------------------
INSERT INTO "sys_gateway_route" VALUES ('1331051599401857026', 'jeecg-demo-websocket', 'jeecg-demo-websocket', 'lb:ws://jeecg-demo', '[{\"args\":[\"/vxeSocket/**\"],\"name\":\"Path\"}]', '[{\"args\":[{\"value\":\"#{@ipKeyResolver}\",\"key\":\"key-resolver\"},{\"value\":20,\"key\":\"redis-rate-limiter.replenishRate\"},{\"value\":20,\"key\":\"redis-rate-limiter.burstCapacity\"}],\"name\":\"RequestRateLimiter\",\"title\":\"限流过滤器\"}]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-24 09:46:46', NULL, NULL, NULL, 0);
INSERT INTO "sys_gateway_route" VALUES ('1805444036892016641', 'jeecg-erp', 'jeecg-erp', 'lb://jeecg-erp', '[{\"args\":[\"/erp/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2024-06-25 11:32:57', NULL, NULL, NULL, 0);
INSERT INTO "sys_gateway_route" VALUES ('jeecg-cloud-websocket', 'jeecg-system-websocket', 'jeecg-system-websocket', 'lb:ws://jeecg-system', '[{\"args\":[\"/websocket/**\",\"/eoaSocket/**\",\"/newsWebsocket/**\",\"/dragChannelSocket/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL, 0);
INSERT INTO "sys_gateway_route" VALUES ('jeecg-demo', 'jeecg-demo', 'jeecg-demo', 'lb://jeecg-demo', '[{\"args\":[\"/mock/**\",\"/bigscreen/template1/**\",\"/bigscreen/template2/**\",\"/test/**\",\"/hello/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL, 0);
INSERT INTO "sys_gateway_route" VALUES ('jeecg-system', 'jeecg-system', 'jeecg-system', 'lb://jeecg-system', '[{\"args\":[\"/sys/**\",\"/online/**\",\"/bigscreen/**\",\"/jmreport/**\",\"/druid/**\",\"/generic/**\",\"/actuator/**\",\"/drag/**\",\"/oauth2/**\",\"/defa/**\",\"/demo/**\",\"/jimubi/**\",\"/airag/**\",\"/openapi/**\"],\"name\":\"Path\"}]', '[]', NULL, NULL, NULL, NULL, 1, 'admin', '2020-11-16 19:41:51', NULL, NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "sys_log";
CREATE TABLE "sys_log" (
"id" varchar(32) NOT NULL,
"log_type" INTEGER NULL DEFAULT NULL,
"log_content" TEXT NULL,
"operate_type" INTEGER NULL DEFAULT NULL,
"userid" varchar(32) NULL DEFAULT NULL,
"username" varchar(100) NULL DEFAULT NULL,
"ip" varchar(100) NULL DEFAULT NULL,
"method" varchar(1000) NULL DEFAULT NULL,
"request_url" varchar(255) NULL DEFAULT NULL,
"request_param" TEXT NULL,
"request_type" varchar(10) NULL DEFAULT NULL,
"cost_time" BIGINT NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT NULL,
"client_type" varchar(5) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sl_userid"("userid"),
INDEX "idx_sl_log_type"("log_type"),
INDEX "idx_sl_operate_type"("operate_type"),
INDEX "idx_sl_create_time"("create_time")
) ;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO "sys_log" VALUES ('1939497644808986625', 1, '用户名: admin,登录成功！', NULL, 'admin', '管理员', '0:0:0:0:0:0:0:1', NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 09:34:07', NULL, NULL, NULL, 'pc');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS "sys_permission";
CREATE TABLE "sys_permission" (
"id" varchar(32) NOT NULL,
"parent_id" varchar(32) NULL DEFAULT NULL,
"name" varchar(255) NULL DEFAULT NULL,
"url" varchar(255) NULL DEFAULT NULL,
"component" varchar(255) NULL DEFAULT NULL,
"is_route" SMALLINT NULL DEFAULT 1,
"component_name" varchar(255) NULL DEFAULT NULL,
"redirect" varchar(255) NULL DEFAULT NULL,
"menu_type" INTEGER NULL DEFAULT NULL,
"perms" varchar(255) NULL DEFAULT NULL,
"perms_type" varchar(10) NULL DEFAULT '0',
"sort_no" NUMERIC(8, 2) NULL DEFAULT NULL,
"always_show" SMALLINT NULL DEFAULT NULL,
"icon" varchar(255) NULL DEFAULT NULL,
"is_leaf" SMALLINT NULL DEFAULT NULL,
"keep_alive" SMALLINT NULL DEFAULT NULL,
"hidden" SMALLINT NULL DEFAULT 0,
"hide_tab" SMALLINT NULL DEFAULT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(255) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(255) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"del_flag" INTEGER NULL DEFAULT 0,
"rule_flag" INTEGER NULL DEFAULT 0,
"status" varchar(2) NULL DEFAULT NULL,
"internal_or_external" SMALLINT NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "index_menu_type"("menu_type"),
INDEX "index_menu_hidden"("hidden"),
INDEX "index_menu_status"("status"),
INDEX "index_menu_del_flag"("del_flag"),
INDEX "index_menu_url"("url"),
INDEX "index_menu_sort_no"("sort_no")
) ;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO "sys_permission" VALUES ('1170592628746878978', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '菜单管理', '/system/menu', 'system/menu/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, 'ant-design:menu-fold-outlined', 0, 0, 0, 0, NULL, 'admin', '2019-09-08 15:00:05', 'ceshi', '2023-10-18 12:02:41', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('119213522910765570', '1674708136602542082', '租户用户', '/system/tenant/TenantUserList', 'system/tenant/TenantUserList', 1, 'tenant-system-user', NULL, 1, NULL, NULL, 2.00, 0, 'ant-design:user', 1, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2025-08-12 18:23:19', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1211885237487923202', '1207203817658105858', 'btn:add', '', '', 1, NULL, NULL, 2, 'btn:add', '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2019-12-31 13:42:11', 'admin', '2020-01-07 20:07:53', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1214376304951664642', '3f915b2769fc80648e92d04e84ca059d', '用户编辑', '', '', 0, NULL, NULL, 2, 'system:user:edit', '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2020-01-07 10:40:47', 'admin', '2022-11-17 16:24:33', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1214462306546319322', '119213522910765570', '新增用户', '', '', 1, NULL, NULL, 2, 'system:user:addTenantUser', '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2020-01-07 16:22:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1214462306546319362', '3f915b2769fc80648e92d04e84ca059d', '新增用户', '', '', 0, NULL, NULL, 2, 'system:user:add', '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2020-01-07 16:22:32', 'admin', '2022-11-17 16:24:47', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1280350452934307841', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '多租户管理', '/system/tenant', 'system/tenant/index', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, 'ant-design:appstore-twotone', 0, 0, 0, 0, NULL, 'admin', '2020-07-07 11:58:30', 'admin', '2025-06-25 14:16:36', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108176273760258', '', '主页', '/dashboard', 'layouts/default/index', 1, NULL, '/dashboard/analysis', 0, NULL, '1', 1.00, 0, 'ant-design:home-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2025-09-13 18:49:01', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108176814825473', '1438108176273760258', '工作台', '/dashboard/workbench', 'dashboard/workbench/index', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, 'ant-design:appstore-twotone', 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:23', 'jeecg', '2024-06-13 11:37:46', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108176932265985', '1438108178010202113', '权限管理', '/permission', 'layouts/default/index', 1, NULL, '/permission/front/page', 0, NULL, '1', 2.00, 0, 'ion:key-outline', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177074872321', '1438108176932265985', '基于前端权限', '/permission/front', NULL, 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177188118529', '1438108176932265985', '基于后台权限', '/permission/back', NULL, 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177351696386', '1438108177074872321', '页面权限', '/permission/front/page', 'demo/permission/front/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2021-09-16 14:37:49', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177565605889', '1438108177074872321', '按钮权限', '/permission/front/btn', 'demo/permission/front/Btn', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2021-09-15 19:57:23', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177720795137', '1438108177188118529', '页面权限', '/permission/back/page', 'demo/permission/back/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2021-09-15 19:56:40', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108177880178689', '1438108177188118529', '按钮权限', '/permission/back/btn', 'demo/permission/back/Btn', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2021-09-15 19:57:00', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178010202113', '1438108196993622018', '功能示例', '/feat', 'layouts/default/index', 1, NULL, '/feat/icon', 0, NULL, '1', 20.00, 0, 'ion:git-compare-outline', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178127642626', '1438108197958315557', '图标', '/comp/basic/icon', 'demo/feat/icon/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178257666049', '1438108178010202113', 'websocket测试', '/feat/ws', 'demo/feat/ws/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178421243905', '1438108178010202113', '登录过期', '/feat/session-timeout', 'demo/feat/session-timeout/index', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178643542017', '1438108197958311677', '打印', '/comp/third/print', 'demo/feat/print/index', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178781954049', '1438108197958315557', 'Tab操作', '/comp/basic/tabs', 'demo/feat/tabs/index', 1, NULL, NULL, 1, NULL, '1', 4.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178781954050', '1438108197958315557', 'TabDetail', '/comp/basic/tabs/detail/:id', 'demo/feat/tabs/TabDetail', 1, NULL, '/comp/basic/tabs/detail', 1, NULL, '1', 4.00, 0, NULL, 1, 0, 1, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108178911977473', '1438108187455774722', '面包屑导航', '/feat/breadcrumb', 'layouts/default/index', 1, NULL, '/feat/breadcrumb/flat', 1, NULL, '1', 5.00, 0, 'ant-design:right-square-filled', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', 'admin', '2021-09-17 15:48:07', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108179226550273', '1438108197958311677', '右键菜单', '/comp/third/context-menu', 'demo/feat/context-menu/index', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108179381739521', '1438108197958311677', '文件下载', '/comp/third/download', 'demo/feat/download/index', 1, NULL, NULL, 1, NULL, '1', 7.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108179599843330', '1438108197958311677', 'ClickOutSide组件', '/comp/third/click-out-side', 'demo/feat/click-out-side/index', 1, NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108179910221825', '1438108197958311677', '图片预览', '/comp/third/img-preview', 'demo/feat/img-preview/index', 1, NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108180077993985', '1438108197958311677', '剪切板', '/comp/third/copy', 'demo/feat/copy/index', 1, NULL, NULL, 1, NULL, '1', 10.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108180258349057', '1438108197958315557', '消息提示', '/comp/basic/msg', 'demo/feat/msg/index', 1, NULL, NULL, 1, NULL, '1', 11.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108180434509826', '1438108197958311677', '水印', '/comp/third/watermark', 'demo/feat/watermark/index', 1, NULL, NULL, 1, NULL, '1', 12.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108180631642113', '1438108197958311677', '水波纹', '/comp/third/ripple', 'demo/feat/ripple/index', 1, NULL, NULL, 1, NULL, '1', 13.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108180770054145', '1438108178010202113', '全屏', '/feat/full-screen', 'demo/feat/full-screen/index', 1, NULL, NULL, 1, NULL, '1', 14.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108182116425729', '1438108197958311677', '日历(New)', '/comp/third/fullCalendar', 'demo/fullcalendar/index', 1, NULL, NULL, 1, NULL, '1', 16.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183085309954', '1438108178010202113', '错误日志', '/feat/error-log', 'sys/error-log/index', 1, NULL, NULL, 1, NULL, '1', 17.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183219527682', '1438108196993622018', 'Excel', '/feat/excel', 'layouts/default/index', 1, NULL, '/feat/excel/customExport', 1, NULL, '1', 18.00, 0, 'ant-design:file-excel-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-17 15:54:57', 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183395688450', '1438108187455774722', 'Tab带参', '/feat/testTab/:id', 'demo/feat/tab-params/index', 1, NULL, NULL, 1, NULL, '1', 19.00, 0, 'ant-design:insert-row-above-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-17 15:48:57', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183492157442', '1438108187455774722', 'Menu带参', '/feat/testParam/:id', 'layouts/default/index', 1, NULL, NULL, 1, NULL, '1', 20.00, 0, 'ant-design:menu-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-17 15:49:12', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183630569474', '1438108178911977473', '平级模式', '/feat/breadcrumb/flat', 'demo/feat/breadcrumb/FlatList', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-15 20:12:01', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183630569477', '1438108178911977473', '平级详情', '/feat/breadcrumb/flatDetail', 'demo/feat/breadcrumb/FlatListDetail', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 1, 1, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-18 11:07:07', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183777370114', '1438108183630569474', '平级详情', '/feat/breadcrumb/flatDetail', 'demo/feat/breadcrumb/FlatListDetail', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 1, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-15 20:13:41', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108183907393538', '1438108178911977473', '层级模式', '/feat/breadcrumb/children', 'demo/feat/breadcrumb/ChildrenList', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-15 20:11:57', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108184049999873', '1438108183907393538', '层级详情', '/feat/breadcrumb/children/childrenDetail', 'demo/feat/breadcrumb/ChildrenListDetail', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:24', 'admin', '2021-09-15 20:11:49', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108185660612609', '1438108183219527682', '选择导出格式', '/feat/excel/customExport', 'demo/excel/CustomExport', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:15:59', 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108185815801858', '1438108183219527682', 'JSON数据导出', '/feat/excel/jsonExport', 'demo/excel/JsonExport', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:16:15', 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108185958408193', '1438108183219527682', 'Array数据导出', '/feat/excel/arrayExport', 'demo/excel/ArrayExport', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:16:32', 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108186289758209', '1438108183219527682', '导入', '/feat/excel/importExcel', 'demo/excel/ImportExcel', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:16:43', 1, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108186717577217', '1438108183492157442', 'Menu带参1', '/feat/testParam/:id/sub1', 'demo/feat/menu-params/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:17:23', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108187103453186', '1438108183492157442', 'Menu带参2', '/feat/testParam/:id/sub2', 'demo/feat/menu-params/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-15 20:17:36', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108187455774722', '', '导航示例', '/page-demo', 'layouts/default/index', 1, NULL, '/page-demo/form/basic', 0, NULL, '1', 12.00, 0, 'ion:aperture-outline', 0, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2025-06-25 14:22:40', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108187678072833', '1438108187455774722', '表单页', '/page-demo/form', 'layouts/default/index', 1, NULL, '/page-demo/form/basic', 1, NULL, '1', 0.00, 0, 'ant-design:form-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-17 15:45:30', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108187871010818', '1438108187455774722', '详情页', '/page-demo/desc', 'layouts/default/index', 1, NULL, '/page-demo/desc/basic', 1, NULL, '1', 1.00, 0, 'ant-design:border-right-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-17 15:46:10', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108188034588674', '1438108187455774722', '结果页', '/page-demo/result', 'layouts/default/index', 1, NULL, '/page-demo/result/success', 1, NULL, '1', 2.00, 0, 'ant-design:account-book-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:25', 'admin', '2021-09-17 15:47:04', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108188378521602', '1438108187455774722', '个人页', '/page-demo/account', 'layouts/default/index', 1, NULL, '/page-demo/account/setting', 1, NULL, '1', 3.00, 0, 'ant-design:user-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', 'admin', '2021-09-17 15:47:23', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108188542099458', '1438108187455774722', '异常页', '/page-demo/exception', 'layouts/default/index', 1, NULL, '/page-demo/exception/404', 1, NULL, '1', 4.00, 0, 'ant-design:bug-twotone', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', 'admin', '2021-09-17 15:47:41', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108188714065922', '1438108187455774722', '列表页', '/page-demo/list', 'layouts/default/index', 1, NULL, '/page-demo/list/card', 1, NULL, '1', 5.00, 0, 'ant-design:table-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', 'admin', '2021-09-17 15:48:19', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108189062193153', '1438108187678072833', '基础表单', '/page-demo/form/basic', 'demo/page/form/basic/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108189427097601', '1438108187678072833', '分步表单', '/page-demo/form/step', 'demo/page/form/step/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108189754253313', '1438108187678072833', '高级表单', '/page-demo/form/high', 'demo/page/form/high/index', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108190110769154', '1438108187871010818', '基础详情页', '/page-demo/desc/basic', 'demo/page/desc/basic/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108190404370433', '1438108187871010818', '高级详情页', '/page-demo/desc/high', 'demo/page/desc/high/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108190777663490', '1438108188034588674', '成功页', '/page-demo/result/success', 'demo/page/result/success/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108191356477442', '1438108188034588674', '失败页', '/page-demo/result/fail', 'demo/page/result/fail/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108192623157249', '1438108188378521602', '个人中心', '/page-demo/account/center', 'demo/page/account/center/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108193701093378', '1438108188378521602', '个人设置', '/page-demo/account/setting', 'demo/page/account/setting/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108194992939010', '1438108188542099458', '403', '/page-demo/exception/403', 'sys/exception/NotAccessException', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:27', 'admin', '2021-09-18 18:02:47', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108195307511809', '1438108188542099458', '404', '/page-demo/exception/404', 'sys/exception/Exception', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108195487866881', '1438108188542099458', '500', '/page-demo/exception/500', 'sys/exception/ServerErrorException', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:27', 'admin', '2021-09-18 18:04:34', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108195638861825', '1438108188542099458', '网络错误', '/page-demo/exception/net-work-error', 'sys/exception/NetworkErrorException', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:27', 'admin', '2021-09-18 18:05:05', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108195924074497', '1438108188542099458', '无数据', '/page-demo/exception/not-data', 'sys/exception/NotDataErrorException', 1, NULL, NULL, 1, NULL, '1', 4.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:27', 'admin', '2021-09-18 18:05:40', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108196263813121', '1438108188714065922', '标准列表', '/page-demo/list/basic', 'demo/page/list/basic/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108196528054273', '1438108188714065922', '卡片列表', '/page-demo/list/card', 'demo/page/list/card/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108196855209985', '1438108188714065922', '搜索列表', '/page-demo/list/search', 'demo/page/list/search/index', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108196993622018', '', '组件示例', '/comp', 'layouts/default/index', 1, NULL, '/comp/basic', 0, NULL, '1', 11.00, 0, 'ion:layers-outline', 0, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2025-06-25 14:22:30', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197270446081', '1438108197958311537', '自定义组件示例', '/comp/jeecg/basic', 'demo/jeecg/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197790539778', '1438108197958315557', 'Button组件', '/comp/basic/button', 'demo/comp/button/index', 1, NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 09:31:48', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197958311537', '1438108196993622018', 'Jeecg组件示例', '/comp/jeecg', 'layouts/default/index', 1, NULL, '/comp/jeecg/basic', 1, NULL, '1', 1.00, 0, 'ant-design:sketch-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:49:57', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197958311637', '1438108196993622018', '弹框抽屉', '/comp/modal', 'layouts/default/index', 1, NULL, '/comp/modal/basic', 1, NULL, '1', 6.00, 0, 'ant-design:laptop-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:53:10', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197958311677', '1438108196993622018', '第三方组件', '/comp/third', 'layouts/default/index', 1, NULL, '/comp/third/basic', 1, NULL, '1', 7.00, 0, 'ant-design:slack-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:53:31', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197958311937', '1438108196993622018', 'Form示例', '/comp/form', 'layouts/default/index', 1, NULL, '/comp/form/basic', 1, NULL, '1', 2.00, 0, 'ant-design:pic-left-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:50:39', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108197958315557', '1438108196993622018', '基础组件', '/comp/basic', 'layouts/default/index', 1, NULL, '/comp/basic', 1, NULL, '1', 1.00, 0, 'ant-design:insert-row-left-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:50:27', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108198113501186', '1438108196993622018', 'Table示例', '/comp/table', 'layouts/default/index', 1, NULL, '/comp/table/basic', 1, NULL, '1', 3.00, 0, 'ant-design:table-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:50:51', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108198339993602', '1438108197958311677', '动画组件', '/comp/third/transition', 'demo/comp/transition/index', 1, NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108198679732226', '1438108197958311537', '一对多示例', '/comp/jeecg/oneToMore', 'demo/vextable/index', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108198855892993', '1438108197958311677', '图片裁剪', '/comp/third/basic', 'demo/comp/cropper/index', 1, NULL, NULL, 1, NULL, '1', 7.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108199120134145', '1438108197958311677', '相对时间', '/comp/third/timestamp', 'demo/comp/time/index', 1, NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108199304683521', '1438108197958311677', '数字动画', '/comp/third/countTo', 'demo/comp/count-to/index', 1, NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108199413735425', '1438108196993622018', 'Tree示例', '/comp/tree', 'layouts/default/index', 1, NULL, '/comp/tree/basic', 1, NULL, '1', 4.00, 0, 'ant-design:partition-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:54:17', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108199539564546', '1438108196993622018', '编辑器', '/comp/editor', 'layouts/default/index', 1, NULL, '/comp/editor/markdown', 1, NULL, '1', 5.00, 0, 'ant-design:credit-card-twotone', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:52:47', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108199631839234', '1438108196993622018', '滚动组件', '/comp/scroll', 'layouts/default/index', 1, NULL, '/comp/scroll/basic', 1, NULL, '1', 11.00, 0, 'ant-design:column-height-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:53:43', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108200076435458', '1438108197958311637', '弹窗扩展', '/comp/modal/basic', 'demo/comp/modal/index', 1, NULL, NULL, 1, NULL, '1', 12.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108200391008257', '1438108197958311637', '抽屉扩展', '/comp/modal/drawer', 'demo/comp/drawer/index', 1, NULL, NULL, 1, NULL, '1', 13.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108200672026626', '1438108197958315557', '详情组件', '/comp/desc', 'demo/comp/desc/index', 1, NULL, NULL, 1, NULL, '1', 14.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108200802050050', '1438108196993622018', '懒加载组件', '/comp/lazy', 'layouts/default/index', 1, NULL, '/comp/lazy/basic', 1, NULL, '1', 15.00, 0, 'ant-design:small-dash-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:28', 'admin', '2021-09-17 15:53:59', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108200919490562', '1438108196993622018', '验证组件', '/comp/verify', 'layouts/default/index', 1, NULL, '/comp/verify/drag', 1, NULL, '1', 16.00, 0, 'ant-design:field-binary-outlined', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', 'admin', '2021-09-17 15:54:36', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108201150177281', '1438108197958311677', '二维码组件', '/comp/third/qrcode', 'demo/comp/qrcode/index', 1, NULL, NULL, 1, NULL, '1', 17.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108201502498817', '1438108197958311677', '密码强度组件', '/comp/third/strength-meter', 'demo/comp/strength-meter/index', 1, NULL, NULL, 1, NULL, '1', 18.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108202060341249', '1438108197958311677', 'Loading', '/comp/third/loading', 'demo/comp/loading/index', 1, NULL, NULL, 1, NULL, '1', 20.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108202366525441', '1438108197958311937', '基础表单', '/comp/form/basic', 'demo/form/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108203649982466', '1438108197958311937', 'useForm', '/comp/form/useForm', 'demo/form/UseForm', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108203817754625', '1438108197958311937', 'RefForm', '/comp/form/refForm', 'demo/form/RefForm', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108204023275521', '1438108197958311937', '可收缩表单', '/comp/form/advancedForm', 'demo/form/AdvancedForm', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108204232990721', '1438108197958311937', '表单验证', '/comp/form/ruleForm', 'demo/form/RuleForm', 1, NULL, NULL, 1, NULL, '1', 4.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108204400762881', '1438108197958311937', '动态表单', '/comp/form/dynamicForm', 'demo/form/DynamicForm', 1, NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108204576923649', '1438108197958311937', '自定义组件', '/comp/form/customerForm', 'demo/form/CustomerForm', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108204732112898', '1438108197958311937', '表单增删示例', '/comp/form/appendForm', 'demo/form/AppendForm', 1, NULL, NULL, 1, NULL, '1', 7.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205004742657', '1438108198113501186', '基础表格', '/comp/table/basic', 'demo/table/Basic', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205180903426', '1438108198113501186', '树形表格', '/comp/table/treeTable', 'demo/table/TreeTable', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205357064193', '1438108198113501186', '远程加载示例', '/comp/table/fetchTable', 'demo/table/FetchTable', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205587750914', '1438108198113501186', '固定列', '/comp/table/fixedColumn', 'demo/table/FixedColumn', 1, NULL, NULL, 1, NULL, '1', 3.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205742940161', '1438108198113501186', '自定义列', '/comp/table/customerCell', 'demo/table/CustomerCell', 1, NULL, NULL, 1, NULL, '1', 4.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108205919100930', '1438108198113501186', '开启搜索区域', '/comp/table/formTable', 'demo/table/FormTable', 1, NULL, NULL, 1, NULL, '1', 5.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108206086873089', '1438108198113501186', 'UseTable', '/comp/table/useTable', 'demo/table/UseTable', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108206258839553', '1438108198113501186', 'RefTable', '/comp/table/refTable', 'demo/table/RefTable', 1, NULL, NULL, 1, NULL, '1', 7.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108206489526274', '1438108198113501186', '多级表头', '/comp/table/multipleHeader', 'demo/table/MultipleHeader', 1, NULL, NULL, 1, NULL, '1', 8.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108206661492738', '1438108198113501186', '合并单元格', '/comp/table/mergeHeader', 'demo/table/MergeHeader', 1, NULL, NULL, 1, NULL, '1', 9.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108206959288321', '1438108198113501186', '嵌套子表格', '/comp/table/nestedTable', 'demo/table/NestedTable', 1, NULL, NULL, 1, NULL, '1', 10.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108207160614913', '1438108198113501186', '可展开表格', '/comp/table/expandTable', 'demo/table/ExpandTable', 1, NULL, NULL, 1, NULL, '1', 11.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108207374524418', '1438108198113501186', '定高/头部自定义', '/comp/table/fixedHeight', 'demo/table/FixedHeight', 1, NULL, NULL, 1, NULL, '1', 12.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108207563268097', '1438108198113501186', '表尾行合计', '/comp/table/footerTable', 'demo/table/FooterTable', 1, NULL, NULL, 1, NULL, '1', 13.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108207793954818', '1438108198113501186', '可编辑单元格', '/comp/table/editCellTable', 'demo/table/EditCellTable', 1, NULL, NULL, 1, NULL, '1', 14.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108208024641538', '1438108198113501186', '可编辑行', '/comp/table/editRowTable', 'demo/table/EditRowTable', 1, NULL, NULL, 1, NULL, '1', 15.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108208297271297', '1438108198113501186', '权限列', '/comp/table/authColumn', 'demo/table/AuthColumn', 1, NULL, NULL, 1, NULL, '1', 16.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108208817364993', '1438108199413735425', '基础树', '/comp/tree/basic', 'demo/tree/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108208980942850', '1438108199413735425', '可搜索/工具栏', '/comp/tree/editTree', 'demo/tree/EditTree', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108209228406785', '1438108199413735425', '函数操作示例', '/comp/tree/actionTree', 'demo/tree/ActionTree', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108210117599234', '1438108199539564546', 'Json编辑器', '/comp/editor/json', 'demo/editor/json/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108210260205570', '1438108199539564546', 'markdown编辑器', '/comp/editor/markdown', NULL, 1, NULL, '/comp/editor/markdown/index', 1, NULL, '1', 1.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108211325558785', '1438108210260205570', '基础使用', '/comp/editor/markdown/index', 'demo/editor/markdown/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:31', 'admin', '2021-09-16 14:40:59', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108211661103106', '1438108210260205570', '嵌入form', '/comp/editor/markdown/editor', 'demo/editor/markdown/Editor', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:31', 'admin', '2021-09-16 14:41:04', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108211778543618', '1438108199539564546', '富文本', '/comp/editor/tinymce', NULL, 1, NULL, '/comp/editor/tinymce/index', 1, NULL, '1', 2.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108214882328577', '1438108211778543618', '基础使用', '/comp/editor/tinymce/index', 'demo/editor/tinymce/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108215335313409', '1438108211778543618', '嵌入form', '/comp/editor/tinymce/editor', 'demo/editor/tinymce/Editor', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108215511474177', '1438108199631839234', '基础滚动', '/comp/scroll/basic', 'demo/comp/scroll/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108215687634945', '1438108199631839234', '滚动函数', '/comp/scroll/action', 'demo/comp/scroll/Action', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108215989624834', '1438108199631839234', '虚拟滚动', '/comp/scroll/virtualScroll', 'demo/comp/scroll/VirtualScroll', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108216300003330', '1438108200802050050', '基础示例', '/comp/lazy/basic', 'demo/comp/lazy/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108216597798914', '1438108200802050050', '动画效果', '/comp/lazy/transition', 'demo/comp/lazy/Transition', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108216971091969', '1438108200919490562', '拖拽校验', '/comp/verify/drag', 'demo/comp/verify/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108217449242626', '1438108200919490562', '图片还原', '/comp/verify/rotate', 'demo/comp/verify/Rotate', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108217562488834', '1438108187455774722', '图表', '/charts', 'layouts/default/index', 1, NULL, '/charts/echarts/map', 0, NULL, '1', 7.00, 0, 'ion:bar-chart-outline', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108217860284417', '1438108217562488834', '百度地图', '/charts/baiduMap', 'demo/charts/map/Baidu', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108218049028097', '1438108217562488834', '高德地图', '/charts/aMap', 'demo/charts/map/Gaode', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108218409738242', '1438108217562488834', 'Echarts', '/charts/echarts', NULL, 1, NULL, '/charts/echarts/map', 1, NULL, '1', 3.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108218787225601', '1438108218409738242', '地图', '/charts/echarts/map', 'demo/charts/Map', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108219034689538', '1438108218409738242', '折线图', '/charts/echarts/line', 'demo/charts/Line', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108219240210434', '1438108218409738242', '饼图', '/charts/echarts/pie', 'demo/charts/Pie', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108219445731330', '1438108187455774722', '外部页面', '/frame', 'layouts/default/index', 1, NULL, '/frame/doc', 0, NULL, '1', 8.00, 0, 'ion:tv-outline', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108219592531970', '1438108219445731330', '项目文档(内嵌)', '/frame/doc', 'http://vue3.jeecg.com', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2021-11-15 17:59:32', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108219793858561', '1438108219445731330', 'antVue文档(内嵌)', '/frame/antv', 'https://2x.antdv.com/docs/vue/introduce-cn', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2021-11-11 17:11:10', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108220137791489', '1438108219445731330', '项目文档(外链)', '/', 'http://vue3.jeecg.com/', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2021-10-25 13:46:59', 0, 0, '1', 1);
INSERT INTO "sys_permission" VALUES ('1438108220418809857', '1438108187455774722', '多级菜单', '/level', 'layouts/default/index', 1, NULL, '/level/menu1/menu1-1/menu1-1-1', 0, NULL, '1', 9.00, 0, 'ion:menu-outline', 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108220523667458', '1438108220418809857', 'Menu1', '/level/menu1', NULL, 1, NULL, '/level/menu1/menu1-1/menu1-1-1', 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108220724994049', '1438108220418809857', 'Menu2', '/level/menu2', 'demo/level/Menu2', 1, 'Menu2Demo', NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2022-09-20 15:24:13', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108220896960513', '1438108220523667458', 'Menu1-1', '/level/menu1/menu1-1', NULL, 1, NULL, '/level/menu1/menu1-1/menu1-1-1', 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108221127647234', '1438108220896960513', 'Menu1-1-1', '/level/menu1/menu1-1/menu1-1-1', 'demo/level/Menu111', 1, 'Menu111Demo', NULL, 1, NULL, '1', 0.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2022-09-20 15:24:03', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108221270253570', '1438108220523667458', 'Menu1-2', '/level/menu1/menu1-2', 'demo/level/Menu12', 1, 'Menu12Demo', NULL, 1, NULL, '1', 1.00, 0, NULL, 1, 1, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2022-09-20 15:24:08', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108221551271937', '1438108196993622018', 'Mock示例', '/system', 'layouts/default/index', 1, NULL, '/system/account', 1, NULL, '1', 10.00, 0, 'ion:settings-outline', 0, 0, 0, 0, NULL, 'admin', '2021-09-15 19:51:33', 'admin', '2025-06-25 14:22:54', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108221849067522', '1438108221551271937', '测试功能', '/system/test', 'demo/system/test/index', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, 'ant-design:bulb-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 15:55:36', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108222218166273', '1438108221551271937', '账号管理', '/system/account', 'demo/system/account/index', 1, NULL, NULL, 1, NULL, '1', 1.00, 0, 'ant-design:user-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 15:55:46', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108222721482753', '1438108221551271937', '账号详情', '/system/account_detail/:id', 'demo/system/account/AccountDetail', 1, NULL, NULL, 1, NULL, '1', 2.00, 0, 'ant-design:idcard-twotone', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 15:56:12', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108223489040385', '1438108221551271937', '部门管理', '/system/dept', 'demo/system/dept/index', 1, NULL, NULL, 1, NULL, '1', 5.00, 0, 'ant-design:usergroup-add-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 15:56:34', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108223661006850', '1438108221551271937', '修改密码', '/system/changePassword', 'demo/system/password/index', 1, NULL, NULL, 1, NULL, '1', 6.00, 0, 'ant-design:field-number-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 15:56:46', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108225263230978', '1438108178010202113', '引导页', '/setup/index', 'demo/setup/index', 1, NULL, NULL, 1, NULL, '1', 12.00, 0, 'whh:paintroll', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', 'admin', '2021-09-17 09:02:19', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438108225451974658', '', '关于', '/about/index', 'sys/about/index', 1, NULL, NULL, 0, NULL, '1', 13.00, 0, 'simple-icons:about-dot-me', 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 19:51:34', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438115924159881218', '1438108183395688450', 'Tab带参1', '/testTab/id1', 'demo/feat/tab-params/index', 1, NULL, NULL, 1, NULL, '0', 0.00, 0, NULL, 1, 0, 0, NULL, NULL, 'admin', '2021-09-15 20:22:10', 'admin', '2021-09-16 14:38:32', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438116003012796418', '1438108183395688450', 'Tab带参2', '/feat/testTab/id2', 'demo/feat/tab-params/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-15 20:22:29', 'admin', '2023-08-25 13:32:42', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1438469604861403137', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '职务级别', '/system/position', 'system/position/index', 1, NULL, NULL, 1, NULL, '0', 5.00, 0, 'ant-design:database-filled', 1, 0, 0, NULL, NULL, 'admin', '2021-09-16 19:47:33', 'admin', '2021-09-17 15:58:22', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1438782530717495298', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '分类字典', '/system/category', 'system/category/index', 1, NULL, NULL, 1, NULL, '0', 9.00, 0, 'ant-design:group-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-17 16:31:01', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1438782641187074050', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '数据字典', '/system/dict', 'system/dict/index', 1, NULL, NULL, 1, NULL, '0', 4.00, 0, 'ant-design:hdd-twotone', 0, 0, 0, 0, NULL, 'admin', '2021-09-17 16:31:27', 'admin', '2023-03-04 15:01:55', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1438782851980210178', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '通知公告', '/system/notice', 'system/notice/index', 1, NULL, NULL, 1, NULL, '0', 8.00, 0, 'ant-design:bell-outlined', 1, 0, 0, NULL, NULL, 'admin', '2021-09-17 16:32:17', 'admin', '2021-09-17 16:36:15', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1438783058792951810', '1438108197958311537', '单表示例', '/system/examples/demo', 'system/examples/demo/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-17 16:33:07', 'admin', '2021-12-08 14:10:47', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439398677984878593', '', '系统监控', '/monitor', 'layouts/RouteView', 1, NULL, NULL, 0, NULL, '0', 5.00, 0, 'ant-design:video-camera-filled', 0, 0, 0, 0, NULL, 'admin', '2021-09-19 09:19:22', 'admin', '2022-10-14 16:21:08', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439399179791409153', '1439398677984878593', '网关路由', '/monitor/route', 'monitor/route/index', 1, NULL, NULL, 1, NULL, '0', 0.00, 0, 'ant-design:branches-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-09-19 09:21:21', 'admin', '2025-07-31 11:32:32', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439488251473993730', '1439398677984878593', '定时任务', '/monitor/quartz', 'monitor/quartz/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, 'ant-design:history-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-09-19 15:15:18', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439511654494937090', '1439398677984878593', '数据源管理', '/monitor/datasource', 'monitor/datasource/index', 1, NULL, NULL, 1, NULL, '0', 3.00, 0, 'ant-design:hdd-filled', 0, 0, 0, 0, NULL, 'admin', '2021-09-19 16:48:17', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439531077792473089', '1439398677984878593', '数据日志', '/monitor/datalog', 'monitor/datalog/index', 1, NULL, NULL, 1, NULL, '0', 6.00, 0, 'ant-design:funnel-plot-twotone', 1, 0, 0, 0, NULL, 'admin', '2021-09-19 18:05:28', 'admin', '2025-06-25 16:45:47', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439533711676973057', '1439398677984878593', '日志管理', '/monitor/log', 'monitor/log/index', 1, NULL, NULL, 1, NULL, '0', 5.00, 0, 'ant-design:interaction-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-09-19 18:15:56', 'admin', '2021-09-19 18:16:56', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439542701152575489', '1443390062919208961', '我的消息', '/monitor/mynews', 'monitor/mynews/index', 1, NULL, NULL, 1, NULL, '0', 6.00, 0, '', 1, 0, 0, 0, NULL, 'admin', '2021-09-19 18:51:40', 'admin', '2022-09-22 10:33:10', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439784356766064642', '1439398677984878593', 'SQL监控', '/monitor/druid', '{{ window._CONFIG[\'domianURL\'] }}/druid', 1, NULL, NULL, 1, NULL, '0', 8.00, 0, 'ant-design:rocket-filled', 1, 0, 0, 0, NULL, 'admin', '2021-09-20 10:51:55', 'admin', '2021-11-15 18:21:20', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439797053314342913', '1439398677984878593', '性能监控', '/monitor/server', 'monitor/server/index', 1, NULL, NULL, 1, NULL, '0', 9.00, 0, 'ant-design:thunderbolt-filled', 1, 0, 0, 0, NULL, 'admin', '2021-09-20 11:42:22', 'admin', '2021-09-20 14:13:14', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439839507094740994', '1439398677984878593', 'Redis监控', '/monitor/redis', 'monitor/redis/index', 1, NULL, NULL, 1, NULL, '0', 10.00, 0, 'ant-design:trademark-outlined', 1, 0, 0, 0, NULL, 'admin', '2021-09-20 14:31:04', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1439842640030113793', '1439398677984878593', '请求追踪', '/monitor/trace', 'monitor/trace/index', 1, NULL, NULL, 1, NULL, '0', 11.00, 0, 'ant-design:ie-circle-filled', 1, 0, 0, 0, NULL, 'admin', '2021-09-20 14:43:31', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1441340399835742209', '1438108197958311537', '打印示例', '/jeecg/PrintDemo', 'demo/jeecg/PrintDemo', 1, NULL, NULL, 1, NULL, '0', 7.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-24 17:55:05', 'admin', '2021-09-24 17:55:20', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1441357157443371009', '1438108197958311537', '表格合计', '/jeecg/tableTotal', 'demo/jeecg/TableTotal', 1, NULL, NULL, 1, NULL, '0', 8.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-24 19:01:40', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1441361249200832513', '1438108197958311537', '异步树表格', '/jeecg/AsyncTreeTable', 'demo/jeecg/AsyncTreeTable', 1, NULL, NULL, 1, NULL, '0', 9.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-24 19:17:56', 'admin', '2021-09-26 16:05:55', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1442055284830769154', '1438108197958311537', '对象存储', '/system/ossfile', 'system/ossfile/index', 1, NULL, NULL, 1, NULL, '0', 11.00, 0, 'ant-design:file-add-outlined', 0, 0, 0, 0, NULL, 'jeecg', '2021-09-26 17:15:47', 'admin', '2022-10-14 16:23:35', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1443390062919208961', '', '消息中心', '/message', 'layouts/default/index', 1, NULL, '/message/manage', 0, NULL, '0', 7.00, 0, 'ant-design:message-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-09-30 09:39:43', 'admin', '2025-07-31 11:32:02', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1443391584864358402', '1443390062919208961', '消息模板', '/message/template', 'system/message/template/index', 1, NULL, NULL, 1, NULL, '0', 2.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-09-30 09:45:45', 'admin', '2022-09-22 10:32:42', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1446778415130722306', '1438108219445731330', 'JEECG官网', '/', 'http://www.jeecg.com', 0, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2021-10-09 18:03:49', 'admin', '2021-11-15 18:01:26', 0, 0, NULL, 1);
INSERT INTO "sys_permission" VALUES ('1447535997560909826', '1438108197270446081', '禁用', NULL, NULL, 0, NULL, NULL, 2, 'demo.dbarray', '2', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-10-11 20:14:10', 'admin', '2021-10-11 20:18:48', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1447763172274495489', '', '统计报表', '/report', 'layouts/RouteView', 1, NULL, NULL, 0, NULL, '0', 10.00, 0, 'ant-design:bar-chart-outlined', 0, 0, 0, 0, NULL, 'jeecg', '2021-10-12 11:16:53', 'admin', '2025-06-25 14:24:19', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1447763517847396354', '1447763172274495489', 'EChartDemo', '/report/chartDemo', 'report/chartdemo/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2021-10-12 11:18:15', 'jeecg', '2021-10-14 14:36:38', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1448252726202859522', '1447763172274495489', '布局统计报表', '/statisticst', 'report/statisticst/index', 1, NULL, NULL, 1, NULL, '0', 2.00, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2021-10-13 19:42:12', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1450308897429536769', '1438108197958311537', 'JVxeTable示例', '/jeecg/j-vxe-table-demo', 'demo/jeecg/JVxeTableDemo/index', 1, NULL, NULL, 1, NULL, '0', 10.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2021-10-19 11:52:41', 'admin', '2021-10-19 11:54:46', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1452508868884353026', '1866001513609637890', '报表设计器', '/jmreport', '{{ window._CONFIG[\'domianURL\'] }}/jmreport/list?token=${token}', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, '', 1, 0, 0, 0, NULL, 'admin', '2021-10-25 13:34:35', 'admin', '2025-05-22 10:53:59', 0, 0, '1', 1);
INSERT INTO "sys_permission" VALUES ('1453250018282573826', '1438108197958311537', '一对多内嵌', '/innerTable', 'demo/jeecg/InnerExpandTable', 1, NULL, NULL, 1, NULL, '0', 12.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-10-27 14:39:39', 'admin', '2021-10-27 14:40:29', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1454031324835807233', '1450308897429536769', '综合示例', '/jeecg/j-vxe-table-demo/normal', 'demo/jeecg/JVxeTableDemo/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-10-29 18:24:17', 'admin', '2021-10-29 18:25:28', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1454031820661260289', '1450308897429536769', '即时保存', '/jeecg/j-vxe-table-demo/jsbc', 'demo/jeecg/JVxeTableDemo/func-demo/JSBCDemo', 1, NULL, NULL, 1, NULL, '0', 2.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-10-29 18:26:15', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1454034512171302914', '1450308897429536769', '无痕刷新', '/jeecg/j-vxe-table-demo/whsx', 'demo/jeecg/JVxeTableDemo/func-demo/SocketReload', 1, NULL, NULL, 1, NULL, '0', 3.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-10-29 18:36:57', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1455019819440021505', '1450308897429536769', '弹出子表', '/jeecg/j-vxe-table-demo/tczb', 'demo/jeecg/JVxeTableDemo/func-demo/PopupSubTable', 1, NULL, NULL, 1, NULL, '0', 4.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-11-01 11:52:13', 'admin', '2021-11-01 11:52:19', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1455067599277662209', '1450308897429536769', '布局模板', '/jeecg/j-vxe-table-demo/layout', 'demo/jeecg/JVxeTableDemo/layout-demo/index', 1, NULL, NULL, 1, NULL, '0', 5.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-11-01 15:02:04', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1455100420297859074', '', '低代码开发', '/online', 'layouts/default/index', 1, NULL, '/online/cgform', 0, NULL, '0', 2.00, 0, 'ant-design:cloud-outlined', 0, 0, 0, 0, NULL, 'admin', '2021-11-01 17:12:29', 'admin', '2025-11-25 16:20:16', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1455101470794850305', '1455100420297859074', 'Online表单开发', '/online/cgform', 'super/online/cgform/index', 1, NULL, NULL, 1, NULL, '0', 1.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2021-11-01 17:16:40', 'admin', '2022-04-04 18:36:25', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1455735714507472898', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '通讯录', '/address', 'system/address/index', 1, NULL, NULL, 1, NULL, '0', 20.00, 0, 'ant-design:book-outlined', 1, 0, 0, 0, NULL, 'admin', '2021-11-03 11:16:55', 'admin', '2023-10-18 13:54:58', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1457678003102879745', '1455100420297859074', '系统编码规则', '/system/fillrule', 'system/fillRule/index', 1, NULL, NULL, 1, NULL, '0', 6.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-11-08 19:54:53', 'jeecg', '2024-06-13 11:36:43', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1458353686530232321', '1455100420297859074', '系统校验规则', '/system/checkrule', 'system/checkRule/index', 1, NULL, NULL, 1, NULL, '0', 5.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2021-11-10 16:39:48', 'jeecg', '2024-06-13 11:36:37', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1458389305235984385', '1438108197958311537', '一对多ERP', '/erplist', 'demo/jeecg/erplist/index', 1, NULL, NULL, 1, NULL, '0', 11.00, 0, '', 1, 0, 0, 0, NULL, 'admin', '2021-11-10 19:01:21', 'admin', '2021-11-30 14:06:53', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1460888189937176577', '1455100420297859074', 'Online报表配置', '/online/cgreport', 'super/online/cgreport/index', 1, NULL, NULL, 1, NULL, '0', 2.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2021-11-17 16:31:01', 'admin', '2021-12-08 10:55:32', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1461270075543347202', '1455100420297859074', 'Online表单视图', '/online/copyform/:code', 'super/online/cgform/CgformCopyList', 1, NULL, NULL, 1, NULL, '0', 99.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2021-11-18 17:48:30', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1461291438825558017', '1455100420297859074', 'AUTO在线报表', '/online/cgreport/:id', 'super/online/cgreport/auto/OnlCgReportList', 1, NULL, NULL, 1, NULL, '0', 21.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2021-11-18 19:13:23', 'jeecg', '2024-06-13 11:36:13', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1465686870713782273', '1455100420297859074', 'AUTO在线表单', '/online/cgformList/:id', 'super/online/cgform/auto/default/OnlineAutoList', 1, NULL, NULL, 1, NULL, '0', 25.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2021-11-30 22:19:16', 'jeecg', '2024-06-13 11:37:14', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1473927410093187073', '1866001513609637890', '大屏和仪表盘', '/report/drag', '{{ window._CONFIG[\'domianURL\'] }}/drag/list?token=${token}&tenantId=${tenantId}', 0, NULL, NULL, 1, NULL, '0', 2.00, 0, '', 0, 0, 0, 0, NULL, 'admin', '2021-12-23 16:04:13', 'admin', '2025-05-22 10:53:53', 0, 0, NULL, 1);
INSERT INTO "sys_permission" VALUES ('1509417558230999041', '1455100420297859074', 'AUTO树表单列表', '/online/cgformTreeList/:id', 'super/online/cgform/auto/tree/OnlineAutoTreeList', 1, NULL, NULL, 1, NULL, '0', 25.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2022-03-31 14:29:24', 'jeecg', '2024-06-13 11:37:18', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1534418199197323265', '1438108197958311537', '单表原生示例', '/one/OneNativeList', 'demo/jeecg/Native/one/OneNativeList', 1, NULL, NULL, 1, NULL, '0', 13.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-08 14:13:01', 'admin', '2022-06-08 14:13:12', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1534500282601893890', '1455101470794850305', '代码生成', NULL, NULL, 0, NULL, NULL, 2, 'online:form:generateCode', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-08 19:39:11', 'admin', '2022-06-30 13:39:19', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1535225446864011265', '1460888189937176577', '批量删除', NULL, NULL, 0, NULL, NULL, 2, 'online:report:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-10 19:40:44', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1535226870641475586', '1455101470794850305', '批量删除', NULL, NULL, 0, NULL, NULL, 2, 'online:form:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-10 19:46:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1535227149789184001', '1455101470794850305', '新建SQL增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceSql:save', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-10 19:47:30', 'admin', '2022-06-30 13:42:36', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383139476467713', '1455101470794850305', '编辑SQL增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceSql:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:42:51', 'admin', '2022-06-30 13:43:38', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383223979110402', '1455101470794850305', '删除SQL增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceSql:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:43:11', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383292690198530', '1455101470794850305', '批量删除SQL增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceSql:batchDelete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:43:28', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383437808922625', '1455101470794850305', '导入数据库表', NULL, NULL, 0, NULL, NULL, 2, 'online:form:importTable', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:44:02', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383507883159553', '1455101470794850305', '添加JAVA增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceJava:save', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:44:19', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383573423353858', '1455101470794850305', '修改JAVA增强', NULL, NULL, 0, NULL, NULL, 2, 'online:form:enhanceJava:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:44:35', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383826117586945', '1455101470794850305', '删除Online表单', NULL, NULL, 0, NULL, NULL, 2, 'online:form:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:45:35', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542383907281563650', '1455101470794850305', '移除Online表单', NULL, NULL, 0, NULL, NULL, 2, 'online:form:remove', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:45:54', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1542385335362383873', '1473927410093187073', '删除仪表盘', NULL, NULL, 0, NULL, NULL, 2, 'onl:drag:page:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-06-30 13:51:35', 'admin', '2022-06-30 13:51:42', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1546736974756032513', '1455101470794850305', '选择代码生成路径', NULL, NULL, 0, NULL, NULL, 2, 'online:codeGenerate:projectPath', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-07-12 14:03:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1554384900763729922', '1473927410093187073', '模板设置', NULL, NULL, 0, NULL, NULL, 2, 'drag:template:edit', '2', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2022-08-02 16:33:34', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1580833876002627585', '1447763172274495489', 'Online报表例子', '/online/cgreport/1256627801873821698', '1', 0, '', NULL, 1, NULL, '0', 3.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 16:12:21', 'admin', '2022-10-14 16:21:55', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1580834045490257922', '1447763172274495489', 'Online表单例子', '/online/cgformList/d35109c3632c4952a19ecc094943dd71', '1', 0, '', NULL, 1, NULL, '0', 4.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 16:13:02', 'jeecg', '2024-06-13 11:39:36', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1580835899477483522', '1447763172274495489', '积木报表例子', '/jmreport/view/961455b47c0b86dc961e90b5893bff05', '{{ window._CONFIG[\'domianURL\'] }}/jmreport/view/961455b47c0b86dc961e90b5893bff05?token=${token}', 1, '', NULL, 1, NULL, '0', 5.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 16:20:24', 'admin', '2022-10-14 16:20:51', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1580877743141933058', '1447763172274495489', '生产销售监控大屏', '/test/bigScreen/templat/index1', '{{ window._CONFIG[\'domianURL\'] }}/test/bigScreen/templat/index1', 1, '', NULL, 1, NULL, '0', 6.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 19:06:40', 'admin', '2023-09-20 21:15:55', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1580877931331964929', '1447763172274495489', '智慧物流监控大屏', '/test/bigScreen/templat/index2', '{{ window._CONFIG[\'domianURL\'] }}/test/bigScreen/templat/index2', 1, '', NULL, 1, NULL, '0', 7.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 19:07:25', 'admin', '2023-09-20 21:16:03', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1580878668472504321', '1447763172274495489', '积木大屏案例', '/test/jmbigscreen2', 'https://cloud.jimureport.com/bigscreen/#/view/bs_1394991793166094338', 1, '', NULL, 1, NULL, '0', 9.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-10-14 19:10:21', 'admin', '2022-10-28 10:18:19', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1588513553652436993', '3f915b2769fc80648e92d04e84ca059d', '修改密码', NULL, NULL, 0, NULL, NULL, 2, 'system:user:changepwd', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-04 20:48:39', 'admin', '2022-11-04 20:49:06', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1590154870697734146', '1447763172274495489', '带参数报表', '/online/cgreport/1590154651759259649?sex=1', 'layouts/RouteView', 0, '1', NULL, 1, NULL, '0', 11.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-09 09:30:39', 'jeecg', '2024-06-21 15:03:29', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1592102143467200514', '1597419994965786625', '给指定角色添加用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:addUserRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:18:49', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592112984361365505', '1170592628746878978', '添加菜单', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:11:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592113148350263298', '190c2b43bec6a5f7a4194a85db67d96a', '保存角色授权', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:saveRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:12:09', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114574275211265', '3f915b2769fc80648e92d04e84ca059d', '删除用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:17:49', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114574275211345', '119213522910765570', '删除用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:17:49', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114652566089729', '3f915b2769fc80648e92d04e84ca059d', '批量删除用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:18:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114721138765826', '3f915b2769fc80648e92d04e84ca059d', '冻结/解冻用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:frozenBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:18:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114772665790465', '3f915b2769fc80648e92d04e84ca059d', '首页用户重置密码', NULL, NULL, 0, NULL, NULL, 2, 'system:user:updatepwd', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:18:37', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114823467200514', '3f915b2769fc80648e92d04e84ca059d', '给指定角色添加用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:addUserRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:18:49', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114893302362114', '3f915b2769fc80648e92d04e84ca059d', '删除指定角色的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114893302823614', '1597419994965786625', '删除指定角色的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114955650691074', '3f915b2769fc80648e92d04e84ca059d', '批量删除指定角色的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteRoleBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592114955650691174', '1597419994965786625', '批量删除指定角色的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteRoleBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115070432014338', '3f915b2769fc80648e92d04e84ca059d', '给指定部门添加对应的用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:editDepartWithUser', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:48', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115115361398786', '3f915b2769fc80648e92d04e84ca059d', '删除指定机构的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteUserInDepart', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:19:58', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115162379546625', '3f915b2769fc80648e92d04e84ca059d', '批量删除指定机构的用户关系', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteUserInDepartBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:20:09', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115213910765570', '3f915b2769fc80648e92d04e84ca059d', '彻底删除用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:deleteRecycleBin', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:20:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115610431877122', '1439511654494937090', '多数据源分页列表', NULL, NULL, 0, NULL, NULL, 2, 'system:datasource:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:21:56', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115712422330529', '1961009998209257473', '部门添加', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:22:21', 'admin', '2022-11-14 19:30:49', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115712466710529', '45c966826eeff4c99b8f8ebfe74511fc', '部门添加', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:22:21', 'admin', '2022-11-14 19:30:49', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592115914493751297', '1170592628746878978', '编辑菜单权限数据', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:editRule', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:23:09', 'admin', '2022-11-14 19:39:25', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592116663936184322', '1170592628746878978', '编辑菜单', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:26:07', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117222764277032', '1961009998209257473', '部门编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:21', 'admin', '2022-11-14 19:30:55', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117222764277761', '45c966826eeff4c99b8f8ebfe74511fc', '部门编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:21', 'admin', '2022-11-14 19:30:55', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117276539449345', '45c966826eeff4c99b8f8ebfe74511fc', '部门删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:33', 'admin', '2022-11-14 19:31:06', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117276539449346', '1961009998209257473', '部门删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:33', 'admin', '2022-11-14 19:31:06', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117377299214337', '45c966826eeff4c99b8f8ebfe74511fc', '部门批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:58', 'admin', '2022-11-14 19:31:12', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117377299214338', '1961009998209257473', '部门批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:28:58', 'admin', '2022-11-14 19:31:12', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117422006300673', '45c966826eeff4c99b8f8ebfe74511fc', '部门导入', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:29:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117625664925697', '5c2f42277948043026b7a14692456828', '部门角色添加', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:role:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:29:57', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117748209905665', '5c2f42277948043026b7a14692456828', '部门角色编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:role:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:30:26', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117804359053314', '5c2f42277948043026b7a14692456828', '部门角色删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:role:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:30:39', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592117990305132545', '5c2f42277948043026b7a14692456828', '部门角色批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:role:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:31:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118053634928641', '5c2f42277948043026b7a14692456828', '部门角色用户授权', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:role:userAdd', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:31:39', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118192218927105', '1438782641187074050', '字典新增', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:32:12', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118254844080130', '1438782641187074050', '字典编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:32:27', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118306983473154', '1438782641187074050', '字典删除', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:32:39', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118356778250241', '1438782641187074050', '字典批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:32:51', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118414990995457', '1438782641187074050', '字典导入', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:33:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118497606201346', '1439399179791409153', '路由网关删除', NULL, NULL, 0, NULL, NULL, 2, 'system:getway:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:33:25', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118604640645122', '1170592628746878978', '删除菜单', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:33:50', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592118648315932674', '1170592628746878978', '批量删除菜单', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:34:01', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592119001883176961', '1170592628746878978', '添加菜单权限数据', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:addRule', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:35:25', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120052866707457', '1170592628746878978', '删除菜单权限数据', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:deleteRule', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:39:35', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120222727630849', '45c966826eeff4c99b8f8ebfe74511fc', '保存部门授权', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:saveDepart', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:40:16', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120224120850434', '190c2b43bec6a5f7a4194a85db67d96a', '查询全部角色不租户隔离', NULL, NULL, 0, NULL, NULL, 2, 'system:role:queryallNoByTenant', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 19:41:18', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120323667750914', '190c2b43bec6a5f7a4194a85db67d96a', '角色添加', NULL, NULL, 0, NULL, NULL, 2, 'system:role:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:40:40', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120323667750934', '1597419994965786625', '角色添加', NULL, NULL, 0, NULL, NULL, 2, 'system:role:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:40:40', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120372296511490', '190c2b43bec6a5f7a4194a85db67d96a', '角色编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:role:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:40:52', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120372296522490', '1597419994965786625', '角色编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:role:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:40:52', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120427007012865', '190c2b43bec6a5f7a4194a85db67d96a', '角色删除', NULL, NULL, 0, NULL, NULL, 2, 'system:role:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:41:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120427223412865', '1597419994965786625', '角色删除', NULL, NULL, 0, NULL, NULL, 2, 'system:role:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:41:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120484120850434', '190c2b43bec6a5f7a4194a85db67d96a', '角色批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:role:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:41:18', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120594695286785', '190c2b43bec6a5f7a4194a85db67d96a', '角色首页配置添加', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:41:45', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592120649007329281', '190c2b43bec6a5f7a4194a85db67d96a', '角色首页配置编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:41:58', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1592135223910765570', '3f915b2769fc80648e92d04e84ca059d', '查询全部用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:listAll', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:20:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593160905216663554', '1438782641187074050', '字典子项新增', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:item:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:35:34', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593160959633563650', '1438782641187074050', '字典子项编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:item:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:35:47', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161025790320641', '1438782641187074050', '字典子项删除', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:item:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:36:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161089787011074', '1438782641187074050', '字典子项批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:item:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:36:18', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161421350936578', '1439488251473993730', '添加定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:37:37', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161483627962370', '1439488251473993730', '更新定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:37:52', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161551202394114', '1439488251473993730', '删除定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:38:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161608362369026', '1439488251473993730', '批量删除定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:38:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161657385394177', '1439488251473993730', '停止定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:pause', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:38:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161697348722689', '1439488251473993730', '启动定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:resume', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:38:43', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593161743607701505', '1439488251473993730', '立即执行定时任务', NULL, NULL, 0, NULL, NULL, 2, 'system:quartzJob:execute', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 16:38:54', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593173018886709250', '1442055284830769154', '文件oos上传', NULL, NULL, 0, NULL, NULL, 2, 'system:ossFile:upload', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 17:23:42', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1593185714482880514', '3f915b2769fc80648e92d04e84ca059d', '用户导出', NULL, NULL, 0, NULL, NULL, 2, 'system:user:export', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-17 18:14:09', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1594930803956920321', '1439398677984878593', '在线用户', '/system/onlineuser', 'system/onlineuser/OnlineUserList', 1, '', NULL, 1, NULL, '0', 12.00, 0, 'ant-design:aliwangwang-outlined', 1, 0, 0, 0, NULL, 'admin', '2022-11-22 13:48:31', 'admin', '2023-03-04 15:15:36', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1596141938193747970', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户设置', '/system/usersetting', 'system/usersetting/UserSetting', 1, '', NULL, 1, NULL, '0', 12.00, 0, 'ant-design:setting-twotone', 0, 0, 1, 0, NULL, 'admin', '2022-11-25 22:01:08', 'admin', '2023-03-04 15:00:26', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1596335805278990338', '1596141938193747970', '账户设置用户编辑权限', NULL, NULL, 0, NULL, NULL, 2, 'system:user:setting:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-26 10:51:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1597419994965786625', '1674708136602542082', '租户角色', '/system/role/TenantRoleList', 'system/role/TenantRoleList', 1, 'tenant-role-list', NULL, 1, NULL, '0', 3.00, 0, 'ant-design:line-height-outlined', 0, 0, 0, 0, NULL, 'admin', '2022-11-29 10:39:40', 'admin', '2025-08-12 18:23:22', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('15c92115213910765570', '3f915b2769fc80648e92d04e84ca059d', '通过ID查询用户信息接口', NULL, NULL, 0, NULL, NULL, 2, 'system:user:queryById', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:20:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600105607009162230', '1961253156897710081', '邀请用户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:invitation:user', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 20:31:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600105607009165314', '1280350452934307841', '邀请用户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:invitation:user', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 20:31:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600108123037913486', '1961253156897710081', '查询租户下用户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:user:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 20:41:20', 'admin', '2023-01-11 12:10:48', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600108123037917186', '1280350452934307841', '通过租户id获取用户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:user:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 20:41:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600129606082650113', '1280350452934307841', '租户请离', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:leave', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 22:06:42', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1600129606082650123', '119213522910765570', '租户请离', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:leave', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-06 22:06:42', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1609123240547344376', '1961253156897710081', '产品包分页列表查询', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:packList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-31 17:44:11', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1609123240547344385', '1280350452934307841', '产品包分页列表查询', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:packList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-31 17:44:11', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1609123437247619074', '1280350452934307841', '创建租户产品包', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:add:pack', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-31 17:44:58', 'admin', '2022-12-31 20:27:56', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1609164542165012482', '1280350452934307841', '编辑租户产品包', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:edit:pack', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-31 20:28:18', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1609164635442139138', '1280350452934307841', '批量删除租户产品包', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:delete:pack', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-12-31 20:28:41', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611620416187969538', '1280350452934307841', '分页获取租户用户数据', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:tenantPageList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-07 15:07:04', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611620600003342337', '1280350452934307841', '通过用户id获取租户列表', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:getTenantListByUserId', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-07 15:07:48', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611620654621569026', '1280350452934307841', '更新用户租户关系状态', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:updateUserTenantStatus', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-07 15:08:01', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611620772498218641', '1280350452934307841', '查询租户列表', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611620772498288641', '1280350452934307841', '注销租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:cancelTenant', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-07 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1611650772498288641', '1280350452934307841', '删除租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1612438989792034818', '1280350452934307841', '编辑租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-07 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1613620712498288641', '1280350452934307841', '批量删除租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1620261087828418562', '1280350452934307841', '获取租户删除的列表', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:recycleBinPageList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-31 11:22:01', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1620305415648989186', '1280350452934307841', '彻底删除租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:deleteTenantLogic', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-31 14:18:10', 'admin', '2023-01-31 14:19:51', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1620327825894981634', '1280350452934307841', '租户还原', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:revertTenantLogic', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-31 15:47:13', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1620709334357532673', '1438108176273760258', '官网', 'https://jeecg.com', 'https://jeecg.com', 0, '', NULL, 1, NULL, '0', 5.00, 0, 'ant-design:layout-filled', 1, 0, 0, 0, NULL, 'jeecg', '2023-02-01 17:03:11', 'admin', '2025-09-13 18:54:44', 0, 0, NULL, 1);
INSERT INTO "sys_permission" VALUES ('1621620772498288641', '1280350452934307841', '添加租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1629109281748291586', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '第三方配置', '/third/app', 'system/appconfig/ThirdAppConfigList', 1, '', NULL, 1, NULL, '0', 13.00, 0, 'ant-design:setting-outlined', 1, 0, 0, 0, NULL, 'admin', '2023-02-24 21:21:35', 'admin', '2023-02-24 21:51:05', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1660568280725127169', '1439533711676973057', '日志列表', NULL, NULL, 1, NULL, NULL, 2, 'system:log:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-05-22 16:48:25', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1660568368558047234', '1439533711676973057', '日志删除', NULL, NULL, 1, NULL, NULL, 2, 'system:log:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-05-22 16:48:46', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1660568426632380417', '1439533711676973057', '日志批量删除', NULL, NULL, 1, NULL, NULL, 2, 'system:log:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-05-22 16:48:59', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1668174661456171010', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '租户默认套餐', '/tenant/TenantDefaultPack', 'system/tenant/pack/TenantDefaultPackList', 1, '', NULL, 1, NULL, '0', 7.00, 0, 'ant-design:deployment-unit-outlined', 1, 0, 0, 0, NULL, 'admin', '2023-06-12 16:33:27', 'admin', '2025-07-30 17:34:03', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1674708136602542082', '', '我的租户', '/mytenant', 'layouts/RouteView', 1, '', NULL, 0, NULL, '0', 4.20, 0, 'ant-design:user-outlined', 0, 0, 0, 0, NULL, 'admin', '2023-06-30 17:15:09', 'admin', '2024-06-17 15:42:29', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1691031996d593131521', '1455100420297859074', 'AUTO在线ERP表单', '/online/cgformErpList/:id', 'super/online/cgform/auto/erp/OnlCgformErpList', 1, '', NULL, 1, NULL, '0', 21.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2023-08-14 18:20:20', 'jeecg', '2024-06-13 11:37:04', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1691031996d5931315212', '1455100420297859074', 'AUTO在线一对多内嵌', '/online/cgformInnerTableList/:id', 'super/online/cgform/auto/innerTable/OnlCgformInnerTableList', 1, '', NULL, 1, NULL, '0', 21.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2023-08-14 18:20:20', 'jeecg', '2024-06-13 11:37:07', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1691031996d5931315213', '1455100420297859074', 'AUTO在线Tab风格', '/online/cgformTabList/:id', 'super/online/cgform/auto/tab/OnlCgformTabList', 1, '', NULL, 1, NULL, '0', 21.00, 0, NULL, 1, 0, 1, 0, NULL, 'admin', '2023-08-14 18:20:20', 'jeecg', '2024-06-13 11:37:11', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1693195557097164801', '190c2b43bec6a5f7a4194a85db67d96a', '查询所有角色', NULL, NULL, 0, NULL, NULL, 2, 'system:role:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-08-20 17:37:34', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1697220712498288641', '1280350452934307841', '根据ids查询租户', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:queryList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-01-11 15:08:29', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1698650926200352770', '1473927410093187073', '数据集解析SQL', NULL, NULL, 0, NULL, NULL, 2, 'drag:analysis:sql', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2023-09-04 18:55:15', 'jeecg', '2023-09-05 20:36:51', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699038961937113090', '1473927410093187073', '数据源添加', NULL, NULL, 0, NULL, NULL, 2, 'drag:datasource:saveOrUpate', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2023-09-05 20:37:10', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699039098474291201', '1473927410093187073', '数据源删除', NULL, NULL, 0, NULL, NULL, 2, 'drag:datasource:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2023-09-05 20:37:42', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699039192154071041', '1473927410093187073', '数据源批量删除', NULL, NULL, 0, NULL, NULL, 2, 'drag:datasource:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2023-09-05 20:38:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374269152100354', '1455101470794850305', '同步数据库', NULL, NULL, 0, NULL, NULL, 2, 'online:form:syncDb', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:49:33', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374346553786370', '1455101470794850305', '添加Online表单', NULL, NULL, 0, NULL, NULL, 2, 'online:form:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:49:52', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374404015751169', '1455101470794850305', '修改Online表单', NULL, NULL, 0, NULL, NULL, 2, 'online:form:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:50:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374509749960705', '1455101470794850305', '查询数据库表名', NULL, NULL, 0, NULL, NULL, 2, 'online:form:queryTables', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:50:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374612388773890', '1460888189937176577', '获取字典列表', NULL, NULL, 0, NULL, NULL, 2, 'online:report:getDictList', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:50:55', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374704168534017', '1460888189937176577', 'SQL解析', NULL, NULL, 0, NULL, NULL, 2, 'online:report:parseSql', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:51:17', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699374801816125442', '1460888189937176577', '添加Online报表', NULL, NULL, 0, NULL, NULL, 2, 'online:report:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:51:40', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699375086147993601', '1460888189937176577', '修改Online报表', NULL, NULL, 0, NULL, NULL, 2, 'online:report:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:52:48', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1699375193576701953', '1460888189937176577', '删除Online报表', NULL, NULL, 0, NULL, NULL, 2, 'online:report:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2023-09-06 18:53:14', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1701475606988812289', '1473927410093187073', '数据源连接', NULL, NULL, 0, NULL, NULL, 2, 'drag:datasource:testConnection', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2023-09-12 13:59:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1701575168519839746', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '白名单管理', '/system/tableWhiteList', 'system/tableWhiteList/SysTableWhiteListList', 1, '', NULL, 1, NULL, '0', 4.00, 0, 'ant-design:table-outlined', 0, 0, 0, 0, NULL, 'admin', '2023-09-12 20:35:09', 'jeecg', '2024-06-13 11:38:28', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1746709108126285826', '1455100420297859074', 'AUTO在线表单详情', '/online/cgformDetail/:id', 'super/online/cgform/auto/default/OnlineAutoDetail', 1, '', NULL, 1, NULL, '0', 21.00, 0, NULL, 1, 0, 1, 0, NULL, 'jeecg', '2024-01-15 09:41:18', 'jeecg', '2024-06-13 11:37:01', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1750128461040648193', '1170592628746878978', '设置默认首页', NULL, NULL, 0, NULL, NULL, 2, 'system:permission:setDefIndex', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2024-01-24 20:08:35', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1783334031927627777', '1438108198113501186', '原生总结栏', '/comp/table/tableSummary', 'demo/table/AntdTableSummary', 1, '', NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2024-04-25 11:15:40', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1800372628805861377', '1701575168519839746', '列表权限', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:40:59', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1800372727493640194', '1701575168519839746', '添加权限', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:41:22', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1800372811518132225', '1701575168519839746', '修改权限', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:41:42', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1800372906330374146', '1701575168519839746', '删除权限', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:42:05', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1800373633509441537', '1701575168519839746', '批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:44:58', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1800373733220630530', '1701575168519839746', '通过id查询', NULL, NULL, 0, NULL, NULL, 2, 'system:tableWhite:queryById', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-06-11 11:45:22', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1801954937339428865', '1460888189937176577', '测试数据源连接', NULL, NULL, 0, NULL, NULL, 2, 'online:report:testConnection', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2024-06-15 20:28:30', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1804046424930480129', '1447763172274495489', '仪表盘集成示例', '/drag/view/964024982110830592', '{{ window._CONFIG[\'domianURL\'] }}/drag/view?pageId=910475721247866880&token=${token}&tenantId=${tenantId}', 1, '', NULL, 1, NULL, '0', 3.00, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2024-06-21 14:59:20', 'admin', '2025-08-08 22:32:01', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1808098125316870145', '3f915b2769fc80648e92d04e84ca059d', 'app端编辑用户', NULL, NULL, 0, NULL, NULL, 2, 'system:user:app:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2024-07-02 19:19:21', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1810652607946940417', '1438782641187074050', '批量彻底删除', NULL, NULL, 0, NULL, NULL, 2, 'system:dict:deleteRecycleBin', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-07-09 20:29:57', '15931993294', '2024-07-09 20:30:39', 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1810923799513612290', '1439399179791409153', '彻底删除', NULL, NULL, 0, NULL, NULL, 2, 'system:gateway:deleteRecycleBin', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-07-10 14:27:34', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1811685368354754561', '1439399179791409153', '复制路由', NULL, NULL, 0, NULL, NULL, 2, 'system:gateway:copyRoute', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-07-12 16:53:46', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1811685464467230721', '1439399179791409153', '还原逻辑删除', NULL, NULL, 0, NULL, NULL, 2, 'system:gateway:putRecycleBin', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, '15931993294', '2024-07-12 16:54:09', NULL, NULL, 0, NULL, '1', 0);
INSERT INTO "sys_permission" VALUES ('1866001513609637890', '', '数据可视化', '/dataVisual', 'layouts/default/index', 1, '', NULL, 0, NULL, '0', 3.00, 0, 'ant-design:sliders-outlined', 0, 0, 0, 0, NULL, 'admin', '2024-12-09 14:06:44', 'admin', '2025-04-02 20:18:40', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1876220177009315842', '1473927410093187073', '表单设计页面查询', NULL, NULL, 0, NULL, NULL, 2, 'drag:design:getTotalData', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-01-06 18:52:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1887447660072292354', '1280350452934307841', '初始化套餐包', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:syncDefaultPack', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'jeecg', '2025-02-06 18:26:04', 'jeecg', '2025-02-06 18:26:53', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1890213291321749505', '1892553163993931777', 'AI流程设计', '/process/list/airag', 'super/airag/aiflow/pages/ProcessList', 1, '', NULL, 1, NULL, '0', 2.00, 0, 'ant-design:box-plot-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-02-14 09:35:41', 'admin', '2026-01-23 16:52:44', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1892553163993931777', '', 'AI应用平台', '/airag', 'layouts/default/index', 1, '', NULL, 0, NULL, '0', 2.20, 0, 'ant-design:box-plot-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-02-20 20:33:31', 'admin', '2025-11-25 16:20:04', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1892553778493022209', '1892553163993931777', 'AI模型配置', '/super/airag/aimodel/AiModelList', 'super/airag/aimodel/AiModelList', 1, '', NULL, 1, NULL, '0', 4.00, 0, 'ant-design:setting-twotone', 0, 0, 0, 0, NULL, 'admin', '2025-02-20 20:35:57', 'admin', '2025-03-06 20:31:13', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1892557342028226561', '1892553163993931777', 'AI知识库', '/super/airag/aiknowledge/AiKnowledgeBaseList', 'super/airag/aiknowledge/AiKnowledgeBaseList', 1, '', NULL, 1, NULL, '0', 3.00, 0, 'ant-design:book-twotone', 0, 0, 0, 0, NULL, 'admin', '2025-02-20 20:50:07', 'admin', '2026-01-23 16:52:40', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1893865471550578689', '1892553163993931777', 'AI应用管理', '/super/airag/aiapp/AiAppList', 'super/airag/aiapp/AiAppList', 1, '', NULL, 1, NULL, '0', 1.00, 0, 'ant-design:appstore-twotone', 0, 0, 0, 0, NULL, 'admin', '2025-02-24 11:28:09', 'admin', '2025-03-06 20:30:58', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1895401981290643458', '1892553163993931777', 'AI聊天', '/super/airag/aiapp/chat/AiChat', 'super/airag/aiapp/chat/AiChat', 1, '', NULL, 1, NULL, '0', 5.00, 0, 'ant-design:aliwangwang-outlined', 1, 0, 1, 0, NULL, 'admin', '2025-02-28 17:13:42', 'admin', '2025-02-28 17:30:40', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1907441271556497409', '1473927410093187073', '清空回收站', NULL, NULL, 0, NULL, NULL, 2, 'onl:drag:clear:recovery', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-04-02 22:33:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('190c2b43bec6a5f7a4194a85db67d96a', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '角色管理', '/system/role', 'system/role/index', 1, NULL, NULL, 1, NULL, NULL, 2.00, 0, 'ant-design:solution', 0, 1, 0, NULL, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2021-09-17 15:58:00', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1912753560201089025', '2012375501376606210', 'OCR识别', '/ai/ocr', 'super/airag/ocr/AiOcrList', 1, '', NULL, 1, NULL, '0', 8.00, 0, 'ant-design:scan-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-04-17 14:22:41', 'admin', '2026-01-17 12:05:13', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1917957565728198657', '1922109301837606914', '接口文档', '/openapi/SwaggerUI', 'openapi/SwaggerUI', 1, '', NULL, 1, NULL, '0', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 23:01:32', 'admin', '2025-05-13 09:59:46', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1922109301837606914', '1439398677984878593', 'OpenAPI', '/openapi', 'layouts/RouteView', 1, '', NULL, 1, NULL, '0', 4.00, 0, 'ant-design:swap-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-05-13 09:59:03', 'admin', '2025-09-13 19:31:31', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1930152938891608066', '1455100420297859074', 'APP版本管理', '/app/version', 'system/appVersion/SysAppVersion', 1, '', NULL, 1, NULL, '0', 11.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2025-06-04 14:41:36', 'admin', '2025-07-30 17:22:24', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1930221213607591937', '1893865471550578689', '新增或编辑AI应用', NULL, NULL, 0, NULL, NULL, 2, 'airag:app:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:12:54', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221335938662401', '1893865471550578689', '删除AI应用', NULL, NULL, 0, NULL, NULL, 2, 'airag:app:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:13:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221570324758530', '1892557342028226561', '添加AI知识库', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:14:19', 'admin', '2025-06-04 19:21:38', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221637551063042', '1892557342028226561', '编辑AI知识库', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:14:35', 'admin', '2025-06-04 19:21:42', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221702164316161', '1892557342028226561', '重建AI知识库', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:rebuild', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:14:50', 'admin', '2025-06-04 19:21:46', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221774230847490', '1892557342028226561', '删除AI知识库', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:15:07', 'admin', '2025-06-04 19:21:52', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930221983555977217', '1892557342028226561', '新增编辑AI知识库文档', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:doc:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:15:57', 'admin', '2025-06-04 19:22:03', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222066120851457', '1892557342028226561', '导入AI知识库文档', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:doc:zip', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:16:17', 'admin', '2025-06-04 19:22:09', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222218734796802', '1892557342028226561', '向量化AI知识库文档', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:doc:rebuild', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:16:53', 'admin', '2025-06-04 19:22:16', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222295012409345', '1892557342028226561', '批量删除AI知识库文档', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:doc:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:17:12', 'admin', '2025-06-04 19:22:21', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222395180777474', '1892557342028226561', '清空AI知识库文档', NULL, NULL, 0, NULL, NULL, 2, 'airag:knowledge:doc:deleteAll', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:17:35', 'admin', '2025-06-04 19:22:25', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222558582472705', '1892553778493022209', '新增AI模型', NULL, NULL, 0, NULL, NULL, 2, 'airag:model:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:18:14', 'admin', '2025-06-04 19:21:16', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222617197871105', '1892553778493022209', '编辑AI模型', NULL, NULL, 0, NULL, NULL, 2, 'airag:model:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:18:28', 'admin', '2025-06-04 19:21:20', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222679269376001', '1892553778493022209', '删除AI模型', NULL, NULL, 0, NULL, NULL, 2, 'airag:model:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:18:43', 'admin', '2025-06-04 19:21:24', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222862556266498', '1890213291321749505', '新增AI流程', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:19:27', 'admin', '2025-06-04 19:21:08', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930222953853681666', '1890213291321749505', '编辑AI流程', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:19:49', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930223034757611522', '1890213291321749505', '保存AI流程设计', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:designSave', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:20:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930223114757611522', '1890213291321749505', 'AI流程测试', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:debug', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-01 19:20:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1930223132619112449', '1890213291321749505', '删除AI流程', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-06-04 19:20:31', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1939572818833301506', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '首页配置', '/system/homeConfig', 'system/homeConfig/index', 1, '', NULL, 1, NULL, '0', 1.00, 0, 'ant-design:appstore-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-06-30 14:32:50', 'admin', '2025-07-01 20:13:22', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1941349246536998913', '1939572818833301506', '首页配置-添加', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-05 12:11:44', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1941349335431077889', '1939572818833301506', '首页配置-编辑', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-05 12:12:05', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1941349462887587842', '1939572818833301506', '首页配置-删除', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-05 12:12:35', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1941349550087168001', '1939572818833301506', '首页配置-批量删除', NULL, NULL, 0, NULL, NULL, 2, 'system:roleindex:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-05 12:12:56', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1942160438629109761', '1930152938891608066', 'APP版本编辑', NULL, NULL, 0, NULL, NULL, 2, 'app:edit:version', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-07 17:55:07', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1947833384695164929', '1629109281748291586', '第三方配置删除', NULL, NULL, 0, NULL, NULL, 2, 'system:third:config:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-23 09:37:23', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1960994076329316353', '119213522910765570', '添加一个用户和多个套餐关系', NULL, NULL, 0, NULL, NULL, 2, 'system:tenant:addPacksUser', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-08-28 17:13:16', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1961009998209257473', '1674708136602542082', '租户部门', '/depart/TenantDepartList', 'system/depart/TenantDepartList', 1, '', NULL, 1, NULL, '0', 3.30, 0, 'ant-design:apartment-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-08-28 18:16:32', 'admin', '2025-08-29 10:20:25', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1961253156897710081', '1674708136602542082', '租户套餐', '/pack/TenantCurrentPackList', 'system/tenant/pack/TenantCurrentPackList', 1, '', NULL, 1, NULL, '0', 3.40, 0, 'ant-design:read-filled', 0, 0, 0, 0, NULL, 'admin', '2025-08-29 10:22:46', 'admin', '2025-08-29 10:24:46', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1963086454217281537', '1674708136602542082', '租户职务', '/position/TenantPositionList', 'system/position/TenantPositionList', 1, '', NULL, 1, NULL, '0', 3.50, 0, 'ant-design:user-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-09-03 11:47:38', NULL, NULL, 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1963133393868722178', '1674708136602542082', '我的租户', '/my/MyTenantDetail', 'system/tenant/my/MyTenantDetail', 1, '', NULL, 1, NULL, '0', 0.00, 0, 'ant-design:user-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-09-03 14:54:09', 'admin', '2025-09-13 17:16:57', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1972617196420993025', '45c966826eeff4c99b8f8ebfe74511fc', '部门管理拖拽修改上下级', NULL, NULL, 0, NULL, NULL, 2, 'system:depart:updateChange', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-09-29 18:59:24', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1972645086223814657', '3f915b2769fc80648e92d04e84ca059d', '重置系统密码', NULL, NULL, 0, NULL, NULL, 2, 'system:user:resetPassword', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-09-29 20:50:13', 'admin', '2025-09-30 11:58:29', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1980223355087781889', '1892553163993931777', 'MCP配置', '/super/airag/aimcp/AiragMcpList', 'super/airag/aimcp/AiragMcpList', 1, '', NULL, 1, NULL, '0', 5.00, 0, 'ant-design:tool-twotone', 1, 0, 0, 0, NULL, 'admin', '2025-10-20 18:43:33', 'admin', '2025-10-21 19:00:31', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1996422809213341698', '1892553163993931777', '应用门户', '/app/portal', 'super/airag/aiapp/chat/portal/AppPortal', 1, '', NULL, 1, NULL, '0', 0.00, 0, 'ant-design:home-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-12-04 11:34:24', 'admin', '2026-01-28 15:17:14', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1999306189754236930', '1737321792727388161', '数据集编辑保存', NULL, NULL, 0, NULL, NULL, 2, 'drag:dataset:save', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-12 10:31:56', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1999306301071065090', '1737321792727388161', '数据集删除', NULL, NULL, 0, NULL, NULL, 2, 'drag:dataset:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-12 10:32:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1999367175911657473', '2012376076054974466', 'AI提示词', '/super/airag/aiprompts', 'super/airag/aiprompts/AiragPromptsList', 1, '', NULL, 1, NULL, '0', 7.00, 0, 'ant-design:exclamation-circle-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-12-12 14:34:16', 'admin', '2026-01-17 12:08:01', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('1999406402585542657', '1594930803956920321', '在线用户列表接口', NULL, NULL, 0, NULL, NULL, 2, 'system:online:list', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-12 17:10:08', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1999406500300242946', '1594930803956920321', '强制用户退出接口', NULL, NULL, 0, NULL, NULL, 2, 'system:online:forceLogout', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-12 17:10:32', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('1a0811914300741f4e11838ff37a1d3a', '3f915b2769fc80648e92d04e84ca059d', '手机号禁用', '', '', 0, NULL, NULL, 2, 'user:form:phone', '2', 1.00, 0, NULL, 1, NULL, 0, NULL, NULL, 'admin', '2019-05-11 17:19:30', 'admin', '2019-05-11 18:00:22', 0, 0, '1', NULL);
INSERT INTO "sys_permission" VALUES ('1d592115213910765570', '3f915b2769fc80648e92d04e84ca059d', '通过ID查询用户拥有的角色', NULL, NULL, 0, NULL, NULL, 2, 'system:user:queryUserRole', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2022-11-14 19:20:22', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2000880658872508417', '2012376076054974466', 'AI评估器', '/super/airag/experiment', 'super/airag/aiprompts/AiragExtDataExperiment', 1, '', NULL, 1, NULL, '0', 7.10, 0, 'ant-design:sliders-outlined', 1, 0, 0, 0, NULL, 'admin', '2025-12-16 18:48:18', 'admin', '2026-01-17 12:08:14', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('2005541199412592642', '1890213291321749505', 'ai流程复制', NULL, NULL, 0, NULL, NULL, 2, 'airag:flow:copy', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-12-29 15:27:38', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2008516285254000642', '2012375501376606210', 'Ai海报', '/airag/aiposter/AiPoster', 'super/airag/aiposter/AiPoster', 1, '', NULL, 1, NULL, '0', 8.00, 0, 'ant-design:file-image-filled', 1, 0, 0, 0, NULL, 'admin', '2026-01-06 20:29:33', 'admin', '2026-01-17 12:05:05', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('2010623918706446338', '2012375501376606210', 'AI写作', '/airag/aiwriter/AiWriter', 'super/airag/aiwriter/AiWriter', 1, '', NULL, 1, NULL, '0', 9.00, 0, 'ant-design:edit-filled', 1, 0, 0, 0, NULL, 'admin', '2026-01-12 16:04:32', 'admin', '2026-01-17 12:04:57', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('2012375501376606210', '1892553163993931777', 'AI工具箱', '/ai/box', 'layouts/default/index', 1, '', NULL, 1, NULL, '0', 11.00, 0, 'ant-design:tool-outlined', 0, 0, 0, 0, NULL, 'admin', '2026-01-17 12:04:42', 'admin', '2026-01-17 12:09:42', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('2012376076054974466', '1892553163993931777', '提示词管理', '/ai/prompt', 'layouts/default/index', 1, '', NULL, 1, NULL, '0', 10.00, 0, 'ant-design:star-outlined', 0, 0, 0, 0, NULL, 'admin', '2026-01-17 12:06:59', 'admin', '2026-01-17 12:09:27', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('2025050104193340030', '1922109301837606914', '接口管理', '/openapi/openApiList', 'openapi/OpenApiList', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', 'admin', '2025-05-13 09:59:24', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350031', '2025050104193340030', '添加接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350032', '2025050104193340030', '编辑接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350033', '2025050104193340030', '删除接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350034', '2025050104193340030', '批量删除接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350035', '2025050104193340030', '导出excel_接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050104193350036', '2025050104193340030', '导入excel_接口管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 16:19:03', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940200', '1922109301837606914', '授权管理', '/openapi/openApiAuthList', 'openapi/OpenApiAuthList', 1, NULL, NULL, 1, NULL, '1', 0.00, 0, NULL, 0, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', 'admin', '2025-05-13 09:59:35', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940201', '2025050105554940200', '添加授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940202', '2025050105554940200', '编辑授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940203', '2025050105554940200', '删除授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940204', '2025050105554940200', '批量删除授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940205', '2025050105554940200', '导出excel_授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:exportXls', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025050105554940206', '2025050105554940200', '导入excel_授权管理', NULL, NULL, 0, NULL, NULL, 2, 'openapi:open_api_auth:importExcel', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-05-01 17:55:20', NULL, NULL, 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023480210', '2012375501376606210', 'AI简历', '/airag/word', 'super/airag/wordtpl/EoaWordTemplateList', 1, NULL, NULL, 1, NULL, '1', 15.00, 0, 'ant-design:file-word-outlined', 0, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2026-01-17 12:05:20', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023490211', '2025070908023480210', '添加word模版管理', NULL, NULL, 0, NULL, NULL, 2, 'wordtpl:template:add', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2025-07-09 20:11:09', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023490212', '2025070908023480210', '编辑word模版管理', NULL, NULL, 0, NULL, NULL, 2, 'wordtpl:template:edit', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2025-07-09 20:11:13', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023490213', '2025070908023480210', '删除word模版管理', NULL, NULL, 0, NULL, NULL, 2, 'wordtpl:template:delete', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2025-07-09 20:11:17', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023490214', '2025070908023480210', '批量删除word模版管理', NULL, NULL, 0, NULL, NULL, 2, 'wordtpl:template:deleteBatch', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2025-07-09 20:11:21', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('2025070908023490215', '2025070908023480210', '设计word模版', NULL, NULL, 0, NULL, NULL, 2, 'wordtpl:template:design', '1', NULL, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2025-07-09 20:02:21', 'admin', '2025-07-09 20:19:04', 0, 0, '1', 0);
INSERT INTO "sys_permission" VALUES ('3f915b2769fc80648e92d04e84ca059d', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '用户管理', '/system/user', 'system/user/index', 1, NULL, NULL, 1, NULL, NULL, 1.00, 0, 'ant-design:user', 0, 1, 0, NULL, NULL, NULL, '2018-12-25 20:34:38', 'sunjianlei', '2021-05-08 09:57:31', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('45c966826eeff4c99b8f8ebfe74511fc', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '部门管理', '/system/depart', 'system/depart/index', 1, NULL, NULL, 1, NULL, NULL, 3.00, 0, 'ant-design:team', 0, 0, 0, NULL, NULL, 'admin', '2019-01-29 18:47:40', 'admin', '2021-09-17 15:58:13', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('5c2f42277948043026b7a14692456828', 'd7d6e2e4e2934f2c9385a623fd98c6f3', '我的部门', '/system/depart-user', 'system/departUser/index', 1, NULL, NULL, 1, NULL, NULL, 3.00, 0, 'ant-design:home-outlined', 0, 0, 0, 0, NULL, 'admin', '2019-04-17 15:12:24', 'admin', '2023-03-04 15:03:07', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('9502685863ab87f0ad1134142788a385', '1438108176273760258', '首页', '/dashboard/analysis', 'dashboard/Analysis', 1, NULL, NULL, 1, NULL, NULL, 1.00, 0, 'ant-design:qrcode-outlined', 1, 1, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'jeecg', '2024-06-18 23:09:37', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('d7d6e2e4e2934f2c9385a623fd98c6f3', '', '系统管理', '/isystem', 'layouts/RouteView', 1, NULL, NULL, 0, NULL, NULL, 4.00, 0, 'ant-design:setting', 0, 0, 0, 0, NULL, NULL, '2018-12-25 20:34:38', 'admin', '2025-06-25 14:24:07', 0, 0, NULL, 0);
INSERT INTO "sys_permission" VALUES ('f15543b0263cf6c5fac85afdd3eba3f2', '3f915b2769fc80648e92d04e84ca059d', '用户导入', '', NULL, 0, NULL, NULL, 2, 'system:user:import', '1', 1.00, 0, NULL, 1, 0, 0, 0, NULL, 'admin', '2019-05-13 19:15:27', 'admin', '2022-06-30 15:05:12', 0, 0, '1', 0);

-- ----------------------------
-- Table structure for sys_permission_data_rule
-- ----------------------------
DROP TABLE IF EXISTS "sys_permission_data_rule";
CREATE TABLE "sys_permission_data_rule" (
"id" varchar(32) NOT NULL,
"permission_id" varchar(32) NULL DEFAULT NULL,
"rule_name" varchar(50) NULL DEFAULT NULL,
"rule_column" varchar(50) NULL DEFAULT NULL,
"rule_conditions" varchar(50) NULL DEFAULT NULL,
"rule_value" varchar(300) NULL DEFAULT NULL,
"status" varchar(3) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_spdr_permission_id"("permission_id")
) ;

-- ----------------------------
-- Records of sys_permission_data_rule
-- ----------------------------
INSERT INTO "sys_permission_data_rule" VALUES ('1260935285157511170', '4148ec82b6acd69f470bea75fe41c357', 'createBy', 'createBy', '=', '#{sys_user_code}', '0', '2020-05-14 22:09:34', 'jeecg', '2020-05-14 22:13:52', 'admin');
INSERT INTO "sys_permission_data_rule" VALUES ('1260936345293012993', '4148ec82b6acd69f470bea75fe41c357', '年龄', 'age', '>', '20', '1', '2020-05-14 22:13:46', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('1260937192290762754', '4148ec82b6acd69f470bea75fe41c357', 'sysOrgCode', 'sysOrgCode', 'RIGHT_LIKE', '#{sys_org_code}', '1', '2020-05-14 22:17:08', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('32b62cb04d6c788d9d92e3ff5e66854e', '8d4683aacaa997ab86b966b464360338', '000', '00', '!=', '00', '1', '2019-04-02 18:36:08', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('40283181614231d401614234fe670003', '40283181614231d401614232cd1c0001', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 21:57:04', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('4028318161424e730161424fca6f0004', '4028318161424e730161424f61510002', 'createBy', 'createBy', '=', '#{sys_user_code}', '1', '2018-01-29 22:26:20', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402880e6487e661a01487e732c020005', '402889fb486e848101486e93a7c80014', 'SYS_ORG_CODE', 'SYS_ORG_CODE', 'LIKE', '010201%', '1', '2014-09-16 20:32:30', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402880e6487e661a01487e8153ee0007', '402889fb486e848101486e93a7c80014', 'create_by', 'create_by', '', '#{SYS_USER_CODE}', '1', '2014-09-16 20:47:57', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402880ec5ddec439015ddf9225060038', '40288088481d019401481d2fcebf000d', '复杂关系', '', 'USE_SQL_RULES', 'name like \'%张%\' or age > 10', '1', NULL, NULL, '2017-08-14 15:10:25', 'demo');
INSERT INTO "sys_permission_data_rule" VALUES ('402880ec5ddfdd26015ddfe3e0570011', '4028ab775dca0d1b015dca3fccb60016', '复杂sql配置', '', 'USE_SQL_RULES', 'table_name like \'%test%\' or is_tree = \'Y\'', '1', NULL, NULL, '2017-08-14 16:38:55', 'demo');
INSERT INTO "sys_permission_data_rule" VALUES ('402880f25b1e2ac7015b1e5fdebc0012', '402880f25b1e2ac7015b1e5cdc340010', '只能看自己数据', 'create_by', '=', '#{sys_user_code}', '1', '2017-03-30 16:40:51', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881875b19f141015b19f8125e0014', '40288088481d019401481d2fcebf000d', '可看下属业务数据', 'sys_org_code', 'LIKE', '#{sys_org_code}', '1', NULL, NULL, '2017-08-14 15:04:32', 'demo');
INSERT INTO "sys_permission_data_rule" VALUES ('402881e45394d66901539500a4450001', '402881e54df73c73014df75ab670000f', 'sysCompanyCode', 'sysCompanyCode', '=', '#{SYS_COMPANY_CODE}', '1', '2016-03-21 01:09:21', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881e45394d6690153950177cb0003', '402881e54df73c73014df75ab670000f', 'sysOrgCode', 'sysOrgCode', '=', '#{SYS_ORG_CODE}', '1', '2016-03-21 01:10:15', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881e56266f43101626727aff60067', '402881e56266f43101626724eb730065', '销售自己看自己的数据', 'createBy', '=', '#{sys_user_code}', '1', '2018-03-27 19:11:16', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881e56266f4310162672fb1a70082', '402881e56266f43101626724eb730065', '销售经理看所有下级数据', 'sysOrgCode', 'LIKE', '#{sys_org_code}', '1', '2018-03-27 19:20:01', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881e56266f431016267387c9f0088', '402881e56266f43101626724eb730065', '只看金额大于1000的数据', 'money', '>=', '1000', '1', '2018-03-27 19:29:37', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402881f3650de25101650dfb5a3a0010', '402881e56266f4310162671d62050044', '22', '', 'USE_SQL_RULES', '22', '1', '2018-08-06 14:45:01', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402889fb486e848101486e913cd6000b', '402889fb486e848101486e8e2e8b0007', 'userName', 'userName', '=', 'admin', '1', '2014-09-13 18:31:25', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('402889fb486e848101486e98d20d0016', '402889fb486e848101486e93a7c80014', 'title', 'title', '=', '12', '1', NULL, NULL, '2014-09-13 22:18:22', 'scott');
INSERT INTO "sys_permission_data_rule" VALUES ('402889fe47fcb29c0147fcb6b6220001', '8a8ab0b246dc81120146dc8180fe002b', '12', '12', '>', '12', '1', '2014-08-22 15:55:38', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('4028ab775dca0d1b015dca4183530018', '4028ab775dca0d1b015dca3fccb60016', '表名限制', 'isDbSynch', '=', 'Y', '1', NULL, NULL, '2017-08-14 16:43:45', 'demo');
INSERT INTO "sys_permission_data_rule" VALUES ('4028ef815595a881015595b0ccb60001', '40288088481d019401481d2fcebf000d', '限只能看自己', 'create_by', '=', '#{sys_user_code}', '1', NULL, NULL, '2017-08-14 15:03:56', 'demo');
INSERT INTO "sys_permission_data_rule" VALUES ('4028ef81574ae99701574aed26530005', '4028ef81574ae99701574aeb97bd0003', '用户名', 'userName', '!=', 'admin', '1', '2016-09-21 12:07:18', 'admin', NULL, NULL);
INSERT INTO "sys_permission_data_rule" VALUES ('f852d85d47f224990147f2284c0c0005', NULL, '小于', 'test', '<=', '11', '1', '2014-08-20 14:43:52', '8a8ab0b246dc81120146dc8181950052', NULL, NULL);

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS "sys_position";
CREATE TABLE "sys_position" (
"id" varchar(32) NOT NULL,
"code" varchar(100) NULL DEFAULT NULL,
"name" varchar(100) NULL DEFAULT NULL,
"post_level" INTEGER NULL DEFAULT NULL,
"company_id" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"sys_org_code" varchar(50) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_code"("code")
) ;

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO "sys_position" VALUES ('1958470823064436737', '5za8WqucKR', '职员', 6, NULL, 'admin', '2025-08-21 18:06:46', NULL, NULL, 'A01A08', 0);
INSERT INTO "sys_position" VALUES ('1958470865577902082', 'hGAuYslALj', '副部长', 5, NULL, 'admin', '2025-08-21 18:06:56', NULL, NULL, 'A01A08', 0);
INSERT INTO "sys_position" VALUES ('1958470912214368258', 'M0xkqpPsg7', '部长', 4, NULL, 'admin', '2025-08-21 18:07:07', NULL, NULL, 'A01A08', 0);
INSERT INTO "sys_position" VALUES ('1958471030867034113', 'npEbkFq6Uw', '副总经理', 3, NULL, 'admin', '2025-08-21 18:07:35', NULL, NULL, 'A01A08', 0);
INSERT INTO "sys_position" VALUES ('1958471074953363458', 'DEPMkWRJEu', '总经理', 2, NULL, 'admin', '2025-08-21 18:07:46', 'admin', '2025-09-13 18:52:25', 'A01A08', 0);
INSERT INTO "sys_position" VALUES ('1958471111989067778', 'gu7Rbffh0L', '董事长', 1, NULL, 'admin', '2025-08-21 18:07:54', NULL, NULL, 'A01A08', 0);

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS "sys_quartz_job";
CREATE TABLE "sys_quartz_job" (
"id" varchar(32) NOT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"del_flag" INTEGER NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"job_class_name" varchar(255) NULL DEFAULT NULL,
"cron_expression" varchar(255) NULL DEFAULT NULL,
"parameter" varchar(255) NULL DEFAULT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT NULL,
PRIMARY KEY ("id")
) ;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO "sys_quartz_job" VALUES ('1966781755167879169', 'admin', '2025-09-13 16:31:26', 0, NULL, NULL, 'org.jeecg.modules.system.job.UserUpadtePwdJob', '0 0 0 * * ? *', NULL, '5个月未修改密码提醒', 0);
INSERT INTO "sys_quartz_job" VALUES ('5b3d2c087ad41aa755fc4f89697b01e7', 'admin', '2019-04-11 19:04:21', 0, 'admin', '2024-03-18 14:21:35', 'org.jeecg.modules.message.job.SendMsgJob', '0/50 * * * * ? *', NULL, NULL, -1);
INSERT INTO "sys_quartz_job" VALUES ('a253cdfc811d69fa0efc70d052bc8128', 'admin', '2019-03-30 12:44:48', 0, 'admin', '2020-05-02 15:48:49', 'org.jeecg.modules.quartz.job.SampleJob', '0/1 * * * * ?', NULL, NULL, -1);
INSERT INTO "sys_quartz_job" VALUES ('df26ecacf0f75d219d746750fe84bbee', NULL, '2021-06-30 16:03:09', 0, 'admin', '2020-05-02 15:40:35', 'org.jeecg.modules.quartz.job.SampleParamJob', '0/1 * * * * ?', 'scott', '带参测试 后台将每隔1秒执行输出日志', -1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "sys_role";
CREATE TABLE "sys_role" (
"id" varchar(32) NOT NULL,
"role_name" varchar(200) NULL DEFAULT NULL,
"role_code" varchar(100) NOT NULL,
"description" varchar(255) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_sys_role_role_code"("role_code"),
INDEX "idx_sysrole_tenant_id"("tenant_id")
) ;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "sys_role" VALUES ('1169504891467464706', '数据开发角色', 'dbadeveloper', '', NULL, '2019-03-12 19:01:35', 'admin', '2019-03-12 19:01:35', 0);
INSERT INTO "sys_role" VALUES ('1169504891467464707', '低代码开发角色', 'lowdeveloper', '', NULL, '2019-03-12 19:01:35', 'admin', '2019-03-12 19:01:35', 0);
INSERT INTO "sys_role" VALUES ('1501570619841810433', 'Vue3全角色', 'vue3', NULL, 'admin', '2022-03-09 22:48:28', 'admin', '2025-06-25 16:26:19', 0);
INSERT INTO "sys_role" VALUES ('1962488045068464130', '租户管理员', 'zuhuadmin', NULL, 'admin', '2025-09-01 20:09:46', NULL, NULL, 0);
INSERT INTO "sys_role" VALUES ('1996463539853824001', 'AI应用角色', 'aiadmin', NULL, 'admin', '2025-12-04 14:16:15', NULL, NULL, 0);
INSERT INTO "sys_role" VALUES ('ee8626f80f7c2619917b6236f3a7f02b', '系统用户标配角色', 'test', '系统所有用户拥有的最小权限角色，默认都分配这个角色', NULL, '2018-12-20 10:59:04', 'admin', '2025-08-12 18:39:54', 0);
INSERT INTO "sys_role" VALUES ('f6817f48af4fb3af11b9e8bf182f618b', '管理员', 'admin', '管理员', NULL, '2020-12-21 18:03:39', 'admin', '2025-07-30 15:17:55', 0);

-- ----------------------------
-- Table structure for sys_role_index
-- ----------------------------
DROP TABLE IF EXISTS "sys_role_index";
CREATE TABLE "sys_role_index" (
"id" varchar(32) NOT NULL,
"role_code" varchar(50) NULL DEFAULT NULL,
"url" varchar(100) NULL DEFAULT NULL,
"component" varchar(255) NULL DEFAULT NULL,
"is_route" SMALLINT NULL DEFAULT 1,
"priority" INTEGER NULL DEFAULT 0,
"status" varchar(2) NULL DEFAULT '0',
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"sys_org_code" varchar(64) NULL DEFAULT NULL,
"relation_type" varchar(20) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sri_role_code"("role_code"),
INDEX "idx_sri_status"("status"),
INDEX "idx_sri_priority"("priority")
) ;

-- ----------------------------
-- Records of sys_role_index
-- ----------------------------
INSERT INTO "sys_role_index" VALUES ('1803082647166652418', 'DEF_INDEX_ALL', '/dashboard/analysis', 'dashboard/Analysis', 1, 0, '0', 'jeecg', '2024-06-18 23:09:37', 'admin', '2025-11-25 15:53:36', 'A02A01', 'DEFAULT');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS "sys_role_permission";
CREATE TABLE "sys_role_permission" (
"id" varchar(32) NOT NULL,
"role_id" varchar(32) NULL DEFAULT NULL,
"permission_id" varchar(32) NULL DEFAULT NULL,
"data_rule_ids" varchar(1000) NULL DEFAULT NULL,
"operate_date" TIMESTAMP NULL DEFAULT NULL,
"operate_ip" varchar(100) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_srp_role_per_id"("role_id", "permission_id"),
INDEX "idx_srp_role_id"("role_id"),
INDEX "idx_srp_permission_id"("permission_id")
) ;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO "sys_role_permission" VALUES ('00b0748f04d3ea52c8cfa179c1c9d384', '52b0cf022ac4187b2a70dfa4f8b2d940', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('0d9d14bc66e9d5e99b0280095fdc8587', 'ee8626f80f7c2619917b6236f3a7f02b', '277bfabef7d76e89b33062b16a9a5020', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('0dec36b68c234767cd35466efef3b941', 'ee8626f80f7c2619917b6236f3a7f02b', '54dd5457a3190740005c1bfec55b1c34', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('115a6673ae6c0816d3f60de221520274', '21c5a3187763729408b40afb0d0fdfa8', '63b551e81c5956d5c861593d366d8c57', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1209423580355481602', 'f6817f48af4fb3af11b9e8bf182f618b', '190c2b43bec6a5f7a4194a85db67d96a', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1232123957949304833', 'ee8626f80f7c2619917b6236f3a7f02b', 'f0675b52d89100ee88472b6800754a08', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1232123957978664962', 'ee8626f80f7c2619917b6236f3a7f02b', '1232123780958064642', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1232123957978664963', 'ee8626f80f7c2619917b6236f3a7f02b', '020b06793e4de2eee0007f603000c769', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1232123957987053570', 'ee8626f80f7c2619917b6236f3a7f02b', '2aeddae571695cd6380f6d6d334d6e7d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1232125488694104066', 'ee8626f80f7c2619917b6236f3a7f02b', 'e41b69c57a941a3bbcce45032fe57605', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1260929736852488194', 'ee8626f80f7c2619917b6236f3a7f02b', '1260929666434318338', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1260931414095937537', 'ee8626f80f7c2619917b6236f3a7f02b', '1260931366557696001', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1281494164924653569', 'f6817f48af4fb3af11b9e8bf182f618b', '1280350452934307841', NULL, '2020-07-10 15:43:13', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1427184775947751425', 'ee8626f80f7c2619917b6236f3a7f02b', '1352200630711652354', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775956140034', 'ee8626f80f7c2619917b6236f3a7f02b', '1205097455226462210', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775956140035', 'ee8626f80f7c2619917b6236f3a7f02b', '1335960713267093506', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775964528642', 'ee8626f80f7c2619917b6236f3a7f02b', '1205098241075453953', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775964528643', 'ee8626f80f7c2619917b6236f3a7f02b', '1205306106780364802', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775972917250', 'ee8626f80f7c2619917b6236f3a7f02b', '109c78a583d4693ce2f16551b7786786', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775972917251', 'ee8626f80f7c2619917b6236f3a7f02b', '1192318987661234177', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775972917252', 'ee8626f80f7c2619917b6236f3a7f02b', '1224641973866467330', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775977111554', 'ee8626f80f7c2619917b6236f3a7f02b', '1229674163694841857', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775977111555', 'ee8626f80f7c2619917b6236f3a7f02b', '1209731624921534465', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775977111556', 'ee8626f80f7c2619917b6236f3a7f02b', '1304032910990495745', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775977111559', 'ee8626f80f7c2619917b6236f3a7f02b', '1174506953255182338', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775985500162', 'ee8626f80f7c2619917b6236f3a7f02b', '1174590283938041857', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775985500163', 'ee8626f80f7c2619917b6236f3a7f02b', 'ebb9d82ea16ad864071158e0c449d186', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775985500164', 'ee8626f80f7c2619917b6236f3a7f02b', '1404684556047024130', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775985500165', 'ee8626f80f7c2619917b6236f3a7f02b', '1265162119913824258', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775989694465', 'ee8626f80f7c2619917b6236f3a7f02b', '841057b8a1bef8f6b4b20f9a618a7fa6', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775989694466', 'ee8626f80f7c2619917b6236f3a7f02b', '700b7f95165c46cc7a78bf227aa8fed3', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775989694467', 'ee8626f80f7c2619917b6236f3a7f02b', '8d1ebd663688965f1fd86a2f0ead3416', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775989694468', 'ee8626f80f7c2619917b6236f3a7f02b', '024f1fd1283dc632458976463d8984e1', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775989694469', 'ee8626f80f7c2619917b6236f3a7f02b', '8b3bff2eee6f1939147f5c68292a1642', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775998083074', 'ee8626f80f7c2619917b6236f3a7f02b', 'd07a2c87a451434c99ab06296727ec4f', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775998083075', 'ee8626f80f7c2619917b6236f3a7f02b', 'fc810a2267dd183e4ef7c71cc60f4670', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775998083076', 'ee8626f80f7c2619917b6236f3a7f02b', '97c8629abc7848eccdb6d77c24bb3ebb', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775998083077', 'ee8626f80f7c2619917b6236f3a7f02b', '1287715272999944193', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184775998083078', 'ee8626f80f7c2619917b6236f3a7f02b', '1287715783966834689', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471682', 'ee8626f80f7c2619917b6236f3a7f02b', '1287716451494510593', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471683', 'ee8626f80f7c2619917b6236f3a7f02b', '1287718919049691137', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471684', 'ee8626f80f7c2619917b6236f3a7f02b', '1287718938179911682', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471685', 'ee8626f80f7c2619917b6236f3a7f02b', '1287718956957810689', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471686', 'ee8626f80f7c2619917b6236f3a7f02b', '1166535831146504193', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776006471687', 'ee8626f80f7c2619917b6236f3a7f02b', '9a90363f216a6a08f32eecb3f0bf12a3', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860289', 'ee8626f80f7c2619917b6236f3a7f02b', '4356a1a67b564f0988a484f5531fd4d9', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860290', 'ee8626f80f7c2619917b6236f3a7f02b', '655563cd64b75dcf52ef7bcdd4836953', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860291', 'ee8626f80f7c2619917b6236f3a7f02b', '1365187528377102337', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860292', 'ee8626f80f7c2619917b6236f3a7f02b', '6ad53fd1b220989a8b71ff482d683a5a', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860293', 'ee8626f80f7c2619917b6236f3a7f02b', '7960961b0063228937da5fa8dd73d371', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860294', 'ee8626f80f7c2619917b6236f3a7f02b', '1387612436586065922', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776014860295', 'ee8626f80f7c2619917b6236f3a7f02b', '043780fa095ff1b2bec4dc406d76f023', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776023248897', 'ee8626f80f7c2619917b6236f3a7f02b', '0620e402857b8c5b605e1ad9f4b89350', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776023248898', 'ee8626f80f7c2619917b6236f3a7f02b', 'c431130c0bc0ec71b0a5be37747bb36a', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1427184776023248899', 'ee8626f80f7c2619917b6236f3a7f02b', 'e1979bb53e9ea51cecc74d86fd9d2f64', NULL, '2021-08-16 16:25:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1501570988789567490', '1501570619841810433', '1438108176273760258', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988802150402', '1501570619841810433', '1438108176814825473', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988810539010', '1501570619841810433', '9502685863ab87f0ad1134142788a385', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988814733313', '1501570619841810433', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988814733314', '1501570619841810433', '3f915b2769fc80648e92d04e84ca059d', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988823121922', '1501570619841810433', '1214376304951664642', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988823121923', '1501570619841810433', '1214462306546319362', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988831510529', '1501570619841810433', '1a0811914300741f4e11838ff37a1d3a', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988831510530', '1501570619841810433', '190c2b43bec6a5f7a4194a85db67d96a', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988831510531', '1501570619841810433', '1170592628746878978', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988831510532', '1501570619841810433', '45c966826eeff4c99b8f8ebfe74511fc', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988831510534', '1501570619841810433', '1438782851980210178', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988839899138', '1501570619841810433', '1438782530717495298', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988839899139', '1501570619841810433', '1438782641187074050', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093442', '1501570619841810433', '1442055284830769154', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093443', '1501570619841810433', '1280350452934307841', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093444', '1501570619841810433', '1439398677984878593', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093445', '1501570619841810433', '1439399179791409153', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093446', '1501570619841810433', '1439488251473993730', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988844093447', '1501570619841810433', '1438469604861403137', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988852482050', '1501570619841810433', '1439511654494937090', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988856676354', '1501570619841810433', '1439531077792473089', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988856676355', '1501570619841810433', '1439533711676973057', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988860870657', '1501570619841810433', '1439784356766064642', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988860870658', '1501570619841810433', '1439797053314342913', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988860870659', '1501570619841810433', '1439839507094740994', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988869259265', '1501570619841810433', '1439842640030113793', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453570', '1501570619841810433', '1447763172274495489', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453571', '1501570619841810433', '1447763517847396354', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453573', '1501570619841810433', '1448252726202859522', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453574', '1501570619841810433', '1438108196993622018', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453575', '1501570619841810433', '1438108197958311537', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453576', '1501570619841810433', '1438108197270446081', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453577', '1501570619841810433', '1447535997560909826', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988873453578', '1501570619841810433', '1438783058792951810', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842177', '1501570619841810433', '1438108198679732226', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842178', '1501570619841810433', '1441340399835742209', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842179', '1501570619841810433', '1441357157443371009', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842180', '1501570619841810433', '1453250018282573826', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842181', '1501570619841810433', '1458389305235984385', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988881842182', '1501570619841810433', '1455067599277662209', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988890230785', '1501570619841810433', '1455019819440021505', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988890230786', '1501570619841810433', '1454034512171302914', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988890230787', '1501570619841810433', '1454031820661260289', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988898619394', '1501570619841810433', '1454031324835807233', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988898619395', '1501570619841810433', '1450308897429536769', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988898619396', '1501570619841810433', '1441361249200832513', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988907008001', '1501570619841810433', '1438108197958315557', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988907008002', '1501570619841810433', '1438108178127642626', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988907008003', '1501570619841810433', '1438108178781954049', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988907008004', '1501570619841810433', '1438108178781954050', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988907008005', '1501570619841810433', '1438108200672026626', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202306', '1501570619841810433', '1438108180258349057', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202307', '1501570619841810433', '1438108197790539778', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202308', '1501570619841810433', '1438108197958311937', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202309', '1501570619841810433', '1438108202366525441', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202310', '1501570619841810433', '1438108203649982466', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202311', '1501570619841810433', '1438108204400762881', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202312', '1501570619841810433', '1438108204576923649', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202313', '1501570619841810433', '1438108204732112898', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988911202314', '1501570619841810433', '1438108198113501186', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988919590914', '1501570619841810433', '1438108204232990721', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988919590915', '1501570619841810433', '1438108204023275521', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501570988919590916', '1501570619841810433', '1438108203817754625', NULL, '2022-03-09 22:49:56', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577222', '1501570619841810433', '1438108205004742657', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577223', '1501570619841810433', '1438108205180903426', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577224', '1501570619841810433', '1438108205357064193', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577225', '1501570619841810433', '1438108205587750914', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577226', '1501570619841810433', '1438108205742940161', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577227', '1501570619841810433', '1438108205919100930', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514077577228', '1501570619841810433', '1438108206086873089', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965825', '1501570619841810433', '1438108206258839553', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965826', '1501570619841810433', '1438108206489526274', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965827', '1501570619841810433', '1438108206661492738', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965828', '1501570619841810433', '1438108206959288321', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965829', '1501570619841810433', '1438108207160614913', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965830', '1501570619841810433', '1438108207374524418', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965831', '1501570619841810433', '1438108207563268097', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965832', '1501570619841810433', '1438108207793954818', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965833', '1501570619841810433', '1438108208024641538', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514085965834', '1501570619841810433', '1438108208297271297', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514094354434', '1501570619841810433', '1438108199413735425', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514094354435', '1501570619841810433', '1438108208817364993', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514094354436', '1501570619841810433', '1438108208980942850', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514094354437', '1501570619841810433', '1438108209228406785', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514094354438', '1501570619841810433', '1438108199539564546', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548738', '1501570619841810433', '1438108210117599234', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548739', '1501570619841810433', '1438108210260205570', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548740', '1501570619841810433', '1438108211325558785', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548741', '1501570619841810433', '1438108211661103106', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548742', '1501570619841810433', '1438108211778543618', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548743', '1501570619841810433', '1438108214882328577', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548744', '1501570619841810433', '1438108215335313409', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548745', '1501570619841810433', '1438108197958311637', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548746', '1501570619841810433', '1438108200076435458', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548747', '1501570619841810433', '1438108200391008257', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548748', '1501570619841810433', '1438108197958311677', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548749', '1501570619841810433', '1438108178643542017', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548750', '1501570619841810433', '1438108179226550273', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514098548751', '1501570619841810433', '1438108179381739521', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937345', '1501570619841810433', '1438108198855892993', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937346', '1501570619841810433', '1438108179599843330', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937347', '1501570619841810433', '1438108199120134145', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937348', '1501570619841810433', '1438108179910221825', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937349', '1501570619841810433', '1438108198339993602', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937350', '1501570619841810433', '1438108199304683521', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937351', '1501570619841810433', '1438108180077993985', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937352', '1501570619841810433', '1438108180434509826', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937353', '1501570619841810433', '1438108180631642113', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937354', '1501570619841810433', '1438108182116425729', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937355', '1501570619841810433', '1438108201150177281', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937356', '1501570619841810433', '1438108201502498817', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514106937358', '1501570619841810433', '1438108202060341249', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325954', '1501570619841810433', '1438108199631839234', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325955', '1501570619841810433', '1438108215511474177', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325956', '1501570619841810433', '1438108215687634945', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325957', '1501570619841810433', '1438108215989624834', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325958', '1501570619841810433', '1438108200802050050', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325959', '1501570619841810433', '1438108216300003330', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325960', '1501570619841810433', '1438108216597798914', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325961', '1501570619841810433', '1438108200919490562', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325962', '1501570619841810433', '1438108216971091969', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325963', '1501570619841810433', '1438108217449242626', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325964', '1501570619841810433', '1438108183219527682', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514115325965', '1501570619841810433', '1438108185660612609', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714561', '1501570619841810433', '1438108185815801858', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714562', '1501570619841810433', '1438108185958408193', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714563', '1501570619841810433', '1438108186289758209', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714564', '1501570619841810433', '1438108178010202113', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714565', '1501570619841810433', '1438108178257666049', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714566', '1501570619841810433', '1438108176932265985', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714567', '1501570619841810433', '1438108177074872321', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714568', '1501570619841810433', '1438108177351696386', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714569', '1501570619841810433', '1438108177565605889', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714570', '1501570619841810433', '1438108177188118529', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714571', '1501570619841810433', '1438108177720795137', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714572', '1501570619841810433', '1438108177880178689', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714573', '1501570619841810433', '1438108178421243905', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714574', '1501570619841810433', '1438108225263230978', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514123714575', '1501570619841810433', '1438108180770054145', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501572514132103169', '1501570619841810433', '1438108183085309954', NULL, '2022-03-09 22:56:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501576319410212868', '1501570619841810433', '1449995470942593026', NULL, '2022-03-09 23:11:07', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1501576328700596228', '1501570619841810433', '1449995470942593026', NULL, '2022-03-09 23:11:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1572775794269970434', '1501570619841810433', '1534418199197323265', NULL, '2022-09-22 10:32:25', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580834175006171137', '1501570619841810433', '1580833876002627585', NULL, '2022-10-14 16:13:32', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580834175006171138', '1501570619841810433', '1580834045490257922', NULL, '2022-10-14 16:13:32', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580835941080784898', '1501570619841810433', '1580835899477483522', NULL, '2022-10-14 16:20:34', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580861542625955842', 'f6817f48af4fb3af11b9e8bf182f618b', '1170592628746878978', NULL, '2022-10-14 18:02:17', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1580877977129570306', '1501570619841810433', '1580877931331964929', NULL, '2022-10-14 19:07:36', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580877977129570307', '1501570619841810433', '1580877743141933058', NULL, '2022-10-14 19:07:36', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580878701653643267', '1501570619841810433', '1580878668472504321', NULL, '2022-10-14 19:10:28', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1580878704866480129', '1501570619841810433', '1580878668472504321', NULL, '2022-10-14 19:10:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040483061761', '1501570619841810433', '1455100420297859074', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644673', '1501570619841810433', '1461270075543347202', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644674', '1501570619841810433', '1458353686530232321', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644675', '1501570619841810433', '1457678003102879745', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644676', '1501570619841810433', '1509417558230999041', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644677', '1501570619841810433', '1452508868884353026', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644678', '1501570619841810433', '1461291438825558017', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040495644679', '1501570619841810433', '1460888189937176577', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040504033281', '1501570619841810433', '1455101470794850305', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1587064040504033282', '1501570619841810433', '1465686870713782273', NULL, '2022-10-31 20:48:48', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1590154918424719362', '1501570619841810433', '1590154870697734146', NULL, '2022-11-09 09:30:51', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1592114400605859842', 'f6817f48af4fb3af11b9e8bf182f618b', '1592113148350263298', NULL, '2022-11-14 19:17:08', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613761', '1501570619841810433', '1588513553652436993', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613762', '1501570619841810433', '1592114574275211265', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613763', '1501570619841810433', '1592114652566089729', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613765', '1501570619841810433', '1592114772665790465', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613766', '1501570619841810433', '1592114823467200514', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613767', '1501570619841810433', '1592114893302362114', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444602613768', '1501570619841810433', '1592114955650691074', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722625', '1501570619841810433', '1592115070432014338', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722626', '1501570619841810433', '1592115115361398786', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722627', '1501570619841810433', '1592115162379546625', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722628', '1501570619841810433', '1592115213910765570', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722631', '1501570619841810433', '1592120484120850434', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722632', '1501570619841810433', '1592120427007012865', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722633', '1501570619841810433', '1592120372296511490', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722634', '1501570619841810433', '1592120323667750914', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722635', '1501570619841810433', '1592113148350263298', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722636', '1501570619841810433', '1592112984361365505', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722637', '1501570619841810433', '1592115914493751297', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722638', '1501570619841810433', '1592116663936184322', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722639', '1501570619841810433', '1592118604640645122', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722640', '1501570619841810433', '1592118648315932674', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722641', '1501570619841810433', '1592119001883176961', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722642', '1501570619841810433', '1592120052866707457', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722643', '1501570619841810433', '1592120222727630849', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722644', '1501570619841810433', '1592117422006300673', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722645', '1501570619841810433', '1592117377299214337', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722646', '1501570619841810433', '1592117276539449345', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722647', '1501570619841810433', '1592117222764277761', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722648', '1501570619841810433', '1592115712466710529', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722649', '1501570619841810433', '1592118053634928641', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722650', '1501570619841810433', '1592117990305132545', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722651', '1501570619841810433', '1592117804359053314', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722652', '1501570619841810433', '1592117748209905665', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722653', '1501570619841810433', '1592117625664925697', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722654', '1501570619841810433', '1592118414990995457', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444669722655', '1501570619841810433', '1592118356778250241', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444732637186', '1501570619841810433', '1592118306983473154', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444732637187', '1501570619841810433', '1592118254844080130', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444732637188', '1501570619841810433', '1592118192218927105', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444732637189', '1501570619841810433', '1592118497606201346', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593150444732637190', '1501570619841810433', '1592115610431877122', NULL, '2022-11-17 15:54:00', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473537', 'f6817f48af4fb3af11b9e8bf182f618b', '1588513553652436993', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473538', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114574275211265', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473539', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114652566089729', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473540', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115213910765570', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473541', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115162379546625', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473542', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115115361398786', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473543', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115070432014338', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473544', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114955650691074', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473545', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114893302362114', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473546', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114823467200514', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006353473547', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114772665790465', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388100', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120323667750914', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388101', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120372296511490', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388102', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120427007012865', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388103', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120484120850434', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388104', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120594695286785', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388105', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120649007329281', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388106', 'f6817f48af4fb3af11b9e8bf182f618b', '1592112984361365505', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388107', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115914493751297', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388108', 'f6817f48af4fb3af11b9e8bf182f618b', '1592116663936184322', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388109', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118604640645122', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388110', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118648315932674', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388111', 'f6817f48af4fb3af11b9e8bf182f618b', '1592119001883176961', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388112', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120052866707457', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388113', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115712466710529', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388114', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117222764277761', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388115', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117276539449345', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388116', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117377299214337', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388117', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117422006300673', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388118', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120222727630849', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388119', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118053634928641', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388120', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117990305132545', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388121', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117804359053314', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388122', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117748209905665', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388123', 'f6817f48af4fb3af11b9e8bf182f618b', '1592117625664925697', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388124', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118192218927105', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388125', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118254844080130', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388126', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118306983473154', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388127', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118356778250241', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388128', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118414990995457', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153006416388129', 'f6817f48af4fb3af11b9e8bf182f618b', '1592118497606201346', NULL, '2022-11-17 16:04:11', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1593153077300125697', 'f6817f48af4fb3af11b9e8bf182f618b', '1592115610431877122', NULL, '2022-11-17 16:04:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1631912286053158913', '1501570619841810433', '1592135223910765570', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286069936130', '1501570619841810433', '1593185714482880514', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286069936131', '1501570619841810433', '15c92115213910765570', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286069936132', '1501570619841810433', '1d592115213910765570', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286069936133', '1501570619841810433', '1592120224120850434', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286078324740', '1501570619841810433', '1593160959633563650', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286086713346', '1501570619841810433', '1593160905216663554', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286086713347', '1501570619841810433', '1593161025790320641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286086713348', '1501570619841810433', '1593161089787011074', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286090907650', '1501570619841810433', '1596335805278990338', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286090907651', '1501570619841810433', '1596141938193747970', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286090907652', '1501570619841810433', '1600105607009165314', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286090907653', '1501570619841810433', '1600108123037917186', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286090907654', '1501570619841810433', '1600129606082650113', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101953', '1501570619841810433', '1611620416187969538', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101954', '1501570619841810433', '1611620600003342337', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101955', '1501570619841810433', '1611620654621569026', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101956', '1501570619841810433', '1611620772498218641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101957', '1501570619841810433', '1611620772498288641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286095101958', '1501570619841810433', '1611650772498288641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296258', '1501570619841810433', '1612438989792034818', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296259', '1501570619841810433', '1613620712498288641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296260', '1501570619841810433', '1620261087828418562', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296261', '1501570619841810433', '1620305415648989186', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296262', '1501570619841810433', '1697220712498288641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296263', '1501570619841810433', '1621620772498288641', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296264', '1501570619841810433', '1620327825894981634', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296265', '1501570619841810433', '1593161743607701505', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296266', '1501570619841810433', '1593161697348722689', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296267', '1501570619841810433', '1593161657385394177', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296268', '1501570619841810433', '1593161608362369026', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296269', '1501570619841810433', '1593161551202394114', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286099296270', '1501570619841810433', '1593161483627962370', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286107684866', '1501570619841810433', '1593161421350936578', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286107684867', '1501570619841810433', '1594930803956920321', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1631912286107684868', '1501570619841810433', '1593173018886709250', NULL, '2023-03-04 14:59:43', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1657938323991883777', '1501570619841810433', '1473927410093187073', NULL, '2023-05-15 10:37:54', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1657938324004466690', '1501570619841810433', '1542385335362383873', NULL, '2023-05-15 10:37:54', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1657938324004466691', '1501570619841810433', '1554384900763729922', NULL, '2023-05-15 10:37:54', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779465240578', 'f6817f48af4fb3af11b9e8bf182f618b', '1447535997560909826', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779486212097', 'f6817f48af4fb3af11b9e8bf182f618b', '1542385335362383873', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779486212098', 'f6817f48af4fb3af11b9e8bf182f618b', '1554384900763729922', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779486212099', 'f6817f48af4fb3af11b9e8bf182f618b', '1592120224120850434', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779490406401', 'f6817f48af4fb3af11b9e8bf182f618b', '1592135223910765570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779490406402', 'f6817f48af4fb3af11b9e8bf182f618b', '1593160905216663554', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779490406403', 'f6817f48af4fb3af11b9e8bf182f618b', '1593160959633563650', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779490406404', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161025790320641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779498795010', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161089787011074', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779498795011', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161421350936578', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779498795012', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161483627962370', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989314', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161551202394114', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989315', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161608362369026', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989316', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161657385394177', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989317', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161697348722689', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989318', 'f6817f48af4fb3af11b9e8bf182f618b', '1593161743607701505', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989319', 'f6817f48af4fb3af11b9e8bf182f618b', '1593173018886709250', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989320', 'f6817f48af4fb3af11b9e8bf182f618b', '1593185714482880514', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779502989321', 'f6817f48af4fb3af11b9e8bf182f618b', '1596335805278990338', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377921', 'f6817f48af4fb3af11b9e8bf182f618b', '1600105607009165314', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377922', 'f6817f48af4fb3af11b9e8bf182f618b', '1600108123037917186', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377923', 'f6817f48af4fb3af11b9e8bf182f618b', '1600129606082650113', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377924', 'f6817f48af4fb3af11b9e8bf182f618b', '1611620416187969538', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377925', 'f6817f48af4fb3af11b9e8bf182f618b', '1611620600003342337', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377926', 'f6817f48af4fb3af11b9e8bf182f618b', '1611620654621569026', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377927', 'f6817f48af4fb3af11b9e8bf182f618b', '1611620772498218641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377928', 'f6817f48af4fb3af11b9e8bf182f618b', '1611620772498288641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377929', 'f6817f48af4fb3af11b9e8bf182f618b', '1611650772498288641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377930', 'f6817f48af4fb3af11b9e8bf182f618b', '1612438989792034818', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779511377931', 'f6817f48af4fb3af11b9e8bf182f618b', '1613620712498288641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766529', 'f6817f48af4fb3af11b9e8bf182f618b', '1620261087828418562', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766530', 'f6817f48af4fb3af11b9e8bf182f618b', '1620305415648989186', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766531', 'f6817f48af4fb3af11b9e8bf182f618b', '1620327825894981634', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766532', 'f6817f48af4fb3af11b9e8bf182f618b', '1621620772498288641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766533', 'f6817f48af4fb3af11b9e8bf182f618b', '1693195557097164801', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766534', 'f6817f48af4fb3af11b9e8bf182f618b', '1697220712498288641', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766535', 'f6817f48af4fb3af11b9e8bf182f618b', '15c92115213910765570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766536', 'f6817f48af4fb3af11b9e8bf182f618b', '1d592115213910765570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766537', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177074872321', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779519766538', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177351696386', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155138', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177720795137', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155139', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178127642626', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155140', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183630569474', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155141', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183630569477', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155142', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183777370114', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155143', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108184049999873', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779528155144', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108186717577217', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779532349442', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108187678072833', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779532349443', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108189062193153', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779532349444', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108190110769154', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543746', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108190777663490', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543747', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108192623157249', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543748', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108194992939010', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543749', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108196263813121', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543750', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197270446081', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543751', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108202366525441', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543752', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205004742657', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543753', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108208817364993', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543754', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108210117599234', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543755', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108211325558785', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543756', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108214882328577', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779536543757', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108215511474177', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932354', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108216300003330', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932355', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108216971091969', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932356', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108217860284417', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932357', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108218787225601', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932358', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108219592531970', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932359', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108220523667458', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779544932360', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108220896960513', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126657', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108221127647234', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126659', 'f6817f48af4fb3af11b9e8bf182f618b', '1438115924159881218', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126660', 'f6817f48af4fb3af11b9e8bf182f618b', '1211885237487923202', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126661', 'f6817f48af4fb3af11b9e8bf182f618b', '1214376304951664642', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126662', 'f6817f48af4fb3af11b9e8bf182f618b', '1214462306546319362', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126663', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108176273760258', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779549126664', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108176814825473', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320962', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177188118529', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320963', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177565605889', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320964', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108177880178689', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320965', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178257666049', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320966', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183907393538', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320967', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108187103453186', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320968', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108187871010818', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320969', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108189427097601', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320970', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108190404370433', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320971', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108191356477442', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320972', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108193701093378', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320973', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108195307511809', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779553320974', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108196528054273', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709569', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197958311537', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709570', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197958315557', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709571', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108203649982466', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709572', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205180903426', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709573', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108208980942850', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709574', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108210260205570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779561709575', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108211661103106', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903874', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108215335313409', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903875', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108215687634945', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903876', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108216597798914', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903877', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108217449242626', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903878', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108218049028097', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903879', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108219034689538', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903880', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108219793858561', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903881', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108220724994049', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779565903882', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108221270253570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098178', 'f6817f48af4fb3af11b9e8bf182f618b', '1438116003012796418', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098179', 'f6817f48af4fb3af11b9e8bf182f618b', '1438783058792951810', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098180', 'f6817f48af4fb3af11b9e8bf182f618b', '1439399179791409153', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098181', 'f6817f48af4fb3af11b9e8bf182f618b', '1439488251473993730', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098182', 'f6817f48af4fb3af11b9e8bf182f618b', '1446778415130722306', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098183', 'f6817f48af4fb3af11b9e8bf182f618b', '1447763517847396354', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098184', 'f6817f48af4fb3af11b9e8bf182f618b', '1454031324835807233', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098185', 'f6817f48af4fb3af11b9e8bf182f618b', '1455101470794850305', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098186', 'f6817f48af4fb3af11b9e8bf182f618b', '1590154870697734146', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098187', 'f6817f48af4fb3af11b9e8bf182f618b', '1a0811914300741f4e11838ff37a1d3a', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098188', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108176932265985', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098189', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178421243905', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098190', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108188034588674', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779570098191', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108189754253313', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486786', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108195487866881', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486787', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108196855209985', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486788', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197958311937', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486789', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108203817754625', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486790', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205357064193', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486791', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108209228406785', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486792', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108211778543618', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486793', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108215989624834', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486794', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108219240210434', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486795', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108220137791489', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486797', 'f6817f48af4fb3af11b9e8bf182f618b', '1443391584864358402', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486798', 'f6817f48af4fb3af11b9e8bf182f618b', '1448252726202859522', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486799', 'f6817f48af4fb3af11b9e8bf182f618b', '1454031820661260289', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486800', 'f6817f48af4fb3af11b9e8bf182f618b', '1455100420297859074', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486801', 'f6817f48af4fb3af11b9e8bf182f618b', '1460888189937176577', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486802', 'f6817f48af4fb3af11b9e8bf182f618b', '1461291438825558017', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779578486803', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178643542017', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875394', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108188378521602', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875395', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108195638861825', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875396', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108198113501186', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875397', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108204023275521', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875398', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205587750914', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875399', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108218409738242', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875400', 'f6817f48af4fb3af11b9e8bf182f618b', '1439511654494937090', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875401', 'f6817f48af4fb3af11b9e8bf182f618b', '1452508868884353026', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875402', 'f6817f48af4fb3af11b9e8bf182f618b', '1454034512171302914', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875403', 'f6817f48af4fb3af11b9e8bf182f618b', '1473927410093187073', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875404', 'f6817f48af4fb3af11b9e8bf182f618b', '1580833876002627585', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779586875405', 'f6817f48af4fb3af11b9e8bf182f618b', '119213522910765570', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069698', 'f6817f48af4fb3af11b9e8bf182f618b', '1597419994965786625', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069699', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178781954049', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069700', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178781954050', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069701', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108188542099458', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069702', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108195924074497', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069703', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108199413735425', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069704', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108204232990721', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069705', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205742940161', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069706', 'f6817f48af4fb3af11b9e8bf182f618b', '1438782641187074050', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069707', 'f6817f48af4fb3af11b9e8bf182f618b', '1439531077792473089', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069708', 'f6817f48af4fb3af11b9e8bf182f618b', '1455019819440021505', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069709', 'f6817f48af4fb3af11b9e8bf182f618b', '1580834045490257922', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069711', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178911977473', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069712', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108188714065922', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779591069713', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108199539564546', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264002', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108204400762881', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264003', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108205919100930', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264005', 'f6817f48af4fb3af11b9e8bf182f618b', '1438469604861403137', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264006', 'f6817f48af4fb3af11b9e8bf182f618b', '1439398677984878593', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264007', 'f6817f48af4fb3af11b9e8bf182f618b', '1439533711676973057', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264009', 'f6817f48af4fb3af11b9e8bf182f618b', '1447763172274495489', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264010', 'f6817f48af4fb3af11b9e8bf182f618b', '1455067599277662209', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264011', 'f6817f48af4fb3af11b9e8bf182f618b', '1465686870713782273', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264012', 'f6817f48af4fb3af11b9e8bf182f618b', '1509417558230999041', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264013', 'f6817f48af4fb3af11b9e8bf182f618b', '1580835899477483522', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264014', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108179226550273', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264015', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197958311637', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264016', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108198679732226', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264017', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108204576923649', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779595264018', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108206086873089', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779603652610', 'f6817f48af4fb3af11b9e8bf182f618b', '1439542701152575489', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779603652611', 'f6817f48af4fb3af11b9e8bf182f618b', '1580877743141933058', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779603652612', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108179381739521', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779603652613', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197958311677', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779603652614', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108198855892993', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846913', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108204732112898', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846914', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108206258839553', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846915', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108217562488834', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846916', 'f6817f48af4fb3af11b9e8bf182f618b', '1441340399835742209', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846917', 'f6817f48af4fb3af11b9e8bf182f618b', '1580877931331964929', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846918', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108179599843330', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779607846919', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108197790539778', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041218', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108199120134145', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041219', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108206489526274', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041220', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108219445731330', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041221', 'f6817f48af4fb3af11b9e8bf182f618b', '1438782851980210178', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041222', 'f6817f48af4fb3af11b9e8bf182f618b', '1439784356766064642', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041223', 'f6817f48af4fb3af11b9e8bf182f618b', '1441357157443371009', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041224', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108179910221825', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041225', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108198339993602', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041226', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108199304683521', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041227', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108206661492738', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779612041228', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108220418809857', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235521', 'f6817f48af4fb3af11b9e8bf182f618b', '1438782530717495298', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235522', 'f6817f48af4fb3af11b9e8bf182f618b', '1439797053314342913', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235523', 'f6817f48af4fb3af11b9e8bf182f618b', '1441361249200832513', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235524', 'f6817f48af4fb3af11b9e8bf182f618b', '1457678003102879745', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235525', 'f6817f48af4fb3af11b9e8bf182f618b', '1580878668472504321', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235526', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108180077993985', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779616235527', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108206959288321', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429826', 'f6817f48af4fb3af11b9e8bf182f618b', '1439839507094740994', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429827', 'f6817f48af4fb3af11b9e8bf182f618b', '1450308897429536769', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429828', 'f6817f48af4fb3af11b9e8bf182f618b', '1455735714507472898', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429829', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108180258349057', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429831', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108199631839234', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429832', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108207160614913', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429833', 'f6817f48af4fb3af11b9e8bf182f618b', '1439842640030113793', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429834', 'f6817f48af4fb3af11b9e8bf182f618b', '1442055284830769154', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429835', 'f6817f48af4fb3af11b9e8bf182f618b', '1458389305235984385', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429836', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108180434509826', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429838', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108200076435458', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429839', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108207374524418', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429840', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108225263230978', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429841', 'f6817f48af4fb3af11b9e8bf182f618b', '1453250018282573826', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779620429842', 'f6817f48af4fb3af11b9e8bf182f618b', '1594930803956920321', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624130', 'f6817f48af4fb3af11b9e8bf182f618b', '1596141938193747970', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624131', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108180631642113', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624132', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108200391008257', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624133', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108207563268097', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624135', 'f6817f48af4fb3af11b9e8bf182f618b', '1534418199197323265', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624136', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108180770054145', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624137', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108200672026626', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624138', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108207793954818', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624139', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108200802050050', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624140', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108208024641538', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624141', 'f6817f48af4fb3af11b9e8bf182f618b', '1458353686530232321', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624142', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108200919490562', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624143', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108208297271297', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624144', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183085309954', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624145', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108201150177281', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624146', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108201502498817', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624147', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183395688450', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779624624148', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108178010202113', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779633012738', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108183492157442', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779633012739', 'f6817f48af4fb3af11b9e8bf182f618b', '1438108202060341249', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1693199779633012740', 'f6817f48af4fb3af11b9e8bf182f618b', '1461270075543347202', NULL, '2023-08-20 17:54:20', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('16ef8ed3865ccc6f6306200760896c50', 'ee8626f80f7c2619917b6236f3a7f02b', 'e8af452d8948ea49d37c934f5100ae6a', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1703032629144289281', 'f6817f48af4fb3af11b9e8bf182f618b', '1609123240547344385', NULL, '2023-09-16 21:06:34', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1703032629144289282', 'f6817f48af4fb3af11b9e8bf182f618b', '1609123437247619074', NULL, '2023-09-16 21:06:34', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1703032629144289283', 'f6817f48af4fb3af11b9e8bf182f618b', '1609164542165012482', NULL, '2023-09-16 21:06:34', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1703032629211398145', 'f6817f48af4fb3af11b9e8bf182f618b', '1609164635442139138', NULL, '2023-09-16 21:06:34', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1704379601608437762', 'f6817f48af4fb3af11b9e8bf182f618b', '1691031996d593131521', NULL, '2023-09-20 14:18:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1704379601608437763', 'f6817f48af4fb3af11b9e8bf182f618b', '1660568426632380417', NULL, '2023-09-20 14:18:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1704379601608437764', 'f6817f48af4fb3af11b9e8bf182f618b', '1660568368558047234', NULL, '2023-09-20 14:18:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1704379601608437765', 'f6817f48af4fb3af11b9e8bf182f618b', '1660568280725127169', NULL, '2023-09-20 14:18:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633924976642', '1501570619841810433', '1691031996d593131521', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633966919681', '1501570619841810433', '1629109281748291586', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633966919682', '1501570619841810433', '1701575168519839746', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633966919684', '1501570619841810433', '1609123240547344385', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633975308289', '1501570619841810433', '1609123437247619074', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633975308290', '1501570619841810433', '1609164635442139138', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633975308291', '1501570619841810433', '1609164542165012482', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633979502594', '1501570619841810433', '1668174661456171010', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633979502596', '1501570619841810433', '1663816667704500225', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633979502597', '1501570619841810433', '1660568280725127169', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633979502598', '1501570619841810433', '1660568368558047234', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714210633979502599', '1501570619841810433', '1660568426632380417', NULL, '2023-10-17 17:23:58', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1714215494145949698', '1501570619841810433', '1693195557097164801', NULL, '2023-10-17 17:43:17', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1732331210279628801', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374704168534017', NULL, '2023-12-06 17:28:40', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1732331210292211714', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374509749960705', NULL, '2023-12-06 17:28:40', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1732331210292211715', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374269152100354', NULL, '2023-12-06 17:28:40', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995477389314', '1501570619841810433', '1699374269152100354', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972226', '1501570619841810433', '1699374509749960705', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972227', '1501570619841810433', '1691031996d5931315212', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972228', '1501570619841810433', '1691031996d5931315213', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972229', '1501570619841810433', '1699374704168534017', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972230', '1501570619841810433', '1701475606988812289', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972231', '1501570619841810433', '1699039192154071041', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995489972232', '1501570619841810433', '1699039098474291201', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995498360833', '1501570619841810433', '1699038961937113090', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741323995498360834', '1501570619841810433', '1698650926200352770', NULL, '2023-12-31 13:02:47', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1741324948112879617', '1501570619841810433', '1737321792727388161', NULL, '2023-12-31 13:06:35', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1742379927128961025', '1501570619841810433', '1546736974756032513', NULL, '2024-01-03 10:58:41', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1765276463387095042', '1501570619841810433', '1750128461040648193', NULL, '2024-03-06 15:21:21', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1765276463395483650', '1501570619841810433', '1592114721138765826', NULL, '2024-03-06 15:21:21', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1765276566625693698', 'f6817f48af4fb3af11b9e8bf182f618b', '1750128461040648193', NULL, '2024-03-06 15:21:45', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1765276566634082305', 'f6817f48af4fb3af11b9e8bf182f618b', '1592114721138765826', NULL, '2024-03-06 15:21:45', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('17ead5b7d97ed365398ab20009a69ea3', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e08cb190ef230d5d4f03824198773950', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1800736354410942465', 'f6817f48af4fb3af11b9e8bf182f618b', '1546736974756032513', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942466', 'f6817f48af4fb3af11b9e8bf182f618b', '1746709108126285826', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942467', 'f6817f48af4fb3af11b9e8bf182f618b', '1691031996d5931315212', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942468', 'f6817f48af4fb3af11b9e8bf182f618b', '1691031996d5931315213', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942469', 'f6817f48af4fb3af11b9e8bf182f618b', '1701475606988812289', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942470', 'f6817f48af4fb3af11b9e8bf182f618b', '1699039098474291201', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942471', 'f6817f48af4fb3af11b9e8bf182f618b', '1699039192154071041', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942472', 'f6817f48af4fb3af11b9e8bf182f618b', '1699038961937113090', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736354410942473', 'f6817f48af4fb3af11b9e8bf182f618b', '1698650926200352770', NULL, '2024-06-12 11:46:18', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1800736426536194049', '1501570619841810433', '1746709108126285826', NULL, '2024-06-12 11:46:35', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349244334081', '1501570619841810433', '1534500282601893890', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722690', '1501570619841810433', '1535226870641475586', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722691', '1501570619841810433', '1535227149789184001', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722692', '1501570619841810433', '1542383139476467713', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722693', '1501570619841810433', '1542383223979110402', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722694', '1501570619841810433', '1542383292690198530', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722695', '1501570619841810433', '1542383437808922625', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349252722696', '1501570619841810433', '1542383507883159553', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111297', '1501570619841810433', '1542383573423353858', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111298', '1501570619841810433', '1542383826117586945', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111299', '1501570619841810433', '1542383907281563650', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111300', '1501570619841810433', '1699374346553786370', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111301', '1501570619841810433', '1699374404015751169', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111302', '1501570619841810433', '1535225446864011265', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111303', '1501570619841810433', '1699374612388773890', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349261111304', '1501570619841810433', '1699374801816125442', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349265305602', '1501570619841810433', '1699375086147993601', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081349265305603', '1501570619841810433', '1699375193576701953', NULL, '2024-06-13 10:37:11', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365570', 'f6817f48af4fb3af11b9e8bf182f618b', '1534500282601893890', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365571', 'f6817f48af4fb3af11b9e8bf182f618b', '1535226870641475586', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365572', 'f6817f48af4fb3af11b9e8bf182f618b', '1535227149789184001', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365573', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383139476467713', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365574', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383223979110402', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365575', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383292690198530', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365576', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383437808922625', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365577', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383507883159553', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365578', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383573423353858', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365579', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383826117586945', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365580', 'f6817f48af4fb3af11b9e8bf182f618b', '1542383907281563650', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365581', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374346553786370', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365582', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374404015751169', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365583', 'f6817f48af4fb3af11b9e8bf182f618b', '1535225446864011265', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365584', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374612388773890', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365585', 'f6817f48af4fb3af11b9e8bf182f618b', '1699374801816125442', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365586', 'f6817f48af4fb3af11b9e8bf182f618b', '1699375086147993601', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1801081424624365587', 'f6817f48af4fb3af11b9e8bf182f618b', '1699375193576701953', NULL, '2024-06-13 10:37:29', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1802512146434314242', '1501570619841810433', '1801954937339428865', NULL, '2024-06-17 09:22:39', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1802512173219139585', 'f6817f48af4fb3af11b9e8bf182f618b', '1801954937339428865', NULL, '2024-06-17 09:22:46', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1802906584184770561', '1501570619841810433', 'f15543b0263cf6c5fac85afdd3eba3f2', NULL, '2024-06-18 11:30:01', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1803082137470636033', '1501570619841810433', '1620709334357532673', NULL, '2024-06-18 23:07:36', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1803082162472882177', 'f6817f48af4fb3af11b9e8bf182f618b', '1620709334357532673', NULL, '2024-06-18 23:07:42', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1804046501195509761', '1501570619841810433', '1804046424930480129', NULL, '2024-06-21 14:59:38', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393666', '1501570619841810433', '1800372628805861377', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393667', '1501570619841810433', '1800372727493640194', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393668', '1501570619841810433', '1800372811518132225', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393669', '1501570619841810433', '1800372906330374146', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393670', '1501570619841810433', '1800373633509441537', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833351001521393671', '1501570619841810433', '1800373733220630530', NULL, '2024-09-10 11:45:15', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408020878077953', '1501570619841810433', '1810923799513612290', NULL, '2024-09-10 15:31:50', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408020961964033', '1501570619841810433', '1811685368354754561', NULL, '2024-09-10 15:31:50', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408020961964034', '1501570619841810433', '1811685464467230721', NULL, '2024-09-10 15:31:50', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100234309633', 'f6817f48af4fb3af11b9e8bf182f618b', '1810923799513612290', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100242698241', 'f6817f48af4fb3af11b9e8bf182f618b', '1811685368354754561', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100246892545', 'f6817f48af4fb3af11b9e8bf182f618b', '1811685464467230721', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100246892546', 'f6817f48af4fb3af11b9e8bf182f618b', '1701575168519839746', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100246892547', 'f6817f48af4fb3af11b9e8bf182f618b', '1800372628805861377', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100255281153', 'f6817f48af4fb3af11b9e8bf182f618b', '1800372727493640194', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100255281154', 'f6817f48af4fb3af11b9e8bf182f618b', '1800372811518132225', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100255281155', 'f6817f48af4fb3af11b9e8bf182f618b', '1800372906330374146', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100255281156', 'f6817f48af4fb3af11b9e8bf182f618b', '1800373633509441537', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1833408100255281157', 'f6817f48af4fb3af11b9e8bf182f618b', '1800373733220630530', NULL, '2024-09-10 15:32:09', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1866001696833613826', '1501570619841810433', '1866001513609637890', NULL, '2024-12-09 14:07:28', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1866001714697154561', 'f6817f48af4fb3af11b9e8bf182f618b', '1866001513609637890', NULL, '2024-12-09 14:07:32', '127.0.0.1');
INSERT INTO "sys_role_permission" VALUES ('1887778978006814721', '1501570619841810433', '1887447660072292354', NULL, '2025-02-07 16:22:36', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1887788524574068737', '1501570619841810433', '1438108223489040385', NULL, '2025-02-07 17:00:32', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1887788524574068738', '1501570619841810433', '1438108222721482753', NULL, '2025-02-07 17:00:32', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1887788524574068739', '1501570619841810433', '1438108222218166273', NULL, '2025-02-07 17:00:32', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1887788524574068740', '1501570619841810433', '1438108221849067522', NULL, '2025-02-07 17:00:32', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1887788524574068741', '1501570619841810433', '1438108223661006850', NULL, '2025-02-07 17:00:32', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1892117657990971393', '1456165677820301314', '1876220177009315842', NULL, '2025-02-19 15:42:58', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1892117657990971394', '1456165677820301314', '1867047795019440130', NULL, '2025-02-19 15:42:58', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1892117657990971395', '1456165677820301314', '1867041505346019330', NULL, '2025-02-19 15:42:58', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1892509406223613954', '1501570619841810433', '1876220177009315842', NULL, '2025-02-20 17:39:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907407238864781314', 'f6817f48af4fb3af11b9e8bf182f618b', '1892553163993931777', NULL, '2025-04-02 20:18:18', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907407238864781315', 'f6817f48af4fb3af11b9e8bf182f618b', '1895401981290643458', NULL, '2025-04-02 20:18:18', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907407238864781316', 'f6817f48af4fb3af11b9e8bf182f618b', '1892553778493022209', NULL, '2025-04-02 20:18:18', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907407238864781317', 'f6817f48af4fb3af11b9e8bf182f618b', '1892557342028226561', NULL, '2025-04-02 20:18:18', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907407238864781318', 'f6817f48af4fb3af11b9e8bf182f618b', '1893865471550578689', NULL, '2025-04-02 20:18:18', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1907441306927063042', 'f6817f48af4fb3af11b9e8bf182f618b', '1907441271556497409', NULL, '2025-04-02 22:33:41', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071739539457', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193340030', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648321', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350031', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648322', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350032', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648323', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350033', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648324', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350034', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648325', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350035', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917857071806648326', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050104193350036', NULL, '2025-05-01 16:22:13', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917881149426864129', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940200', NULL, '2025-05-01 17:57:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917881149431058436', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940203', NULL, '2025-05-01 17:57:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917881149431058437', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940204', NULL, '2025-05-01 17:57:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917881149431058438', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940205', NULL, '2025-05-01 17:57:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917881149431058439', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940206', NULL, '2025-05-01 17:57:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1917957659860963330', 'f6817f48af4fb3af11b9e8bf182f618b', '1917957565728198657', NULL, '2025-05-01 23:01:55', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1922109760551858178', 'f6817f48af4fb3af11b9e8bf182f618b', '1922109301837606914', NULL, '2025-05-13 10:00:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1922164055780016129', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940201', NULL, '2025-05-13 13:36:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1922164055800987650', 'f6817f48af4fb3af11b9e8bf182f618b', '2025050105554940202', NULL, '2025-05-13 13:36:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218122706386946', 'f6817f48af4fb3af11b9e8bf182f618b', '1890213291321749505', NULL, '2025-05-16 11:25:07', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787265', '1501570619841810433', '1892553163993931777', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787266', '1501570619841810433', '1895401981290643458', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787267', '1501570619841810433', '1892553778493022209', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787268', '1501570619841810433', '1890213291321749505', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787269', '1501570619841810433', '1892557342028226561', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1923218155547787270', '1501570619841810433', '1893865471550578689', NULL, '2025-05-16 11:25:15', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570591584258', '1501570619841810433', '1438108221551271937', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693122', '1501570619841810433', '1922109301837606914', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693123', '1501570619841810433', '2025050104193340030', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693124', '1501570619841810433', '2025050104193350031', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693125', '1501570619841810433', '2025050104193350032', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693126', '1501570619841810433', '2025050104193350033', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693127', '1501570619841810433', '2025050104193350034', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693128', '1501570619841810433', '2025050104193350035', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693129', '1501570619841810433', '2025050104193350036', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693130', '1501570619841810433', '2025050105554940200', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693131', '1501570619841810433', '2025050105554940201', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693132', '1501570619841810433', '2025050105554940202', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693133', '1501570619841810433', '2025050105554940203', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693134', '1501570619841810433', '2025050105554940204', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693135', '1501570619841810433', '2025050105554940205', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693136', '1501570619841810433', '2025050105554940206', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937756570658693137', '1501570619841810433', '1917957565728198657', NULL, '2025-06-25 14:15:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330064568321', '1501570619841810433', '1930222558582472705', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330077151234', '1501570619841810433', '1930222617197871105', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330085539842', '1501570619841810433', '1930222679269376001', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330085539843', '1501570619841810433', '1930222862556266498', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330085539844', '1501570619841810433', '1930222953853681666', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330085539845', '1501570619841810433', '1930223034757611522', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734145', '1501570619841810433', '1930223132619112449', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734146', '1501570619841810433', '1930221570324758530', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734147', '1501570619841810433', '1930221637551063042', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734148', '1501570619841810433', '1930221702164316161', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734149', '1501570619841810433', '1930221774230847490', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734150', '1501570619841810433', '1930221983555977217', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330089734151', '1501570619841810433', '1930222066120851457', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330093928450', '1501570619841810433', '1930222218734796802', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330093928451', '1501570619841810433', '1930222295012409345', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330093928452', '1501570619841810433', '1930222395180777474', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330098122753', '1501570619841810433', '1930221213607591937', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1937789330098122754', '1501570619841810433', '1930221335938662401', NULL, '2025-06-25 16:25:53', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1938073430981754881', '1501570619841810433', '1912753560201089025', NULL, '2025-06-26 11:14:48', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950486711935152129', '1501570619841810433', '1939572818833301506', NULL, '2025-07-30 17:20:45', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950486711935152130', '1501570619841810433', '1455735714507472898', NULL, '2025-07-30 17:20:45', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487094736695297', '1501570619841810433', '1930152938891608066', NULL, '2025-07-30 17:22:16', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487094803804162', '1501570619841810433', '1942160438629109761', NULL, '2025-07-30 17:22:16', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487483951329281', '1501570619841810433', '1941349246536998913', NULL, '2025-07-30 17:23:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487483951329282', '1501570619841810433', '1941349335431077889', NULL, '2025-07-30 17:23:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487483959717889', '1501570619841810433', '1941349462887587842', NULL, '2025-07-30 17:23:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1950487483959717890', '1501570619841810433', '1941349550087168001', NULL, '2025-07-30 17:23:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1962489414454194178', '1962488045068464130', '1609123240547344385', NULL, '2025-09-01 20:15:12', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251539722241', '1962488045068464130', '1674708136602542082', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251548110850', '1962488045068464130', '1663816667704500225', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251552305154', '1962488045068464130', '119213522910765570', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251552305155', '1962488045068464130', '1592114574275211345', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251560693762', '1962488045068464130', '1960994076329316353', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251560693763', '1962488045068464130', '1214462306546319322', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251560693764', '1962488045068464130', '1597419994965786625', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251560693765', '1962488045068464130', '1592102143467200514', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251569082370', '1962488045068464130', '1592114893302823614', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251569082371', '1962488045068464130', '1592120323667750934', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251569082372', '1962488045068464130', '1592120372296522490', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251569082373', '1962488045068464130', '1592120427223412865', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251573276674', '1962488045068464130', '1961009998209257473', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251573276675', '1962488045068464130', '1592115712422330529', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251573276676', '1962488045068464130', '1592117222764277032', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251573276677', '1962488045068464130', '1592117276539449346', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251581665281', '1962488045068464130', '1592117377299214338', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251581665282', '1962488045068464130', '1961253156897710081', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251585859586', '1962488045068464130', '1600105607009162230', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251585859587', '1962488045068464130', '1600108123037913486', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962765251585859588', '1962488045068464130', '1609123240547344376', NULL, '2025-09-02 14:31:17', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1962766200899461121', '1962488045068464130', '1592114955650691174', NULL, '2025-09-02 14:35:03', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963068885343252482', '1962488045068464130', '1600129606082650123', NULL, '2025-09-03 10:37:49', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963086686351036418', '1962488045068464130', '1963086454217281537', NULL, '2025-09-03 11:48:33', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963133491872829442', '1962488045068464130', '1963133393868722178', NULL, '2025-09-03 14:54:32', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963153837854330881', 'ee8626f80f7c2619917b6236f3a7f02b', '1596141938193747970', NULL, '2025-09-03 16:15:23', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963153837854330882', 'ee8626f80f7c2619917b6236f3a7f02b', '1596335805278990338', NULL, '2025-09-03 16:15:23', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1963153837854339901', 'ee8626f80f7c2619917b6236f3a7f02b', '1611620654621569026', NULL, '2025-09-03 16:15:23', '192.168.1.6');
INSERT INTO "sys_role_permission" VALUES ('1966810195686531074', 'ee8626f80f7c2619917b6236f3a7f02b', '1438108225451974658', NULL, '2025-09-13 18:24:27', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299781357570', '1501570619841810433', '1438108187455774722', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746177', '1501570619841810433', '1438108187678072833', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746178', '1501570619841810433', '1438108189062193153', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746179', '1501570619841810433', '1438108189427097601', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746180', '1501570619841810433', '1438108189754253313', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746181', '1501570619841810433', '1438108187871010818', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746182', '1501570619841810433', '1438108190110769154', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299789746183', '1501570619841810433', '1438108190404370433', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134786', '1501570619841810433', '1438108188034588674', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134787', '1501570619841810433', '1438108190777663490', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134788', '1501570619841810433', '1438108191356477442', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134789', '1501570619841810433', '1438108188378521602', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134790', '1501570619841810433', '1438108192623157249', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134791', '1501570619841810433', '1438108193701093378', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134792', '1501570619841810433', '1438108188542099458', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134793', '1501570619841810433', '1438108194992939010', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134794', '1501570619841810433', '1438108195307511809', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134795', '1501570619841810433', '1438108195487866881', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299798134796', '1501570619841810433', '1438108195638861825', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329089', '1501570619841810433', '1438108195924074497', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329090', '1501570619841810433', '1438108178911977473', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329091', '1501570619841810433', '1438108183630569474', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329092', '1501570619841810433', '1438108183630569477', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329093', '1501570619841810433', '1438108183907393538', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329094', '1501570619841810433', '1438108184049999873', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329095', '1501570619841810433', '1438108188714065922', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329096', '1501570619841810433', '1438108196263813121', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329097', '1501570619841810433', '1438108196528054273', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329098', '1501570619841810433', '1438108196855209985', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329099', '1501570619841810433', '1438108217562488834', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329100', '1501570619841810433', '1438108217860284417', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329101', '1501570619841810433', '1438108218049028097', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299802329102', '1501570619841810433', '1438108218409738242', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717697', '1501570619841810433', '1438108218787225601', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717698', '1501570619841810433', '1438108219034689538', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717699', '1501570619841810433', '1438108219240210434', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717700', '1501570619841810433', '1438108219445731330', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717701', '1501570619841810433', '1438108219592531970', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717702', '1501570619841810433', '1438108219793858561', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717703', '1501570619841810433', '1446778415130722306', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717704', '1501570619841810433', '1438108220137791489', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717705', '1501570619841810433', '1438108220418809857', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717706', '1501570619841810433', '1438108220523667458', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717707', '1501570619841810433', '1438108220896960513', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717708', '1501570619841810433', '1438108221127647234', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717709', '1501570619841810433', '1438108221270253570', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299810717710', '1501570619841810433', '1438108220724994049', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912001', '1501570619841810433', '1438108183395688450', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912002', '1501570619841810433', '1438115924159881218', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912003', '1501570619841810433', '1438116003012796418', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912004', '1501570619841810433', '1438108183492157442', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912005', '1501570619841810433', '1438108186717577217', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1966827299814912006', '1501570619841810433', '1438108187103453186', NULL, '2025-09-13 19:32:25', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363665309697', '1501570619841810433', '1674708136602542082', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363677892609', '1501570619841810433', '1963133393868722178', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363677892610', '1501570619841810433', '119213522910765570', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363677892611', '1501570619841810433', '1597419994965786625', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363677892612', '1501570619841810433', '1592102143467200514', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363686281217', '1501570619841810433', '1592114893302823614', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363686281218', '1501570619841810433', '1592114955650691174', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475522', '1501570619841810433', '1592120323667750934', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475523', '1501570619841810433', '1592120372296522490', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475524', '1501570619841810433', '1592120427223412865', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475525', '1501570619841810433', '1961009998209257473', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475526', '1501570619841810433', '1592115712422330529', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475527', '1501570619841810433', '1592117222764277032', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475528', '1501570619841810433', '1592117276539449346', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475529', '1501570619841810433', '1592117377299214338', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363690475530', '1501570619841810433', '1961253156897710081', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363694669826', '1501570619841810433', '1600105607009162230', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363694669827', '1501570619841810433', '1600108123037913486', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363694669828', '1501570619841810433', '1609123240547344376', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993228363694669829', '1501570619841810433', '1963086454217281537', NULL, '2025-11-25 16:00:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993244381406035969', '1501570619841810433', '1443390062919208961', NULL, '2025-11-25 17:04:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993244381456367618', '1501570619841810433', '1443391584864358402', NULL, '2025-11-25 17:04:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993244381456367619', '1501570619841810433', '1439542701152575489', NULL, '2025-11-25 17:04:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532089659559937', 'f6817f48af4fb3af11b9e8bf182f618b', '1980223355087781889', NULL, '2025-11-26 12:07:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532089659559938', 'f6817f48af4fb3af11b9e8bf182f618b', '1912753560201089025', NULL, '2025-11-26 12:07:43', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532116092063746', '1501570619841810433', '1980223355087781889', NULL, '2025-11-26 12:07:49', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532192269012993', '1501570619841810433', '1972645086223814657', NULL, '2025-11-26 12:08:07', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532373655883778', '1501570619841810433', '1972617196420993025', NULL, '2025-11-26 12:08:51', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532463099416577', 'f6817f48af4fb3af11b9e8bf182f618b', '1972617196420993025', NULL, '2025-11-26 12:09:12', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1993532463099416578', 'f6817f48af4fb3af11b9e8bf182f618b', '1972645086223814657', NULL, '2025-11-26 12:09:12', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391197980127234', '1501570619841810433', '1930223114757611522', NULL, '2025-12-01 15:15:09', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279299293186', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222862556266498', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279299293187', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222953853681666', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279299293188', 'f6817f48af4fb3af11b9e8bf182f618b', '1930223034757611522', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279299293189', 'f6817f48af4fb3af11b9e8bf182f618b', '1930223114757611522', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279299293190', 'f6817f48af4fb3af11b9e8bf182f618b', '1930223132619112449', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207745', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222295012409345', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207746', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222395180777474', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207747', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222218734796802', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207748', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222066120851457', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207749', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221983555977217', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207750', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221774230847490', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207751', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221702164316161', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207752', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221637551063042', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391279362207753', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221570324758530', NULL, '2025-12-01 15:15:28', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391337201659906', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221213607591937', NULL, '2025-12-01 15:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391337201659907', 'f6817f48af4fb3af11b9e8bf182f618b', '1930221335938662401', NULL, '2025-12-01 15:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391337201659908', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222679269376001', NULL, '2025-12-01 15:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391337201659909', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222617197871105', NULL, '2025-12-01 15:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1995391337201659910', 'f6817f48af4fb3af11b9e8bf182f618b', '1930222558582472705', NULL, '2025-12-01 15:15:42', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828182863873', '1996463539853824001', '1438108176273760258', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252482', '1996463539853824001', '9502685863ab87f0ad1134142788a385', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252483', '1996463539853824001', '1438108176814825473', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252484', '1996463539853824001', '1620709334357532673', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252485', '1996463539853824001', '1892553163993931777', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252486', '1996463539853824001', '1893865471550578689', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828191252487', '1996463539853824001', '1930221213607591937', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641089', '1996463539853824001', '1930221335938662401', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641090', '1996463539853824001', '1892557342028226561', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641091', '1996463539853824001', '1930221570324758530', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641092', '1996463539853824001', '1930221637551063042', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641093', '1996463539853824001', '1930221702164316161', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641094', '1996463539853824001', '1930221774230847490', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641095', '1996463539853824001', '1930221983555977217', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828199641096', '1996463539853824001', '1930222066120851457', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835393', '1996463539853824001', '1930222218734796802', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835394', '1996463539853824001', '1930222295012409345', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835395', '1996463539853824001', '1930222395180777474', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835396', '1996463539853824001', '1890213291321749505', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835397', '1996463539853824001', '1930222862556266498', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835398', '1996463539853824001', '1930222953853681666', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835399', '1996463539853824001', '1930223034757611522', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835400', '1996463539853824001', '1930223114757611522', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828203835401', '1996463539853824001', '1930223132619112449', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224001', '1996463539853824001', '1892553778493022209', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224002', '1996463539853824001', '1930222558582472705', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224003', '1996463539853824001', '1930222617197871105', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224004', '1996463539853824001', '1930222679269376001', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224005', '1996463539853824001', '1895401981290643458', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224006', '1996463539853824001', '1980223355087781889', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224007', '1996463539853824001', '1912753560201089025', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224008', '1996463539853824001', '1460888189937176577', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224009', '1996463539853824001', '1535225446864011265', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224010', '1996463539853824001', '1699374612388773890', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224011', '1996463539853824001', '1699374704168534017', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224012', '1996463539853824001', '1699374801816125442', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224013', '1996463539853824001', '1699375086147993601', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224014', '1996463539853824001', '1699375193576701953', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224015', '1996463539853824001', '1801954937339428865', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224016', '1996463539853824001', '1455101470794850305', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828212224017', '1996463539853824001', '1534500282601893890', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612609', '1996463539853824001', '1535226870641475586', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612610', '1996463539853824001', '1535227149789184001', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612611', '1996463539853824001', '1542383139476467713', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612612', '1996463539853824001', '1542383223979110402', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612613', '1996463539853824001', '1542383292690198530', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612614', '1996463539853824001', '1542383437808922625', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612615', '1996463539853824001', '1542383507883159553', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612616', '1996463539853824001', '1542383573423353858', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612617', '1996463539853824001', '1542383826117586945', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828220612618', '1996463539853824001', '1542383907281563650', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806914', '1996463539853824001', '1546736974756032513', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806915', '1996463539853824001', '1699374269152100354', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806916', '1996463539853824001', '1699374346553786370', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806917', '1996463539853824001', '1699374404015751169', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806918', '1996463539853824001', '1699374509749960705', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806919', '1996463539853824001', '1455100420297859074', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806920', '1996463539853824001', '1461291438825558017', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806921', '1996463539853824001', '1746709108126285826', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806922', '1996463539853824001', '1691031996d593131521', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806923', '1996463539853824001', '1691031996d5931315212', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806924', '1996463539853824001', '1691031996d5931315213', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806925', '1996463539853824001', '1465686870713782273', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806926', '1996463539853824001', '1509417558230999041', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806927', '1996463539853824001', '1461270075543347202', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806928', '1996463539853824001', '1866001513609637890', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806929', '1996463539853824001', '1452508868884353026', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806930', '1996463539853824001', '1473927410093187073', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806931', '1996463539853824001', '1542385335362383873', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828224806932', '1996463539853824001', '1554384900763729922', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195521', '1996463539853824001', '1698650926200352770', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195522', '1996463539853824001', '1699038961937113090', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195523', '1996463539853824001', '1699039098474291201', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195524', '1996463539853824001', '1699039192154071041', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195525', '1996463539853824001', '1701475606988812289', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195526', '1996463539853824001', '1876220177009315842', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195527', '1996463539853824001', '1907441271556497409', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195528', '1996463539853824001', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195529', '1996463539853824001', '1170592628746878978', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195530', '1996463539853824001', '1592112984361365505', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195531', '1996463539853824001', '1592115914493751297', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828233195532', '1996463539853824001', '1592116663936184322', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389826', '1996463539853824001', '1592118604640645122', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389827', '1996463539853824001', '1592118648315932674', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389828', '1996463539853824001', '1592119001883176961', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389829', '1996463539853824001', '1592120052866707457', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389830', '1996463539853824001', '1750128461040648193', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389831', '1996463539853824001', '3f915b2769fc80648e92d04e84ca059d', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389832', '1996463539853824001', '1588513553652436993', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389833', '1996463539853824001', '1592114574275211265', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389834', '1996463539853824001', '1592114652566089729', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389835', '1996463539853824001', '1592114721138765826', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389836', '1996463539853824001', '1592114772665790465', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389837', '1996463539853824001', '1592114823467200514', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389838', '1996463539853824001', '1592114893302362114', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828237389839', '1996463539853824001', '1592114955650691074', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584129', '1996463539853824001', '1592115070432014338', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584130', '1996463539853824001', '1592115115361398786', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584131', '1996463539853824001', '1592115162379546625', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584132', '1996463539853824001', '1592115213910765570', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584133', '1996463539853824001', '1592135223910765570', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584134', '1996463539853824001', '1593185714482880514', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584135', '1996463539853824001', '1808098125316870145', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584136', '1996463539853824001', '1972645086223814657', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584137', '1996463539853824001', '15c92115213910765570', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584138', '1996463539853824001', '1d592115213910765570', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584139', '1996463539853824001', '1214376304951664642', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584140', '1996463539853824001', '1214462306546319362', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828241584141', '1996463539853824001', '1a0811914300741f4e11838ff37a1d3a', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778434', '1996463539853824001', 'f15543b0263cf6c5fac85afdd3eba3f2', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778435', '1996463539853824001', '190c2b43bec6a5f7a4194a85db67d96a', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778436', '1996463539853824001', '1592113148350263298', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778437', '1996463539853824001', '1592120224120850434', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778438', '1996463539853824001', '1592120323667750914', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778439', '1996463539853824001', '1592120372296511490', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778440', '1996463539853824001', '1592120427007012865', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778441', '1996463539853824001', '1592120484120850434', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778442', '1996463539853824001', '1592120594695286785', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778443', '1996463539853824001', '1592120649007329281', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778444', '1996463539853824001', '1693195557097164801', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778445', '1996463539853824001', '45c966826eeff4c99b8f8ebfe74511fc', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828245778446', '1996463539853824001', '1592115712466710529', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972738', '1996463539853824001', '1592117222764277761', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972739', '1996463539853824001', '1592117276539449345', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972740', '1996463539853824001', '1592117377299214337', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972741', '1996463539853824001', '1592117422006300673', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972742', '1996463539853824001', '1592120222727630849', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972743', '1996463539853824001', '1972617196420993025', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828249972744', '1996463539853824001', '5c2f42277948043026b7a14692456828', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361346', '1996463539853824001', '1592117625664925697', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361347', '1996463539853824001', '1592117748209905665', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361348', '1996463539853824001', '1592117804359053314', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361349', '1996463539853824001', '1592117990305132545', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361350', '1996463539853824001', '1592118053634928641', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361351', '1996463539853824001', '1438782641187074050', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361352', '1996463539853824001', '1592118192218927105', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361353', '1996463539853824001', '1592118254844080130', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361354', '1996463539853824001', '1592118306983473154', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361355', '1996463539853824001', '1592118356778250241', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361356', '1996463539853824001', '1592118414990995457', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361357', '1996463539853824001', '1593160905216663554', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361358', '1996463539853824001', '1593160959633563650', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361359', '1996463539853824001', '1593161025790320641', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361360', '1996463539853824001', '1593161089787011074', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361361', '1996463539853824001', '1810652607946940417', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828258361362', '1996463539853824001', '1701575168519839746', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555650', '1996463539853824001', '1800372628805861377', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555651', '1996463539853824001', '1800372727493640194', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555652', '1996463539853824001', '1800372811518132225', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555653', '1996463539853824001', '1800372906330374146', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555654', '1996463539853824001', '1800373633509441537', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555655', '1996463539853824001', '1800373733220630530', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555656', '1996463539853824001', '1438782851980210178', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555657', '1996463539853824001', '1438782530717495298', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555658', '1996463539853824001', '1596141938193747970', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1996463828262555659', '1996463539853824001', '1596335805278990338', NULL, '2025-12-04 14:17:24', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('1ac1688ef8456f384091a03d88a89ab1', '52b0cf022ac4187b2a70dfa4f8b2d940', '693ce69af3432bd00be13c3971a57961', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1af4babaa4227c3cbb830bc5eb513abb', 'ee8626f80f7c2619917b6236f3a7f02b', 'e08cb190ef230d5d4f03824198773950', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1ba162bbc2076c25561f8622f610d5bf', 'ee8626f80f7c2619917b6236f3a7f02b', 'aedbf679b5773c1f25e9f7b10111da73', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('1fe4d408b85f19618c15bcb768f0ec22', '1750a8fb3e6d90cb7957c02de1dc8e59', '9502685863ab87f0ad1134142788a385', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2013562995686309890', '1501570619841810433', '2012376076054974466', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995694698498', '1501570619841810433', '1999367175911657473', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995703087105', '1501570619841810433', '2000880658872508417', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995703087106', '1501570619841810433', '2012375501376606210', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995703087107', '1501570619841810433', '2008516285254000642', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995703087108', '1501570619841810433', '2010623918706446338', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013562995707281409', '1501570619841810433', '1996422809213341698', NULL, '2026-01-20 18:43:23', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053127303169', 'f6817f48af4fb3af11b9e8bf182f618b', '1930152938891608066', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053127303170', 'f6817f48af4fb3af11b9e8bf182f618b', '1942160438629109761', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053127303171', 'f6817f48af4fb3af11b9e8bf182f618b', '1996422809213341698', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053127303172', 'f6817f48af4fb3af11b9e8bf182f618b', '2012376076054974466', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053135691777', 'f6817f48af4fb3af11b9e8bf182f618b', '1999367175911657473', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053135691778', 'f6817f48af4fb3af11b9e8bf182f618b', '2000880658872508417', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053135691779', 'f6817f48af4fb3af11b9e8bf182f618b', '2012375501376606210', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053135691780', 'f6817f48af4fb3af11b9e8bf182f618b', '2008516285254000642', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013563053135691781', 'f6817f48af4fb3af11b9e8bf182f618b', '2010623918706446338', NULL, '2026-01-20 18:43:37', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564035835953154', '1501570619841810433', '2025070908023480210', NULL, '2026-01-20 18:47:31', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564317332471810', '1501570619841810433', '2025070908023490211', NULL, '2026-01-20 18:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564317399580674', '1501570619841810433', '2025070908023490212', NULL, '2026-01-20 18:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564317399580675', '1501570619841810433', '2025070908023490213', NULL, '2026-01-20 18:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564317399580676', '1501570619841810433', '2025070908023490214', NULL, '2026-01-20 18:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('2013564317399580677', '1501570619841810433', '2025070908023490215', NULL, '2026-01-20 18:48:38', '0:0:0:0:0:0:0:1');
INSERT INTO "sys_role_permission" VALUES ('248d288586c6ff3bd14381565df84163', '52b0cf022ac4187b2a70dfa4f8b2d940', '3f915b2769fc80648e92d04e84ca059d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('25f5443f19c34d99718a016d5f54112e', 'ee8626f80f7c2619917b6236f3a7f02b', '6e73eb3c26099c191bf03852ee1310a1', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('27489816708b18859768dfed5945c405', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9502685863ab87f0ad1134142788a385', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('296f9c75ca0e172ae5ce4c1022c996df', '646c628b2b8295fbdab2d34044de0354', '732d48f8e0abe99fe6a23d18a3171cd1', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('29fb4d37aa29b9fa400f389237cf9fe7', 'ee8626f80f7c2619917b6236f3a7f02b', '05b3c82ddb2536a4a5ee1a4c46b5abef', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2c462293cbb0eab7e8ae0a3600361b5f', '52b0cf022ac4187b2a70dfa4f8b2d940', '9502685863ab87f0ad1134142788a385', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2dc1a0eb5e39aaa131ddd0082a492d76', 'ee8626f80f7c2619917b6236f3a7f02b', '08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2ea2382af618ba7d1e80491a0185fb8a', 'ee8626f80f7c2619917b6236f3a7f02b', 'f23d9bfff4d9aa6b68569ba2cff38415', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2fcfa2ac3dcfadc7c67107dae9a0de6d', 'ee8626f80f7c2619917b6236f3a7f02b', '73678f9daa45ed17a3674131b03432fb', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('2fdaed22dfa4c8d4629e44ef81688c6a', '52b0cf022ac4187b2a70dfa4f8b2d940', 'aedbf679b5773c1f25e9f7b10111da73', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('300c462b7fec09e2ff32574ef8b3f0bd', '52b0cf022ac4187b2a70dfa4f8b2d940', '2a470fc0c3954d9dbb61de6d80846549', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('35ac7cae648de39eb56213ca1b649713', '52b0cf022ac4187b2a70dfa4f8b2d940', 'b1cb0a3fedf7ed0e4653cb5a229837ee', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('37112f4d372541e105473f18da3dc50d', 'ee8626f80f7c2619917b6236f3a7f02b', 'a400e4f4d54f79bf5ce160ae432231af', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('37789f70cd8bd802c4a69e9e1f633eaa', 'ee8626f80f7c2619917b6236f3a7f02b', 'ae4fed059f67086fd52a73d913cf473d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('381504a717cb3ce77dcd4070c9689a7e', 'ee8626f80f7c2619917b6236f3a7f02b', '4f84f9400e5e92c95f05b554724c2b58', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('3e563751942b0879c88ca4de19757b50', '1750a8fb3e6d90cb7957c02de1dc8e59', '58857ff846e61794c69208e9d3a85466', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('412e2de37a35b3442d68db8dd2f3c190', '52b0cf022ac4187b2a70dfa4f8b2d940', 'f1cb187abf927c88b89470d08615f5ac', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('4204f91fb61911ba8ce40afa7c02369f', 'f6817f48af4fb3af11b9e8bf182f618b', '3f915b2769fc80648e92d04e84ca059d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('44b5a73541bcb854dd5d38c6d1fb93a1', 'ee8626f80f7c2619917b6236f3a7f02b', '418964ba087b90a84897b62474496b93', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('4d56ce2f67c94b74a1d3abdbea340e42', 'ee8626f80f7c2619917b6236f3a7f02b', 'd86f58e7ab516d3bc6bfb1fe10585f97', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('4faad8ff93cb2b5607cd3d07c1b624ee', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '70b8f33da5f39de1981bf89cf6c99792', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('57c0b3a547b815ea3ec8e509b08948b3', '1750a8fb3e6d90cb7957c02de1dc8e59', '3f915b2769fc80648e92d04e84ca059d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('593ee05c4fe4645c7826b7d5e14f23ec', '52b0cf022ac4187b2a70dfa4f8b2d940', '8fb8172747a78756c11916216b8b8066', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('5affc85021fcba07d81c09a6fdfa8dc6', 'ee8626f80f7c2619917b6236f3a7f02b', '078f9558cdeab239aecb2bda1a8ed0d1', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('5fc194b709336d354640fe29fefd65a3', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '9ba60e626bf2882c31c488aba62b89f0', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('6451dac67ba4acafb570fd6a03f47460', 'ee8626f80f7c2619917b6236f3a7f02b', 'e3c13679c73a4f829bcff2aba8fd68b1', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('6c43fd3f10fdaf2a0646434ae68709b5', 'ee8626f80f7c2619917b6236f3a7f02b', '540a2936940846cb98114ffb0d145cb8', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('71a5f54a90aa8c7a250a38b7dba39f6f', 'ee8626f80f7c2619917b6236f3a7f02b', '8fb8172747a78756c11916216b8b8066', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588591820806', '16457350655250432', '5129710648430592', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588604403712', '16457350655250432', '5129710648430593', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588612792320', '16457350655250432', '40238597734928384', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588625375232', '16457350655250432', '57009744761589760', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588633763840', '16457350655250432', '16392452747300864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588637958144', '16457350655250432', '16392767785668608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('75002588650541056', '16457350655250432', '16439068543946752', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277779875336192', '496138616573952', '5129710648430592', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780043108352', '496138616573952', '5129710648430593', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780055691264', '496138616573952', '15701400130424832', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780064079872', '496138616573952', '16678126574637056', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780072468480', '496138616573952', '15701915807518720', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780076662784', '496138616573952', '15708892205944832', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780085051392', '496138616573952', '16678447719911424', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780089245696', '496138616573952', '25014528525733888', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780097634304', '496138616573952', '56898976661639168', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780135383040', '496138616573952', '40238597734928384', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780139577344', '496138616573952', '45235621697949696', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780147965952', '496138616573952', '45235787867885568', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780156354560', '496138616573952', '45235939278065664', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780164743168', '496138616573952', '43117268627886080', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780168937472', '496138616573952', '45236734832676864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780181520384', '496138616573952', '45237010692050944', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780189908992', '496138616573952', '45237170029465600', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780198297600', '496138616573952', '57009544286441472', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780206686208', '496138616573952', '57009744761589760', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780215074816', '496138616573952', '57009981228060672', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780219269120', '496138616573952', '56309618086776832', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780227657728', '496138616573952', '57212882168844288', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780236046336', '496138616573952', '61560041605435392', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780244434944', '496138616573952', '61560275261722624', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780257017856', '496138616573952', '61560480518377472', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780265406464', '496138616573952', '44986029924421632', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780324126720', '496138616573952', '45235228800716800', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780332515328', '496138616573952', '45069342940860416', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780340903937', '496138616573952', '5129710648430594', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780349292544', '496138616573952', '16687383932047360', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780357681152', '496138616573952', '16689632049631232', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780366069760', '496138616573952', '16689745006432256', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780370264064', '496138616573952', '16689883993083904', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780374458369', '496138616573952', '16690313745666048', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780387041280', '496138616573952', '5129710648430595', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780395429888', '496138616573952', '16694861252005888', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780403818496', '496138616573952', '16695107491205120', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780412207104', '496138616573952', '16695243126607872', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780420595712', '496138616573952', '75002207560273920', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780428984320', '496138616573952', '76215889006956544', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780433178624', '496138616573952', '76216071333351424', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780441567232', '496138616573952', '76216264070008832', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780449955840', '496138616573952', '76216459709124608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780458344448', '496138616573952', '76216594207870976', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780466733056', '496138616573952', '76216702639017984', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780475121664', '496138616573952', '58480609315524608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780483510272', '496138616573952', '61394706252173312', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780491898880', '496138616573952', '61417744146370560', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780496093184', '496138616573952', '76606430504816640', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780504481792', '496138616573952', '76914082455752704', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780508676097', '496138616573952', '76607201262702592', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780517064704', '496138616573952', '39915540965232640', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780525453312', '496138616573952', '41370251991977984', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780538036224', '496138616573952', '45264987354042368', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780546424832', '496138616573952', '45265487029866496', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780554813440', '496138616573952', '45265762415284224', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780559007744', '496138616573952', '45265886315024384', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780567396352', '496138616573952', '45266070000373760', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780571590656', '496138616573952', '41363147411427328', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780579979264', '496138616573952', '41363537456533504', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780588367872', '496138616573952', '41364927394353152', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780596756480', '496138616573952', '41371711400054784', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780605145088', '496138616573952', '41469219249852416', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780613533696', '496138616573952', '39916171171991552', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780621922304', '496138616573952', '39918482854252544', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780630310912', '496138616573952', '41373430515240960', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780718391296', '496138616573952', '41375330996326400', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780722585600', '496138616573952', '63741744973352960', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780730974208', '496138616573952', '42082442672082944', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780739362816', '496138616573952', '41376192166629376', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780747751424', '496138616573952', '41377034236071936', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780756140032', '496138616573952', '56911328312299520', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780764528640', '496138616573952', '41378916912336896', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780768722944', '496138616573952', '63482475359244288', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780772917249', '496138616573952', '64290663792906240', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780785500160', '496138616573952', '66790433014943744', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780789694464', '496138616573952', '42087054753927168', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780798083072', '496138616573952', '67027338952445952', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780806471680', '496138616573952', '67027909637836800', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780810665985', '496138616573952', '67042515441684480', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780823248896', '496138616573952', '67082402312228864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780827443200', '496138616573952', '16392452747300864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780835831808', '496138616573952', '16392767785668608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780840026112', '496138616573952', '16438800255291392', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780844220417', '496138616573952', '16438962738434048', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277780852609024', '496138616573952', '16439068543946752', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860062040064', '496138616573953', '5129710648430592', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860070428672', '496138616573953', '5129710648430593', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860078817280', '496138616573953', '40238597734928384', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860091400192', '496138616573953', '43117268627886080', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860099788800', '496138616573953', '57009744761589760', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860112371712', '496138616573953', '56309618086776832', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860120760320', '496138616573953', '44986029924421632', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860129148928', '496138616573953', '5129710648430594', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860141731840', '496138616573953', '5129710648430595', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860150120448', '496138616573953', '75002207560273920', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860158509056', '496138616573953', '58480609315524608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860162703360', '496138616573953', '76606430504816640', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860171091968', '496138616573953', '76914082455752704', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860179480576', '496138616573953', '76607201262702592', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860187869184', '496138616573953', '39915540965232640', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860196257792', '496138616573953', '41370251991977984', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860204646400', '496138616573953', '41363147411427328', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860208840704', '496138616573953', '41371711400054784', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860213035009', '496138616573953', '39916171171991552', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860221423616', '496138616573953', '39918482854252544', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860225617920', '496138616573953', '41373430515240960', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860234006528', '496138616573953', '41375330996326400', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860242395136', '496138616573953', '63741744973352960', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860250783744', '496138616573953', '42082442672082944', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860254978048', '496138616573953', '41376192166629376', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860263366656', '496138616573953', '41377034236071936', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860271755264', '496138616573953', '56911328312299520', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860313698304', '496138616573953', '41378916912336896', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860322086912', '496138616573953', '63482475359244288', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860326281216', '496138616573953', '64290663792906240', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860334669824', '496138616573953', '66790433014943744', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860343058432', '496138616573953', '42087054753927168', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860347252736', '496138616573953', '67027338952445952', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860351447041', '496138616573953', '67027909637836800', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860359835648', '496138616573953', '67042515441684480', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860364029952', '496138616573953', '67082402312228864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860368224256', '496138616573953', '16392452747300864', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860372418560', '496138616573953', '16392767785668608', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860376612865', '496138616573953', '16438800255291392', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860385001472', '496138616573953', '16438962738434048', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('77277860389195776', '496138616573953', '16439068543946752', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('7750f9be48ee09cd561fce718219a3e2', 'ee8626f80f7c2619917b6236f3a7f02b', '882a73768cfd7f78f3a37584f7299656', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('7a5d31ba48fe3fb1266bf186dc5f7ba7', '52b0cf022ac4187b2a70dfa4f8b2d940', '58857ff846e61794c69208e9d3a85466', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('7d2ea745950be3357747ec7750c31c57', 'ee8626f80f7c2619917b6236f3a7f02b', '2a470fc0c3954d9dbb61de6d80846549', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('7de42bdc0b8c5446b7d428c66a7abc12', '52b0cf022ac4187b2a70dfa4f8b2d940', '54dd5457a3190740005c1bfec55b1c34', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('7e19d90cec0dd87aaef351b9ff8f4902', '646c628b2b8295fbdab2d34044de0354', 'f9d3f4f27653a71c52faa9fb8070fbe7', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('83f704524b21b6a3ae324b8736c65333', 'ee8626f80f7c2619917b6236f3a7f02b', '7ac9eb9ccbde2f7a033cd4944272bf1e', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('84d32474316a43b01256d6644e6e7751', 'ee8626f80f7c2619917b6236f3a7f02b', 'ec8d607d0156e198b11853760319c646', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8703a2410cddb713c33232ce16ec04b9', 'ee8626f80f7c2619917b6236f3a7f02b', '1367a93f2c410b169faa7abcbad2f77c', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('885c1a827383e5b2c6c4f8ca72a7b493', 'ee8626f80f7c2619917b6236f3a7f02b', '4148ec82b6acd69f470bea75fe41c357', '', NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8a60df8d8b4c9ee5fa63f48aeee3ec00', '1750a8fb3e6d90cb7957c02de1dc8e59', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8b1e326791375f325d3e6b797753b65e', 'ee8626f80f7c2619917b6236f3a7f02b', '2dbbafa22cda07fa5d169d741b81fe12', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8ce1022dac4e558ff9694600515cf510', '1750a8fb3e6d90cb7957c02de1dc8e59', '08e6b9dc3c04489c8e1ff2ce6f105aa4', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8d848ca7feec5b7ebb3ecb32b2c8857a', '52b0cf022ac4187b2a70dfa4f8b2d940', '4148ec82b6acd69f470bea75fe41c357', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('8eec2c510f1ac9c5eee26c041b1f00ca', 'ee8626f80f7c2619917b6236f3a7f02b', '58857ff846e61794c69208e9d3a85466', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('903b790e6090414343502c6dc393b7c9', 'ee8626f80f7c2619917b6236f3a7f02b', 'de13e0f6328c069748de7399fcc1dbbd', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('90996d56357730e173e636b99fc48bea', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb07ca05a3e13674dbf6d3245956da2e', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('90e1c607a0631364eec310f3cc4acebd', 'ee8626f80f7c2619917b6236f3a7f02b', '4f66409ef3bbd69c1d80469d6e2a885e', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('9264104cee9b10c96241d527b2d0346d', '1750a8fb3e6d90cb7957c02de1dc8e59', '54dd5457a3190740005c1bfec55b1c34', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('980171fda43adfe24840959b1d048d4d', 'f6817f48af4fb3af11b9e8bf182f618b', 'd7d6e2e4e2934f2c9385a623fd98c6f3', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('98f02353f91dd569e3c6b8fd6b4f4034', 'ee8626f80f7c2619917b6236f3a7f02b', '6531cf3421b1265aeeeabaab5e176e6d', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('9d8772c310b675ae43eacdbc6c7fa04a', 'a799c3b1b12dd3ed4bd046bfaef5fe6e', '1663f3faba244d16c94552f849627d84', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('9f8311ecccd44e079723098cf2ffe1cc', '1750a8fb3e6d90cb7957c02de1dc8e59', '693ce69af3432bd00be13c3971a57961', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('a098e2acc3f90316f161f6648d085640', 'ee8626f80f7c2619917b6236f3a7f02b', 'e6bfd1fcabfd7942fdd05f076d1dad38', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('a66feaaf128417ad762e946abccf27ec', 'ee8626f80f7c2619917b6236f3a7f02b', 'c6cf95444d80435eb37b2f9db3971ae6', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('a7ab87eac0f8fafa2efa4b1f9351923f', 'ee8626f80f7c2619917b6236f3a7f02b', 'fedfbf4420536cacc0218557d263dfea', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('abdc324a2df9f13ee6e73d44c6e62bc8', 'ee8626f80f7c2619917b6236f3a7f02b', 'f1cb187abf927c88b89470d08615f5ac', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('aefc8c22e061171806e59cd222f6b7e1', '52b0cf022ac4187b2a70dfa4f8b2d940', 'e8af452d8948ea49d37c934f5100ae6a', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('b131ebeafcfd059f3c7e542606ea9ff5', 'ee8626f80f7c2619917b6236f3a7f02b', 'e5973686ed495c379d829ea8b2881fc6', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('b2b2dcfff6986d3d7f890ea62d474651', 'ee8626f80f7c2619917b6236f3a7f02b', '200006f0edf145a2b50eacca07585451', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('b495a46fa0e0d4637abe0db7fd12fe1a', 'ee8626f80f7c2619917b6236f3a7f02b', '717f6bee46f44a3897eca9abd6e2ec44', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('d37ad568e26f46ed0feca227aa9c2ffa', 'f6817f48af4fb3af11b9e8bf182f618b', '9502685863ab87f0ad1134142788a385', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('d3fe195d59811531c05d31d8436f5c8b', '1750a8fb3e6d90cb7957c02de1dc8e59', 'e8af452d8948ea49d37c934f5100ae6a', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('e258ca8bf7ee168b93bfee739668eb15', 'ee8626f80f7c2619917b6236f3a7f02b', 'fb367426764077dcf94640c843733985', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('e339f7db7418a4fd2bd2c113f1182186', 'ee8626f80f7c2619917b6236f3a7f02b', 'b1cb0a3fedf7ed0e4653cb5a229837ee', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('e3e922673f4289b18366bb51b6200f17', '52b0cf022ac4187b2a70dfa4f8b2d940', '45c966826eeff4c99b8f8ebfe74511fc', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('eb19ea10f5d311f0abad00155d056b00', '1600076470335246337', '2012375501376606210', NULL, '2026-01-20 15:43:24', '127.0.0.16');
INSERT INTO "sys_role_permission" VALUES ('eb1a1415f5d311f0abad00155d056b00', '1600076470335246337', '2012376076054974466', NULL, '2026-01-20 15:43:24', '127.0.0.17');
INSERT INTO "sys_role_permission" VALUES ('eb1a381bf5d311f0abad00155d056b00', '1600076470335246337', '1996422809213341698', NULL, '2026-01-20 15:43:24', '127.0.0.17');
INSERT INTO "sys_role_permission" VALUES ('ecdd72fe694e6bba9c1d9fc925ee79de', 'f6817f48af4fb3af11b9e8bf182f618b', '45c966826eeff4c99b8f8ebfe74511fc', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('f17ab8ad1e71341140857ef4914ef297', '21c5a3187763729408b40afb0d0fdfa8', '732d48f8e0abe99fe6a23d18a3171cd1', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('fd86f6b08eb683720ba499f9d9421726', 'ee8626f80f7c2619917b6236f3a7f02b', '693ce69af3432bd00be13c3971a57961', NULL, NULL, NULL);
INSERT INTO "sys_role_permission" VALUES ('fed41a4671285efb266cd404f24dd378', '52b0cf022ac4187b2a70dfa4f8b2d940', '00a2a0ae65cdca5e93209cdbde97cbe6', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS "sys_sms";
CREATE TABLE "sys_sms" (
"id" varchar(32) NOT NULL,
"es_title" varchar(100) NULL DEFAULT NULL,
"es_type" varchar(50) NULL DEFAULT NULL,
"es_receiver" varchar(50) NULL DEFAULT NULL,
"es_param" varchar(1000) NULL DEFAULT NULL,
"es_content" TEXT NULL,
"es_send_time" TIMESTAMP NULL DEFAULT NULL,
"es_send_status" varchar(1) NULL DEFAULT NULL,
"es_send_num" INTEGER NULL DEFAULT NULL,
"es_result" varchar(255) NULL DEFAULT NULL,
"remark" varchar(500) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_ss_es_type"("es_type"),
INDEX "idx_ss_es_receiver"("es_receiver"),
INDEX "idx_ss_es_send_time"("es_send_time"),
INDEX "idx_ss_es_send_status"("es_send_status")
) ;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------
INSERT INTO "sys_sms" VALUES ('402880e74dc2f361014dc2f8411e0001', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2015-06-05 17:06:01', '3', NULL, NULL, '认证失败错误的用户名或者密码', 'admin', '2015-06-05 17:05:59', 'admin', '2015-11-19 22:30:39');
INSERT INTO "sys_sms" VALUES ('402880ea533647b00153364e74770001', '发个问候', '3', 'admin', NULL, '你好', '2016-03-02 00:00:00', '2', NULL, NULL, NULL, 'admin', '2016-03-02 15:50:24', 'admin', '2018-07-05 19:53:01');
INSERT INTO "sys_sms" VALUES ('402880ee5a17e711015a17f3188e013f', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', NULL, '2', NULL, NULL, NULL, 'admin', '2017-02-07 17:41:31', 'admin', '2017-03-10 11:37:05');
INSERT INTO "sys_sms" VALUES ('402880f05ab649b4015ab64b9cd80012', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 11:38:13', 'admin', '2017-07-31 17:24:54');
INSERT INTO "sys_sms" VALUES ('402880f05ab7b035015ab7c4462c0004', '消息推送测试333', '2', '411944058@qq.com', NULL, '张三你好，你的订单4028d881436d514601436d521ae80165已付款!', '2017-11-16 15:58:15', '3', NULL, NULL, NULL, 'admin', '2017-03-10 18:29:37', NULL, NULL);
INSERT INTO "sys_sms" VALUES ('402881f3646a472b01646a4a5af00001', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-05 19:53:35', '2', NULL, NULL, NULL, 'admin', '2018-07-05 19:53:35', 'admin', '2018-07-07 13:45:24');
INSERT INTO "sys_sms" VALUES ('402881f3647da06c01647da43a940014', '催办：HR审批', '3', 'admin', NULL, 'admin，您好！\r\n请前待办任务办理事项！HR审批\r\n\r\n\r\n===========================\r\n此消息由系统发出', '2018-07-09 14:04:32', '2', NULL, NULL, NULL, 'admin', '2018-07-09 14:04:32', 'admin', '2018-07-09 18:51:30');

-- ----------------------------
-- Table structure for sys_sms_template
-- ----------------------------
DROP TABLE IF EXISTS "sys_sms_template";
CREATE TABLE "sys_sms_template" (
"id" varchar(32) NOT NULL,
"template_name" varchar(50) NULL DEFAULT NULL,
"template_code" varchar(32) NOT NULL,
"template_type" varchar(1) NOT NULL,
"template_category" varchar(10) NULL DEFAULT NULL,
"template_content" varchar(1000) NOT NULL,
"template_test_json" varchar(1000) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"use_status" varchar(1) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uk_sst_template_code"("template_code")
) ;

-- ----------------------------
-- Records of sys_sms_template
-- ----------------------------
INSERT INTO "sys_sms_template" VALUES ('1199606397416775681', '系统消息通知', 'sys_ts_note', '2', NULL, '<h1>&nbsp; &nbsp; 系统通知</h1>\n<ul>\n<li>通知时间：&nbsp; ${ts_date}</li>\n<li>通知内容：&nbsp; ${ts_content}</li>\n</ul>', NULL, '2019-11-27 16:30:27', 'admin', '2019-11-27 19:36:50', 'admin', NULL);
INSERT INTO "sys_sms_template" VALUES ('1199615897335095298', '流程催办', 'bpm_cuiban', '2', NULL, '<h1>&nbsp; &nbsp;流程催办提醒</h1>\n<ul>\n<li>流程名称：&nbsp; ${bpm_name}</li>\n<li>催办任务：&nbsp; ${bpm_task}</li>\n<li>催办时间 :&nbsp; &nbsp; ${TIMESTAMP}</li>\n<li>催办内容 :&nbsp; &nbsp; ${remark}</li>\n</ul>', NULL, '2019-11-27 17:08:12', 'admin', '2019-11-27 19:36:45', 'admin', NULL);
INSERT INTO "sys_sms_template" VALUES ('1199648914107625473', '流程办理超时提醒', 'bpm_chaoshi_tip', '2', NULL, '<h1>&nbsp; &nbsp;流程办理超时提醒</h1>\n<ul>\n<li>&nbsp; &nbsp;超时提醒信息：&nbsp; &nbsp; 您有待处理的超时任务，请尽快处理！</li>\n<li>&nbsp; &nbsp;超时任务标题：&nbsp; &nbsp; ${title}</li>\n<li>&nbsp; &nbsp;超时任务节点：&nbsp; &nbsp; ${task}</li>\n<li>&nbsp; &nbsp;任务处理人：&nbsp; &nbsp; &nbsp; &nbsp;${user}</li>\n<li>&nbsp; &nbsp;任务开始时间：&nbsp; &nbsp; ${time}</li>\n</ul>', NULL, '2019-11-27 19:19:24', 'admin', '2019-11-27 19:36:37', 'admin', NULL);
INSERT INTO "sys_sms_template" VALUES ('4028608164691b000164693108140003', '催办：${taskName}', 'SYS001', '1', NULL, '${userName}，您好！\r\n请前待办任务办理事项！${taskName}\r\n\r\n\r\n===========================\r\n此消息由系统发出', '{\r\n\"taskName\":\"HR审批\",\r\n\"userName\":\"admin\"\r\n}', '2018-07-05 14:46:18', 'admin', '2018-07-05 18:31:34', 'admin', NULL);

-- ----------------------------
-- Table structure for sys_table_white_list
-- ----------------------------
DROP TABLE IF EXISTS "sys_table_white_list";
CREATE TABLE "sys_table_white_list" (
"id" varchar(32) NOT NULL,
"table_name" varchar(100) NULL DEFAULT NULL,
"field_name" varchar(200) NULL DEFAULT NULL,
"status" varchar(10) NULL DEFAULT '1',
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_sys_table_white_list_table_name"("table_name")
) ;

-- ----------------------------
-- Records of sys_table_white_list
-- ----------------------------
INSERT INTO "sys_table_white_list" VALUES ('1701578033271521282', 'sys_user', 'phone,work_no,id,email,realname,username', '1', 'admin', '2023-09-12 10:46:32', 'admin', '2023-12-31 16:55:30');
INSERT INTO "sys_table_white_list" VALUES ('1701581935488385025', 'oa_officialdoc_organcode', 'id,organ_name', '1', 'admin', '2023-09-12 11:02:02', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701581977733414913', 'demo', 'id,name', '1', 'admin', '2023-09-12 11:02:12', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701582035472203777', 'sys_permission', 'id,name', '1', 'admin', '2023-09-12 11:02:26', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701582087619985409', 'onl_drag_comp', 'id,comp_name', '1', 'admin', '2023-09-12 11:02:38', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701582136420712450', 'sys_depart', 'id,org_code,depart_name', '1', 'admin', '2023-09-12 11:02:50', 'admin', '2023-10-18 09:36:40');
INSERT INTO "sys_table_white_list" VALUES ('1701582163599802370', 'design_form', 'id,desform_name,desform_code', '1', 'admin', '2023-09-12 11:02:56', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701582190187495426', 'onl_cgform_head', 'table_txt,table_name', '1', 'admin', '2023-09-12 11:03:03', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1701582254301626370', 'oa_wps_file', 'id,name', '1', 'admin', '2023-09-12 11:03:18', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1714453996678926338', 'onl_cgreport_head', 'code', '1', 'admin', '2023-10-18 09:31:00', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1714455418728337410', 'sys_category', 'id,name', '1', 'admin', '2023-10-18 09:36:40', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1714471625900564482', 'sys_position', 'name,id', '1', 'ceshi', '2023-10-18 10:41:04', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1769610154632491009', 'sys_dict', 'dict_code', '1', 'admin', '2024-03-18 14:21:53', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1778692300030484482', 'test_shoptype_tree', 'type_name,id', '1', 'admin', '2024-04-12 15:51:05', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1782650226206269441', 'sys_tenant', 'name,id', '1', 'admin', '2024-04-23 13:58:29', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1800712552062898178', 'tj_user_report', 'name,username', '1', 'admin', '2024-06-12 10:11:43', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1801076145102925826', 'sys_data_source', 'code,name', '1', 'admin', '2024-06-13 10:16:30', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1801097090085564420', 'sys_role', 'role_name,role_code', '1', 'jeecg', '2024-06-13 11:39:44', 'admin', '2024-09-10 11:47:35');
INSERT INTO "sys_table_white_list" VALUES ('1805416360756006913', 'wu_liao', 'wul_name,id', '1', 'admin', '2024-06-25 09:42:58', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1897919397122269185', 'ces_shop_type', 'name,pid,id,has_child', '1', 'admin', '2025-03-07 15:57:01', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1907407400953659394', 'airag_flow', 'name,id', '1', 'admin', '2025-04-02 20:18:57', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1907407401083682817', 'airag_model', 'name,id', '1', 'admin', '2025-04-02 20:18:57', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1950438522834546690', 'sys_sms_template', 'template_code', '1', 'admin', '2025-07-30 14:09:16', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1966817706103730178', 'sys_check_rule', 'rule_code', '1', 'admin', '2025-09-13 18:54:17', NULL, NULL);
INSERT INTO "sys_table_white_list" VALUES ('1993972426358153217', 'airag_knowledge', 'name,id', '1', 'admin', '2025-11-27 17:17:27', NULL, NULL);

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "sys_tenant";
CREATE TABLE "sys_tenant" (
"id" INTEGER NOT NULL,
"name" varchar(100) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"create_by" varchar(100) NULL DEFAULT NULL,
"begin_date" TIMESTAMP NULL DEFAULT NULL,
"end_date" TIMESTAMP NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT NULL,
"trade" varchar(10) NULL DEFAULT NULL,
"company_size" varchar(10) NULL DEFAULT NULL,
"company_address" varchar(100) NULL DEFAULT NULL,
"company_logo" varchar(200) NULL DEFAULT NULL,
"house_number" varchar(10) NULL DEFAULT NULL,
"work_place" varchar(100) NULL DEFAULT NULL,
"secondary_domain" varchar(50) NULL DEFAULT NULL,
"login_bkgd_img" varchar(200) NULL DEFAULT NULL,
"position" varchar(10) NULL DEFAULT NULL,
"department" varchar(10) NULL DEFAULT NULL,
"del_flag" SMALLINT NULL DEFAULT 0,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"apply_status" INTEGER NULL DEFAULT NULL,
PRIMARY KEY ("id")
) ;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO "sys_tenant" VALUES (1000, '北京国炬信息技术有限公司', '2023-03-09 19:55:11', 'jeecg', NULL, NULL, 1, NULL, NULL, NULL, 'temp/国炬软件logo_1764069407429.png', '2PI3U6', NULL, NULL, NULL, NULL, NULL, 0, 'admin', '2025-11-25 19:16:47', NULL);
INSERT INTO "sys_tenant" VALUES (1001, '北京敲敲云科技有限公司', '2023-10-18 13:37:19', 'ceshi', NULL, NULL, 1, NULL, NULL, NULL, '', 'EX33W8', NULL, NULL, NULL, NULL, NULL, 0, 'admin', '2024-03-18 11:19:28', NULL);

-- ----------------------------
-- Table structure for sys_tenant_pack
-- ----------------------------
DROP TABLE IF EXISTS "sys_tenant_pack";
CREATE TABLE "sys_tenant_pack" (
"id" varchar(32) NOT NULL,
"tenant_id" INTEGER NULL DEFAULT NULL,
"pack_name" varchar(20) NULL DEFAULT NULL,
"status" varchar(1) NULL DEFAULT NULL,
"remarks" varchar(100) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" date NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" date NULL DEFAULT NULL,
"pack_code" varchar(50) NULL DEFAULT NULL,
"pack_type" varchar(10) NULL DEFAULT 'custom',
"iz_sysn" varchar(1) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx__stp_tenant_id_pack_code"("tenant_id", "pack_code")
) ;

-- ----------------------------
-- Records of sys_tenant_pack
-- ----------------------------
INSERT INTO "sys_tenant_pack" VALUES ('1714517098074152962', 0, '默认套餐', '1', NULL, 'ceshi', '2023-10-18', 'admin', '2025-08-12', NULL, 'default', NULL);
INSERT INTO "sys_tenant_pack" VALUES ('1955184115322142722', 1000, '默认套餐', '1', NULL, 'ceshi', '2023-10-18', 'admin', '2025-08-12', NULL, 'custom', NULL);
INSERT INTO "sys_tenant_pack" VALUES ('1955187901394534401', 1000, '升级企业套餐', '1', NULL, 'admin', '2025-08-12', 'admin', '2025-08-12', NULL, 'custom', NULL);
INSERT INTO "sys_tenant_pack" VALUES ('1955222289125720066', 1001, '默认套餐', '1', NULL, 'ceshi', '2023-10-18', 'admin', '2025-08-12', NULL, 'custom', NULL);

-- ----------------------------
-- Table structure for sys_tenant_pack_perms
-- ----------------------------
DROP TABLE IF EXISTS "sys_tenant_pack_perms";
CREATE TABLE "sys_tenant_pack_perms" (
"id" varchar(32) NOT NULL,
"pack_id" varchar(32) NULL DEFAULT NULL,
"permission_id" varchar(32) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" date NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" date NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_stpp_pack_id"("pack_id")
) ;

-- ----------------------------
-- Records of sys_tenant_pack_perms
-- ----------------------------
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955183422662197249', '1714517098074152962', '1438108225451974658', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955184115389251585', '1955184115322142722', '1438108225451974658', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955187901482614785', '1955187901394534401', '1438108176273760258', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955187901503586305', '1955187901394534401', '1438108176814825473', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955187901516169218', '1955187901394534401', '1620709334357532673', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955187901528752129', '1955187901394534401', '9502685863ab87f0ad1134142788a385', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195388533358593', '1955187901394534401', '1438108187455774722', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195388600467458', '1955187901394534401', '1438108178911977473', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195388659187713', '1955187901394534401', '1438108183395688450', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195509216067585', '1955187901394534401', '1439398677984878593', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195509216067586', '1955187901394534401', '1438108225451974658', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195623284359170', '1955187901394534401', '1443390062919208961', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195663855861761', '1955187901394534401', '1438108183492157442', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955195717383569409', '1955187901394534401', '119213522910765570', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955221560482840577', '1714517098074152962', '1438108176273760258', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955221560617058305', '1714517098074152962', '9502685863ab87f0ad1134142788a385', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955221560617058306', '1714517098074152962', '1620709334357532673', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955221560617058307', '1714517098074152962', '1438108176814825473', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222179079766017', '1714517098074152962', '1438108187455774722', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222179146874881', '1714517098074152962', '1438108178911977473', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289125720067', '1955222289125720066', '1438108225451974658', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289125720068', '1955222289125720066', '1438108176273760258', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289125720069', '1955222289125720066', '9502685863ab87f0ad1134142788a385', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289125720070', '1955222289125720066', '1620709334357532673', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289125720071', '1955222289125720066', '1438108176814825473', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289188634625', '1955222289125720066', '1438108187455774722', 'admin', '2025-08-12', NULL, NULL);
INSERT INTO "sys_tenant_pack_perms" VALUES ('1955222289188634626', '1955222289125720066', '1438108178911977473', 'admin', '2025-08-12', NULL, NULL);

-- ----------------------------
-- Table structure for sys_tenant_pack_user
-- ----------------------------
DROP TABLE IF EXISTS "sys_tenant_pack_user";
CREATE TABLE "sys_tenant_pack_user" (
"id" varchar(32) NOT NULL,
"pack_id" varchar(32) NULL DEFAULT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_tpu_pack_id"("pack_id"),
INDEX "idx_tpu_user_id"("user_id"),
INDEX "idx_tpu_tenant_id"("tenant_id"),
INDEX "idx_tpu_status"("status")
) ;

-- ----------------------------
-- Records of sys_tenant_pack_user
-- ----------------------------
INSERT INTO "sys_tenant_pack_user" VALUES ('1633795234318729217', '1633795213938606082', 'a75d45a015c44384a04449ee80dc3503', 1, 'admin', '2023-03-09 19:41:53', NULL, NULL, 1);
INSERT INTO "sys_tenant_pack_user" VALUES ('1955184602037567490', '1955184115322142722', '1955183658394664962', 1000, 'admin', '2025-08-12 16:28:29', NULL, NULL, 1);
INSERT INTO "sys_tenant_pack_user" VALUES ('1955187972634787841', '1955187901394534401', '1955183658394664962', 1000, 'admin', '2025-08-12 16:41:53', NULL, NULL, 1);
INSERT INTO "sys_tenant_pack_user" VALUES ('1955222312760623107', '1955222289125720066', '1955218082645544962', 1001, 'admin', '2025-08-12 18:58:20', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_third_account
-- ----------------------------
DROP TABLE IF EXISTS "sys_third_account";
CREATE TABLE "sys_third_account" (
"id" varchar(32) NOT NULL,
"sys_user_id" varchar(32) NULL DEFAULT NULL,
"avatar" varchar(255) NULL DEFAULT NULL,
"status" SMALLINT NULL DEFAULT NULL,
"del_flag" SMALLINT NULL DEFAULT NULL,
"realname" varchar(100) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
"third_user_uuid" varchar(100) NULL DEFAULT NULL,
"third_user_id" varchar(100) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"third_type" varchar(50) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_stat_third_type_user_id"("third_type", "third_user_id"),
UNIQUE INDEX "uniq_sta_third_user_id_third_type"("third_user_id", "third_type", "tenant_id"),
UNIQUE INDEX "uniq_sta_third_user_uuid_third_type"("third_user_uuid", "third_type", "tenant_id")
) ;

-- ----------------------------
-- Records of sys_third_account
-- ----------------------------

-- ----------------------------
-- Table structure for sys_third_app_config
-- ----------------------------
DROP TABLE IF EXISTS "sys_third_app_config";
CREATE TABLE "sys_third_app_config" (
"id" varchar(32) NOT NULL,
"tenant_id" INTEGER NOT NULL DEFAULT 0,
"agent_id" varchar(20) NULL DEFAULT NULL,
"client_id" varchar(50) NULL DEFAULT NULL,
"client_secret" varchar(100) NULL DEFAULT NULL,
"corp_id" varchar(100) NULL DEFAULT NULL,
"third_type" varchar(20) NULL DEFAULT NULL,
"status" INTEGER NULL DEFAULT 1,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_stac_tenant_id"("tenant_id"),
INDEX "idx_stac_third_type"("third_type")
) ;

-- ----------------------------
-- Records of sys_third_app_config
-- ----------------------------
INSERT INTO "sys_third_app_config" VALUES ('1714477134884085762', 0, '1', '1', '1', NULL, 'dingtalk', 1, '2023-10-18 11:02:57', NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "sys_user";
CREATE TABLE "sys_user" (
"id" varchar(32) NOT NULL,
"username" varchar(100) NULL DEFAULT NULL,
"realname" varchar(100) NULL DEFAULT NULL,
"password" varchar(255) NULL DEFAULT NULL,
"salt" varchar(45) NULL DEFAULT NULL,
"avatar" varchar(255) NULL DEFAULT NULL,
"birthday" date NULL DEFAULT NULL,
"sex" SMALLINT NULL DEFAULT NULL,
"email" varchar(45) NULL DEFAULT NULL,
"phone" varchar(45) NULL DEFAULT NULL,
"org_code" varchar(64) NULL DEFAULT NULL,
"status" SMALLINT NULL DEFAULT NULL,
"del_flag" SMALLINT NULL DEFAULT NULL,
"third_id" varchar(100) NULL DEFAULT NULL,
"third_type" varchar(100) NULL DEFAULT NULL,
"activiti_sync" SMALLINT NULL DEFAULT NULL,
"work_no" varchar(100) NULL DEFAULT NULL,
"telephone" varchar(45) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
"user_identity" SMALLINT NULL DEFAULT NULL,
"depart_ids" varchar(1000) NULL DEFAULT NULL,
"client_id" varchar(64) NULL DEFAULT NULL,
"login_tenant_id" INTEGER NULL DEFAULT NULL,
"bpm_status" varchar(2) NULL DEFAULT NULL,
"sign_enable" SMALLINT NULL DEFAULT NULL,
"sign" varchar(500) NULL DEFAULT NULL,
"main_dep_post_id" varchar(32) NULL DEFAULT NULL,
"position_type" varchar(32) NULL DEFAULT NULL,
"last_pwd_update_time" TIMESTAMP NULL DEFAULT NULL,
"sort" INTEGER NULL DEFAULT NULL,
"iz_hide_contact" varchar(1) NULL DEFAULT NULL,
PRIMARY KEY ("id"),
UNIQUE INDEX "uniq_sys_user_work_no"("work_no"),
UNIQUE INDEX "uniq_sys_user_username"("username"),
UNIQUE INDEX "uniq_sys_user_phone"("phone"),
UNIQUE INDEX "uniq_sys_user_email"("email"),
INDEX "idx_su_status"("status"),
INDEX "idx_su_del_flag"("del_flag"),
INDEX "idx_su_del_username"("username", "del_flag"),
INDEX "idx_su_main_dep_post_id"("main_dep_post_id")
) ;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "sys_user" VALUES ('1714471285016895490', 'ceshi', '测试用户', 'a9932bb12d2cbc5a', 'AF4vhXUz', NULL, '2024-04-11', NULL, 'winter@jeecg.org', '15201111112', NULL, 1, 0, NULL, NULL, 1, '123', NULL, 'admin', '2023-10-18 10:39:42', 'ceshi', '2025-05-08 16:11:05', 1, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, '2025-11-25 15:42:34', 1000, NULL);
INSERT INTO "sys_user" VALUES ('3d464b4ea0d2491aab8a7bde74c57e95', 'zhangsan', '张三', '02ea098224c7d0d2077c14b9a3a1ed16', 'x5xRdeKB', 'https://static.jeecg.com/temp/jmlogo_1606575041993.png', '2024-04-11', NULL, '111@1.com', '13426411111', '财务部', 1, 0, NULL, NULL, 1, '0005', NULL, 'admin', '2020-05-14 21:26:24', 'admin', '2024-04-26 13:25:37', 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-25 15:42:34', 1000, NULL);
INSERT INTO "sys_user" VALUES ('a75d45a015c44384a04449ee80dc3503', 'jeecg', 'jeecg', 'eee378a1258530cb', 'mIgiYJow', 'https://static.jeecg.com/temp/国炬软件logo_1606575029126.png', NULL, 1, '418799587@qq.com', '18611788525', 'A02A01', 1, 0, NULL, NULL, 1, '00002', NULL, 'admin', '2019-02-13 16:02:36', 'admin', '2023-10-18 13:51:36', 1, '', NULL, 1001, NULL, NULL, NULL, NULL, NULL, '2025-11-25 15:42:34', 1000, NULL);
INSERT INTO "sys_user" VALUES ('e9ca23d68d884d4ebb19d07889727dae', 'admin', '管理员', 'cb362cfeefbf3d8d', 'RCGTeGiH', 'https://static.jeecg.com/temp/国炬软件logo_1606575029126.png', '1986-02-01', 1, 'jeecg@163.com', '18611111111', 'A01A03', 1, 0, NULL, NULL, 1, '00001', NULL, NULL, '2019-06-21 17:54:10', 'admin', '2025-12-03 19:12:32', 2, '', NULL, 1000, NULL, 0, NULL, '', NULL, '2025-11-25 15:42:34', 1000, NULL);

-- ----------------------------
-- Table structure for sys_user_dep_post
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_dep_post";
CREATE TABLE "sys_user_dep_post" (
"id" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"dep_id" varchar(32) NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sudp_user_id"("user_id"),
INDEX "idx_sudp_dep_id"("dep_id"),
INDEX "idx_sudp_user_dep_id"("user_id", "dep_id")
) ;

-- ----------------------------
-- Records of sys_user_dep_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_depart
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_depart";
CREATE TABLE "sys_user_depart" (
"ID" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"dep_id" varchar(32) NULL DEFAULT NULL,
PRIMARY KEY ("ID"),
UNIQUE INDEX "idx_sud_user_dep_id"("user_id", "dep_id"),
INDEX "idx_sud_user_id"("user_id"),
INDEX "idx_sud_dep_id"("dep_id")
) ;

-- ----------------------------
-- Records of sys_user_depart
-- ----------------------------
INSERT INTO "sys_user_depart" VALUES ('1783729121915510785', '3d464b4ea0d2491aab8a7bde74c57e95', 'a7d7e77e06c84325a40932163adcdaa6');
INSERT INTO "sys_user_depart" VALUES ('1714519577067200514', 'a75d45a015c44384a04449ee80dc3503', 'a7d7e77e06c84325a40932163adcdaa6');
INSERT INTO "sys_user_depart" VALUES ('1f3a0267811327b9eca86b0cc2b956f3', 'bcbe1290783a469a83ae3bd8effe15d4', '5159cde220114246b045e574adceafe9');
INSERT INTO "sys_user_depart" VALUES ('1996175712356261891', 'e9ca23d68d884d4ebb19d07889727dae', '4f1765520d6346f9bd9c79e2479e5b12');

-- ----------------------------
-- Table structure for sys_user_position
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_position";
CREATE TABLE "sys_user_position" (
"id" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"position_id" varchar(32) NULL DEFAULT NULL,
"create_by" varchar(50) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(50) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sup_user_id"("user_id"),
INDEX "idx_sup_position_id"("position_id"),
INDEX "idx_sup_user_position_id"("user_id", "position_id")
) ;

-- ----------------------------
-- Records of sys_user_position
-- ----------------------------
INSERT INTO "sys_user_position" VALUES ('1920390985293144065', '1714471285016895490', '1185040064792571906', 'ceshi', '2025-05-08 16:11:05', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_role";
CREATE TABLE "sys_user_role" (
"id" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"role_id" varchar(32) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT 0,
PRIMARY KEY ("id"),
INDEX "idx_sur_user_id"("user_id"),
INDEX "idx_sur_role_id"("role_id"),
INDEX "idx_sur_user_role_id"("user_id", "role_id")
) ;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "sys_user_role" VALUES ('0ede6d23d53bc7dc990346ff14faabee', '3db4cf42353f4e868b7ccfeef90505d2', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('1714519577000091650', 'a75d45a015c44384a04449ee80dc3503', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('1714519577000091651', 'a75d45a015c44384a04449ee80dc3503', '1501570619841810433', 0);
INSERT INTO "sys_user_role" VALUES ('1783729121881956354', '3d464b4ea0d2491aab8a7bde74c57e95', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('1794912584001581058', 'a75d45a015c44384a04449ee80dc3503', '1169504891467464706', 0);
INSERT INTO "sys_user_role" VALUES ('1794912584001581059', 'a75d45a015c44384a04449ee80dc3503', '1169504891467464707', 0);
INSERT INTO "sys_user_role" VALUES ('1920390985230229505', '1714471285016895490', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('1996175712356261889', 'e9ca23d68d884d4ebb19d07889727dae', '1501570619841810433', 0);
INSERT INTO "sys_user_role" VALUES ('1996175712356261890', 'e9ca23d68d884d4ebb19d07889727dae', 'f6817f48af4fb3af11b9e8bf182f618b', 0);
INSERT INTO "sys_user_role" VALUES ('79d66ef7aa137cfa9957081a1483009d', '9a668858c4c74cf5a2b25ad9608ba095', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('b3ffd9311a1ca296c44e2409b547384f', '01b802058ea94b978a2c96f4807f6b48', '1', 0);
INSERT INTO "sys_user_role" VALUES ('be2639167ede09379937daca7fc3bb73', '526f300ab35e44faaed54a9fb0742845', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('e78d210d24aaff48e0a736e2ddff4cdc', '3e177fede453430387a8279ced685679', 'ee8626f80f7c2619917b6236f3a7f02b', 0);
INSERT INTO "sys_user_role" VALUES ('ee45d0343ecec894b6886effc92cb0b7', '4d8fef4667574b24a9ccfedaf257810c', 'f6817f48af4fb3af11b9e8bf182f618b', 0);
INSERT INTO "sys_user_role" VALUES ('f2922a38ba24fb53749e45a0c459adb3', '439ae3e9bcf7418583fcd429cadb1d72', '1', 0);
INSERT INTO "sys_user_role" VALUES ('f72c6190b0722e798147e73c776c6ac9', '439ae3e9bcf7418583fcd429cadb1d72', 'ee8626f80f7c2619917b6236f3a7f02b', 0);

-- ----------------------------
-- Table structure for sys_user_tenant
-- ----------------------------
DROP TABLE IF EXISTS "sys_user_tenant";
CREATE TABLE "sys_user_tenant" (
"id" varchar(32) NOT NULL,
"user_id" varchar(32) NULL DEFAULT NULL,
"tenant_id" INTEGER NULL DEFAULT NULL,
"status" varchar(1) NULL DEFAULT NULL,
"create_by" varchar(32) NULL DEFAULT NULL,
"create_time" TIMESTAMP NULL DEFAULT NULL,
"update_by" varchar(32) NULL DEFAULT NULL,
"update_time" TIMESTAMP NULL DEFAULT NULL,
PRIMARY KEY ("id"),
INDEX "idx_sut_user_id"("user_id"),
INDEX "idx_sut_tenant_id"("tenant_id"),
INDEX "idx_sut_user_rel_tenant"("user_id", "tenant_id"),
INDEX "idx_sut_status"("status"),
INDEX "idx_sut_userid_status"("user_id", "status")
) ;

-- ----------------------------
-- Records of sys_user_tenant
-- ----------------------------
INSERT INTO "sys_user_tenant" VALUES ('1955179797651038210', 'a75d45a015c44384a04449ee80dc3503', 1001, '1', 'admin', '2025-08-12 16:09:24', NULL, NULL);
INSERT INTO "sys_user_tenant" VALUES ('1955182032762126337', 'e9ca23d68d884d4ebb19d07889727dae', 1000, '1', 'admin', '2025-08-12 16:18:17', NULL, NULL);
INSERT INTO "sys_user_tenant" VALUES ('1955211766602534913', '1714471285016895490', 1001, '1', 'admin', '2025-08-12 18:16:26', NULL, NULL);
