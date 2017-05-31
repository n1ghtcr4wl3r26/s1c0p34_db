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
    tipo_doc                       VARCHAR2(20 BYTE),
    tipo_diplomatico               VARCHAR2(50 BYTE),
    proyecto                       VARCHAR2(150 BYTE))
  NOPARALLEL
  LOGGING
/

