-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.25-0ubuntu0.18.04.2 - (Ubuntu)
-- OS do Servidor:               Linux
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela dvi_acl.modules
CREATE TABLE IF NOT EXISTS `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela dvi_acl.modules: ~1 rows (aproximadamente)
DELETE FROM `modules`;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` (`id`, `name`, `description`) VALUES
	(1, 'user', 'Gerenciamento de usuários');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

-- Copiando estrutura para tabela dvi_acl.module_actions
CREATE TABLE IF NOT EXISTS `module_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `action` enum('create','read','updated','delete') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_module_actions_modules` (`module_id`),
  CONSTRAINT `FK_module_actions_modules` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela dvi_acl.module_actions: ~4 rows (aproximadamente)
DELETE FROM `module_actions`;
/*!40000 ALTER TABLE `module_actions` DISABLE KEYS */;
INSERT INTO `module_actions` (`id`, `module_id`, `action`) VALUES
	(1, 1, 'create'),
	(2, 1, 'read'),
	(3, 1, 'updated'),
	(4, 1, 'delete');
/*!40000 ALTER TABLE `module_actions` ENABLE KEYS */;

-- Copiando estrutura para tabela dvi_acl.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela dvi_acl.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `login`, `password`) VALUES
	(1, 'admin', '123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Copiando estrutura para tabela dvi_acl.user_permissions
CREATE TABLE IF NOT EXISTS `user_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `module_action_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_permissions_users` (`user_id`),
  KEY `FK_user_permissions_module_actions` (`module_action_id`),
  CONSTRAINT `FK_user_permissions_module_actions` FOREIGN KEY (`module_action_id`) REFERENCES `module_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_user_permissions_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela dvi_acl.user_permissions: ~4 rows (aproximadamente)
DELETE FROM `user_permissions`;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` (`id`, `user_id`, `module_action_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 3),
	(4, 1, 4);
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
