CREATE TABLE ws_entidad
    (ent_codentidad                 VARCHAR2(10 BYTE),
    ent_nombreentidad              VARCHAR2(200 BYTE),
    ent_direccion                  VARCHAR2(200 BYTE),
    ent_telefono                   VARCHAR2(50 BYTE),
    ent_fax                        VARCHAR2(50 BYTE),
    ent_correo                     VARCHAR2(200 BYTE),
    ent_tipoentidad                VARCHAR2(10 BYTE),
    ent_num                        NUMBER,
    ent_lstope                     VARCHAR2(1 BYTE),
    ent_usuario                    VARCHAR2(50 BYTE),
    ent_fec                        DATE)
  NOPARALLEL
  LOGGING
/

