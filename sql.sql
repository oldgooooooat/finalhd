/*
 Navicat MySQL Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3307
 Source Schema         : final

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 09/05/2022 16:57:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `exam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `question_creator_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_score` int NULL DEFAULT 0,
  `exam_time_limit` int NOT NULL DEFAULT 0,
  `exam_switch` int NOT NULL DEFAULT 1,
  `exam_type` int NOT NULL DEFAULT 0,
  `exam_review` int NULL DEFAULT 1,
  `exam_start_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `exam_end_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`exam_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES ('0c7af7cbc3454ed1a8ba530e9f32f0aa', '测试', '测试', '288dbb53b93a4e7d892df8d88e5bdca8', 20, 4, 1, 0, 1, '2022-05-31 00:00:00', '2022-06-30 00:00:00', '2022-05-09 13:54:10', '2022-05-09 13:54:10');
INSERT INTO `exam` VALUES ('233b8e38935343adb773be9073ec7ea6', 'ces111', 'ces111', '288dbb53b93a4e7d892df8d88e5bdca8', 88, 3, 1, 0, 1, '2022-05-25 00:00:00', '2022-06-23 00:00:00', '2022-05-09 11:31:24', '2022-05-09 11:31:23');
INSERT INTO `exam` VALUES ('2979d0d494eb49e1b06734c263e19ec8', '随机考试', '随机考试', 'bc58cbc441d84ce7ab835e54f9d5303b', 20, 120, 2, 1, 0, '2022-04-08 13:24:21', '2025-01-01 13:24:21', '2022-04-08 13:24:21', '2022-05-05 09:31:22');
INSERT INTO `exam` VALUES ('485682a457e44170b039769505c58389', '语文期末考试', '语文期末考试', '288dbb53b93a4e7d892df8d88e5bdca8', 25, 60, 2, 0, 0, '2022-04-09 00:00:00', '2022-05-31 00:00:00', '2022-04-08 09:46:20', '2022-05-05 09:31:22');
INSERT INTO `exam` VALUES ('82b5a319f6aa404e907c6929c96ddf78', 'ces', 'ces', '288dbb53b93a4e7d892df8d88e5bdca8', 5, 1, 1, 0, 1, '2022-05-27 00:00:00', '2022-06-30 00:00:00', '2022-05-09 11:28:49', '2022-05-09 11:28:49');
INSERT INTO `exam` VALUES ('9a3a1408c0f3428f8a5ead3344b79a2d', '语文测试', '语文测试', '288dbb53b93a4e7d892df8d88e5bdca8', 20, 15, 2, 0, 0, '2022-04-08 00:00:00', '2022-05-18 00:00:00', '2022-04-08 14:06:51', '2022-05-05 09:31:22');
INSERT INTO `exam` VALUES ('a369a10240c740e2881120dd9369c2bd', 'ces', '3', '288dbb53b93a4e7d892df8d88e5bdca8', 36, 3, 2, 0, 1, '2022-05-09 00:00:00', '2022-06-30 00:00:00', '2022-05-09 11:29:39', '2022-05-09 11:41:29');
INSERT INTO `exam` VALUES ('c69a6dbd56094b7ab60094e1b566958e', '测试58', '测试58', '288dbb53b93a4e7d892df8d88e5bdca8', 65, 9, 2, 0, 1, '2022-05-02 00:00:00', '2022-06-30 00:00:00', '2022-05-09 11:45:12', '2022-05-09 11:45:15');
INSERT INTO `exam` VALUES ('cd52356d70fc4f998f4b5d5ab86c6b7a', '语文期中考试', '语文期中考试', '288dbb53b93a4e7d892df8d88e5bdca8', 20, 60, 3, 0, 0, '2022-04-01 00:00:00', '2022-05-31 00:00:00', '2022-04-08 09:46:55', '2022-05-05 09:31:22');
INSERT INTO `exam` VALUES ('d7373acae6f24d94a148a9c75d249a42', '语文期初考试', '语文期初考试', '288dbb53b93a4e7d892df8d88e5bdca8', 25, 60, 2, 0, 0, '2022-04-01 00:00:00', '2022-05-31 00:00:00', '2022-04-08 09:47:22', '2022-05-05 09:31:22');
INSERT INTO `exam` VALUES ('dfc7e6e052ba48df9e392a534117792f', '语文单元测试', '语文单元测试', '288dbb53b93a4e7d892df8d88e5bdca8', 20, 120, 2, 0, 0, '2022-04-07 00:00:00', '2022-05-31 00:00:00', '2022-04-08 10:39:38', '2022-05-05 10:28:25');
INSERT INTO `exam` VALUES ('fac534ace025405dac6472177f76d3be', '测试59', '6', '288dbb53b93a4e7d892df8d88e5bdca8', 144, 6, 2, 0, 1, '2022-05-01 00:00:00', '2022-06-30 00:00:00', '2022-05-09 11:40:18', '2022-05-09 11:42:05');

-- ----------------------------
-- Table structure for exam_question
-- ----------------------------
DROP TABLE IF EXISTS `exam_question`;
CREATE TABLE `exam_question`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `question_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question
-- ----------------------------
INSERT INTO `exam_question` VALUES ('01a6406a8eeb47a1ae3a621f339ad457', 'cd52356d70fc4f998f4b5d5ab86c6b7a', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('02ce59445ab04cb4b374c69d17bcc33b', '485682a457e44170b039769505c58389', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('0524f131dce54a548e536b08b9d48b7e', '485682a457e44170b039769505c58389', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('07e0b2b165684ac78a92f048d322e9ea', '0c7af7cbc3454ed1a8ba530e9f32f0aa', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('084b4adcff1f4affbb053d49f5172ba6', '233b8e38935343adb773be9073ec7ea6', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('0a18ed03195a45f5a19f29cddde4f88d', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('0ba1ec8a2eef49edbbcab186f4b3adc6', '2979d0d494eb49e1b06734c263e19ec8', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('0e5741824a0343489b6543b5b10e3a30', '1fdb75cae72940faa4871537deca6229', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('0ee9146d02bf41af83b98aba553419a9', '233b8e38935343adb773be9073ec7ea6', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('103a6160a9414e08982c317f9177cc86', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('10512cac0ac44f558e2fba06a3d09deb', 'f1423b34f92644b39b2bd8cd4fa50b1d', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('108313abf5974013a791b693fd9e5f6e', 'f1423b34f92644b39b2bd8cd4fa50b1d', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('1114fa399e34432a9fb71f2054b9a317', 'a369a10240c740e2881120dd9369c2bd', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('11def17e8f70441b89b33505077d3cf8', 'd7373acae6f24d94a148a9c75d249a42', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('12172bb740a8425199b2b466a19344b2', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('15aed9d5eb004defabf9567bbcfdb13e', 'a369a10240c740e2881120dd9369c2bd', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('18f8a41cf5994c59b074fa5570c7d2bf', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('1a417a141ead4d1db0395a8270f9f8c4', '6732ff09e7624fefa3e7028047aacd6a', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('1d29da819bd74be3bc4eafdfada264bf', 'f1423b34f92644b39b2bd8cd4fa50b1d', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('1d83cf7014d14b47b8cf616026d7a9ef', '233b8e38935343adb773be9073ec7ea6', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('2253e34a811e490ab8484bb704c87876', 'c69a6dbd56094b7ab60094e1b566958e', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('228c6d4632804112acb3b49848dd81d1', '74f09256de3f43a8be233f40f626caf8', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('23aefb30197f4326831af212459b0e5b', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('25aaea6f46f3406c982d55796ac833f8', 'dfc7e6e052ba48df9e392a534117792f', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('26a7e21a4e254b2e8ff4dd8eabecc390', '0c7af7cbc3454ed1a8ba530e9f32f0aa', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('2f5e3ed1f00b44efb87b31fb7c33654d', 'f1423b34f92644b39b2bd8cd4fa50b1d', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('33a2e215dd8a4ec48cfcbdc7a86cd0f3', 'cd52356d70fc4f998f4b5d5ab86c6b7a', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('3416ab119f89422c8408737b56d0b1af', '9a3a1408c0f3428f8a5ead3344b79a2d', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('3be301cdec174d1e97c06c32d6cfd118', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('3c54e46064ee45aaa637f9d2f157bb36', '233b8e38935343adb773be9073ec7ea6', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('3e988e9a3d95444dac6bc9b7becec870', '9a3a1408c0f3428f8a5ead3344b79a2d', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('3f5feed8cd06494a900372c283876d02', 'dfc7e6e052ba48df9e392a534117792f', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('3f66870807824283807b8e02c6431f3e', '2979d0d494eb49e1b06734c263e19ec8', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('4140ca6202024e349261f55ab9e795a8', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('4184a2b5b5d64ae3ab02ef21d948b1eb', '0c7af7cbc3454ed1a8ba530e9f32f0aa', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('497fcb0b006a4214b188b519a5023726', '485682a457e44170b039769505c58389', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('4b872e0ad8234f8c89c0851df63475bb', 'dfc7e6e052ba48df9e392a534117792f', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('50d0cefefccc478389b34b88fe9ec9ce', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('50f7076c8bdb445895cc0c18f45eeb93', '1fdb75cae72940faa4871537deca6229', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('565647afc54f4e30befde29efa1e84bb', '233b8e38935343adb773be9073ec7ea6', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('582254ea930e428388dbdfef1801553b', 'cd52356d70fc4f998f4b5d5ab86c6b7a', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('5cb31cbb743c473b8d4c600bec2258ca', 'c69a6dbd56094b7ab60094e1b566958e', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('5d0e999510b449569995ff2534d066d3', 'a369a10240c740e2881120dd9369c2bd', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('5f778839a3fc4f65bac1c302ad46faf4', '1fdb75cae72940faa4871537deca6229', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('6305914e470f4833ae0fd8ce9fe71fcb', '6732ff09e7624fefa3e7028047aacd6a', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('64c7d69b2aef42c6b4d5b22dfd894a0c', '1fdb75cae72940faa4871537deca6229', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('6ad7f395ef654a07addb2b0433eff28b', 'c69a6dbd56094b7ab60094e1b566958e', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('712fc0b7b392403fabadd043f5b0a210', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('7270d5da90124e2aa06e2410483ccc7a', '2979d0d494eb49e1b06734c263e19ec8', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('73d619a5c5074c8a9709a37677d47a26', '233b8e38935343adb773be9073ec7ea6', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('7488312f9b9e4817b37a73db67a46e59', 'c69a6dbd56094b7ab60094e1b566958e', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('7b416560bede49b18bd589b16001b302', '1fdb75cae72940faa4871537deca6229', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('7bbac77aae1e4b0a8d8a7dbd617cde2a', '559beccecdd5493c8854e33e8b7bd6bd', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('812875537d9e476fa2e6beb20a089c82', '233b8e38935343adb773be9073ec7ea6', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('8b4e9bfda3404b22888011604c12f7fc', 'd7373acae6f24d94a148a9c75d249a42', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('97d81a9cf04b49cc9ea30aa9415b1a61', '233b8e38935343adb773be9073ec7ea6', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('9a3fadabeebe4139924bc39fe1d91237', 'a369a10240c740e2881120dd9369c2bd', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('a6f8ad6552ab44619dcbc7ae69e5f2a1', '485682a457e44170b039769505c58389', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('aa25afaa4c0b40fdbe46270482f1a510', '233b8e38935343adb773be9073ec7ea6', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('b75af0072c4e41faa17ca955cf662a82', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('ba45bf849bff476e9387e98ca97b4560', '2979d0d494eb49e1b06734c263e19ec8', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('be261f52fa8c4c31af2232ae40f441ea', '6732ff09e7624fefa3e7028047aacd6a', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('beb7833dc83c4700a460bba7021329f2', '0c7af7cbc3454ed1a8ba530e9f32f0aa', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('c242e95fb0e84b589a49d57128e07c6c', '485682a457e44170b039769505c58389', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('c316e42ef52c4995854f8ff58912d160', 'c69a6dbd56094b7ab60094e1b566958e', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('c81ad5d2b24a40c6a506164e54afd41a', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('cc9ae571cf184f4a84d12f427b4b2ef2', '6732ff09e7624fefa3e7028047aacd6a', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('d17c77d7fa1f4b1a97b0d505b5341fce', '74f09256de3f43a8be233f40f626caf8', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('d2945049f87c464db719cb2c82f83085', '233b8e38935343adb773be9073ec7ea6', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('d3080932e7de46d1abda5d575945977e', 'a369a10240c740e2881120dd9369c2bd', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('d8328b3a02b2417b84d9057256e3818e', 'f1423b34f92644b39b2bd8cd4fa50b1d', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('dc9834b35f7b4f4e8307ecf982757ae2', '6732ff09e7624fefa3e7028047aacd6a', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('dd3e2753b1624b0e8cb57a5f81789996', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('ddab0b931ca540c6b464d22ea27770aa', '9a3a1408c0f3428f8a5ead3344b79a2d', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('de31c029b1df497e976b0058c86e51cb', 'cd52356d70fc4f998f4b5d5ab86c6b7a', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('e0d3b717ad5847f28f8de89afaf42ab0', 'dfc7e6e052ba48df9e392a534117792f', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('e1206046047346108da4c520a9fcc91f', '559beccecdd5493c8854e33e8b7bd6bd', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('e4c4ae3c320647bd8b55e14f345fe00c', '9a3a1408c0f3428f8a5ead3344b79a2d', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('e5700e8870f644d79488e5f1e003f858', 'd7373acae6f24d94a148a9c75d249a42', '4fd938bf1b1240cf9109c9083441c5e8');
INSERT INTO `exam_question` VALUES ('e99b7991264440b096555e96c8e060c2', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('e9a6ad7308924c1bb1a446b3fafd83ee', 'd7373acae6f24d94a148a9c75d249a42', '4e87c67b881e49c980cea6fb6ab5923f');
INSERT INTO `exam_question` VALUES ('ea343dedecac4bfaa4def75a4634b783', 'c69a6dbd56094b7ab60094e1b566958e', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('ec926681e8954217964d96568b2295b3', 'c69a6dbd56094b7ab60094e1b566958e', 'c0feb20f875341d18671b7834a9fb4bd');
INSERT INTO `exam_question` VALUES ('ecf5e1447e0344ef836fddd5a3f10165', '82b5a319f6aa404e907c6929c96ddf78', '5dce9aa6bfb44c4fa4b0908c8034abe8');
INSERT INTO `exam_question` VALUES ('f38653bfda334dc7838701f0eeb1de4f', 'd7373acae6f24d94a148a9c75d249a42', '337f9e7b0c3f4d76b3c4390d13a91e81');
INSERT INTO `exam_question` VALUES ('f727a0cc69d84a81a9162c8b9ed47064', '233b8e38935343adb773be9073ec7ea6', 'b9b7e710f19749c88616bf6b7c225e3b');
INSERT INTO `exam_question` VALUES ('fb5bad924170490d88f4ffd21d0d8867', 'fac534ace025405dac6472177f76d3be', 'f7a3d9fcbd534b94aaf4195bc18f850e');
INSERT INTO `exam_question` VALUES ('fcbad71eaeec496581b59f8616f13e38', 'f1423b34f92644b39b2bd8cd4fa50b1d', '88367e8fbee14c0793cd2af46eb05a27');
INSERT INTO `exam_question` VALUES ('fe6a2bfaf6904ed69e94a4fd42f5b987', 'c69a6dbd56094b7ab60094e1b566958e', 'c0feb20f875341d18671b7834a9fb4bd');

-- ----------------------------
-- Table structure for exam_question_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_question_record`;
CREATE TABLE `exam_question_record`  (
  `question_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的主键',
  `exam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `record_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `question_option_id` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '题目选项表的主键',
  `correct` int NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_question_record
-- ----------------------------
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '2979d0d494eb49e1b06734c263e19ec8', 'ec4b5ea46ea1497d8482f36182a99dff', '', 3);
INSERT INTO `exam_question_record` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '2979d0d494eb49e1b06734c263e19ec8', 'ec4b5ea46ea1497d8482f36182a99dff', '', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '2979d0d494eb49e1b06734c263e19ec8', 'ec4b5ea46ea1497d8482f36182a99dff', '', 3);
INSERT INTO `exam_question_record` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '2979d0d494eb49e1b06734c263e19ec8', 'ec4b5ea46ea1497d8482f36182a99dff', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '2979d0d494eb49e1b06734c263e19ec8', 'b4f8b73a496f454489f8befc5bce4a62', '4d5561493b1745ffa1d4b386f2370728', 1);
INSERT INTO `exam_question_record` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '2979d0d494eb49e1b06734c263e19ec8', 'b4f8b73a496f454489f8befc5bce4a62', 'd13807fa7aff41f48e9a640f5084efe5', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '2979d0d494eb49e1b06734c263e19ec8', 'b4f8b73a496f454489f8befc5bce4a62', '1399e830a54c49a496dccb2b9b1bee80', 1);
INSERT INTO `exam_question_record` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '2979d0d494eb49e1b06734c263e19ec8', 'b4f8b73a496f454489f8befc5bce4a62', '7da6fe7462b14a87a5063387686a2ebf', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '2979d0d494eb49e1b06734c263e19ec8', '9867d70d35be49eb86d64ad2001d81e7', '2718940e7f704ccc92e8d9e3da8d2471', 3);
INSERT INTO `exam_question_record` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '2979d0d494eb49e1b06734c263e19ec8', '9867d70d35be49eb86d64ad2001d81e7', 'd13807fa7aff41f48e9a640f5084efe5', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '2979d0d494eb49e1b06734c263e19ec8', '9867d70d35be49eb86d64ad2001d81e7', '1399e830a54c49a496dccb2b9b1bee80', 1);
INSERT INTO `exam_question_record` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '2979d0d494eb49e1b06734c263e19ec8', '9867d70d35be49eb86d64ad2001d81e7', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '2979d0d494eb49e1b06734c263e19ec8', 'cb401a8505fb4e60996c14c0e874fa77', '', 3);
INSERT INTO `exam_question_record` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '2979d0d494eb49e1b06734c263e19ec8', 'cb401a8505fb4e60996c14c0e874fa77', '', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '2979d0d494eb49e1b06734c263e19ec8', 'cb401a8505fb4e60996c14c0e874fa77', '', 3);
INSERT INTO `exam_question_record` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '2979d0d494eb49e1b06734c263e19ec8', 'cb401a8505fb4e60996c14c0e874fa77', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '2979d0d494eb49e1b06734c263e19ec8', '6f2a5040aa1e4e16ae834fce807f6281', '', 3);
INSERT INTO `exam_question_record` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '2979d0d494eb49e1b06734c263e19ec8', '6f2a5040aa1e4e16ae834fce807f6281', '', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '2979d0d494eb49e1b06734c263e19ec8', '6f2a5040aa1e4e16ae834fce807f6281', '', 3);
INSERT INTO `exam_question_record` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '2979d0d494eb49e1b06734c263e19ec8', '6f2a5040aa1e4e16ae834fce807f6281', '', 3);
INSERT INTO `exam_question_record` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8', 'dfc7e6e052ba48df9e392a534117792f', 'c0625f70659947e9917f8fccdd9e95ee', 'e4064a9f5447406b98ce371715e41a4c', 1);
INSERT INTO `exam_question_record` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', 'dfc7e6e052ba48df9e392a534117792f', 'c0625f70659947e9917f8fccdd9e95ee', '5ee0491a481743818aa25bfcb18bf2ad-97821b50275c4834ba5d209a283a283f', 2);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', 'dfc7e6e052ba48df9e392a534117792f', 'c0625f70659947e9917f8fccdd9e95ee', '2d59f10baedd4a64a87f4222839fb71d', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', 'dfc7e6e052ba48df9e392a534117792f', 'c0625f70659947e9917f8fccdd9e95ee', 'bf3a465212e04fe8a74621eacdf589ef', 3);
INSERT INTO `exam_question_record` VALUES ('88367e8fbee14c0793cd2af46eb05a27', '485682a457e44170b039769505c58389', 'bf5bc11f96a04eb7bc50b62848969985', NULL, 3);
INSERT INTO `exam_question_record` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8', '485682a457e44170b039769505c58389', 'bf5bc11f96a04eb7bc50b62848969985', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '485682a457e44170b039769505c58389', 'bf5bc11f96a04eb7bc50b62848969985', '', 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '485682a457e44170b039769505c58389', 'bf5bc11f96a04eb7bc50b62848969985', '', 3);
INSERT INTO `exam_question_record` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', '485682a457e44170b039769505c58389', 'bf5bc11f96a04eb7bc50b62848969985', NULL, 3);
INSERT INTO `exam_question_record` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8', 'd7373acae6f24d94a148a9c75d249a42', '9df8032771d94961b3fe461f218c8c0b', '', 3);
INSERT INTO `exam_question_record` VALUES ('88367e8fbee14c0793cd2af46eb05a27', 'd7373acae6f24d94a148a9c75d249a42', '9df8032771d94961b3fe461f218c8c0b', NULL, 3);
INSERT INTO `exam_question_record` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', 'd7373acae6f24d94a148a9c75d249a42', '9df8032771d94961b3fe461f218c8c0b', NULL, 3);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', 'd7373acae6f24d94a148a9c75d249a42', '9df8032771d94961b3fe461f218c8c0b', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', 'd7373acae6f24d94a148a9c75d249a42', '9df8032771d94961b3fe461f218c8c0b', '', 3);
INSERT INTO `exam_question_record` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '9a3a1408c0f3428f8a5ead3344b79a2d', '89a5df089d23418a83b41ee01ff2c894', '4d5561493b1745ffa1d4b386f2370728', 1);
INSERT INTO `exam_question_record` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '9a3a1408c0f3428f8a5ead3344b79a2d', '89a5df089d23418a83b41ee01ff2c894', '2d59f10baedd4a64a87f4222839fb71d', 3);
INSERT INTO `exam_question_record` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', '9a3a1408c0f3428f8a5ead3344b79a2d', '89a5df089d23418a83b41ee01ff2c894', '6b9117631cac4b7f936c4e3c35202516', 3);
INSERT INTO `exam_question_record` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8', '9a3a1408c0f3428f8a5ead3344b79a2d', '89a5df089d23418a83b41ee01ff2c894', '0f71a95f68df4b418739e65bcbade872', 3);

-- ----------------------------
-- Table structure for exam_record
-- ----------------------------
DROP TABLE IF EXISTS `exam_record`;
CREATE TABLE `exam_record`  (
  `record_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `exam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `answer_score` float NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_record
-- ----------------------------
INSERT INTO `exam_record` VALUES ('6f2a5040aa1e4e16ae834fce807f6281', '2979d0d494eb49e1b06734c263e19ec8', 0, '2022-04-25 15:12:41', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('89a5df089d23418a83b41ee01ff2c894', '9a3a1408c0f3428f8a5ead3344b79a2d', 5, '2022-05-07 13:55:02', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('9867d70d35be49eb86d64ad2001d81e7', '2979d0d494eb49e1b06734c263e19ec8', 5, '2022-04-25 15:01:15', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('9df8032771d94961b3fe461f218c8c0b', 'd7373acae6f24d94a148a9c75d249a42', 0, '2022-05-05 13:56:46', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('b4f8b73a496f454489f8befc5bce4a62', '2979d0d494eb49e1b06734c263e19ec8', 10, '2022-04-25 14:57:08', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('bf5bc11f96a04eb7bc50b62848969985', '485682a457e44170b039769505c58389', 0, '2022-05-05 13:56:22', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('c0625f70659947e9917f8fccdd9e95ee', 'dfc7e6e052ba48df9e392a534117792f', 7.5, '2022-04-28 09:16:58', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('cb401a8505fb4e60996c14c0e874fa77', '2979d0d494eb49e1b06734c263e19ec8', 0, '2022-04-25 15:07:12', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_record` VALUES ('ec4b5ea46ea1497d8482f36182a99dff', '2979d0d494eb49e1b06734c263e19ec8', 0, '2022-04-25 14:38:48', 'bc58cbc441d84ce7ab835e54f9d5303b');

-- ----------------------------
-- Table structure for exam_user
-- ----------------------------
DROP TABLE IF EXISTS `exam_user`;
CREATE TABLE `exam_user`  (
  `exam_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam_user
-- ----------------------------
INSERT INTO `exam_user` VALUES ('485682a457e44170b039769505c58389', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('cd52356d70fc4f998f4b5d5ab86c6b7a', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('d7373acae6f24d94a148a9c75d249a42', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('dfc7e6e052ba48df9e392a534117792f', '184513686d4841348fe324de13f6099c');
INSERT INTO `exam_user` VALUES ('dfc7e6e052ba48df9e392a534117792f', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('2979d0d494eb49e1b06734c263e19ec8', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('9a3a1408c0f3428f8a5ead3344b79a2d', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `exam_user` VALUES ('fac534ace025405dac6472177f76d3be', 'bc58cbc441d84ce7ab835e54f9d5303b');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的主键',
  `question_name` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的名字',
  `question_creator_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目创建者的用户id',
  `question_level_id` int NOT NULL DEFAULT 0 COMMENT '题目难易度级别',
  `question_type_id` int NOT NULL DEFAULT 0 COMMENT '题目的类型，比如单选、多选、判断等',
  `question_score` int NULL DEFAULT 0,
  `question_category` int NULL DEFAULT NULL,
  `question_description` longtext CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '题目额外的描述',
  `question_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的选项，用选项的id用-连在一起表示答案',
  `question_answer_option_ids` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目的答案，用选项的id用-连在一起表示答案',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `question_photos` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '考试题目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', '“近朱者赤，近墨者黑”所蕴含的道理和下列哪句话最相似？', '288dbb53b93a4e7d892df8d88e5bdca8', 2, 1, 5, 4, '“近朱者赤，近墨者黑”所蕴含的道理和下列哪句话最相似？', '4d5561493b1745ffa1d4b386f2370728-d08b2d40d802411a9a88b481b469b8ae-bf3a465212e04fe8a74621eacdf589ef-2718940e7f704ccc92e8d9e3da8d2471', '4d5561493b1745ffa1d4b386f2370728', '2022-04-08 09:35:07', '2022-04-08 09:35:06', '');
INSERT INTO `question` VALUES ('4e87c67b881e49c980cea6fb6ab5923f', '比喻句', '288dbb53b93a4e7d892df8d88e5bdca8', 1, 1, 5, 4, '下面不属于比喻句的一项是', '1399e830a54c49a496dccb2b9b1bee80-969af3f9c7404d15ae6c3e4d6ee0c332-faa53f54d4e84d9fbe9c876b68956d71-2d59f10baedd4a64a87f4222839fb71d', '1399e830a54c49a496dccb2b9b1bee80', '2022-04-08 08:53:06', '2022-04-08 08:53:05', '');
INSERT INTO `question` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', '下列作品出自李贽的是：', '288dbb53b93a4e7d892df8d88e5bdca8', 3, 2, 5, 4, '下列作品出自李贽的是：', '9408f286554e40ef8669921bf90f71aa-97821b50275c4834ba5d209a283a283f-b7f687e493844031800f5406f8b59b87-6b9117631cac4b7f936c4e3c35202516-5ee0491a481743818aa25bfcb18bf2ad', '9408f286554e40ef8669921bf90f71aa-97821b50275c4834ba5d209a283a283f', '2022-04-08 09:00:07', '2022-04-08 09:00:07', '');
INSERT INTO `question` VALUES ('5dce9aa6bfb44c4fa4b0908c8034abe8', '用部首查字法，“车”可查整个字；“币”可查起笔。', '288dbb53b93a4e7d892df8d88e5bdca8', 2, 3, 5, 4, '用部首查字法，“车”可查整个字；“币”可查起笔。', 'e4064a9f5447406b98ce371715e41a4c-0f71a95f68df4b418739e65bcbade872', 'e4064a9f5447406b98ce371715e41a4c', '2022-04-08 08:58:38', '2022-04-08 08:58:38', '');
INSERT INTO `question` VALUES ('88367e8fbee14c0793cd2af46eb05a27', '陆游现存诗歌有九千三百余首，是南宋诗坛第一大家。下列保存陆游诗歌的文集有', '288dbb53b93a4e7d892df8d88e5bdca8', 3, 2, 5, 4, '陆游现存诗歌有九千三百余首，是南宋诗坛第一大家。下列保存陆游诗歌的文集有', 'ab0565329a1b49a8ab8c5027c1061bdf-b4b8d3dea8584271997f7938e68365fb-f0e014857a934e0f9cb3442ab89905b8-a630734899ca434fafe2cdfcfbaaa985-826c7178ea9d4ca5bbc33392c0743622', 'ab0565329a1b49a8ab8c5027c1061bdf-b4b8d3dea8584271997f7938e68365fb-f0e014857a934e0f9cb3442ab89905b8', '2022-04-08 09:01:26', '2022-04-08 09:01:26', '');
INSERT INTO `question` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', '“西施殿、北京、赖宁”这几个词的拼音，第一个字的声母要大写。', '288dbb53b93a4e7d892df8d88e5bdca8', 2, 3, 5, 4, '“西施殿、北京、赖宁”这几个词的拼音，第一个字的声母要大写。', '74bc5a4c598b439eaa7e732672531633-d13807fa7aff41f48e9a640f5084efe5', '74bc5a4c598b439eaa7e732672531633', '2022-04-08 08:57:13', '2022-04-08 08:58:47', '');
INSERT INTO `question` VALUES ('c0feb20f875341d18671b7834a9fb4bd', '词语不恰当', '288dbb53b93a4e7d892df8d88e5bdca8', 1, 1, 5, 4, '下列括号使用不恰当的一项是', '169c3d85d33a4d30b66544d1e2da7732-4322c1f1be9c4d6495b95f57510d26cd-7da6fe7462b14a87a5063387686a2ebf-ea03e0befe8a4979a1c46cbb8221e0a9', '169c3d85d33a4d30b66544d1e2da7732', '2022-04-08 08:55:47', '2022-04-08 08:55:47', '');
INSERT INTO `question` VALUES ('f7a3d9fcbd534b94aaf4195bc18f850e', '测试22222', '288dbb53b93a4e7d892df8d88e5bdca8', 1, 1, 16, 1, '测试2222', 'f82651e0b6f742fa8a264ee1b55c7962-b9a2d295ecf441cea51898411767e4f1', 'f82651e0b6f742fa8a264ee1b55c7962', '2022-05-06 10:50:38', '2022-05-06 10:50:38', '');

-- ----------------------------
-- Table structure for question_category
-- ----------------------------
DROP TABLE IF EXISTS `question_category`;
CREATE TABLE `question_category`  (
  `question_category_id` int NOT NULL AUTO_INCREMENT,
  `question_category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `question_category_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`question_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_category
-- ----------------------------
INSERT INTO `question_category` VALUES (1, '天文', '天文');
INSERT INTO `question_category` VALUES (2, '英文', '英文');
INSERT INTO `question_category` VALUES (3, '数学', '数学');
INSERT INTO `question_category` VALUES (4, '语文', '语文');
INSERT INTO `question_category` VALUES (5, '生物', '生物');

-- ----------------------------
-- Table structure for question_collection
-- ----------------------------
DROP TABLE IF EXISTS `question_collection`;
CREATE TABLE `question_collection`  (
  `questionid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question_collection
-- ----------------------------
INSERT INTO `question_collection` VALUES ('b9b7e710f19749c88616bf6b7c225e3b', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `question_collection` VALUES ('337f9e7b0c3f4d76b3c4390d13a91e81', 'bc58cbc441d84ce7ab835e54f9d5303b');
INSERT INTO `question_collection` VALUES ('4fd938bf1b1240cf9109c9083441c5e8', 'bc58cbc441d84ce7ab835e54f9d5303b');

-- ----------------------------
-- Table structure for question_option
-- ----------------------------
DROP TABLE IF EXISTS `question_option`;
CREATE TABLE `question_option`  (
  `question_option_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '题目选项表的主键',
  `question_option_content` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '选项的内容',
  `question_option_description` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '选项的额外描述，可以用于题目答案解析',
  PRIMARY KEY (`question_option_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '题目的选项' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of question_option
-- ----------------------------
INSERT INTO `question_option` VALUES ('0f71a95f68df4b418739e65bcbade872', '对', NULL);
INSERT INTO `question_option` VALUES ('1399e830a54c49a496dccb2b9b1bee80', '那时候大家简直好像马上就会看见他挥着手帕喊着：“喂！菲利普！”', NULL);
INSERT INTO `question_option` VALUES ('169c3d85d33a4d30b66544d1e2da7732', '因为我们的许多白人兄弟已经认识到，他们的命运与我们的命运时紧密相连的，……他们的自由与我们的自由时(休戚)相关的。', NULL);
INSERT INTO `question_option` VALUES ('2718940e7f704ccc92e8d9e3da8d2471', '锲而不舍，金石可镂', NULL);
INSERT INTO `question_option` VALUES ('2d59f10baedd4a64a87f4222839fb71d', '竹山门啊，你是耸立在我国近代史上一座血染的丰碑！', NULL);
INSERT INTO `question_option` VALUES ('4322c1f1be9c4d6495b95f57510d26cd', '我们共和国的缔造者草拟宪法和独立宣言的(气壮山河)的词句时，曾向每一个美国人许下了诺言……', NULL);
INSERT INTO `question_option` VALUES ('4d5561493b1745ffa1d4b386f2370728', '蓬生麻中，不扶而直', NULL);
INSERT INTO `question_option` VALUES ('5ee0491a481743818aa25bfcb18bf2ad', '《续焚烧书》', NULL);
INSERT INTO `question_option` VALUES ('6b9117631cac4b7f936c4e3c35202516', '《高太史全集》', NULL);
INSERT INTO `question_option` VALUES ('74bc5a4c598b439eaa7e732672531633', '对', NULL);
INSERT INTO `question_option` VALUES ('7da6fe7462b14a87a5063387686a2ebf', '我们认为这些真理是(不言而喻)的，人人生而平等。', NULL);
INSERT INTO `question_option` VALUES ('826c7178ea9d4ca5bbc33392c0743622', '《临川集》', NULL);
INSERT INTO `question_option` VALUES ('9408f286554e40ef8669921bf90f71aa', '《焚书》', NULL);
INSERT INTO `question_option` VALUES ('969af3f9c7404d15ae6c3e4d6ee0c332', '雨，像牛毛，像花针，像细丝，密密地斜织着。', NULL);
INSERT INTO `question_option` VALUES ('97821b50275c4834ba5d209a283a283f', '《藏书》', NULL);
INSERT INTO `question_option` VALUES ('a630734899ca434fafe2cdfcfbaaa985', '《乐章集》', NULL);
INSERT INTO `question_option` VALUES ('ab0565329a1b49a8ab8c5027c1061bdf', '《剑南诗稿》', NULL);
INSERT INTO `question_option` VALUES ('b4b8d3dea8584271997f7938e68365fb', '《放翁词》', NULL);
INSERT INTO `question_option` VALUES ('b7f687e493844031800f5406f8b59b87', '《西湖寻梦》', NULL);
INSERT INTO `question_option` VALUES ('b9a2d295ecf441cea51898411767e4f1', '22222222222222', NULL);
INSERT INTO `question_option` VALUES ('bf3a465212e04fe8a74621eacdf589ef', '公生明，偏生暗', NULL);
INSERT INTO `question_option` VALUES ('d08b2d40d802411a9a88b481b469b8ae', '青出于蓝，而胜于蓝', NULL);
INSERT INTO `question_option` VALUES ('d13807fa7aff41f48e9a640f5084efe5', '错', NULL);
INSERT INTO `question_option` VALUES ('e4064a9f5447406b98ce371715e41a4c', '错', NULL);
INSERT INTO `question_option` VALUES ('ea03e0befe8a4979a1c46cbb8221e0a9', '但有朝一日，那里的黑人男孩和女孩将能与白人男孩和女孩(情同骨肉)，携手并进。', NULL);
INSERT INTO `question_option` VALUES ('f0e014857a934e0f9cb3442ab89905b8', '《渭南文集》', NULL);
INSERT INTO `question_option` VALUES ('f82651e0b6f742fa8a264ee1b55c7962', '111111111111', NULL);
INSERT INTO `question_option` VALUES ('faa53f54d4e84d9fbe9c876b68956d71', '晋祠，真不愧为我国锦绣河山中一颗璀璨的明珠。', NULL);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` int NOT NULL,
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `menuname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hasThird` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `authority` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 'li-icon-xiangmuguanli', '问题管理', NULL, NULL, '2', 2);
INSERT INTO `t_menu` VALUES (2, 'icon-cat-skuQuery', '问题管理', 'N', 'questions/Question', NULL, NULL);
INSERT INTO `t_menu` VALUES (3, 'li-icon-xiangmuguanli', '答题', 'null', 'null', '4', 3);
INSERT INTO `t_menu` VALUES (4, 'icon-cat-skuQuery', '自由回答', 'N', 'answer/Answer', NULL, NULL);
INSERT INTO `t_menu` VALUES (5, 'li-icon-xiangmuguanli', '在线考试', NULL, NULL, '6-7', 3);
INSERT INTO `t_menu` VALUES (6, 'icon-cat-skuQuery', '在线考试', 'N', 'answer/Examanswer', NULL, NULL);
INSERT INTO `t_menu` VALUES (7, 'icon-cat-skuQuery', '随机考试', 'N', 'exam/Randomexam', NULL, NULL);
INSERT INTO `t_menu` VALUES (8, 'li-icon-xiangmuguanli', '考试管理', NULL, NULL, '9', 2);
INSERT INTO `t_menu` VALUES (9, 'icon-cat-skuQuery', '考试管理', 'N', 'exam/Exam', NULL, NULL);
INSERT INTO `t_menu` VALUES (10, 'li-icon-xiangmuguanli', '考试记录', NULL, NULL, '11-12-13', 3);
INSERT INTO `t_menu` VALUES (11, 'icon-cat-skuQuery', '考试记录', 'N', 'record/Examrecord', NULL, NULL);
INSERT INTO `t_menu` VALUES (12, 'icon-cat-skuQuery', '我的收藏', 'N', 'record/questioncollection', NULL, NULL);
INSERT INTO `t_menu` VALUES (13, 'icon-cat-skuQuery', '错题本', NULL, 'record/questionwrong', NULL, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` bigint NOT NULL COMMENT '角色id',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `nameZh` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色中文名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, 'admin', '管理员');
INSERT INTO `t_role` VALUES (2, 'teacher', '教师');
INSERT INTO `t_role` VALUES (3, 'student', '学生');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户id',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `classname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '昵称',
  `type` int NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('184513686d4841348fe324de13f6099c', '1013662939@qq.com', 'user1', '$2a$10$7pdfMLldPB93I2YHzBQ/B.5Yad5ruT.P84EbLv3465rigLQEci2r6', '计科18-2BJ', '张三', 3);
INSERT INTO `t_user` VALUES ('288dbb53b93a4e7d892df8d88e5bdca8', '2697055747@qq.com', '1', '$2a$10$Qe09srBUsAOtQpnKy/H5GOgacYBqnD1fdoZo6U1d.Jnu5fdowcogK', '计科', '教师', 2);
INSERT INTO `t_user` VALUES ('4e73c13e6a6e4eb980402bbc201897ea', '2697055747@qq.com', '14182404114', '$2a$10$7e.iypTAFXD4erbaBzD7Q.vmnfztP6rp211TyyLFqma/N4pPSZd0W', '计科18-2BJ', '老山羊', 3);
INSERT INTO `t_user` VALUES ('bc58cbc441d84ce7ab835e54f9d5303b', '2697055747@qq.com', 'user', '$2a$10$yowYin4yLKf6wzBkKgNgq.1FlY25olxch/vDDdp7MUwNvvo013Q9i', '计科18-2BJ', '章煜晨', 3);

SET FOREIGN_KEY_CHECKS = 1;
