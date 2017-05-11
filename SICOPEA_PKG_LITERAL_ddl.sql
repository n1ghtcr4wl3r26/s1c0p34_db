CREATE OR REPLACE 
PACKAGE pkg_literal
IS
   FUNCTION f_literal (pa_numero IN NUMBER)
      RETURN VARCHAR2;

   FUNCTION f_centenas (
      pa_digito      VARCHAR2,
      pa_anterior    VARCHAR2,
      pa_anterior2   VARCHAR2
   )
      RETURN VARCHAR2;

   FUNCTION f_decenas (pa_digito VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION f_decenas2 (pa_digito VARCHAR2, pa_anterior VARCHAR2)
      RETURN VARCHAR2;

   FUNCTION f_unidades (pa_digito VARCHAR2, pa_anterior NUMBER)
      RETURN VARCHAR2;
END pkg_literal;                                                     -- Package
/

CREATE OR REPLACE 
PACKAGE BODY pkg_literal
IS
   FUNCTION f_literal (pa_numero IN NUMBER)
      RETURN VARCHAR2
   IS
      vl_contador    NUMBER;
      vl_cont        NUMBER;
      vl_auxiliar    VARCHAR2 (5);
      vl_literal     VARCHAR2 (200);
      vl_aux         VARCHAR2 (20);
      vl_aux2        VARCHAR2 (20);
      vl_bandera     NUMBER;
      vl_bandera2    NUMBER;
      vl_decimales   NUMBER;
      vl_numero2     NUMBER;
   BEGIN
      vl_decimales := MOD (ABS (pa_numero), 1);
      vl_numero2 := ABS (pa_numero) - vl_decimales;
      vl_contador := LENGTH (vl_numero2);
      vl_cont := 1;
      vl_bandera := 0;
      vl_bandera2 := 0;

      IF                                               -- Si el monto es cero
         pa_numero = 0
      THEN
         vl_literal := 'Cero ';
      ELSE                                           -- Si es diferente a cero
         IF                                    -- si el monto es menor a cero
            pa_numero < 0
         THEN
            vl_literal := 'Menos ';
         END IF;

         WHILE                               -- traduce las cifras a literales
              vl_contador > 0
         LOOP
            vl_auxiliar := SUBSTR (TO_CHAR (vl_numero2), vl_cont, 1);

            IF                                                    -- unidades
               vl_contador = 1
            THEN
               IF                         -- agrega a la frase el prefijo 'y'
                  vl_cont > 1 AND vl_auxiliar != '0' AND vl_bandera = 0
               THEN
                  vl_literal := vl_literal || 'y ';
               END IF;                     -- agrega a la frase el prefijo 'y'

               vl_literal :=
                           vl_literal || f_unidades (vl_auxiliar, vl_contador);
            ELSIF                                       -- decenas hasta el 19
                 vl_contador = 2 AND vl_auxiliar = '1'
            THEN
               vl_auxiliar := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1);
               vl_literal := vl_literal || f_decenas (vl_auxiliar);
               EXIT;
            ELSIF                                       -- decenas desde el 20
                 vl_contador = 2 AND vl_auxiliar != '1'
            THEN
               vl_aux :=
                  f_decenas2 (vl_auxiliar,
                              SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1)
                             );

               IF                                            -- activa bandera
                  vl_aux = 'veinti' OR vl_aux IS NULL
               THEN
                  vl_bandera := 1;
               ELSE
                  vl_bandera := 0;
               END IF;                                       -- activa bandera

               vl_literal := vl_literal || vl_aux;
            ELSIF                                                  -- centenas
                 vl_contador = 3
            THEN
               vl_aux := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1);
               vl_aux2 := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 2, 1);
               vl_literal :=
                      vl_literal || f_centenas (vl_auxiliar, vl_aux, vl_aux2);
--                      message(vl_literal);
            ELSIF                                         -- unidades de miles
                 vl_contador = 4
            THEN
               IF             -- no ingresa si la cifra es del 10 al 20 o 000
                  vl_bandera2 = 0
               THEN
                  IF                      -- agrega a la frase el prefijo 'y'
                     vl_cont > 1 AND vl_auxiliar != '0' AND vl_bandera = 0
                  THEN
                     vl_literal := vl_literal || ' y ';
                  END IF;                   --agrega a la frase el prefijo 'y'

                  vl_literal :=
                        vl_literal
                     || f_unidades (vl_auxiliar, vl_contador)
                     || ' mil ';
               END IF;         -- no ingresa si la cifra es del 10 al 20 o 000
            ELSIF                              -- decenas de miles hasta el 19
                 vl_contador = 5 AND vl_auxiliar = '1'
            THEN
               vl_auxiliar := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1);
               vl_literal := vl_literal || f_decenas (vl_auxiliar) || ' mil ';
               vl_bandera2 := 1;
            ELSIF                             --  decenas de miles desde el 20
                 vl_contador = 5 AND vl_auxiliar != '1'
            THEN
               vl_aux :=
                  f_decenas2 (vl_auxiliar,
                              SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1)
                             );

               IF                                            -- activa bandera
                  vl_aux = 'veinti' OR vl_aux IS NULL
               THEN
                  vl_bandera := 1;
               ELSE
                  vl_bandera := 0;
               END IF;                                       -- activa bandera

               vl_literal := vl_literal || vl_aux;
            ELSIF                                         -- centenas de miles
                 vl_contador = 6
            THEN
               vl_aux := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1);
               vl_aux2 := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 2, 1);
               vl_literal :=
                      vl_literal || f_centenas (vl_auxiliar, vl_aux, vl_aux2);

               IF                                     -- Para el caso del 000
                  vl_aux = '0' AND vl_aux2 = '0' AND vl_auxiliar = '0'
               THEN
                  vl_bandera2 := 1;
               ELSE
                  vl_bandera2 := 0;
               END IF;                                 -- Para el caso del 000
            ELSIF                                        -- unidades de millon
                 vl_contador = 7 AND vl_bandera2 = 0
            THEN
               IF                         -- agrega a la frase el prefijo 'y'
                  vl_cont > 1 AND vl_auxiliar != '0' AND vl_bandera = 0
               THEN
                  vl_literal := vl_literal || ' y ';
               END IF;                     -- agrega a la frase el prefijo 'y'

               IF                       -- discrimina para el caso de 1 millon
                  vl_auxiliar = '1' AND LENGTH (vl_numero2) = 7
               THEN
                  vl_literal :=
                        vl_literal
                     || f_unidades (vl_auxiliar, vl_contador)
                     || ' millon ';
               ELSE
                  vl_literal :=
                        vl_literal
                     || f_unidades (vl_auxiliar, vl_contador)
                     || ' millones ';
               END IF;                  -- discrimina para el caso de 1 millon
            ELSIF                             -- decenas de millon hasta el 19
                 vl_contador = 8 AND vl_auxiliar = '1'
            THEN
               vl_literal :=
                     vl_literal
                  || f_decenas (SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1))
                  || ' millones ';
               vl_bandera2 := 1;
            ELSIF                             -- decenas de millon desde el 20
                 vl_contador = 8 AND vl_auxiliar != '1'
            THEN
               vl_aux :=
                  f_decenas2 (vl_auxiliar,
                              SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1)
                             );

               IF                                            -- activa bandera
                  vl_aux = 'veinti' OR vl_aux IS NULL
               THEN
                  vl_bandera := 1;
               ELSE
                  vl_bandera := 0;
               END IF;                                       -- activa bandera

               vl_literal := vl_literal || vl_aux;
            ELSIF                                        -- centenas de millon
                 vl_contador = 9
            THEN
               vl_aux := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 1, 1);
               vl_aux2 := SUBSTR (TO_CHAR (vl_numero2), vl_cont + 2, 1);
               vl_literal :=
                      vl_literal || f_centenas (vl_auxiliar, vl_aux, vl_aux2);
            END IF;                                                -- unidades

            vl_contador := vl_contador - 1;
            vl_cont := vl_cont + 1;
         END LOOP;                           -- traduce las cifras a literales
      END IF;

      vl_literal := UPPER (vl_literal);
      vl_literal:=substr(vl_literal,1,1)||lower(substr(vl_literal,2,length(vl_literal)));
--          message(vl_literal);
      RETURN (   LTRIM (   vl_literal
                        || TO_CHAR (vl_decimales * 100, '00')
                        || '/100'
                       )
              || ' dólares estadounidenses'
             );
   END f_literal;

   FUNCTION f_centenas (
      pa_digito      VARCHAR2,
      pa_anterior    VARCHAR2,
      pa_anterior2   VARCHAR2
   )
      RETURN VARCHAR2
   IS
   BEGIN
      IF                                                          --para el 1
         pa_digito = '1'
      THEN
         IF                                           -- para el caso del 100
            pa_anterior = '0' AND pa_anterior2 = '0'
         THEN
            RETURN ('cien ');
         ELSE
            RETURN ('ciento ');
         END IF;
      ELSIF                                                       -- para el 2
           pa_digito = '2'
      THEN
         RETURN ('doscientos ');
      ELSIF                                                       -- para el 3
           pa_digito = '3'
      THEN
         RETURN ('trescientos ');
      ELSIF                                                       -- para el 4
           pa_digito = '4'
      THEN
         RETURN ('cuatrocientos ');
      ELSIF                                                       -- para el 5
           pa_digito = '5'
      THEN
         RETURN ('quinientos ');
      ELSIF                                                       -- para el 6
           pa_digito = '6'
      THEN
         RETURN ('seiscientos ');
      ELSIF                                                       -- para el 7
           pa_digito = '7'
      THEN
         RETURN ('setecientos ');
      ELSIF                                                       -- para el 8
           pa_digito = '8'
      THEN
         RETURN ('ochocientos ');
      ELSIF                                                       -- para el 9
           pa_digito = '9'
      THEN
         RETURN ('novecientos ');
      ELSIF                                                       -- para el 0
           pa_digito = '0'
      THEN
         RETURN (NULL);
      END IF;
   END f_centenas;

   FUNCTION f_decenas (pa_digito VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      IF                                                          --para el 0
         pa_digito = '0'
      THEN
         RETURN ('diez ');
      ELSIF                                                       -- para el 1
           pa_digito = '1'
      THEN
         RETURN ('once ');
      ELSIF                                                       -- para el 2
           pa_digito = '2'
      THEN
         RETURN ('doce ');
      ELSIF                                                       -- para el 3
           pa_digito = '3'
      THEN
         RETURN ('trece ');
      ELSIF                                                       -- para el 4
           pa_digito = '4'
      THEN
         RETURN ('catorce ');
      ELSIF                                                       -- para el 5
           pa_digito = '5'
      THEN
         RETURN ('quince ');
      ELSIF                                                       -- para el 6
           pa_digito = '6'
      THEN
         RETURN ('dieciseis ');
      ELSIF                                                       -- para el 7
           pa_digito = '7'
      THEN
         RETURN ('diecisiete ');
      ELSIF                                                       -- para el 8
           pa_digito = '8'
      THEN
         RETURN ('dieciocho ');
      ELSIF                                                       -- para el 9
           pa_digito = '9'
      THEN
         RETURN ('diecinueve ');
      END IF;
   END f_decenas;

   FUNCTION f_decenas2 (pa_digito VARCHAR2, pa_anterior VARCHAR2)
      RETURN VARCHAR2
   IS
   BEGIN
      IF                                                          --para el 0
         pa_digito = '0'
      THEN
         RETURN (NULL);
      ELSIF                                                        --para el 2
           pa_digito = '2'
      THEN
         IF                               -- para concatenar con las unidades
            pa_anterior != '0'
         THEN
            RETURN ('veinti');
         ELSE
            RETURN ('veinte ');
         END IF;
      ELSIF                                                        --para el 3
           pa_digito = '3'
      THEN
         RETURN ('treinta ');
      ELSIF                                                        --para el 4
           pa_digito = '4'
      THEN
         RETURN ('cuarenta ');
      ELSIF                                                        --para el 5
           pa_digito = '5'
      THEN
         RETURN ('cincuenta ');
      ELSIF                                                        --para el 6
           pa_digito = '6'
      THEN
         RETURN ('sesenta ');
      ELSIF                                                        --para el 7
           pa_digito = '7'
      THEN
         RETURN ('setenta ');
      ELSIF                                                        --para el 8
           pa_digito = '8'
      THEN
         RETURN ('ochenta ');
      ELSIF                                                        --para el 9
           pa_digito = '9'
      THEN
         RETURN ('noventa ');
      END IF;
   END f_decenas2;

   FUNCTION f_unidades (pa_digito VARCHAR2, pa_anterior NUMBER)
      RETURN VARCHAR2
   IS
   BEGIN
      IF                                                         -- para el 0
         pa_digito = '0'
      THEN
         RETURN (NULL);
      ELSIF                                   -- para el 1 mayor o igual a mil
           pa_digito = '1' AND pa_anterior > 3
      THEN
         RETURN ('un');
      ELSIF                                           -- para el 1 menor a mil
           pa_digito = '1' AND pa_anterior <= 3
      THEN
         RETURN ('uno');
      ELSIF                                                       -- para el 2
           pa_digito = '2'
      THEN
         RETURN ('dos');
      ELSIF                                                       -- para el 3
           pa_digito = '3'
      THEN
         RETURN ('tres');
      ELSIF                                                  -- para el cuatro
           pa_digito = '4'
      THEN
         RETURN ('cuatro');
      ELSIF                                                        --para el 5
           pa_digito = '5'
      THEN
         RETURN ('cinco');
      ELSIF                                                        --para el 6
           pa_digito = '6'
      THEN
         RETURN ('seis');
      ELSIF                                                        --para el 7
           pa_digito = '7'
      THEN
         RETURN ('siete');
      ELSIF                                                        --para el 8
           pa_digito = '8'
      THEN
         RETURN ('ocho');
      ELSIF                                                        --para el 9
           pa_digito = '9'
      THEN
         RETURN ('nueve');
      END IF;
   END f_unidades;
END pkg_literal;
/

