CREATE TABLE acreditacion
    (cod_acred                      VARCHAR2(10 BYTE),
    nombre                         VARCHAR2(400 BYTE),
    cite                           VARCHAR2(150 BYTE),
    fec_cite                       DATE,
    cargo                          VARCHAR2(300 BYTE),
    categoria                      VARCHAR2(10 BYTE),
    fec_llegada                    DATE,
    fec_cese                       DATE,
    ver                            NUMBER,
    lst_ope                        VARCHAR2(1 BYTE),
    usu_reg                        VARCHAR2(50 BYTE),
    fec_mod                        DATE,
    cod_ent                        VARCHAR2(10 BYTE),
    key_year                       VARCHAR2(4 BYTE),
    key_nber                       VARCHAR2(10 BYTE),
    tipo_mod                       VARCHAR2(1 BYTE),
    fec_asc                        DATE,
    observacion                    VARCHAR2(200 BYTE),
    doc_identificacion             VARCHAR2(30 BYTE),
    tipo_doc                       VARCHAR2(20 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE categorias
    (cod_cat                        VARCHAR2(30 BYTE),
    desc_categoria                 VARCHAR2(255 BYTE),
    valor_cif_bien                 NUMBER(*,0),
    tiempo_bien                    NUMBER(*,0),
    valor_cif_vehiculo             NUMBER(*,0),
    tiempo_vehiculo                NUMBER(*,0),
    cant_vehiculo                  NUMBER(*,0),
    lst_ope                        VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE doc_adjuntos
    (nro_sol                        VARCHAR2(30 BYTE) NOT NULL,
    nro_informe                    VARCHAR2(30 BYTE),
    cod_doc                        VARCHAR2(30 BYTE),
    emitido                        VARCHAR2(255 BYTE),
    nro_doc                        VARCHAR2(50 BYTE),
    fecha_doc                      DATE,
    orden                          NUMBER(*,0),
    imprimir                       VARCHAR2(2 BYTE),
    nro_ra_sol                     VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE doc_adjuntosaux
    (nro_sol                        VARCHAR2(30 BYTE) NOT NULL,
    nro_informe                    VARCHAR2(30 BYTE),
    cod_doc                        VARCHAR2(30 BYTE),
    emitido                        VARCHAR2(255 BYTE),
    nro_doc                        VARCHAR2(50 BYTE),
    fecha_doc                      DATE,
    orden                          NUMBER(*,0),
    imprimir                       VARCHAR2(2 BYTE),
    nro_ra_sol                     VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE entidad
    (cod_ent                        VARCHAR2(10 BYTE),
    des_ent                        VARCHAR2(200 BYTE),
    lst_ope                        VARCHAR2(1 BYTE),
    ver                            NUMBER,
    usu_reg                        VARCHAR2(50 BYTE),
    fec_mod                        DATE,
    dir_ent                        VARCHAR2(200 BYTE),
    tel_ent                        VARCHAR2(50 BYTE),
    fax_ent                        VARCHAR2(50 BYTE),
    mail_ent                       VARCHAR2(200 BYTE),
    tipo                           VARCHAR2(10 BYTE),
    cod_sector                     VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE habilitar_trans
    (nro_ra_sol                     VARCHAR2(30 BYTE) NOT NULL,
    motivo                         VARCHAR2(255 BYTE),
    user_mod                       VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE proyecto
    (cod_proy                       VARCHAR2(30 BYTE),
    desc_proy                      VARCHAR2(300 BYTE),
    cod_entidad                    VARCHAR2(30 BYTE),
    fch_ini_proy                   DATE,
    fch_fin_proy                   DATE,
    convenio_proy                  VARCHAR2(300 BYTE),
    lst_ope                        VARCHAR2(30 BYTE),
    ult_ver                        NUMBER,
    user_mod                       VARCHAR2(30 BYTE),
    fch_mod                        DATE)
  NOPARALLEL
  LOGGING
/

CREATE TABLE ret
    (user_mod                       VARCHAR2(55 BYTE),
    nro_ra_sol                     VARCHAR2(55 BYTE),
    categoria                      VARCHAR2(55 BYTE),
    cuota_anual                    VARCHAR2(55 BYTE),
    concedido                      VARCHAR2(55 BYTE),
    valor_liberado                 VARCHAR2(55 BYTE),
    saldo                          VARCHAR2(55 BYTE),
    total_liberado                 VARCHAR2(55 BYTE),
    parrafo1                       VARCHAR2(3000 BYTE),
    parrafo2                       VARCHAR2(3000 BYTE),
    parrafo3                       VARCHAR2(1500 BYTE),
    parrafo4                       VARCHAR2(1500 BYTE),
    parrafo5                       VARCHAR2(3000 BYTE),
    parrafo6                       VARCHAR2(1500 BYTE),
    parrafo7                       VARCHAR2(1500 BYTE),
    parrafo8                       VARCHAR2(1500 BYTE),
    aduana                         VARCHAR2(55 BYTE))
  NOPARALLEL
  LOGGING
/

COMMENT ON COLUMN ret.parrafo5 IS 'PRIMERO.-'
/
COMMENT ON COLUMN ret.parrafo6 IS 'SEGUNDO.-'
/
COMMENT ON COLUMN ret.parrafo7 IS 'TERCERO.-'
/
COMMENT ON COLUMN ret.parrafo8 IS 'CUARTO.-'
/
CREATE TABLE ret_informe
    (nro_informe_tec                VARCHAR2(55 BYTE) NOT NULL,
    parrafo01                      VARCHAR2(4000 BYTE),
    parrafo02                      VARCHAR2(4000 BYTE),
    parrafo03                      VARCHAR2(4000 BYTE),
    parrafo04                      VARCHAR2(4000 BYTE),
    parrafo05                      VARCHAR2(4000 BYTE),
    parrafo06                      VARCHAR2(4000 BYTE),
    parrafo07                      VARCHAR2(4000 BYTE),
    parrafo08                      VARCHAR2(4000 BYTE),
    parrafo09                      VARCHAR2(4000 BYTE),
    parrafo10                      VARCHAR2(4000 BYTE),
    parrafo11                      VARCHAR2(4000 BYTE),
    parrafo12                      VARCHAR2(4000 BYTE),
    parrafo13                      VARCHAR2(4000 BYTE),
    parrafo14                      VARCHAR2(4000 BYTE),
    parrafo15                      VARCHAR2(4000 BYTE))
  NOPARALLEL
  LOGGING
/

ALTER TABLE ret_informe
ADD CONSTRAINT pk_ret_informe PRIMARY KEY (nro_informe_tec)
USING INDEX
/

CREATE TABLE ret_resolucion
    (nro_informe_tec                VARCHAR2(55 BYTE) NOT NULL,
    parrafo01                      VARCHAR2(4000 BYTE),
    parrafo02                      VARCHAR2(4000 BYTE),
    parrafo03                      VARCHAR2(4000 BYTE),
    parrafo04                      VARCHAR2(4000 BYTE),
    parrafo05                      VARCHAR2(4000 BYTE),
    parrafo06                      VARCHAR2(4000 BYTE),
    parrafo07                      VARCHAR2(4000 BYTE),
    parrafo08                      VARCHAR2(4000 BYTE),
    parrafo09                      VARCHAR2(4000 BYTE),
    parrafo10                      VARCHAR2(4000 BYTE),
    parrafo11                      VARCHAR2(4000 BYTE),
    parrafo12                      VARCHAR2(4000 BYTE),
    parrafo13                      VARCHAR2(4000 BYTE),
    parrafo14                      VARCHAR2(4000 BYTE),
    parrafo15                      VARCHAR2(4000 BYTE))
  NOPARALLEL
  LOGGING
/

ALTER TABLE ret_resolucion
ADD CONSTRAINT pk_ret_resolucion PRIMARY KEY (nro_informe_tec)
USING INDEX
/

CREATE TABLE sector
    (cod_sector                     VARCHAR2(30 BYTE),
    desc_sector                    VARCHAR2(255 BYTE),
    lst_ope                        VARCHAR2(1 BYTE),
    nro_ra_anterior                VARCHAR2(30 BYTE),
    nro_informe_anterior           VARCHAR2(50 BYTE),
    nro_trans_anterior             VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE set_documentos
    (atd_cod                        VARCHAR2(4 BYTE),
    atd_dsc                        VARCHAR2(70 BYTE),
    atd_est                        VARCHAR2(1 BYTE),
    lst_ope                        VARCHAR2(1 BYTE),
    ult_ver                        NUMBER,
    user_mod                       VARCHAR2(30 BYTE),
    fch_mod                        DATE)
  NOPARALLEL
  LOGGING
/

CREATE TABLE sol_anh
    (nro_informe                    VARCHAR2(30 BYTE) NOT NULL,
    anh_tipo_imp                   VARCHAR2(3 BYTE) NOT NULL,
    anh_nit                        VARCHAR2(30 BYTE),
    anh_rzs                        VARCHAR2(255 BYTE),
    anh_rep_legal                  VARCHAR2(255 BYTE),
    anh_nro_matricula              VARCHAR2(30 BYTE),
    anh_direc_emp                  VARCHAR2(255 BYTE),
    anh_jefe                       VARCHAR2(55 BYTE) NOT NULL,
    user_mod                       VARCHAR2(30 BYTE) NOT NULL,
    fch_mod                        DATE NOT NULL,
    lst_ope                        VARCHAR2(1 BYTE) NOT NULL,
    ult_ver                        NUMBER(*,0) NOT NULL,
    anh_cargo                      VARCHAR2(255 BYTE),
    anh_entidad_dependiente        VARCHAR2(255 BYTE),
    hoja_ruta3                     VARCHAR2(50 BYTE),
    fecha_hoja_ruta3               DATE)
  NOPARALLEL
  LOGGING
/

ALTER TABLE sol_anh
ADD CONSTRAINT pk_sol_anh PRIMARY KEY (nro_informe, lst_ope, ult_ver)
USING INDEX
/

COMMENT ON COLUMN sol_anh.anh_direc_emp IS 'DIRECCION DE LA EMPRESA'
/
COMMENT ON COLUMN sol_anh.anh_jefe IS 'JEJE USO PARA EL INFORME TECNICO'
/
COMMENT ON COLUMN sol_anh.anh_nit IS 'NUMERO DE NIT DE LA EMPRESA'
/
COMMENT ON COLUMN sol_anh.anh_nro_matricula IS 'NUMERO MATRICUAL DE LA EMPRESA'
/
COMMENT ON COLUMN sol_anh.anh_rep_legal IS 'PRPIETARIO O REPRESENTANTE LEGAL'
/
COMMENT ON COLUMN sol_anh.anh_rzs IS 'NOMBRE O RAZON SOCIAL DE LA EMPRESA'
/
COMMENT ON COLUMN sol_anh.anh_tipo_imp IS 'UNI: EMPRESA UNIPERSONAL; JUR: EMPRESA JURIDICA; PUB: EMPRESA PUBLICA'
/
COMMENT ON COLUMN sol_anh.fch_mod IS 'FECHA DE MODIFICACION'
/
COMMENT ON COLUMN sol_anh.lst_ope IS 'ESTADO'
/
COMMENT ON COLUMN sol_anh.nro_informe IS 'NRO RESOLUCION ADMINISTRATIVA'
/
COMMENT ON COLUMN sol_anh.ult_ver IS 'VERSIONAMIENTO'
/
COMMENT ON COLUMN sol_anh.user_mod IS 'USUARIO QUE REALIZO LA OPERACION'
/
CREATE TABLE sol_discapacitado
    (nro_informe                    VARCHAR2(30 BYTE) NOT NULL,
    dis_nom_conalpedis             VARCHAR2(200 BYTE),
    dis_cargo                      VARCHAR2(200 BYTE),
    dis_ci_nit                     VARCHAR2(50 BYTE),
    dis_razon_social               VARCHAR2(300 BYTE),
    dis_inf_tec_jur                VARCHAR2(50 BYTE),
    dis_fecha_inf_tec_jur          DATE,
    dis_jefe_uso                   VARCHAR2(55 BYTE),
    dis_hoja_ruta3                 VARCHAR2(50 BYTE),
    dis_fecha_hoja_ruta3           DATE,
    user_mod                       VARCHAR2(30 BYTE) NOT NULL,
    fch_mod                        DATE NOT NULL,
    lst_ope                        VARCHAR2(1 BYTE) NOT NULL,
    ult_ver                        NUMBER(*,0) NOT NULL)
  NOPARALLEL
  LOGGING
/

ALTER TABLE sol_discapacitado
ADD CONSTRAINT pk_sol_discapacitado PRIMARY KEY (nro_informe, lst_ope, ult_ver)
USING INDEX
/

CREATE TABLE sol_vih
    (nro_informe                    VARCHAR2(30 BYTE) NOT NULL,
    vih_tipo_imp                   VARCHAR2(3 BYTE) NOT NULL,
    vih_nit                        VARCHAR2(30 BYTE),
    vih_rzs                        VARCHAR2(255 BYTE),
    vih_rep_legal                  VARCHAR2(255 BYTE),
    vih_nro_matricula              VARCHAR2(30 BYTE),
    vih_direc_emp                  VARCHAR2(255 BYTE),
    vih_jefe                       VARCHAR2(55 BYTE) NOT NULL,
    user_mod                       VARCHAR2(30 BYTE) NOT NULL,
    fch_mod                        DATE NOT NULL,
    lst_ope                        VARCHAR2(1 BYTE) NOT NULL,
    ult_ver                        NUMBER(*,0) NOT NULL,
    vih_cargo                      VARCHAR2(255 BYTE),
    vih_entidad_dependiente        VARCHAR2(255 BYTE),
    vih_hoja_ruta3                 VARCHAR2(50 BYTE),
    vih_fecha_hoja_ruta3           DATE,
    vih_importador                 VARCHAR2(255 BYTE),
    vih_descripcion_bien           VARCHAR2(255 BYTE))
  NOPARALLEL
  LOGGING
/

ALTER TABLE sol_vih
ADD CONSTRAINT pk_sol_vih PRIMARY KEY (nro_informe, lst_ope, ult_ver)
USING INDEX
/

CREATE TABLE solicitud
    (cod_sol                        VARCHAR2(30 BYTE),
    nro_sol                        VARCHAR2(35 BYTE),
    cod_ent                        VARCHAR2(30 BYTE),
    cod_acred                      VARCHAR2(30 BYTE),
    cod_aduana                     VARCHAR2(30 BYTE),
    emp_cod                        VARCHAR2(30 BYTE),
    cod_tipo_bien                  VARCHAR2(30 BYTE),
    cant_sol                       VARCHAR2(50 BYTE),
    detalle_sol                    VARCHAR2(1000 BYTE),
    valor_cif_sol                  NUMBER(14,4),
    fecha_sol                      DATE,
    nro_ra_sol                     VARCHAR2(30 BYTE),
    url_archivo_sol                VARCHAR2(255 BYTE),
    cod_estado_sol                 VARCHAR2(30 BYTE),
    user_mod                       VARCHAR2(30 BYTE),
    lst_ope                        VARCHAR2(30 BYTE),
    fch_mod                        DATE,
    ult_ver                        NUMBER(*,0),
    obs_sol                        VARCHAR2(300 BYTE),
    hoja_ruta                      VARCHAR2(50 BYTE),
    fecha_ra                       DATE,
    valor_cif_liberado             NUMBER(14,4),
    cod_frv                        VARCHAR2(15 BYTE),
    peso_bruto_sol                 NUMBER(14,4),
    cod_cat                        VARCHAR2(30 BYTE) DEFAULT 0,
    cod_sector                     VARCHAR2(3 BYTE),
    nro_informe_tec                VARCHAR2(30 BYTE),
    fob_sol                        NUMBER(14,4),
    seguro_sol                     NUMBER(14,4),
    flete_i_sol                    NUMBER(14,4),
    flete_ii_sol                   NUMBER(14,4),
    gasto_port_sol                 NUMBER(14,4),
    otro_gasto_sol                 NUMBER(14,4),
    tipo_doc_sol                   VARCHAR2(30 BYTE),
    user_sol                       VARCHAR2(30 BYTE),
    importador_sol                 VARCHAR2(255 BYTE),
    cod_proy                       VARCHAR2(30 BYTE) DEFAULT 0,
    cif_saldo                      NUMBER(14,4) DEFAULT 0,
    fecha_hoja_ruta                DATE,
    sexo_acred                     VARCHAR2(30 BYTE),
    fecha_informe_tec              DATE,
    tipo_bulto                     VARCHAR2(30 BYTE),
    hoja_ruta2                     VARCHAR2(30 BYTE),
    fecha_hoja_ruta2               DATE,
    parrafo_adicional              VARCHAR2(4000 BYTE),
    inicial_tecnico                VARCHAR2(30 BYTE),
    peso_exacto                    VARCHAR2(30 BYTE),
    factura_emitido                VARCHAR2(500 BYTE),
    nro_ra_anterior                VARCHAR2(30 BYTE),
    fch_ra_anterior                DATE,
    nombre_tec                     VARCHAR2(50 BYTE),
    cargo_tec                      VARCHAR2(50 BYTE),
    parrafoit                      VARCHAR2(4000 BYTE),
    convenio                       VARCHAR2(255 BYTE),
    nomproy                        VARCHAR2(255 BYTE),
    nombre_acr                     VARCHAR2(255 BYTE),
    fch_emb                        DATE,
    sol_entidad                    VARCHAR2(200 BYTE))
  NOPARALLEL
  LOGGING
/

COMMENT ON COLUMN solicitud.cargo_tec IS 'CARGO TECNICO'
/
COMMENT ON COLUMN solicitud.cod_estado_sol IS 'P:PENDIENTE;A:APROBADO;O:OBSERVADO;F:FINALIZADO;M:RESOLUCION MANUAL'
/
COMMENT ON COLUMN solicitud.fch_emb IS 'FECHA DE EMBARQUE'
/
COMMENT ON COLUMN solicitud.fecha_sol IS 'FECHA DE SOLICITUD'
/
COMMENT ON COLUMN solicitud.inicial_tecnico IS 'INICIAL TECNICO'
/
COMMENT ON COLUMN solicitud.nombre_tec IS 'NOMBRE TECNICO'
/
CREATE TABLE solicitud_saldo
    (cod_saldo                      NUMBER NOT NULL,
    cod_acred                      VARCHAR2(30 BYTE) NOT NULL,
    saldo_acred                    NUMBER,
    cod_tipo_bien                  VARCHAR2(30 BYTE) NOT NULL,
    lst_ope                        VARCHAR2(1 BYTE),
    ult_ver                        NUMBER NOT NULL,
    fch_mod                        DATE)
  NOPARALLEL
  LOGGING
/

ALTER TABLE solicitud_saldo
ADD CONSTRAINT solicitud_saldo_pk PRIMARY KEY (cod_saldo, ult_ver)
USING INDEX
/

CREATE TABLE transferencia
    (nro_ra_sol                     VARCHAR2(30 BYTE),
    nro_ra_trans                   VARCHAR2(30 BYTE),
    poliza_trans                   VARCHAR2(255 BYTE),
    transferido_a                  VARCHAR2(255 BYTE),
    motivo_trans                   VARCHAR2(255 BYTE),
    url_archivos_trans             VARCHAR2(255 BYTE),
    lst_ope                        VARCHAR2(30 BYTE),
    fch_mod                        DATE,
    ult_ver                        NUMBER(*,0),
    hoja_ruta_trans                VARCHAR2(50 BYTE),
    fecha_trans                    DATE,
    fecha_ra_trans                 DATE,
    obs_trans                      VARCHAR2(255 BYTE),
    user_mod                       VARCHAR2(32 BYTE),
    cod_estado_sol                 VARCHAR2(30 BYTE),
    nro_nota_trans                 VARCHAR2(50 BYTE),
    fecha_nota_trans               DATE,
    nro_informe_tec                VARCHAR2(30 BYTE),
    fch_informe_tec                DATE,
    user_trans                     VARCHAR2(30 BYTE))
  NOPARALLEL
  LOGGING
/

CREATE TABLE usu_ent
    (usuario                        VARCHAR2(50 BYTE),
    cod_ent                        VARCHAR2(10 BYTE),
    ver                            NUMBER,
    lst_ope                        VARCHAR2(1 BYTE),
    usu_reg                        VARCHAR2(50 BYTE),
    fec_mod                        DATE)
  NOPARALLEL
  LOGGING
/

