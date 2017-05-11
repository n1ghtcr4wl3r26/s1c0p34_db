CREATE OR REPLACE 
PACKAGE pkg_sector
  IS
TYPE cursortype IS REF CURSOR;
  procedure save_anh
    (
        p_nroSol in solicitud.nro_sol%type,
        p_fechaSol in varchar2,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_cantSol in solicitud.cant_sol%type,
        p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
        p_pesoBruto in number,
        p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
        p_valorCIF in number,
        p_fobSol in number,
        p_seguroSol in number,
        p_fleteISol in number,
        p_fleteIISol in number,
        p_gastoPortSol in number,
        p_otroGastoSol in number,
        p_detalleSol in solicitud.detalle_sol%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_fechaHojaRuta in varchar2,
        p_hojaRuta2 in varchar2,
        p_fechaHojaRuta2 in varchar2,
        p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
        p_nombreTec in varchar2,
        p_cargoTec in varchar2,
        p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
        p_parrafoIT in solicitud.parrafoit%type,
        p_opcionSave in varchar2,
        p_tipoImportador        in varchar2,
        p_nro_nit               in varchar2,
        p_rsz_social            in varchar2,
        p_rep_legal             in varchar2,
        p_matricula             in varchar2,
        p_direc_empresa         in varchar2,
        p_jefe_uso              in varchar2,
        p_cod_sector            in varchar2,
        p_nroRa                 in SOLICITUD.NRO_RA_SOL%type,
        p_userMod               in solicitud.user_mod%type,
        p_cargo                 in varchar2,
        p_genero                in varchar2,
        p_entidad_dependiente   in varchar2,
        p_hoja_ruta3            in varchar2,
        p_fecha_hoja_ruta3      in varchar2,
        p_xml_tipobien          in varchar2,
        p_xml_docadj            in varchar2,
        p_salida                out varchar2,
        p_salida_nro_informe    out varchar2
    );

  procedure save_vih
    (
        p_nroSol in solicitud.nro_sol%type,
        p_fechaSol in varchar2,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_cantSol in solicitud.cant_sol%type,
        p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
        p_pesoBruto in number,
        p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
        p_valorCIF in number,
        p_fobSol in number,
        p_seguroSol in number,
        p_fleteISol in number,
        p_fleteIISol in number,
        p_gastoPortSol in number,
        p_otroGastoSol in number,
        p_detalleSol in solicitud.detalle_sol%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_fechaHojaRuta in varchar2,
        p_hojaRuta2 in varchar2,
        p_fechaHojaRuta2 in varchar2,
        p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
        p_nombreTec in varchar2,
        p_cargoTec in varchar2,
        p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
        p_parrafoIT in solicitud.parrafoit%type,
        p_opcionSave in varchar2,
        p_tipoImportador        in varchar2,
        p_importador            in varchar2,
        p_nro_nit               in varchar2,
        p_rsz_social            in varchar2,
        p_rep_legal             in varchar2,
        p_matricula             in varchar2,
        p_direc_empresa         in varchar2,
        p_jefe_uso              in varchar2,
        p_cod_sector            in varchar2,
        p_nroRa                 in SOLICITUD.NRO_RA_SOL%type,
        p_userMod               in solicitud.user_mod%type,
        p_cargo                 in varchar2,
        p_genero                in varchar2,
        p_entidad_dependiente   in varchar2,
        p_hoja_ruta3            in varchar2,
        p_fecha_hoja_ruta3      in varchar2,
        p_descripcion_bien      in varchar2,
        p_xml_tipobien          in varchar2,
        p_xml_docadj            in varchar2,
        p_salida                out varchar2,
        p_salida_nro_informe    out varchar2
    );

PROCEDURE save_dis (
      p_nro_sol                    in VARCHAR2, -- tabla solicitud
      p_fecha_sol                  in VARCHAR2, -- tabla solicitud
      p_nom_conalpedis                in VARCHAR2, -- tablas sol_discapacitado
      p_cargo                         in VARCHAR2, -- tablas sol_discapacitado
      p_ci_nit                        in VARCHAR2, -- tablas sol_discapacitado
      p_razon_social                  in VARCHAR2, -- tablas sol_discapacitado
      p_inf_tec_jur                   in VARCHAR2, -- tablas sol_discapacitado
      p_fecha_inf_tec_jur             in VARCHAR2, -- tablas sol_discapacitado
      p_cod_aduana                 in VARCHAR2, -- tabla solicitud
      p_emp_cod                    in VARCHAR2, -- tabla solicitud
      p_cant_sol                   in VARCHAR2, -- tabla solicitud
      p_tipo_bulto                 in VARCHAR2, -- tabla solicitud
      p_peso_bruto_sol             in VARCHAR2, -- tabla solicitud
      p_peso_exacto                in VARCHAR2, -- tabla solicitud
      p_detalle_sol                in VARCHAR2, -- tabla solicitud
      p_valor_cif_sol              in NUMBER,--VARCHAR2, -- tabla solicitud
      p_fob_sol                    in NUMBER,--VARCHAR2, -- tabla solicitud
      p_seguro_sol                 in NUMBER,--VARCHAR2, -- tabla solicitud
      p_flete_i_sol                in NUMBER,--VARCHAR2, -- tabla solicitud
      p_flete_ii_sol               in NUMBER,--VARCHAR2, -- tabla solicitud
      p_gasto_port_sol             in NUMBER,--VARCHAR2, -- tabla solicitud
      p_otro_gasto_sol             in NUMBER,--VARCHAR2, -- tabla solicitud
      p_parrafoit                  in VARCHAR2, -- tabla solicitud
      p_parrafo_adicional          in VARCHAR2, -- tabla solicitud
      p_jefe_uso                      in VARCHAR2, -- tablas sol_discapacitado
      p_nombre_tec                 in VARCHAR2, -- tabla solicitud
      p_cargo_tec                  in VARCHAR2, -- tabla solicitud
      p_inicial_tecnico            in VARCHAR2, -- tabla solicitud
      p_hoja_ruta                  in VARCHAR2, -- tabla solicitud
      p_fecha_hoja_ruta            in VARCHAR2, -- tabla solicitud
      p_hoja_ruta2                 in VARCHAR2, -- tabla solicitud
      p_fecha_hoja_ruta2           in VARCHAR2, -- tabla solicitud
      p_hoja_ruta3                    in VARCHAR2, -- tablas sol_discapacitado
      p_fecha_hoja_ruta3              in VARCHAR2, -- tablas sol_discapacitado
      p_cod_sector                 in VARCHAR2, -- tabla solicitud
      p_nro_informe            in VARCHAR2, -- tabla solicitud
      p_user_mod               in VARCHAR2, -- tabla solicitud
      p_opcionSave             in varchar2,
      p_xml_docadj             in varchar2,
      p_salida                 out varchar2,
      p_salida_nro_informe     out varchar2
     );

  FUNCTION f_valortag(p_xml IN VARCHAR2, p_tag IN VARCHAR2)
      RETURN VARCHAR2;


  procedure aprobar_solicitud_otros
      (
          p_nroInformeTec in solicitud.nro_informe_tec%type,
          p_obsSol in solicitud.obs_sol%type,
          p_userMod in solicitud.user_mod%type,
          p_salida out varchar2
      );
    function fn_emppublica
    return cursortype;
/*
procedure save_ret_informe(
        p_nro_informe        in  varchar2,
        p_parrafo01          in  varchar2,
        p_parrafo02          in  varchar2,
        p_parrafo03          in  varchar2,
        p_parrafo04          in  varchar2,
        p_parrafo05          in  varchar2,
        p_parrafo06          in  varchar2,
        p_parrafo07          in  varchar2,
        p_parrafo08          in  varchar2,
        p_parrafo09          in  varchar2,
        p_parrafo10          in  varchar2,
        p_parrafo11          in  varchar2,
        p_parrafo12          in  varchar2,
        p_parrafo13          in  varchar2,
        p_parrafo14          in  varchar2,
        p_parrafo15          in  varchar2
    );
procedure save_ret_resolucion(
        p_nro_informe        in  varchar2,
        p_parrafo01          in  varchar2,
        p_parrafo02          in  varchar2,
        p_parrafo03          in  varchar2,
        p_parrafo04          in  varchar2,
        p_parrafo05          in  varchar2,
        p_parrafo06          in  varchar2,
        p_parrafo07          in  varchar2,
        p_parrafo08          in  varchar2,
        p_parrafo09          in  varchar2,
        p_parrafo10          in  varchar2,
        p_parrafo11          in  varchar2,
        p_parrafo12          in  varchar2,
        p_parrafo13          in  varchar2,
        p_parrafo14          in  varchar2,
        p_parrafo15          in  varchar2
    );
*/
END; -- Package spec
/

CREATE OR REPLACE 
PACKAGE BODY pkg_sector
is

PROCEDURE save_anh (
      p_nroSol in solicitud.nro_sol%type,
      p_fechaSol in varchar2,
      p_codAduana in solicitud.cod_aduana%type,
      p_codAgencia in solicitud.emp_cod%type,
      p_cantSol in solicitud.cant_sol%type,
      p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
      p_pesoBruto in number,
      p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
      p_valorCIF in number,
      p_fobSol in number,
      p_seguroSol in number,
      p_fleteISol in number,
      p_fleteIISol in number,
      p_gastoPortSol in number,
      p_otroGastoSol in number,
      p_detalleSol in solicitud.detalle_sol%type,
      p_hoja_ruta in solicitud.HOJA_RUTA%type,
      p_fechaHojaRuta in varchar2,
      p_hojaRuta2 in varchar2,
      p_fechaHojaRuta2 in varchar2,
      p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
      p_nombreTec in varchar2,
      p_cargoTec in varchar2,
      p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
      p_parrafoIT in solicitud.parrafoit%type,
      p_opcionSave in varchar2,
      p_tipoImportador        in varchar2,
      p_nro_nit               in varchar2,
      p_rsz_social            in varchar2,
      p_rep_legal             in varchar2,
      p_matricula             in varchar2,
      p_direc_empresa         in varchar2,
      p_jefe_uso              in varchar2,
      p_cod_sector            in varchar2,
      p_nroRa                 in SOLICITUD.NRO_RA_SOL%type,
      p_userMod               in solicitud.user_mod%type,
      p_cargo                 in varchar2,
      p_genero                in varchar2,
      p_entidad_dependiente   in varchar2,
      p_hoja_ruta3            in varchar2,
      p_fecha_hoja_ruta3      in varchar2,
      p_xml_tipobien          in varchar2,
      p_xml_docadj            in varchar2,
      p_salida                out varchar2,
      p_salida_nro_informe    out varchar2
     )
   is
      vNroInforme varchar2(30):=0;
      cont        number;
      vCodSol     number;
      -- nuevas variables usadas
      vEstado      varchar2(30);
      v_hoja_ruta  varchar2(100);
      v_xml        varchar2(10000);
      v_total      number;
      v_i          number;
      vInformeTecnico date;
   begin
      v_hoja_ruta := trim(p_hoja_ruta);
      if p_opcionSave='RRET' then
         -- generamos numero de informe y codigo para llave
         vNroInforme:=PKG_UTIL.FN_GENERAR_NRO_INFORME;
         SELECT nvl(max(to_number(to_number(s.cod_sol)))+1,1) INTO vCodSol FROM solicitud s;
         -- verifica si existe la hoja de ruta
         cont := 0;
         SELECT count(*) INTO cont FROM solicitud
         WHERE ult_ver=0 AND lst_ope='U' AND cod_estado_sol not in('AN','SE') AND hoja_ruta=v_hoja_ruta;
         -- si no existe la hoja de ruta entonces guardamos
         if cont=0 then
            -- insertamos en la tabla 'solicitud'
            INSERT INTO solicitud
            (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
            ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope
            ,fch_mod,ult_ver,hoja_ruta,fecha_ra
            ,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,nro_informe_tec
            ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol
            ,importador_sol,cod_proy,cif_saldo,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto
            ,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional,inicial_tecnico
            ,peso_exacto,factura_emitido,nombre_tec,cargo_tec,parrafoit)
            VALUES (vCodSol, p_nroSol, 0, 0, p_codAduana, p_codAgencia, '1', p_cantSol,
               p_detalleSol, p_valorCIF, to_date(p_fechaSol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_userMod, 'U',
               sysdate, 0, v_hoja_ruta, null,
               p_valorCIF, 0, p_pesoBruto, 0, p_cod_sector, vNroInforme,
               p_fobSol, p_seguroSol, p_fleteISol, p_fleteIISol, p_gastoPortSol, p_otroGastoSol, 0, p_userMod,
               p_rsz_social, 0, 0, to_date(p_fechaHojaRuta, 'dd/mm/yyyy HH:MI:SS AM'), p_genero, sysdate, p_tipoBulto,
               trim(p_hojaRuta2), to_date(p_fechaHojaRuta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafoAdicional, p_inicialTenico,
               p_pesoExacto, 0, p_nombreTec, p_cargoTec, p_parrafoIT);

            -- insertamos en la tabla 'sol_anh'
            INSERT INTO sol_anh
            (nro_informe, anh_tipo_imp, anh_nit, anh_rzs, anh_rep_legal, anh_nro_matricula, anh_direc_emp,
            anh_jefe, user_mod, fch_mod, lst_ope, ult_ver, anh_cargo,anh_entidad_dependiente, hoja_ruta3, fecha_hoja_ruta3)
            VALUES (vNroInforme, p_tipoImportador, p_nro_nit, p_rsz_social, p_rep_legal, p_matricula, p_direc_empresa,
            p_jefe_uso, p_userMod, SYSDATE, 'U', 0, p_cargo, p_entidad_dependiente, p_hoja_ruta3, to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'));

            --insertamos varios registros correspondientes a tipo bien
            v_xml := p_xml_tipobien;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc, fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codTB'||v_i),
                  null, null, null,
                  ''||v_i, null, null
               );
            END LOOP;

            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc,
                  fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codDocDA'||v_i),
                  f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
                  to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),
                  ''||v_i, null, null
               );
            END LOOP;
            select count(1) into cont from doc_adjuntos a,set_documentos d where nro_informe=vNroInforme and a.cod_doc=d.atd_cod and d.lst_ope='U' and d.ult_ver=0 and atd_est IN('F','C','M');
            if cont>0 then
                commit;
                p_salida_nro_informe := vNroInforme;
                p_salida := 'OK';
            else
                ROLLBACK;
                p_salida := 'En Documentos Adjuntos es obligatorio seleccionar una de las opciones: Factura Comercial, Certificado y/o Parte de Recepci'||chr(243)||'n de Mercanc'||chr(237)||'as';
            end if;
         else
            p_salida := 'Hoja de Ruta ya registrada: '||v_hoja_ruta||'.';
         end if;
      end if;
      if p_opcionSave='MRET' then
         -- recuperamos numero de informe y codigo para llave y su estado
         vNroInforme := p_nroRa;
         p_salida_nro_informe := vNroInforme;
         vEstado := '';
         SELECT s.cod_sol, s.cod_estado_sol, s.fecha_informe_tec INTO vCodSol, vEstado, vInformeTecnico FROM solicitud s WHERE s.lst_ope='U' AND s.ult_ver=0 AND s.nro_informe_tec=vNroInforme;
         -- verifica si existe la hoja de ruta
         cont := 0;
         SELECT count(*) INTO cont FROM solicitud s
         WHERE s.ult_ver=0 AND s.lst_ope='U' AND s.nro_informe_tec!=vNroInforme AND s.cod_estado_sol not in('AN','SE') AND s.hoja_ruta=v_hoja_ruta;
         -- si no existe la hoja de ruta entonces guardamos ademas tiene que estar en estado pendiente muy importante
         if cont=0 AND vEstado='P' then
            -- actualizamos version en 'solicitud' y adicionamos
            SELECT max(s.ult_ver) INTO cont FROM solicitud s WHERE s.lst_ope='U' AND s.nro_informe_tec=vNroInforme;
            cont := cont + 1;
            UPDATE solicitud s SET s.ult_ver = cont
            WHERE s.ult_ver = 0 AND s.lst_ope = 'U'
            AND s.nro_informe_tec = vNroInforme;

            INSERT INTO solicitud
            (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
            ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope
            ,fch_mod,ult_ver,hoja_ruta,fecha_ra
            ,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,nro_informe_tec
            ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol
            ,importador_sol,cod_proy,cif_saldo,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto
            ,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional,inicial_tecnico
            ,peso_exacto,factura_emitido,nombre_tec,cargo_tec,parrafoit)
            VALUES (vCodSol, p_nroSol, 0, 0, p_codAduana, p_codAgencia, '1', p_cantSol,
               p_detalleSol, p_valorCIF, to_date(p_fechaSol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_userMod, 'U',
               sysdate, 0, v_hoja_ruta, null,
               p_valorCIF, 0, p_pesoBruto, 0, p_cod_sector, vNroInforme,
               p_fobSol, p_seguroSol, p_fleteISol, p_fleteIISol, p_gastoPortSol, p_otroGastoSol, 0, p_userMod,
               p_rsz_social, 0, 0, to_date(p_fechaHojaRuta, 'dd/mm/yyyy HH:MI:SS AM'), p_genero, vInformeTecnico, p_tipoBulto,
               trim(p_hojaRuta2), to_date(p_fechaHojaRuta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafoAdicional, p_inicialTenico,
               p_pesoExacto, 0, p_nombreTec, p_cargoTec, p_parrafoIT);

            -- insertamos en la tabla 'sol_anh'
            cont := 0;
            SELECT max(s.ult_ver) INTO cont FROM sol_anh s WHERE s.lst_ope='U' AND s.nro_informe=vNroInforme;
            cont := cont + 1;
            UPDATE sol_anh sa SET sa.ult_ver = cont
            WHERE sa.ult_ver = 0 AND sa.lst_ope = 'U'
            AND sa.nro_informe = vNroInforme;

            INSERT INTO sol_anh
            (nro_informe, anh_tipo_imp, anh_nit, anh_rzs, anh_rep_legal, anh_nro_matricula, anh_direc_emp,
            anh_jefe, user_mod, fch_mod, lst_ope, ult_ver, anh_cargo,anh_entidad_dependiente, hoja_ruta3, fecha_hoja_ruta3)
            VALUES (vNroInforme, p_tipoImportador, p_nro_nit, p_rsz_social, p_rep_legal, p_matricula, p_direc_empresa,
            p_jefe_uso, p_userMod, SYSDATE, 'U', 0, p_cargo, p_entidad_dependiente, p_hoja_ruta3, to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'));

            --eliminamos inicialmente los existentes
            DELETE FROM doc_adjuntos da WHERE da.nro_informe = vNroInforme;

            --insertamos varios registros correspondientes a tipo bien,
            v_xml := p_xml_tipobien;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc, fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codTB'||v_i),
                  null, null, null,
                  ''||v_i, null, null
               );
            END LOOP;

            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc,
                  fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codDocDA'||v_i),
                  f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
                  to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),
                  ''||v_i, null, null
               );
            END LOOP;
            select count(1) into cont from doc_adjuntos a,set_documentos d where nro_informe=vNroInforme and a.cod_doc=d.atd_cod and d.lst_ope='U' and d.ult_ver=0 and atd_est IN('F','C','M');
            if cont>0 then
                commit;
                p_salida := 'OK';
            else
                ROLLBACK;
                p_salida := 'En Documentos Adjuntos es obligatorio seleccionar una de las opciones: Factura Comercial, Certificado y/o Parte de Recepci'||chr(243)||'n de Mercanc'||chr(237)||'as';
            end if;
         else
            p_salida := 'Hoja de Ruta ya registrada: '||v_hoja_ruta||'.';
         end if;
      end if;
   EXCEPTION
      WHEN OTHERS THEN
      ROLLBACK;
      p_salida:=p_salida || SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
   END save_anh;

PROCEDURE save_vih (
      p_nroSol in solicitud.nro_sol%type,
      p_fechaSol in varchar2,
      p_codAduana in solicitud.cod_aduana%type,
      p_codAgencia in solicitud.emp_cod%type,
      p_cantSol in solicitud.cant_sol%type,
      p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
      p_pesoBruto in number,
      p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
      p_valorCIF in number,
      p_fobSol in number,
      p_seguroSol in number,
      p_fleteISol in number,
      p_fleteIISol in number,
      p_gastoPortSol in number,
      p_otroGastoSol in number,
      p_detalleSol in solicitud.detalle_sol%type,
      p_hoja_ruta in solicitud.HOJA_RUTA%type,
      p_fechaHojaRuta in varchar2,
      p_hojaRuta2 in varchar2,
      p_fechaHojaRuta2 in varchar2,
      p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
      p_nombreTec in varchar2,
      p_cargoTec in varchar2,
      p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
      p_parrafoIT in solicitud.parrafoit%type,
      p_opcionSave in varchar2,
      p_tipoImportador        in varchar2,
      p_importador            in varchar2,
      p_nro_nit               in varchar2,
      p_rsz_social            in varchar2,
      p_rep_legal             in varchar2,
      p_matricula             in varchar2,
      p_direc_empresa         in varchar2,
      p_jefe_uso              in varchar2,
      p_cod_sector            in varchar2,
      p_nroRa                 in SOLICITUD.NRO_RA_SOL%type,
      p_userMod               in solicitud.user_mod%type,
      p_cargo                 in varchar2,
      p_genero                in varchar2,
      p_entidad_dependiente   in varchar2,
      p_hoja_ruta3            in varchar2,
      p_fecha_hoja_ruta3      in varchar2,
      p_descripcion_bien      in varchar2,
      p_xml_tipobien          in varchar2,
      p_xml_docadj            in varchar2,
      p_salida                out varchar2,
      p_salida_nro_informe    out varchar2
     )
   is
      vNroInforme varchar2(30):=0;
      cont        number;
      vCodSol     number;
      -- nuevas variables usadas
      vEstado      varchar2(30);
      v_hoja_ruta  varchar2(100);
      v_xml        varchar2(10000);
      v_total      number;
      v_i          number;
      vFechaSolicitud date;
      v_fecha_informe_tec date;
      --v_xxx   varchar2(500) := '';
   begin
      v_hoja_ruta := trim(p_hoja_ruta);
      if p_opcionSave='RVS' then
         -- generamos numero de informe y codigo para llave
         vNroInforme:=PKG_UTIL.FN_GENERAR_NRO_INFORME;
         SELECT nvl(max(to_number(to_number(s.cod_sol)))+1,1) INTO vCodSol FROM solicitud s;
         -- verifica si existe la hoja de ruta
         cont := 0;
         SELECT count(*) INTO cont FROM solicitud
         WHERE ult_ver=0 AND lst_ope='U' AND cod_estado_sol not in('AN','SE') AND hoja_ruta=v_hoja_ruta;
         -- si no existe la hoja de ruta entonces guardamos
         if cont=0 then
            -- insertamos en la tabla 'solicitud'
            INSERT INTO solicitud
            (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
            ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope
            ,fch_mod,ult_ver,hoja_ruta,fecha_ra
            ,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,nro_informe_tec
            ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol
            ,importador_sol,cod_proy,cif_saldo,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto
            ,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional,inicial_tecnico
            ,peso_exacto,factura_emitido,nombre_tec,cargo_tec,parrafoit)
            VALUES (vCodSol, p_nroSol, 0, 0, p_codAduana, p_codAgencia, '1', p_cantSol,
               p_detalleSol, p_valorCIF, to_date(p_fechaSol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_userMod, 'U',
               sysdate, 0, v_hoja_ruta, null,
               p_valorCIF, 0, p_pesoBruto, 0, p_cod_sector, vNroInforme,
               p_fobSol, p_seguroSol, p_fleteISol, p_fleteIISol, p_gastoPortSol, p_otroGastoSol, 0, p_userMod,
               p_importador, 0, 0, to_date(p_fechaHojaRuta, 'dd/mm/yyyy HH:MI:SS AM'), p_genero, sysdate, p_tipoBulto,
               trim(p_hojaRuta2), to_date(p_fechaHojaRuta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafoAdicional, p_inicialTenico,
               p_pesoExacto, 0, p_nombreTec, p_cargoTec, p_parrafoIT);

            -- insertamos en la tabla 'sol_vih'
            INSERT INTO sol_vih
            (nro_informe, vih_tipo_imp, vih_nit, vih_rzs, vih_rep_legal, vih_nro_matricula, vih_direc_emp,
            vih_jefe, user_mod, fch_mod, lst_ope, ult_ver, vih_cargo, vih_entidad_dependiente,
            vih_hoja_ruta3, vih_fecha_hoja_ruta3, vih_importador, vih_descripcion_bien)
            VALUES (vNroInforme, p_tipoImportador, p_nro_nit, p_rsz_social, p_rep_legal, p_matricula, p_direc_empresa,
            p_jefe_uso, p_userMod, SYSDATE, 'U', 0, p_cargo, p_entidad_dependiente,
            p_hoja_ruta3, to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'), p_importador, p_descripcion_bien);

            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc,
                  fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codDocDA'||v_i),
                  f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
                  to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),
                  ''||v_i, null, null
               );
            END LOOP;
            select count(1) into cont from doc_adjuntos a,set_documentos d where nro_informe=vNroInforme and a.cod_doc=d.atd_cod and d.lst_ope='U' and d.ult_ver=0 and atd_est IN('F','C','M');
            if cont>0 then
                commit;
                p_salida_nro_informe := vNroInforme;
                p_salida := 'OK';
            else
                ROLLBACK;
                p_salida := 'En Documentos Adjuntos es obligatorio seleccionar una de las opciones: Factura Comercial, Certificado y/o Parte de Recepci'||chr(243)||'n de Mercanc'||chr(237)||'as';
            end if;
         else
            p_salida := 'Hoja de Ruta registrada '||v_hoja_ruta||'.';
         end if;
      end if;
      if p_opcionSave='MV' then
         -- recuperamos numero de informe y codigo para llave y su estado
         vNroInforme := p_nroRa;
         p_salida_nro_informe := vNroInforme;
         vEstado := '';
         SELECT s.cod_sol, s.cod_estado_sol,s.fecha_informe_tec INTO vCodSol, vEstado, v_fecha_informe_tec FROM solicitud s WHERE s.lst_ope='U' AND s.ult_ver=0 AND s.nro_informe_tec=vNroInforme;
         -- verifica si existe la hoja de ruta
         cont := 0;
         SELECT count(*) INTO cont FROM solicitud s
         WHERE s.ult_ver=0 AND s.lst_ope='U' AND s.nro_informe_tec!=vNroInforme AND s.cod_estado_sol not in('AN','SE') AND s.hoja_ruta=v_hoja_ruta;
         -- si no existe la hoja de ruta entonces guardamos ademas tiene que estar en estado pendiente muy importante
         if cont=0 AND vEstado='P' then
            -- actualizamos version en 'solicitud' y adicionamos
            SELECT max(s.ult_ver) INTO cont FROM solicitud s WHERE s.lst_ope='U' AND s.nro_informe_tec=vNroInforme;
            cont := cont + 1;
            UPDATE solicitud s SET s.ult_ver = cont
            WHERE s.ult_ver = 0 AND s.lst_ope = 'U'
            AND s.nro_informe_tec = vNroInforme;

            INSERT INTO solicitud
            (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
            ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope
            ,fch_mod,ult_ver,hoja_ruta,fecha_ra
            ,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,nro_informe_tec
            ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol
            ,importador_sol,cod_proy,cif_saldo,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto
            ,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional,inicial_tecnico
            ,peso_exacto,factura_emitido,nombre_tec,cargo_tec,parrafoit)
            VALUES (vCodSol, p_nroSol, 0, 0, p_codAduana, p_codAgencia, '1', p_cantSol,
               p_detalleSol, p_valorCIF, to_date(p_fechaSol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_userMod, 'U',
               sysdate, 0, v_hoja_ruta, null,
               p_valorCIF, 0, p_pesoBruto, 0, p_cod_sector, vNroInforme,
               p_fobSol, p_seguroSol, p_fleteISol, p_fleteIISol, p_gastoPortSol, p_otroGastoSol, 0, p_userMod,
               p_importador, 0, 0, to_date(p_fechaHojaRuta, 'dd/mm/yyyy HH:MI:SS AM'), p_genero,v_fecha_informe_tec,  p_tipoBulto,
               trim(p_hojaRuta2), to_date(p_fechaHojaRuta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafoAdicional, p_inicialTenico,
               p_pesoExacto, 0, p_nombreTec, p_cargoTec, p_parrafoIT);

            -- insertamos en la tabla 'sol_vih'
            cont := 0;
            SELECT max(s.ult_ver) INTO cont FROM sol_vih s WHERE s.lst_ope='U' AND s.nro_informe=vNroInforme;
            cont := cont + 1;
            UPDATE sol_vih sv SET sv.ult_ver = cont
            WHERE sv.ult_ver = 0 AND sv.lst_ope = 'U'
            AND sv.nro_informe = vNroInforme;

            INSERT INTO sol_vih
            (nro_informe, vih_tipo_imp, vih_nit, vih_rzs, vih_rep_legal, vih_nro_matricula, vih_direc_emp,
            vih_jefe, user_mod, fch_mod, lst_ope, ult_ver, vih_cargo, vih_entidad_dependiente,
            vih_hoja_ruta3, vih_fecha_hoja_ruta3, vih_importador, vih_descripcion_bien)
            VALUES (vNroInforme, p_tipoImportador, p_nro_nit, p_rsz_social, p_rep_legal, p_matricula, p_direc_empresa,
            p_jefe_uso, p_userMod, SYSDATE, 'U', 0, p_cargo, p_entidad_dependiente,
            p_hoja_ruta3, to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'), p_importador, p_descripcion_bien);

            --eliminamos inicialmente los existentes
            DELETE FROM doc_adjuntos da WHERE da.nro_informe = vNroInforme;

            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (
                  nro_sol, nro_informe, cod_doc,
                  emitido, nro_doc,
                  fecha_doc,
                  orden, imprimir, nro_ra_sol)
               VALUES (
                  0, vNroInforme, f_valortag(v_xml, 'codDocDA'||v_i),
                  f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
                  to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),
                  ''||v_i, null, null
               );
            END LOOP;
            select count(1) into cont from doc_adjuntos a,set_documentos d where nro_informe=vNroInforme and a.cod_doc=d.atd_cod and d.lst_ope='U' and d.ult_ver=0 and atd_est IN('F','C','M');
            if cont>0 then
                commit;
                p_salida_nro_informe := vNroInforme;
                p_salida := 'OK';
            else
                ROLLBACK;
                p_salida := 'En Documentos Adjuntos es obligatorio seleccionar una de las opciones: Factura Comercial, Certificado y/o Parte de Recepci'||chr(243)||'n de Mercanc'||chr(237)||'as';
            end if;
         else
            p_salida := 'Hoja de Ruta registrada '||v_hoja_ruta||'.';
         end if;
      end if;
   EXCEPTION
      WHEN OTHERS THEN
      ROLLBACK;
      p_salida:=p_salida || SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
   END save_vih;

PROCEDURE save_dis (
      p_nro_sol                    in VARCHAR2, -- tabla solicitud
      p_fecha_sol                  in VARCHAR2, -- tabla solicitud
      p_nom_conalpedis                in VARCHAR2, -- tablas sol_discapacitado
      p_cargo                         in VARCHAR2, -- tablas sol_discapacitado
      p_ci_nit                        in VARCHAR2, -- tablas sol_discapacitado
      p_razon_social                  in VARCHAR2, -- tablas sol_discapacitado
      p_inf_tec_jur                   in VARCHAR2, -- tablas sol_discapacitado
      p_fecha_inf_tec_jur             in VARCHAR2, -- tablas sol_discapacitado
      p_cod_aduana                 in VARCHAR2, -- tabla solicitud
      p_emp_cod                    in VARCHAR2, -- tabla solicitud
      p_cant_sol                   in VARCHAR2, -- tabla solicitud
      p_tipo_bulto                 in VARCHAR2, -- tabla solicitud
      p_peso_bruto_sol             in VARCHAR2, -- tabla solicitud
      p_peso_exacto                in VARCHAR2, -- tabla solicitud
      p_detalle_sol                in VARCHAR2, -- tabla solicitud
      p_valor_cif_sol              in NUMBER,--VARCHAR2, -- tabla solicitud
      p_fob_sol                    in NUMBER,--VARCHAR2, -- tabla solicitud
      p_seguro_sol                 in NUMBER,--VARCHAR2, -- tabla solicitud
      p_flete_i_sol                in NUMBER,--VARCHAR2, -- tabla solicitud
      p_flete_ii_sol               in NUMBER,--VARCHAR2, -- tabla solicitud
      p_gasto_port_sol             in NUMBER,--VARCHAR2, -- tabla solicitud
      p_otro_gasto_sol             in NUMBER,--VARCHAR2, -- tabla solicitud
      p_parrafoit                  in VARCHAR2, -- tabla solicitud
      p_parrafo_adicional          in VARCHAR2, -- tabla solicitud
      p_jefe_uso                      in VARCHAR2, -- tablas sol_discapacitado
      p_nombre_tec                 in VARCHAR2, -- tabla solicitud
      p_cargo_tec                  in VARCHAR2, -- tabla solicitud
      p_inicial_tecnico            in VARCHAR2, -- tabla solicitud
      p_hoja_ruta                  in VARCHAR2, -- tabla solicitud
      p_fecha_hoja_ruta            in VARCHAR2, -- tabla solicitud
      p_hoja_ruta2                 in VARCHAR2, -- tabla solicitud
      p_fecha_hoja_ruta2           in VARCHAR2, -- tabla solicitud
      p_hoja_ruta3                    in VARCHAR2, -- tablas sol_discapacitado
      p_fecha_hoja_ruta3              in VARCHAR2, -- tablas sol_discapacitado
      p_cod_sector                 in VARCHAR2, -- tabla solicitud
      p_nro_informe            in VARCHAR2, -- tabla solicitud
      p_user_mod               in VARCHAR2, -- tabla solicitud
      p_opcionSave             in varchar2,
      p_xml_docadj             in varchar2,
      p_salida                 out varchar2,
      p_salida_nro_informe     out varchar2
     )
   IS
      v_nro_informe       varchar2(30):=0;--usado
      v_cont              number;--usado
      v_cod_sol           number;--usado
      -- nuevas variables usadas
      v_estado            varchar2(30);
      v_xml               varchar2(10000);--usado
      v_total             number;--usado
      v_i                 number;--usado
      v_fecha_solicitud   date;
      v_fecha_informe_tec date;
      --v_aux         varchar2(1000);
      v_rsz         varchar2(100);
   BEGIN
        -- RAZON SOCIAL DE CONLPEDIS
        select ope_razonsocialnsga into v_rsz from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_claseoperador='CO' and c.ope_num=0 and c.ope_numerodoc=p_ci_nit;
        if p_opcionSave='REG_DIS' then
            -- generamos numero de informe y codigo para llave
            v_nro_informe := PKG_UTIL.FN_GENERAR_NRO_INFORME;
            SELECT nvl(max(to_number(to_number(s.cod_sol)))+1,1) INTO v_cod_sol FROM solicitud s;
            -- verifica si existe la hoja de ruta
            v_cont := 0;
            SELECT count(*) INTO v_cont FROM solicitud s WHERE s.ult_ver=0 AND s.lst_ope='U' AND s.cod_estado_sol not in('AN','SE') AND s.hoja_ruta=p_hoja_ruta;
            -- si no existe la hoja de ruta entonces guardamos
         if v_cont=0 then
            -- insertamos en la tabla 'solicitud'
            INSERT INTO solicitud (cod_sol, nro_sol, cod_ent, cod_acred, cod_aduana, emp_cod, cod_tipo_bien, cant_sol,
               detalle_sol, valor_cif_sol, fecha_sol, nro_ra_sol, cod_estado_sol, user_mod, lst_ope,
               fch_mod, ult_ver, hoja_ruta, fecha_ra,
               valor_cif_liberado, cod_frv, peso_bruto_sol, cod_cat, cod_sector, nro_informe_tec,
               fob_sol, seguro_sol, flete_i_sol, flete_ii_sol, gasto_port_sol, otro_gasto_sol, tipo_doc_sol, user_sol,
               importador_sol, cod_proy, cif_saldo, fecha_hoja_ruta, sexo_acred, fecha_informe_tec, tipo_bulto,
               hoja_ruta2, fecha_hoja_ruta2, parrafo_adicional, inicial_tecnico,
               peso_exacto, factura_emitido, nombre_tec, cargo_tec, parrafoit)
               VALUES (v_cod_sol, p_nro_sol, 0, 0, p_cod_aduana, p_emp_cod, '1', p_cant_sol,
               p_detalle_sol, p_valor_cif_sol, to_date(p_fecha_sol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_user_mod, 'U',
               sysdate, 0, p_hoja_ruta, null/*sysdate*/,
               p_valor_cif_sol, 0, p_peso_bruto_sol, 0, p_cod_sector, v_nro_informe,
               p_fob_sol, p_seguro_sol, p_flete_i_sol, p_flete_ii_sol, p_gasto_port_sol, p_otro_gasto_sol, 0, p_user_mod,
               v_rsz, 0, 0, to_date(p_fecha_hoja_ruta, 'dd/mm/yyyy HH:MI:SS AM'), null, trunc(sysdate), p_tipo_bulto,
               trim(p_hoja_ruta2), to_date(p_fecha_hoja_ruta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafo_adicional, p_inicial_tecnico,
               p_peso_exacto, 0, p_nombre_tec, p_cargo_tec, p_parrafoit);
            -- insertamos en la tabla 'sol_discapacitado'
            INSERT INTO sol_discapacitado (nro_informe, dis_nom_conalpedis, dis_cargo, dis_ci_nit, dis_razon_social, dis_inf_tec_jur, dis_fecha_inf_tec_jur,
               dis_jefe_uso, dis_hoja_ruta3, dis_fecha_hoja_ruta3, user_mod, fch_mod, lst_ope, ult_ver)
               VALUES (v_nro_informe, p_nom_conalpedis, p_cargo, p_ci_nit, v_rsz, p_inf_tec_jur, to_date(p_fecha_inf_tec_jur, 'dd/mm/yyyy'),
               p_jefe_uso, p_hoja_ruta3,  to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'), p_user_mod, sysdate, 'U', 0);
            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (nro_sol, nro_informe, cod_doc, emitido, nro_doc, fecha_doc, orden, imprimir, nro_ra_sol)
               VALUES (0, v_nro_informe, f_valortag(v_xml, 'codDocDA'||v_i),f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
               to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),''||v_i, null, null);
            END LOOP;
            commit;
            p_salida_nro_informe := v_nro_informe;
            p_salida := 'OK';
         else
            p_salida := 'Hoja de Ruta registrada '||p_hoja_ruta||'.';
         end if;
      end if;
      if p_opcionSave='MOD_DIS' then
         -- recuperamos numero de informe y codigo para llave y su estado
         v_nro_informe := p_nro_informe;
         v_estado := '';
         SELECT s.cod_sol, s.cod_estado_sol INTO v_cod_sol, v_estado FROM solicitud s WHERE s.lst_ope='U' AND s.ult_ver=0 AND s.nro_informe_tec=v_nro_informe;
         -- verifica si existe la hoja de ruta
         v_cont := 0;
         SELECT count(*) INTO v_cont FROM solicitud s
         WHERE s.ult_ver=0 AND s.lst_ope='U' AND s.nro_informe_tec!=v_nro_informe
         AND s.cod_estado_sol not in('AN','SE') AND s.hoja_ruta=p_hoja_ruta;
         -- si no existe la hoja de ruta entonces guardamos ademas tiene que estar en estado pendiente muy importante
         IF v_cont=0 AND v_estado='P' THEN
            -- recuperamos algunos valores que teniamos
            SELECT s.fecha_informe_tec INTO v_fecha_informe_tec FROM solicitud s WHERE s.ult_ver = 0 AND s.lst_ope = 'U' AND s.nro_informe_tec = v_nro_informe;
            -- actualizamos version en 'solicitud' y adicionamos
            SELECT max(s.ult_ver) INTO v_cont FROM solicitud s WHERE s.lst_ope='U' AND s.nro_informe_tec=v_nro_informe;
            v_cont := v_cont + 1;
            UPDATE solicitud s SET s.ult_ver = v_cont WHERE s.ult_ver = 0 AND s.lst_ope = 'U' AND s.nro_informe_tec = v_nro_informe;

            --v_aux := v_aux || '_1:'||p_valor_cif_sol||'='||0||'='||p_valor_cif_sol||'='||p_peso_bruto_sol||'='||p_fob_sol||'='||p_seguro_sol||'='||p_flete_i_sol||'='||p_flete_ii_sol||'='||p_gasto_port_sol||'='||p_otro_gasto_sol||'='||0||'=';
            --v_aux := v_aux || '';
            INSERT INTO solicitud (cod_sol, nro_sol, cod_ent, cod_acred, cod_aduana, emp_cod, cod_tipo_bien, cant_sol,
               detalle_sol, valor_cif_sol, fecha_sol, nro_ra_sol, cod_estado_sol, user_mod, lst_ope,
               fch_mod, ult_ver, hoja_ruta, fecha_ra,
               valor_cif_liberado, cod_frv, peso_bruto_sol, cod_cat, cod_sector, nro_informe_tec,
               fob_sol, seguro_sol, flete_i_sol, flete_ii_sol, gasto_port_sol, otro_gasto_sol, tipo_doc_sol, user_sol,
               importador_sol, cod_proy, cif_saldo, fecha_hoja_ruta, sexo_acred, fecha_informe_tec, tipo_bulto,
               hoja_ruta2, fecha_hoja_ruta2, parrafo_adicional, inicial_tecnico,
               peso_exacto, factura_emitido, nombre_tec, cargo_tec, parrafoit)
            VALUES (v_cod_sol, p_nro_sol, 0, 0, p_cod_aduana, p_emp_cod, '1', p_cant_sol,
               p_detalle_sol, p_valor_cif_sol, to_date(p_fecha_sol, 'dd/mm/yyyy HH:MI:SS AM'), null, 'P', p_user_mod, 'U',
               sysdate, 0, p_hoja_ruta, null/*sysdate*/,
               p_valor_cif_sol, 0, p_peso_bruto_sol, 0, p_cod_sector, v_nro_informe,
               p_fob_sol, p_seguro_sol, p_flete_i_sol, p_flete_ii_sol, p_gasto_port_sol, p_otro_gasto_sol, 0, p_user_mod,
               v_rsz, 0, 0, to_date(p_fecha_hoja_ruta, 'dd/mm/yyyy HH:MI:SS AM'), null, v_fecha_informe_tec, p_tipo_bulto,
               trim(p_hoja_ruta2), to_date(p_fecha_hoja_ruta2, 'dd/mm/yyyy HH:MI:SS AM'), p_parrafo_adicional, p_inicial_tecnico,

               p_peso_exacto, 0, p_nombre_tec, p_cargo_tec, p_parrafoit);
               --v_aux := v_aux || '_2';
            -- versionamos la tabla 'sol_discapacitado'
            v_cont := 0;
            SELECT max(s.ult_ver) INTO v_cont FROM sol_discapacitado s WHERE s.lst_ope='U' AND s.nro_informe=v_nro_informe;

            --v_aux := v_aux || '_3';
            v_cont := v_cont + 1;
            --v_aux := v_aux || '_4';
            UPDATE sol_discapacitado sd SET sd.ult_ver = v_cont WHERE sd.ult_ver = 0 AND sd.lst_ope = 'U' AND sd.nro_informe = v_nro_informe;
            --v_aux := v_aux || '_5';
            -- insertamos en la tabla 'sol_discapacitado'
            INSERT INTO sol_discapacitado (nro_informe, dis_nom_conalpedis, dis_cargo, dis_ci_nit, dis_razon_social, dis_inf_tec_jur, dis_fecha_inf_tec_jur,
            dis_jefe_uso, dis_hoja_ruta3, dis_fecha_hoja_ruta3, user_mod, fch_mod, lst_ope, ult_ver)
            VALUES (v_nro_informe, p_nom_conalpedis, p_cargo, p_ci_nit, v_rsz, p_inf_tec_jur, to_date(p_fecha_inf_tec_jur, 'dd/mm/yyyy'),
            p_jefe_uso, p_hoja_ruta3, to_date(p_fecha_hoja_ruta3, 'dd/mm/yyyy'), p_user_mod, sysdate, 'U', 0);

            --v_aux := v_aux || '_6';
            --eliminamos inicialmente los existentes
            DELETE FROM doc_adjuntos da WHERE da.nro_informe = v_nro_informe;
            --v_aux := v_aux || '_7';

            --insertamos varios registros correspondientes a documento adjunto
            v_xml := p_xml_docadj;
            v_total := cast(nvl(f_valortag(v_xml, 'total'), '0') as number); --total de registros en el xml
            FOR v_i IN 1 .. v_total LOOP
               INSERT INTO doc_adjuntos (nro_sol, nro_informe, cod_doc, emitido, nro_doc, fecha_doc, orden, imprimir, nro_ra_sol)
               VALUES (0, v_nro_informe, f_valortag(v_xml, 'codDocDA'||v_i),f_valortag(v_xml, 'emitidoDA'||v_i), f_valortag(v_xml, 'nroDocDA'||v_i),
               to_date(f_valortag(v_xml, 'fchDocDA'||v_i), 'dd/mm/yyyy HH:MI:SS AM'),''||v_i, null, null);
            END LOOP;
            commit;
            p_salida_nro_informe := v_nro_informe;
            p_salida := 'OK';
         ELSE
            p_salida := 'Hoja de Ruta registrada '||p_hoja_ruta||'.';
         END IF;
      END IF;
   EXCEPTION
      WHEN OTHERS THEN
      ROLLBACK;
      --p_salida := p_salida || SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM || v_aux, 1, 255);
      p_salida := p_salida || SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
END save_dis;

FUNCTION f_valortag(p_xml IN VARCHAR2, p_tag IN VARCHAR2)
      RETURN VARCHAR2
   IS
      valor    VARCHAR2(5000);
      tagIni   VARCHAR2(200);
      tagFin   VARCHAR2(200);
      posIni   INTEGER;
      posFin   INTEGER;
   BEGIN
      tagIni := '<'||p_tag||'>';
      tagFin := '</'||p_tag||'>';
      posIni := INSTR(p_xml, tagIni) + LENGTH(tagIni);
      posFin := INSTR(p_xml, tagFin) - (INSTR(p_xml, tagIni) + LENGTH(tagIni));
      valor := SUBSTR(p_xml, posIni, posFin);
      RETURN valor;
   EXCEPTION
      WHEN NO_DATA_FOUND
      THEN
         RETURN '';
   END f_valortag;

  procedure aprobar_solicitud_otros
      (
          p_nroInformeTec in solicitud.nro_informe_tec%type,
          p_obsSol in solicitud.obs_sol%type,
          p_userMod in solicitud.user_mod%type,
          p_salida out varchar2
      )
    is
       v_ra_generado   VARCHAR2(20);
       v_cod_sector    VARCHAR2(20);
    begin
        p_salida := '';
        SELECT a.cod_sector INTO v_cod_sector
        FROM solicitud a
        WHERE a.nro_informe_tec=p_nroInformeTec AND a.ult_ver=0 AND a.lst_ope='U';
        -- generar numero de resolucion administrativa
        v_ra_generado := '';
        pkg_sara.generarResolucionLiberacion(v_cod_sector, v_ra_generado);
        -- validamos el valor generado
        IF LENGTH(v_ra_generado)>0 THEN
            -- versionamos el registro
            UPDATE solicitud SET ult_ver=(select max(s.ult_ver)+1 from solicitud s where s.nro_informe_tec=p_nroInformeTec)
            WHERE nro_informe_tec=p_nroInformeTec AND ult_ver=0;
            -- insertamos el nuevo registro modificado
            INSERT INTO solicitud SELECT
                a.cod_sol, a.nro_sol, a.cod_ent, a.cod_acred, a.cod_aduana, a.emp_cod, a.cod_tipo_bien, a.cant_sol, a.detalle_sol,
                a.valor_cif_sol, a.fecha_sol, v_ra_generado, a.url_archivo_sol, 'A', p_userMod, 'U', sysdate, 0,
                p_obsSol, a.hoja_ruta, sysdate, a.valor_cif_liberado, a.cod_frv, a.peso_bruto_sol, a.cod_cat, a.cod_sector,
                a.nro_informe_tec, a.fob_sol, a.seguro_sol, a.flete_i_sol, a.flete_ii_sol, a.gasto_port_sol, a.otro_gasto_sol,
                a.tipo_doc_sol, a.user_sol, a.importador_sol, a.cod_proy, a.cif_saldo, a.fecha_hoja_ruta, a.sexo_acred,
                a.fecha_informe_tec, a.tipo_bulto, a.hoja_ruta2, a.fecha_hoja_ruta2, a.parrafo_adicional, a.inicial_tecnico,
                a.peso_exacto, a.factura_emitido, a.nro_ra_anterior, a.fch_ra_anterior, a.nombre_tec, a.cargo_tec, a.parrafoit,
                a.convenio, a.nomproy, a.nombre_acr, a.fch_emb, a.sol_entidad
            FROM solicitud a
            WHERE a.nro_informe_tec=p_nroInformeTec
            AND a.ult_ver in (select max(ult_ver) from solicitud sol where sol.nro_informe_tec=p_nroInformeTec and sol.lst_ope='U');
            -- guardamos las modificaciones
            commit;
            p_salida:='OK';
        END IF;
    exception
        when others then
        ROLLBACK;
        p_salida := SQLCODE || '-' || SQLERRM;
    end;
    function fn_emppublica
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        select ope_numerodoc,nvl(ope_razonsocialnsga,'-') ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea
        where ope_claseoperador IN ('EM','EN') and ope_num=0; -- listado de empresa publica EM y entidad publica EN
        --where ope_claseoperador IN ('EM') and ope_num=0; -- listado de empresa publica EM y entidad publica EN
        return ct;
    end fn_emppublica;
/*
procedure save_ret_informe
    (
        p_nro_informe        in  varchar2,
        p_parrafo01          in  varchar2,
        p_parrafo02          in  varchar2,
        p_parrafo03          in  varchar2,
        p_parrafo04          in  varchar2,
        p_parrafo05          in  varchar2,
        p_parrafo06          in  varchar2,
        p_parrafo07          in  varchar2,
        p_parrafo08          in  varchar2,
        p_parrafo09          in  varchar2,
        p_parrafo10          in  varchar2,
        p_parrafo11          in  varchar2,
        p_parrafo12          in  varchar2,
        p_parrafo13          in  varchar2,
        p_parrafo14          in  varchar2,
        p_parrafo15          in  varchar2
    )
    is
    begin

        delete from ret_informe where nro_informe_tec=p_nro_informe;

        insert into ret_informe (nro_informe_tec, parrafo01, parrafo02, parrafo03, parrafo04, parrafo05, parrafo06, parrafo07
        , parrafo08, parrafo09, parrafo10, parrafo11, parrafo12, parrafo13, parrafo14, parrafo15)

        values(p_nro_informe, replace(p_parrafo01,'&',' y '), replace(p_parrafo02,'&',' y '), replace(p_parrafo03,'&',' y '), replace(p_parrafo04,'&',' y '), replace(p_parrafo05,'&',' y ')
        , replace(p_parrafo06,'&',' y '), replace(p_parrafo07,'&',' y '), replace(p_parrafo08,'&',' y '), replace(p_parrafo09,'&',' y '), replace(p_parrafo10,'&',' y '), null, null, null, null, null);

        COMMIT;
    exception
        when others then
        ROLLBACK;
    end;
procedure save_ret_resolucion
    (
        p_nro_informe        in  varchar2,
        p_parrafo01          in  varchar2,
        p_parrafo02          in  varchar2,
        p_parrafo03          in  varchar2,
        p_parrafo04          in  varchar2,
        p_parrafo05          in  varchar2,
        p_parrafo06          in  varchar2,
        p_parrafo07          in  varchar2,
        p_parrafo08          in  varchar2,
        p_parrafo09          in  varchar2,
        p_parrafo10          in  varchar2,
        p_parrafo11          in  varchar2,
        p_parrafo12          in  varchar2,
        p_parrafo13          in  varchar2,
        p_parrafo14          in  varchar2,
        p_parrafo15          in  varchar2
    )
    is
    begin

        delete from ret_resolucion where nro_informe_tec=p_nro_informe;

        insert into ret_resolucion (nro_informe_tec, parrafo01, parrafo02, parrafo03, parrafo04, parrafo05, parrafo06, parrafo07
        , parrafo08, parrafo09, parrafo10, parrafo11, parrafo12, parrafo13, parrafo14, parrafo15)

        values(p_nro_informe, replace(p_parrafo01,'&',' y '), replace(p_parrafo02,'&',' y '), replace(p_parrafo03,'&',' y '), replace(p_parrafo04,'&',' y '), replace(p_parrafo05,'&',' y ')
        , replace(p_parrafo06,'&',' y '), replace(p_parrafo07,'&',' y '), replace(p_parrafo08,'&',' y '), replace(p_parrafo09,'&',' y '), replace(p_parrafo10,'&',' y '), null, null, null, null, null);

        COMMIT;
    exception
        when others then
        ROLLBACK;
    end;*/
END;
/

