CREATE OR REPLACE 
PACKAGE pkg_wscancilleria
  IS
    TYPE cursortype IS REF CURSOR;
FUNCTION registra_acreditado (prm_clasepasaporte        IN VARCHAR2,
                                  prm_nropasaporte          IN VARCHAR2,
                                  prm_tipodiplomatico       IN VARCHAR2,
                                  prm_codentidad            IN VARCHAR2,
                                  prm_nombrecompleto        IN VARCHAR2,
                                  prm_nombres               IN VARCHAR2,
                                  prm_paterno               IN VARCHAR2,
                                  prm_materno               IN VARCHAR2,
                                  prm_cargopersona          IN VARCHAR2,
                                  prm_categoria             IN VARCHAR2,
                                  prm_citesolacreditacion   IN VARCHAR2,
                                  prm_fechacitesol          IN VARCHAR2,
                                  prm_fechallegadaalpais    IN VARCHAR2,
                                  prm_fechacese             IN VARCHAR2,
                                  prm_proyecto              IN VARCHAR2)
        RETURN VARCHAR2;
FUNCTION registra_entidad (prm_codentidad      IN VARCHAR2,
                               prm_nombreentidad   IN VARCHAR2,
                               prm_direccion       IN VARCHAR2,
                               prm_telefono        IN VARCHAR2,
                               prm_fax             IN VARCHAR2,
                               prm_correo          IN VARCHAR2,
                               prm_tipoentidad     IN VARCHAR2)
        RETURN VARCHAR2;


END;
/

CREATE OR REPLACE 
PACKAGE BODY pkg_wscancilleria
/* Formatted on 30/05/2017 10:28:53 (QP5 v5.126) */
IS
    FUNCTION registra_acreditado (prm_clasepasaporte        IN VARCHAR2,
                                  prm_nropasaporte          IN VARCHAR2,
                                  prm_tipodiplomatico       IN VARCHAR2,
                                  prm_codentidad            IN VARCHAR2,
                                  prm_nombrecompleto        IN VARCHAR2,
                                  prm_nombres               IN VARCHAR2,
                                  prm_paterno               IN VARCHAR2,
                                  prm_materno               IN VARCHAR2,
                                  prm_cargopersona          IN VARCHAR2,
                                  prm_categoria             IN VARCHAR2,
                                  prm_citesolacreditacion   IN VARCHAR2,
                                  prm_fechacitesol          IN VARCHAR2,
                                  prm_fechallegadaalpais    IN VARCHAR2,
                                  prm_fechacese             IN VARCHAR2,
                                  prm_proyecto              IN VARCHAR2)
        RETURN VARCHAR2
    IS
    BEGIN
        INSERT INTO ws_acreditacion
          VALUES   (prm_clasepasaporte,
                    prm_nropasaporte,
                    prm_tipodiplomatico,
                    prm_codentidad,
                    prm_nombrecompleto,
                    prm_nombres,
                    prm_paterno,
                    prm_materno,
                    prm_cargopersona,
                    prm_categoria,
                    prm_citesolacreditacion,
                    prm_fechacitesol,
                    prm_fechallegadaalpais,
                    prm_fechacese,
                    prm_proyecto,
                    0,
                    'U',
                    'WS',
                    SYSDATE);

        COMMIT;

        RETURN 'OK';
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;

    FUNCTION registra_entidad (prm_codentidad      IN VARCHAR2,
                               prm_nombreentidad   IN VARCHAR2,
                               prm_direccion       IN VARCHAR2,
                               prm_telefono        IN VARCHAR2,
                               prm_fax             IN VARCHAR2,
                               prm_correo          IN VARCHAR2,
                               prm_tipoentidad     IN VARCHAR2)
        RETURN VARCHAR2
    IS
    BEGIN
        INSERT INTO ws_entidad
          VALUES   (prm_codentidad,
                    prm_nombreentidad,
                    prm_direccion,
                    prm_telefono,
                    prm_fax,
                    prm_correo,
                    prm_tipoentidad,
                    0,
                    'U',
                    'WS',
                    SYSDATE);


        RETURN 'OK';
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;
END;
/

