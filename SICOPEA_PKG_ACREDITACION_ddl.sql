CREATE OR REPLACE 
PACKAGE pkg_acreditacion
IS
    TYPE cursortype IS REF CURSOR;

    -- To modify this template, edit file PKGSPEC.TXT in TEMPLATE
    -- directory of SQL Navigator
    --
    -- Purpose: Briefly explain the functionality of the package
    --
    -- MODIFICATION HISTORY
    -- Person      Date    Comments
    -- ---------   ------  ------------------------------------------
    -- Enter package declarations as shown below

    FUNCTION evalua (prm_eval IN NUMBER)
        RETURN VARCHAR2;

    FUNCTION versiona_acreditacion (prm_cod_acred   IN VARCHAR2,
                                    prm_cod_ent     IN VARCHAR2)
        RETURN NUMBER;

    FUNCTION versiona_entidad (prm_cod_ent IN VARCHAR2)
        RETURN NUMBER;

    FUNCTION modifica_acreditado (prm_cod_acred            IN VARCHAR2,
                                  prm_nombre               IN VARCHAR2,
                                  prm_cite                 IN VARCHAR2,
                                  prm_fec_cite             IN VARCHAR2,
                                  prm_cargo                IN VARCHAR2,
                                  prm_categoria            IN VARCHAR2,
                                  prm_fec_llegada          IN VARCHAR2,
                                  prm_fec_cese             IN VARCHAR2,
                                  prm_usu_reg              IN VARCHAR2,
                                  prm_cod_ent              IN VARCHAR2,
                                  prm_obs                  IN VARCHAR2,
                                  prm_tipoobs              IN VARCHAR2,
                                  prm_fecobs               IN VARCHAR2,
                                  prm_doc_identificacion   IN VARCHAR2,
                                  prm_tipo_doc             IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION modifica_entidad (prm_cod_ent    IN VARCHAR2,
                               prm_des_ent    IN VARCHAR2,
                               prm_usu_reg    IN VARCHAR2,
                               prm_dir_ent    IN VARCHAR2,
                               prm_tel_ent    IN VARCHAR2,
                               prm_fax_ent    IN VARCHAR2,
                               prm_mail_ent   IN VARCHAR2,
                               prm_tipo       IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION elimina_acreditado (prm_codacred   IN VARCHAR2,
                                 prm_codent     IN VARCHAR2,
                                 prm_usuario    IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION elimina_entidad (prm_codent    IN VARCHAR2,
                              prm_usuario   IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION registra_acreditado (prm_cod_acred            IN VARCHAR2,
                                  prm_nombre               IN VARCHAR2,
                                  prm_cite                 IN VARCHAR2,
                                  prm_fec_cite             IN VARCHAR2,
                                  prm_cargo                IN VARCHAR2,
                                  prm_categoria            IN VARCHAR2,
                                  prm_fec_llegada          IN VARCHAR2,
                                  prm_fec_cese             IN VARCHAR2,
                                  prm_usu_reg              IN VARCHAR2,
                                  prm_cod_ent              IN VARCHAR2,
                                  prm_doc_identificacion   IN VARCHAR2,
                                  prm_tipo_doc             IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION registra_entidad (prm_cod_ent    IN VARCHAR2,
                               prm_des_ent    IN VARCHAR2,
                               prm_dir_ent    IN VARCHAR2,
                               prm_tel_ent    IN VARCHAR2,
                               prm_fax_ent    IN VARCHAR2,
                               prm_mail_ent   IN VARCHAR2,
                               prm_usu_reg    IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION lista_acreditados_entidad (prm_encargado IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_entidades (prm_estado IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_entidad (prm_estado IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_responsables_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_acreditados_por_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_acreditados_por_entidad2 (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_acreditados_por_entidad3 (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION list2_acreditados_por_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION list2_acreditados_por_entidad2 (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION list2_acreditados_por_entidad3 (prm_entidad IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_acreditados_por_busqueda (prm_acreditado IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_log_acreditado (prm_codacred   IN VARCHAR2,
                                   prm_codent     IN VARCHAR2)
        RETURN cursortype;

    FUNCTION lista_log_acreditado2 (prm_codacred IN VARCHAR2)
        RETURN cursortype;

    FUNCTION devuelve_acreditado (prm_codacred   IN VARCHAR2,
                                  prm_codent     IN VARCHAR2)
        RETURN cursortype;

    FUNCTION devuelve_entidad (prm_usuario IN VARCHAR2)
        RETURN VARCHAR;

    FUNCTION devuelve_nombre_entidad (prm_usuario IN VARCHAR2)
        RETURN VARCHAR;

    FUNCTION devuelve_nombre_entidad2 (prm_codent IN VARCHAR2)
        RETURN VARCHAR;

    FUNCTION correlativo (prm_codent IN VARCHAR2)
        RETURN VARCHAR2;

    FUNCTION devuelve_tipofun (prm_cod IN VARCHAR2)
        RETURN VARCHAR;

    FUNCTION devuelve_estado_re (prm_cod IN VARCHAR2)
        RETURN VARCHAR;
END;                                                           -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY pkg_acreditacion
IS
    --
    -- To modify this template, edit file PKGBODY.TXT in TEMPLATE
    -- directory of SQL Navigator
    --
    -- Purpose: Briefly explain the functionality of the package body
    --
    -- MODIFICATION HISTORY
    -- Person      Date    Comments
    -- ---------   ------  ------------------------------------------
    -- Enter procedure, function bodies as shown below
    -- versiona el transito

    FUNCTION evalua (prm_eval IN NUMBER)
        RETURN VARCHAR2
    IS
        res   VARCHAR2 (50) := '';
    BEGIN
        IF prm_eval <= 2.5
        THEN
            res := 'LA CAPACITACION NO FUE EFICAZ';
        ELSE
            IF prm_eval > 2.5 AND prm_eval <= 3.5
            THEN
                res := 'SE REQUIERE REFORZAR LA CAPACITACION';
            ELSE
                IF prm_eval > 3.5
                THEN
                    res := 'SE EVIDENCIA LA EFICACIA DE LA CAPACITACION';
                END IF;
            END IF;
        END IF;



        RETURN res;
    END;



    FUNCTION versiona_acreditacion (prm_cod_acred   IN VARCHAR2,
                                    prm_cod_ent     IN VARCHAR2)
        RETURN NUMBER
    IS
        version   NUMBER (3) := 0;
    --prm_cod_ent := upper(prm_cod_ent);
    BEGIN
        SELECT   MAX (ver)
          INTO   version
          FROM   acreditacion
         WHERE   cod_acred = UPPER (prm_cod_acred) AND cod_ent = prm_cod_ent;

        UPDATE   acreditacion
           SET   ver = version + 1
         WHERE       cod_acred = prm_cod_acred
                 AND cod_ent = prm_cod_ent
                 AND ver = 0;

        RETURN (version + 1);
    END;

    FUNCTION versiona_entidad (prm_cod_ent IN VARCHAR2)
        RETURN NUMBER
    IS
        version   NUMBER (3) := 0;
    BEGIN
        SELECT   MAX (ver)
          INTO   version
          FROM   entidad
         WHERE   cod_ent = prm_cod_ent;

        UPDATE   entidad
           SET   ver = version + 1
         WHERE   cod_ent = prm_cod_ent AND ver = 0;

        RETURN (version + 1);
    END;

    FUNCTION modifica_acreditado (prm_cod_acred            IN VARCHAR2,
                                  prm_nombre               IN VARCHAR2,
                                  prm_cite                 IN VARCHAR2,
                                  prm_fec_cite             IN VARCHAR2,
                                  prm_cargo                IN VARCHAR2,
                                  prm_categoria            IN VARCHAR2,
                                  prm_fec_llegada          IN VARCHAR2,
                                  prm_fec_cese             IN VARCHAR2,
                                  prm_usu_reg              IN VARCHAR2,
                                  prm_cod_ent              IN VARCHAR2,
                                  prm_obs                  IN VARCHAR2,
                                  prm_tipoobs              IN VARCHAR2,
                                  prm_fecobs               IN VARCHAR2,
                                  prm_doc_identificacion   IN VARCHAR2,
                                  prm_tipo_doc             IN VARCHAR2)
        RETURN VARCHAR2
    IS
        res VARCHAR2 (50)
                := 'LOS DATOS FUERON MODIFICADOS SATISFACTORIAMENTE';
        imax        NUMBER (3);
        pcodigo     VARCHAR2 (50) := '0';
        pentidad    VARCHAR2 (10) := '0';
        pkey_year   VARCHAR2 (4) := '0';
        pkey_nber   VARCHAR2 (10) := '0';
    BEGIN
        SELECT   ac.cod_acred,
                 ac.cod_ent,
                 ac.key_year,
                 ac.key_nber
          INTO   pcodigo,
                 pentidad,
                 pkey_year,
                 pkey_nber
          FROM   acreditacion ac
         WHERE       ac.cod_acred = prm_cod_acred
                 AND ac.cod_ent = prm_cod_ent
                 AND ac.ver = 0
                 AND ac.lst_ope = 'U';

        IF (pcodigo <> 0 AND pentidad <> 0)
        THEN
            imax := versiona_acreditacion (pcodigo, pentidad);

            INSERT INTO acreditacion
              VALUES   (pcodigo,
                        prm_nombre,
                        prm_cite,
                        TO_DATE (prm_fec_cite, 'dd/mm/yyyy'),
                        prm_cargo,
                        prm_categoria,
                        TO_DATE (prm_fec_llegada, 'dd/mm/yyyy'),
                        DECODE (prm_fec_cese,
                                NULL, NULL,
                                TO_DATE (prm_fec_cese, 'dd/mm/yyyy')),
                        0,
                        'U',
                        prm_usu_reg,
                        SYSDATE,
                        pentidad,
                        pkey_year,
                        pkey_nber,
                        prm_tipoobs,
                        TO_DATE (prm_fecobs, 'dd/mm/yyyy'),
                        prm_obs,
                        prm_doc_identificacion,
                        prm_tipo_doc);

            COMMIT;
        END IF;

        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;


    FUNCTION modifica_entidad (prm_cod_ent    IN VARCHAR2,
                               prm_des_ent    IN VARCHAR2,
                               prm_usu_reg    IN VARCHAR2,
                               prm_dir_ent    IN VARCHAR2,
                               prm_tel_ent    IN VARCHAR2,
                               prm_fax_ent    IN VARCHAR2,
                               prm_mail_ent   IN VARCHAR2,
                               prm_tipo       IN VARCHAR2)
        RETURN VARCHAR2
    IS
        res VARCHAR2 (50)
                := 'LOS DATOS FUERON MODIFICADOS SATISFACTORIAMENTE';
        imax   NUMBER (3);
    BEGIN
        imax := versiona_entidad (prm_cod_ent);

        INSERT INTO entidad
          VALUES   (prm_cod_ent,
                    prm_des_ent,
                    'U',
                    0,
                    prm_usu_reg,
                    SYSDATE,
                    prm_dir_ent,
                    prm_tel_ent,
                    prm_fax_ent,
                    prm_mail_ent,
                    prm_tipo,
                    '104');

        COMMIT;



        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;



    FUNCTION elimina_acreditado (prm_codacred   IN VARCHAR2,
                                 prm_codent     IN VARCHAR2,
                                 prm_usuario    IN VARCHAR2)
        RETURN VARCHAR2
    IS
        res        VARCHAR2 (50) := 'CORRECTO';
        imax       NUMBER (3);
        pcodigo    VARCHAR2 (50) := '0';
        pentidad   VARCHAR2 (10) := '0';
    BEGIN
        SELECT   ac.cod_acred, ac.cod_ent
          INTO   pcodigo, pentidad
          FROM   acreditacion ac
         WHERE       ac.cod_acred = prm_codacred
                 AND ac.cod_ent = prm_codent
                 AND ac.ver = 0
                 AND ac.lst_ope = 'U';

        IF (pcodigo <> 0 AND pentidad <> 0)
        THEN
            imax := versiona_acreditacion (pcodigo, pentidad);

            INSERT INTO acreditacion (cod_acred,
                                      nombre,
                                      cite,
                                      fec_cite,
                                      cargo,
                                      categoria,
                                      fec_llegada,
                                      fec_cese,
                                      ver,
                                      lst_ope,
                                      usu_reg,
                                      fec_mod,
                                      cod_ent)
                SELECT   a.cod_acred,
                         a.nombre,
                         a.cite,
                         a.fec_cite,
                         a.cargo,
                         a.categoria,
                         a.fec_llegada,
                         a.fec_cese,
                         0,
                         'D',
                         prm_usuario,
                         SYSDATE,
                         a.cod_ent
                  FROM   acreditacion a
                 WHERE       a.cod_acred = pcodigo
                         AND a.cod_ent = pentidad
                         AND a.ver = imax;

            COMMIT;
        END IF;

        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;

    FUNCTION elimina_entidad (prm_codent    IN VARCHAR2,
                              prm_usuario   IN VARCHAR2)
        RETURN VARCHAR2
    IS
        res    VARCHAR2 (50) := 'SE ELIMINO CORRECTAMENTE EL REGISTRO';
        imax   NUMBER (3);
    BEGIN
        imax := versiona_entidad (prm_codent);

        INSERT INTO entidad (cod_ent,
                             des_ent,
                             lst_ope,
                             ver,
                             usu_reg,
                             fec_mod,
                             dir_ent,
                             tel_ent,
                             fax_ent,
                             mail_ent,
                             tipo)
            SELECT   a.cod_ent,
                     a.des_ent,
                     'D',
                     0,
                     prm_usuario,
                     SYSDATE,
                     a.dir_ent,
                     a.tel_ent,
                     a.fax_ent,
                     a.mail_ent,
                     a.tipo
              FROM   entidad a
             WHERE   a.cod_ent = prm_codent AND a.ver = imax;

        COMMIT;



        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;



    FUNCTION registra_acreditado (prm_cod_acred            IN VARCHAR2,
                                  prm_nombre               IN VARCHAR2,
                                  prm_cite                 IN VARCHAR2,
                                  prm_fec_cite             IN VARCHAR2,
                                  prm_cargo                IN VARCHAR2,
                                  prm_categoria            IN VARCHAR2,
                                  prm_fec_llegada          IN VARCHAR2,
                                  prm_fec_cese             IN VARCHAR2,
                                  prm_usu_reg              IN VARCHAR2,
                                  prm_cod_ent              IN VARCHAR2,
                                  prm_doc_identificacion   IN VARCHAR2,
                                  prm_tipo_doc             IN VARCHAR2)
        RETURN VARCHAR2
    IS
        -- Enter the procedure variables here. As shown below
        cont    VARCHAR2 (3) := '0';
        cont2   VARCHAR2 (3) := '0';
        res VARCHAR2 (50)
                := 'LOS DATOS FUERON REGISTRADOS SATISFACTORIAMENTE';
    BEGIN
        SELECT   COUNT ( * )
          INTO   cont
          FROM   acreditacion
         WHERE   cod_acred = prm_cod_acred AND cod_ent = prm_cod_ent;

        SELECT   COUNT ( * )
          INTO   cont2
          FROM   acreditacion a
         WHERE       nombre = prm_nombre
                 AND cod_ent = prm_cod_ent
                 AND ver = 0
                 AND lst_ope = 'U';


        IF cont = '0'
        THEN
            IF cont2 = '0'
            THEN
                INSERT INTO acreditacion
                  VALUES   (ide_acr.NEXTVAL,
                            prm_nombre,
                            prm_cite,
                            TO_DATE (prm_fec_cite, 'dd/mm/yyyy'),
                            prm_cargo,
                            prm_categoria,
                            TO_DATE (prm_fec_llegada, 'dd/mm/yyyy'),
                            DECODE (prm_fec_cese,
                                    NULL, NULL,
                                    TO_DATE (prm_fec_cese, 'dd/mm/yyyy')),
                            0,
                            'U',
                            prm_usu_reg,
                            SYSDATE,
                            prm_cod_ent,
                            TO_CHAR (SYSDATE, 'YYYY'),
                            correlativo (prm_cod_ent),
                            '0',
                            NULL,
                            '',
                            prm_doc_identificacion,
                            prm_tipo_doc);

                COMMIT;
            ELSE
                res := 'EL FUNCIONARIO YA FUE REGISTRADO EN ESTA ENTIDAD';
            END IF;
        ELSE
            res := 'EL CODIGO YA ESTA ASIGNADO A OTRA PERSONA';
        END IF;

        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;


    FUNCTION registra_entidad (prm_cod_ent    IN VARCHAR2,
                               prm_des_ent    IN VARCHAR2,
                               prm_dir_ent    IN VARCHAR2,
                               prm_tel_ent    IN VARCHAR2,
                               prm_fax_ent    IN VARCHAR2,
                               prm_mail_ent   IN VARCHAR2,
                               prm_usu_reg    IN VARCHAR2)
        RETURN VARCHAR2
    IS
        -- Enter the procedure variables here. As shown below
        cont   VARCHAR2 (3) := '0';
        res VARCHAR2 (50)
                := 'LOS DATOS FUERON REGISTRADOS SATISFACTORIAMENTE';
    BEGIN
        SELECT   COUNT ( * )
          INTO   cont
          FROM   entidad a
         WHERE   a.des_ent = prm_des_ent AND ver = 0 AND lst_ope = 'U';

        IF cont = '0'
        THEN
            INSERT INTO entidad
              VALUES   (ide_ent.NEXTVAL,
                        prm_des_ent,
                        'U',
                        0,
                        prm_usu_reg,
                        SYSDATE,
                        prm_dir_ent,
                        prm_tel_ent,
                        prm_fax_ent,
                        prm_mail_ent,
                        'EMB',
                        '104');

            COMMIT;
        ELSE
            res := 'ESTA INSTITUCION YA FUE CREADA';
        END IF;

        RETURN res;
    EXCEPTION
        WHEN OTHERS
        THEN
            ROLLBACK;
            RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    END;

    FUNCTION lista_acreditados_entidad (prm_encargado IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese
                FROM   acreditacion ac, usu_ent ue
               WHERE       ac.cod_ent = ue.cod_ent
                       AND ue.usuario = prm_encargado
                       AND ac.ver = 0
                       AND ue.ver = 0
                       AND ue.lst_ope = 'U'
                       AND ac.lst_ope = 'U'
            ORDER BY   ac.nombre;

        RETURN ct;
    END;

    FUNCTION lista_entidades (prm_estado IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   e.cod_ent,
                       e.des_ent,
                       e.dir_ent,
                       e.tel_ent,
                       e.fax_ent,
                       e.mail_ent,
                       e.tipo
                FROM   entidad e
               WHERE   e.lst_ope = 'U' AND e.ver = 0 AND e.cod_sector = '104'
            ORDER BY   e.des_ent;

        RETURN ct;
    END;

    FUNCTION lista_entidad (prm_estado IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   e.cod_ent, e.des_ent
                FROM   entidad e
               WHERE   e.lst_ope = 'U' AND e.ver = 0 AND e.cod_sector = '104'
            ORDER BY   e.des_ent;

        RETURN ct;
    END;



    FUNCTION lista_responsables_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   e.cod_ent,
                       e.des_ent,
                       e.dir_ent,
                       e.tel_ent,
                       e.fax_ent,
                       e.mail_ent
                FROM   entidad e
               WHERE   e.lst_ope = 'U' AND e.ver = 0
            ORDER BY   e.des_ent;

        RETURN ct;
    END;

    FUNCTION lista_acreditados_por_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
            ORDER BY   ac.nombre;

        RETURN ct;
    END;

    FUNCTION lista_acreditados_por_entidad2 (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
                       AND (CAST (ac.fec_cese - SYSDATE AS number) > 0
                            OR ac.fec_cese IS NULL)
            ORDER BY   ac.nombre;

        RETURN ct;
    END;

    FUNCTION lista_acreditados_por_entidad3 (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
                       AND CAST (ac.fec_cese - SYSDATE AS number) <= 0
            ORDER BY   ac.nombre;

        RETURN ct;
    END;



    FUNCTION list2_acreditados_por_entidad (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
                       AND ac.fec_cese IS NOT NULL
            ORDER BY   ac.nombre;

        RETURN ct;
    END;

    FUNCTION list2_acreditados_por_entidad2 (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
                       AND CAST (ac.fec_cese - SYSDATE AS number) > 0
                       AND ac.fec_cese IS NOT NULL
            ORDER BY   ac.nombre;

        RETURN ct;
    END;

    FUNCTION list2_acreditados_por_entidad3 (prm_entidad IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac
               WHERE       ac.cod_ent = prm_entidad
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
                       AND NOT (ac.cod_ent = 0)
                       AND CAST (ac.fec_cese - SYSDATE AS number) <= 0
                       AND ac.fec_cese IS NOT NULL
            ORDER BY   ac.nombre;

        RETURN ct;
    END;



    FUNCTION lista_acreditados_por_busqueda (prm_acreditado IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       en.des_ent AS entidad,
                       CASE
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 0
                           THEN
                               3
                           WHEN CAST (ac.fec_cese - SYSDATE AS number) < 20
                           THEN
                               2
                           ELSE
                               1
                       END
                FROM   acreditacion ac, entidad en
               WHERE       ac.cod_ent = en.cod_ent
                       AND en.ver = 0
                       AND en.lst_ope = 'U'
                       AND ac.nombre LIKE '%' || prm_acreditado || '%'
                       AND ac.ver = 0
                       AND ac.lst_ope = 'U'
            ORDER BY   ac.nombre;

        RETURN ct;
    END;


    FUNCTION lista_log_acreditado (prm_codacred   IN VARCHAR2,
                                   prm_codent     IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cite,
                       TO_CHAR (ac.fec_cite, 'DD/MM/YYYY'),
                       ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       ac.categoria,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       TO_CHAR (ac.fec_mod, 'DD/MM/YYYY HH24:MI'),
                       ac.usu_reg,
                       DECODE (
                           tipo_mod,
                           0,
                              'ACTUALIZACION - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           1,
                              'ASCENSO - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           2,
                              'CESE - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           ' ')
                FROM   acreditacion ac
               WHERE   ac.cod_ent = prm_codent AND ac.cod_acred = prm_codacred
            ORDER BY   ac.fec_mod DESC;

        RETURN ct;
    END;



    FUNCTION lista_log_acreditado2 (prm_codacred IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
              SELECT   ac.cite,
                       TO_CHAR (ac.fec_cite, 'DD/MM/YYYY'),
                       ac.cod_acred,
                       ac.nombre,
                       ac.cargo,
                       ac.categoria,
                       TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY') AS llegada,
                       DECODE (ac.fec_cese,
                               NULL, 'REPATRIADO',
                               TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'))
                           AS cese,
                       TO_CHAR (ac.fec_mod, 'DD/MM/YYYY HH24:MI'),
                       ac.usu_reg,
                       DECODE (
                           tipo_mod,
                           0,
                              'ACTUALIZACION - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           1,
                              'ASCENSO - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           2,
                              'CESE - '
                           || TO_CHAR (ac.fec_asc, 'DD/MM/YYYY')
                           || ' - '
                           || ac.observacion,
                           ' ')
                FROM   acreditacion ac
               WHERE   ac.cod_acred = prm_codacred
            ORDER BY   ac.fec_mod DESC;

        RETURN ct;
    END;



    --devuelve los datos del acreditado por el codigo

    FUNCTION devuelve_acreditado (prm_codacred   IN VARCHAR2,
                                  prm_codent     IN VARCHAR2)
        RETURN cursortype
    IS
        ct   cursortype;
    BEGIN
        OPEN ct FOR
            SELECT   ac.cite,
                     TO_CHAR (ac.fec_cite, 'DD/MM/YYYY'),
                     ac.cod_acred,
                     ac.nombre,
                     ac.cargo,
                     ac.categoria,
                     TO_CHAR (ac.fec_llegada, 'DD/MM/YYYY'),
                     TO_CHAR (ac.fec_cese, 'DD/MM/YYYY'),
                     NVL (
                         DECODE (ac.doc_identificacion,
                                 'Diplomatico', 'Diplom&aacute;tico',
                                 ac.doc_identificacion),
                         ' '),
                     NVL (ac.tipo_doc, ' ')
              FROM   acreditacion ac
             WHERE       ac.cod_acred = prm_codacred
                     AND ac.ver = 0
                     AND ac.lst_ope = 'U'
                     AND ac.cod_ent = prm_codent;

        RETURN ct;
    END;

    FUNCTION devuelve_entidad (prm_usuario IN VARCHAR2)
        RETURN VARCHAR
    IS
        res   VARCHAR (20);
    BEGIN
        SELECT   ue.cod_ent
          INTO   res
          FROM   usu_ent ue
         WHERE       ue.usuario = UPPER (prm_usuario)
                 AND ue.ver = 0
                 AND ue.lst_ope = 'U';

        RETURN res;
    END;



    FUNCTION devuelve_nombre_entidad (prm_usuario IN VARCHAR2)
        RETURN VARCHAR
    IS
        res   VARCHAR (100);
    BEGIN
        SELECT   UPPER (en.des_ent)
          INTO   res
          FROM   usu_ent ue, entidad en
         WHERE       ue.usuario = UPPER (prm_usuario)
                 AND ue.ver = 0
                 AND ue.lst_ope = 'U'
                 AND en.cod_ent = ue.cod_ent
                 AND en.ver = 0
                 AND en.lst_ope = 'U';

        RETURN res;
    END;


    FUNCTION devuelve_nombre_entidad2 (prm_codent IN VARCHAR2)
        RETURN VARCHAR
    IS
        res   VARCHAR (100);
    BEGIN
        SELECT   UPPER (en.des_ent)
          INTO   res
          FROM   entidad en
         WHERE   en.cod_ent = prm_codent AND en.ver = 0 AND en.lst_ope = 'U';

        RETURN res;
    END;

    -- Enter further code below as specified in the Package spec.

    -- registra correlativo

    FUNCTION correlativo (prm_codent IN VARCHAR2)
        RETURN VARCHAR2
    IS
        res   VARCHAR2 (9) := '1';
    BEGIN
        SELECT   DECODE (MAX (CAST (key_nber AS number)) + 1,
                         NULL, 1,
                         MAX (CAST (key_nber AS number)) + 1)
          INTO   res
          FROM   acreditacion
         WHERE   key_year = TO_CHAR (SYSDATE, 'YYYY');

        RETURN res;
    END;

    FUNCTION devuelve_tipofun (prm_cod IN VARCHAR2)
        RETURN VARCHAR
    IS
        res   VARCHAR (20);
    BEGIN
        SELECT   DECODE (a.fec_cese, NULL, 'repatriado', 'acreditado')
          INTO   res
          FROM   acreditacion a
         WHERE   a.cod_acred = prm_cod AND a.ver = 0 AND a.lst_ope = 'U';

        RETURN res;
    END;

    FUNCTION devuelve_estado_re (prm_cod IN VARCHAR2)
        RETURN VARCHAR
    IS
        res   VARCHAR (20);
    BEGIN
        SELECT   CASE
                     WHEN fec_mod <
                              TO_DATE ('16/11/2016 01:00',
                                       'dd/mm/yyyy HH24:MI')
                     THEN
                         'cancilleria'
                     ELSE
                         'aduana'
                 END
          INTO   res
          FROM   acreditacion a
         WHERE   a.cod_acred = prm_cod AND a.ver = 0 AND a.lst_ope = 'U';

        RETURN res;
    END;
END;
/

