CREATE TABLE ws_acreditacion
    (acr_clasepasaporte             VARCHAR2(20 BYTE),
    acr_nropasaporte               VARCHAR2(30 BYTE),
    acr_tipodiplomatico            VARCHAR2(50 BYTE),
    acr_codentidad                 VARCHAR2(10 BYTE),
    acr_nombrecompleto             VARCHAR2(400 BYTE),
    acr_nombres                    VARCHAR2(200 BYTE),
    acr_paterno                    VARCHAR2(100 BYTE),
    acr_materno                    VARCHAR2(100 BYTE),
    acr_cargopersona               VARCHAR2(300 BYTE),
    acr_categoria                  VARCHAR2(50 BYTE),
    acr_citesolacreditacion        VARCHAR2(150 BYTE),
    acr_fechacitesol               DATE,
    acr_fechallegadaalpais         DATE,
    acr_fechacese                  DATE,
    acr_proyecto                   VARCHAR2(150 BYTE),
    acr_num                        NUMBER,
    acr_lstope                     VARCHAR2(1 BYTE),
    acr_usuario                    VARCHAR2(50 BYTE),
    acr_fec                        DATE)
  NOPARALLEL
  LOGGING
/

