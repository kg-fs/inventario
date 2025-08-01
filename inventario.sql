CREATE DATABASE IF NOT EXISTS inventario
use inventario

-- tabla departamento 
CREATE TABLE department (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  details VARCHAR(100)
);

-- tabla cargo
CREATE TABLE cargo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  details VARCHAR(100)
);

-- tabla rol 
CREATE TABLE rol (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
);

-- tabla user
CREATE TABLE user (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  department_id INT NOT NULL,
  cargo_id INT NOT NULL,
  rol_id INT NOT NULL,
  estatus BOOLEAN DEFAULT TRUE,

  FOREIGN KEY (department_id) REFERENCES department(id),
  FOREIGN KEY (cargo_id) REFERENCES cargo(id),
  FOREIGN KEY (rol_id) REFERENCES rol(id)
);

-- tabla categoria
CREATE TABLE categoria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  status BOOLEAN DEFAULT TRUE
);

-- tabla equipo
CREATE TABLE equipo (
  id INT PRIMARY KEY AUTO_INCREMENT,
  codigo VARCHAR(50) NOT NULL,
  categoria_id INT NOT NULL,
  marca VARCHAR(50),
  modelo VARCHAR(50),
  details VARCHAR(100),
  mac VARCHAR(50),
  serial VARCHAR(50),
  pcname VARCHAR(50),
  observaciones VARCHAR(50),
  estatusfisico BOOLEAN DEFAULT TRUE,
  estatus BOOLEAN DEFAULT TRUE,

  FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- tabla asinaciones master
CREATE TABLE asignaciones_master (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATE NOT NULL,
  user_id INT NOT NULL,
  estatus BOOLEAN DEFAULT TRUE,

  FOREIGN KEY (user_id) REFERENCES user(id)
);

-- tabla asignacion detalles
CREATE TABLE asignacion_detalles (
  id INT PRIMARY KEY AUTO_INCREMENT,
  asignacion_master_id INT NOT NULL,
  equipo_id INT NOT NULL,

  FOREIGN KEY (asignacion_master_id) REFERENCES asignaciones_master(id),
  FOREIGN KEY (equipo_id) REFERENCES equipo(id)
);




