CREATE TABLE `personal` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `venta`
ADD COLUMN `personal_id` INT NULL AFTER `inicial`;
