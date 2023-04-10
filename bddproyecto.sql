use bddproyecto;

CREATE TABLE domicilios (
    id_domicilio INT PRIMARY KEY AUTO_INCREMENT,
    calle VARCHAR(255),
    numero_exterior VARCHAR(50),
    numero_interior VARCHAR(50),
    colonia VARCHAR(255),
    codigo_postal VARCHAR(10),
    ciudad VARCHAR(255),
    estado VARCHAR(255),
    pais VARCHAR(255)
);

CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre_legal VARCHAR(50) NOT NULL,
    apellido_paterno VARCHAR(50) NOT NULL,
    apellido_materno VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    id_domicilio INT,
    hash_contraseña VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_domicilio) REFERENCES domicilios(id_domicilio)
);

CREATE TABLE expedientes_tua (
    id_expediente_tua INT PRIMARY KEY AUTO_INCREMENT,
    descripcion TEXT,
    fecha_creacion DATE,
    estado_actual ENUM('pendiente', 'en_proceso', 'finalizado') NOT NULL
);


CREATE TABLE demandas (
    id_demanda INT PRIMARY KEY AUTO_INCREMENT,
    demandante VARCHAR(255),
    demandado VARCHAR(255),
    descripcion TEXT,
    fecha_creacion DATE,
    id_expediente_tua INT,
    FOREIGN KEY (id_expediente_tua) REFERENCES expedientes_tua(id_expediente_tua)
);

CREATE TABLE documentos_demandas (
    id_documento_demanda INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255),
    documento BLOB NOT NULL,
    tipo VARCHAR(255),
    fecha_creacion DATE,
    id_demanda INT,
    FOREIGN KEY (id_demanda) REFERENCES demandas(id_demanda)
);

CREATE TABLE consultas (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    fecha_consulta DATE,
    id_expediente_tua INT,
    id_usuario INT,
    criterios_busqueda TEXT,
    FOREIGN KEY (id_expediente_tua) REFERENCES expedientes_tua(id_expediente_tua),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE roles (
    id_rol INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    es_tua BOOLEAN DEFAULT false,
    puede_consultar BOOLEAN DEFAULT true,
    puede_agregar BOOLEAN DEFAULT false,
    CONSTRAINT chk_puede_agregar CHECK ((es_tua AND puede_agregar) OR (NOT es_tua AND NOT puede_agregar))
);

CREATE TABLE usuarios_roles (
    id_usuario INT,
    id_rol INT,
    PRIMARY KEY (id_usuario, id_rol),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_rol) REFERENCES roles(id_rol)
);

CREATE TABLE agregar_documento (
    id_agregar_documento INT PRIMARY KEY AUTO_INCREMENT,
    id_documento_demanda INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_agregado DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_documento_demanda) REFERENCES documentos_demandas(id_documento_demanda),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
