CREATE OR REPLACE 
PACKAGE pkg_sara
is
procedure save_solicitud
    (
        p_nroSol in solicitud.nro_sol%type,
        p_nroInforme in solicitud.nro_informe_tec%type,
        p_codEnt in solicitud.cod_ent%type,
        p_codAcr in solicitud.cod_acred%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_codTipoBien in solicitud.cod_tipo_bien%type,
        p_cantSol in solicitud.cant_sol%type,
        p_detalleSol in solicitud.detalle_sol%type,
        p_valorCIF in number,
        p_fechaSol in varchar2,
        p_userMod in solicitud.user_mod%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_frv in solicitud.cod_frv%type,
        p_valorVifLiberado in number,
        p_pesoBruto in number,
        p_fobSol in number,
        p_seguroSol in number,
        p_fleteISol in number,
        p_fleteIISol in number,
        p_gastoPortSol in number,
        p_otroGastoSol in number,
        p_informeTecSol in varchar2,
        p_tipoDocSol solicitud.TIPO_DOC_SOL%type,
        p_codProy in varchar2,
        p_saldoCif in number,
        p_fechaHojaRuta in varchar2,
        p_sexoAcred in SOLICITUD.SEXO_ACRED%type,
        p_fechaInformeTecnico in varchar2,
        p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
        p_hojaRuta2 in varchar2,
        p_fechaHojaRuta2 in varchar2,
        p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
        p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
        p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
        p_facturaEmitido in SOLICITUD.FACTURA_EMITIDO%type,
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_nroRaAnterior in SOLICITUD.NRO_RA_ANTERIOR%type,
        p_fchRaAnterior in varchar2,
        p_nombreTec in varchar2,
        p_cargoTec in varchar2,
        p_opcionSave in varchar2,
        p_parrafoIT in solicitud.parrafoit%type,
        p_convenio in solicitud.convenio%type,
        p_fchEmbarque in varchar2,
        p_jefe in varchar2,
        p_salida out varchar2
    );
procedure aprobar_solicitud
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_codEstadoSol in solicitud.COD_ESTADO_SOL%type,
        p_obsSol in solicitud.OBS_SOL%type,
        p_userMod in solicitud.user_mod%type,
        p_salida out varchar2
    );
procedure save_transferencia
    (
        p_nroRA in varchar2,
        p_fechaTransf in varchar2,
        p_poliza in varchar2,
        p_transferidoA in varchar2,
        p_motivo in varchar2,
        p_hojaRutaTrans in varchar2,
        p_userMod in varchar2,
        p_nroNotaTrans in varchar2,
        p_fechaNotaTrans in varchar2,
        p_nroRaTra out varchar2,
        p_nroInformeTec out varchar2,
        p_opcion out varchar2,
        p_salida out varchar2
    );
procedure aprobar_transferencia
    (
        p_RaLiberacion in varchar2,
        p_codEstadoSol in varchar2,
        p_obsTrans in varchar2,
        p_userMod in varchar2,
        p_nro_informe_tec out varchar2,
        p_ra_trans out varchar2,
        p_salida out varchar2
    );
procedure save_solicitudOtro
    (
        p_fechaSol in varchar2,
        p_fechaResolucionSol in varchar2,
        p_codSecor in solicitud.cod_sector%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_importador in varchar2,
        p_valorCIF in number,
        p_detalleSol in solicitud.detalle_sol%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_informeTecSol in varchar2,
        p_nroRa varchar2,
        p_userMod in solicitud.user_mod%type,
        p_opcionSave in varchar2,
        p_salida out varchar2
    );
procedure save_proyecto
    (
    p_descProy in varchar2,
    p_codEntidad in varchar2,
    p_fchInicioProy in varchar2,
    p_fchFinProy in varchar2,
    p_convenioProy in varchar2,
    p_userMod in proyecto.user_mod%type,
    p_salida out varchar2
    );
    procedure update_proyecto
    (
    p_codProy in varchar2,
    p_descProy in varchar2,
    p_codEntidad in varchar2,
    p_fchInicioProy in varchar2,
    p_fchFinProy in varchar2,
    p_convenioProy in varchar2,
    p_userMod in proyecto.user_mod%type,
    p_salida out varchar2
    );
    procedure anularRET
    (
    p_nroSol in varchar2,
    p_userMod in varchar2,
    p_motivo in varchar2,
    p_estado in varchar2,
    p_salida out varchar2,
    p_msj out varchar2,
    p_tipoBien out number
    );
    procedure anularRTM
    (
    p_nroRa in varchar2,
    p_userMod in varchar2,
    p_motivo in varchar2,
    p_estado in varchar2,
    p_salida out varchar2,
    p_msj out varchar2
    );
    procedure registrarDocAdjuntos
    (
        p_nroSol in varchar2,
        p_codDoc in varchar2,
        p_emitidoPor in varchar2,
        p_nroDoc in varchar2,
        p_fchDoc in varchar2,
        p_itemDoc in varchar2,
        p_opcion varchar2,
        p_salida out varchar2
    );
procedure save_solicitudPasada
    (
        p_codSol in varchar2,
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_fchRa in varchar2,
        p_nroSol in solicitud.nro_sol%type,
        p_fechaSol in varchar2,
        p_codEnt in solicitud.cod_ent%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_codTipoBien in solicitud.cod_tipo_bien%type,
        p_cantSol in solicitud.cant_sol%type,
        p_frv in solicitud.cod_frv%type,
        p_detalleSol in solicitud.detalle_sol%type,
        p_valorVifLiberado in number,
        p_userMod in solicitud.user_mod%type,
        p_opcionSave in varchar2,
        p_nombreAcre in varchar2,
        p_codSector in varchar2,
        p_solEntidad in varchar2,
        p_obsSol     in varchar2,
        p_salida out varchar2
    );
procedure habilitarRes
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_motivo in varchar2,
        p_user in varchar2,
        p_salida out varchar2
    );
procedure validarTransferencia
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_salida out varchar2
    );
procedure validarTransferenciaMod
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_perfil in varchar2,
        p_salida out varchar2
    );
procedure generarResolucionLiberacion
    (
        p_codSector in varchar2,
        p_salida out varchar2
    );
function generarResolucionTransferencia
    return varchar2;
procedure save_documento
    (
    p_descDoc in varchar2,
    p_estadoDoc in varchar2,
    p_userMod in varchar2,
    p_salida out varchar2
    );
procedure update_documento
    (
    p_codDoc in varchar2,
    p_descDoc in varchar2,
    p_estadoDoc in varchar2,
    p_userMod in varchar2,
    p_salida out varchar2
    );
procedure save_saldo
    (
    p_codAcred in varchar2,
    p_saldoAcred in number,
    p_tipoBien in varchar2,
    p_salida out varchar2
    );
procedure update_saldo
    (
    p_codSaldo in varchar2,
    p_codAcred in varchar2,
    p_saldoAcred in number,
    p_tipoBien in varchar2,
    p_salida out varchar2
    );
procedure mod_documentos_sol
    (
    p_nro_sol in varchar2,
    p_salida  out varchar2
    );
procedure save_ret
    (
        p_user_mod          in  varchar2,
        p_nro_ra_sol        in  varchar2,
        p_categoria         in  varchar2,
        p_cuota_anual       in  varchar2,
        p_concedido         in  varchar2,
        p_valor_liberado    in  varchar2,
        p_saldo             in  varchar2,
        p_total_liberado    in  varchar2,
        p_parrafo1          in  varchar2,
        p_parrafo2          in  varchar2,
        p_parrafo3          in  varchar2,
        p_parrafo4          in  varchar2,
        p_parrafo5          in  varchar2,
        p_parrafo6          in  varchar2,
        p_parrafo7          in  varchar2,
        p_parrafo8          in  varchar2,
        p_aduana            in  varchar2
    );
end pkg_sara;
/

CREATE OR REPLACE 
PACKAGE BODY pkg_sara
is
procedure save_solicitud
    (
        p_nroSol in solicitud.nro_sol%type,
        p_nroInforme in solicitud.nro_informe_tec%type,
        p_codEnt in solicitud.cod_ent%type,
        p_codAcr in solicitud.cod_acred%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_codTipoBien in solicitud.cod_tipo_bien%type,
        p_cantSol in solicitud.cant_sol%type,
        p_detalleSol in solicitud.detalle_sol%type,
        p_valorCIF in number,
        p_fechaSol in varchar2,
        p_userMod in solicitud.user_mod%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_frv in solicitud.cod_frv%type,
        p_valorVifLiberado in number,
        p_pesoBruto in number,
        p_fobSol in number,
        p_seguroSol in number,
        p_fleteISol in number,
        p_fleteIISol in number,
        p_gastoPortSol in number,
        p_otroGastoSol in number,
        p_informeTecSol in varchar2,
        p_tipoDocSol solicitud.TIPO_DOC_SOL%type,
        p_codProy in varchar2,
        p_saldoCif in number,
        p_fechaHojaRuta in varchar2,
        p_sexoAcred in SOLICITUD.SEXO_ACRED%type,
        p_fechaInformeTecnico in varchar2,
        p_tipoBulto in SOLICITUD.TIPO_BULTO%type,
        p_hojaRuta2 in varchar2,
        p_fechaHojaRuta2 in varchar2,
        p_parrafoAdicional in SOLICITUD.PARRAFO_ADICIONAL%type,
        p_inicialTenico in SOLICITUD.INICIAL_TECNICO%type,
        p_pesoExacto in SOLICITUD.PESO_EXACTO%type,
        p_facturaEmitido in SOLICITUD.FACTURA_EMITIDO%type,
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_nroRaAnterior in SOLICITUD.NRO_RA_ANTERIOR%type,
        p_fchRaAnterior in varchar2,
        p_nombreTec in varchar2,
        p_cargoTec in varchar2,
        p_opcionSave in varchar2,
        p_parrafoIT in solicitud.parrafoit%type,
        p_convenio in solicitud.convenio%type,
        p_fchEmbarque in varchar2,
        p_jefe in varchar2,
        p_salida out varchar2
    )
    is
        cont number;
        contFRV number:=0;
        vSector varchar2(3);
        vSectorRa varchar2(3);
        vEntidad varchar2(3);
        vCodCategoria varchar2(30):=0;
        vDetalle varchar2(1000):=p_detalleSol;
        vSw number:=0;
        vNroInforme varchar2(30):=0;
        vUpdate varchar2(5):=0;
        vCodSol number;
        vContVal number;
        vCodEstadoSol varchar(10);
    begin

        delete from doc_adjuntos where nro_sol=p_nroSol;
        insert into doc_adjuntos select nro_sol,nro_informe,cod_doc,emitido,nro_doc,fecha_doc,orden,imprimir,nro_ra_sol
        from doc_adjuntosaux where nro_sol=p_nroSol;
        delete from doc_adjuntosaux where nro_sol=p_nroSol;
        COMMIT;
        select count(*) into vContVal from doc_adjuntos where nro_sol=p_nroSol;
        if vContVal<=0 then
            p_salida:='Debe adicionar al menos un documento adjunto.';
            return;
        end if;
        if p_codAcr='0'then
            vSector:='104';
        else
             vSector:='105';
             select categoria into vCodCategoria from acreditacion where cod_acred=p_codAcr and ver=0;
        end if;
        /*if p_nroRaAnterior is not null then
            select count(*) into vSw  from solicitud s where s.lst_ope='U' and s.ult_ver=0 and s.nro_ra_sol=trim(p_nroRaAnterior) and s.cod_estado_sol<>'AN';
            if vSw>=1 then
                    p_salida:='Nro. Resoluci'||chr(243)||'n Liberada '||p_nroRaAnterior||' debe ser anulada antes de grabar el registro.';
                    return;
            end if;
        end if;*/
        if(p_codTipoBien=2) then
            select count(*) into contFRV from solicitud s where s.lst_ope='U' and s.ult_ver=0 and s.cod_frv=p_frv and s.cod_estado_sol not in('AN','SE');

            vDetalle:=PKG_UTIL.FN_DESCRIPCION_FRV(p_frv);
        end if;
        -- VALIDAR ENTIDAD
        select UPPER(SUBSTR(INITCAP(e.des_ent),1,3)) into vEntidad from entidad e where e.cod_ent=p_codEnt and e.ver=0;
        if (vEntidad='AGE' or vEntidad='COR' or vEntidad='DEL' or vEntidad='EMB' or vEntidad='OFI' or vEntidad='ORG' or vEntidad='REP' or vEntidad='FUN') then
            vEntidad:='la';
        else
            vEntidad:='el';
        end if;

        if p_opcionSave='R' then
            -- GENERAR NRO INFORME TECNICO
            vNroInforme:=PKG_UTIL.FN_GENERAR_NRO_INFORME;
            select count(*) into cont  from solicitud where nro_sol=p_nroSol and ult_ver=0 and lst_ope='U' and cod_estado_sol not in('AN','SE');
            select nvl(max(to_number(to_number(cod_sol)))+1,1) into vCodSol from solicitud;
            -- verificar si se registro codigo FRV para vehiculos
            if cont=0 then
                if contFRV=0 then
                    insert into solicitud
                    (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
                    ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope,fch_mod,ult_ver,hoja_ruta,fecha_ra,
                    valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,nro_informe_tec
                    ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol,cod_proy,cif_saldo
                    ,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional, inicial_tecnico
                    , peso_exacto,factura_emitido,nro_ra_anterior,fch_ra_anterior,nombre_tec,cargo_tec,parrafoit,convenio,fch_emb)

                    values (vCodSol,p_nroSol,p_codEnt,p_codAcr,p_codAduana,p_codAgencia,p_codTipoBien
                    ,p_cantSol,ltrim(vDetalle),p_valorCIF,to_date(p_fechaSol,'dd/mm/yyyy HH:MI:SS AM'),p_nroRa,'P',p_userMod,'U'
                    ,sysdate,0,p_hoja_ruta,sysdate,p_valorVifLiberado,p_frv,p_pesoBruto,vCodCategoria,vSector,vNroInforme
                    ,p_fobSol,p_seguroSol,p_fleteISol,p_fleteIISol,p_gastoPortSol,p_otroGastoSol,p_tipoDocSol,p_userMod
                    ,p_codProy,p_saldoCif,to_date(p_fechaHojaRuta,'dd/mm/yyyy HH:MI:SS AM'),p_sexoAcred,sysdate,p_tipoBulto
                    ,trim(p_hojaRuta2),to_date(p_fechaHojaRuta2,'dd/mm/yyyy HH:MI:SS AM'),p_parrafoAdicional,p_inicialTenico
                    ,p_pesoExacto,p_facturaEmitido,p_nroRaAnterior,to_date(p_fchRaAnterior,'dd/mm/yyyy HH24:MI:SS'),p_nombreTec
                    ,p_cargoTec,p_parrafoIT,p_convenio,to_date(p_fchEmbarque,'dd/mm/yyyy HH:MI:SS AM'));
                    -- ACTUALIZAR TABLA DOC_ADJUNTOS
                    update doc_adjuntos set  nro_informe=vNroInforme, nro_ra_sol=p_nroRa,imprimir=vEntidad where nro_sol=p_nroSol;
                    p_salida:='OK';
                else
                    p_salida:='El C'||chr(243)||'digo FRV  '||p_frv||' ya cuenta con un registro.';
                end if;
            else
                p_salida:='Ya existe registrado solicitud Nro. '||p_nroSol||'.';
            end if;
        end if;
        -- validacion en la modificacion de un solo tipo de sector
        select SUBSTR(nro_ra_sol,1,3) into vSectorRa from solicitud where nro_ra_sol=p_nroRa and ult_ver=0;
        if(vSectorRa!=vSector) then
            if(vSectorRa='104')then
                p_salida:='El Nro. de resoluci'||chr(243)||'n <b>'||p_nroRa||'</b> pertenece al sector DIPLOMATICO OFICIAL. No puede modificar a otro sector.';
            end if;
            if(vSectorRa='105')then
                p_salida:='El Nro. de resoluci'||chr(243)||'n <b>'||p_nroRa||'</b> pertenece al sector DIPLOMATICO PARTICULAR. No puede modificar a otro sector.';
            end if;
            return;
        end if;
        if p_opcionSave='M' then
            -- valida que no se duliquen documentos adjuntos
            --11/01/2012 ----------------------------------------------------------
            update doc_adjuntos set nro_ra_sol=nro_sol||'-'||nro_ra_sol where nro_ra_sol=p_nroRa and nro_sol<>p_nroSol;
            -- verificar si se registro codigo FRV para vehiculos
            if p_codTipoBien=2 then
                select count(*) into contFRV from solicitud where lst_ope='U' and cod_frv=p_frv and  nro_sol<>p_nroSol;
            end if;
            --if contFRV=0 then

                --ini mod 12/04/2013
                select cod_estado_sol into vCodEstadoSol from solicitud where nro_ra_sol=p_nroRa and ult_ver=0 and lst_ope='U';
                if vCodEstadoSol='O'then
                    vCodEstadoSol:='P';
                end if;
                --fin mod 12/04/2013

                -- MODIFICA EL VALOR DE LA VERSION+1
                update solicitud set ult_ver=(select max(s.ult_ver)+1 from solicitud s
                where s.nro_ra_sol=p_nroRa) where nro_ra_sol=p_nroRa and ult_ver=0;
                -- INSERTAMOS NUEVA VERSION EN LA TABLA DE SOLICITUD
                INSERT ALL INTO SOLICITUD SELECT
                s.COD_SOL,p_nroSol,p_codEnt,p_codAcr,p_codAduana,p_codAgencia,p_codTipoBien,p_cantSol
                ,ltrim(vDetalle),p_valorCIF,to_date(p_fechaSol,'dd/mm/yyyy HH:MI:SS AM'),s.NRO_RA_SOL,s.URL_ARCHIVO_SOL
                ,vCodEstadoSol,p_userMod,'U',sysdate,0,s.OBS_SOL,p_hoja_ruta,fecha_ra,p_valorVifLiberado,p_frv,p_pesoBruto,vCodCategoria,vSector,nro_informe_tec
                ,p_fobSol,p_seguroSol,p_fleteISol,p_fleteIISol,p_gastoPortSol,p_otroGastoSol,p_tipoDocSol,p_userMod  as vUserMod,s.IMPORTADOR_SOL
                ,p_codProy,p_saldoCif,to_date(p_fechaHojaRuta,'dd/mm/yyyy HH:MI:SS AM'),p_sexoAcred,s.fecha_informe_tec,p_tipoBulto
                ,trim(p_hojaRuta2),to_date(p_fechaHojaRuta2,'dd/mm/yyyy HH:MI:SS AM'),p_parrafoAdicional,p_inicialTenico
                ,p_pesoExacto,p_facturaEmitido,p_nroRaAnterior,to_date(p_fchRaAnterior,'dd/mm/yyyy HH:MI:SS AM'),p_nombreTec
                ,p_cargoTec,p_parrafoIT,p_convenio,nomproy,nombre_acr,to_date(p_fchEmbarque,'dd/mm/yyyy HH:MI:SS AM'),sol_entidad
                FROM SOLICITUD s where s.nro_ra_sol=p_nroRa
                and s.ULT_VER in (select max(ult_ver) from solicitud sol where sol.nro_ra_sol=p_nroRa and sol.lst_ope='U');
                 -- ACTUALIZAR TABLA DOC_ADJUNTOS
                 select nro_informe_tec into vNroInforme from solicitud  where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_nroRa;
                 update doc_adjuntos set  nro_informe=vNroInforme, nro_ra_sol=p_nroRa,imprimir=vEntidad where nro_sol=p_nroSol;
                p_salida:='OK';
            /*else
                p_salida:='El C'||chr(243)||'digo FRV  '||p_frv||' ya cuenta con un registro.';
            end if;*/
        end if;
        select count(1) into cont from sector where cod_sector='101' and nro_informe_anterior=trim(p_jefe);
        if cont =0 then
            update sector set nro_informe_anterior = trim(p_jefe) where cod_sector='101';
        end if;
        commit;
    exception
        when others then
        ROLLBACK;
        p_salida:=SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
    end;
procedure aprobar_solicitud
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_codEstadoSol in solicitud.COD_ESTADO_SOL%type,
        p_obsSol in solicitud.OBS_SOL%type,
        p_userMod in solicitud.user_mod%type,
        p_salida out varchar2
    )
    is
    begin
        -- MODIFICA EL VALOR DE LA VERSION+1
        update solicitud set ult_ver=(select max(s.ult_ver)+1 from solicitud s
        where s.nro_ra_sol=p_nroRa) where nro_ra_sol=p_nroRa and ult_ver=0;
        -- INSERTAMOS NUEVA VERSION EN LA TABLA DE SOLICITUD
        INSERT ALL INTO SOLICITUD SELECT
        s.COD_SOL,s.NRO_SOL,s.COD_ENT,s.COD_ACRED,s.COD_ADUANA,s.emp_cod
        ,s.COD_TIPO_BIEN,s.CANT_SOL,s.DETALLE_SOL,s.VALOR_CIF_SOL,s.FECHA_SOL,s.nro_ra_sol,s.URL_ARCHIVO_SOL
        ,p_codEstadoSol,p_userMod,'U',sysdate as fecha1,0,p_obsSol,s.HOJA_RUTA,s.fecha_ra,s.valor_cif_liberado
        ,s.COD_FRV,s.PESO_BRUTO_SOL,s.COD_CAT,s.COD_SECTOR,s.NRO_INFORME_TEC
        ,s.fob_sol,s.seguro_sol,s.flete_i_sol,s.flete_ii_sol,s.gasto_port_sol,s.otro_gasto_sol,s.TIPO_DOC_SOL,s.USER_SOL,s.IMPORTADOR_SOL
        ,s.cod_proy,s.cif_saldo
        ,s.fecha_hoja_ruta,s.sexo_acred,s.fecha_informe_tec,s.tipo_bulto,s.hoja_ruta2,s.fecha_hoja_ruta2
        ,s.parrafo_adicional,s.inicial_tecnico, s.peso_exacto,s.factura_emitido,s.nro_ra_anterior
        ,s.fch_ra_anterior,s.nombre_tec,s.cargo_tec,s.parrafoit,s.convenio,s.nomproy,s.nombre_acr,s.fch_emb,s.sol_entidad
        FROM SOLICITUD s where s.nro_ra_sol=p_nroRa
        and s.ULT_VER in (select max(ult_ver) from solicitud sol where sol.nro_ra_sol=p_nroRa and sol.lst_ope='U');
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure save_transferencia
    (
        p_nroRA in varchar2,
        p_fechaTransf in varchar2,
        p_poliza in varchar2,
        p_transferidoA in varchar2,
        p_motivo in varchar2,
        p_hojaRutaTrans in varchar2,
        p_userMod in varchar2,
        p_nroNotaTrans in varchar2,
        p_fechaNotaTrans in varchar2,
        p_nroRaTra out varchar2,
        p_nroInformeTec out varchar2,
        p_opcion out varchar2,
        p_salida out varchar2
    )
    is
        cont number;
        codSol number;
        vCodEstadoSol varchar(3);
    begin
        -- MODIFICA EL VALOR DE LA VERSION+1
        select count(*) into codSol from transferencia where nro_ra_sol=p_nroRA and ult_ver=0 and cod_estado_sol not in('AN','SE');
        if codSol=0 then
            p_nroInformeTec:=PKG_UTIL.FN_GENERAR_NRO_INFORME;
            select count(*) into codSol from transferencia where nro_ra_sol=p_nroRA and ult_ver=0 and cod_estado_sol in('AN','SE');
            if codSol>=1 then
                update transferencia set ult_ver=(select max(t.ult_ver)+1 from transferencia t
                where t.nro_ra_sol=p_nroRA) where nro_ra_sol=p_nroRA and ult_ver=0;
            end if;
            p_nroRaTra:='0';
            --p_nroRaTra:=PKG_SARA.GENERARRESOLUCIONTRANSFERENCIA;
            insert into transferencia (NRO_RA_SOL,NRO_RA_TRANS,POLIZA_TRANS,TRANSFERIDO_A
            ,MOTIVO_TRANS,LST_OPE,FCH_MOD,ULT_VER,HOJA_RUTA_TRANS,FECHA_TRANS,FECHA_RA_TRANS
            ,USER_MOD,COD_ESTADO_SOL,NRO_NOTA_TRANS,FECHA_NOTA_TRANS,NRO_INFORME_TEC,FCH_INFORME_TEC,USER_TRANS)
            --values(p_nroRA,'',p_poliza,p_transferidoA,p_motivo,'U',sysdate,0,p_hojaRutaTrans,to_date(p_fechaTransf||'12:00:00','dd/mm/yyyy hh24:mi:ss'),to_date(p_fechaTransf||'12:00:00','dd/mm/yyyy hh24:mi:ss'),p_userMod,'P',p_nroNotaTrans,to_date(p_fechaNotaTrans,'dd/mm/yyyy')
            values(p_nroRA,'',p_poliza,p_transferidoA,p_motivo,'U',sysdate,0,p_hojaRutaTrans,null,null,p_userMod,'P',p_nroNotaTrans,to_date(p_fechaNotaTrans,'dd/mm/yyyy')
            ,p_nroInformeTec,sysdate,p_userMod);
            p_opcion:='SAVE';
        else
            -- ini mod 12/04/2013
            select cod_estado_sol into vCodEstadoSol from transferencia where nro_ra_sol=p_nroRa and ult_ver=0 and lst_ope='U';
            if vCodEstadoSol='O'then
                vCodEstadoSol:='P';
            end if;
            -- fin mod 12/04/2013

            update transferencia set ult_ver=(select max(t.ult_ver)+1 from transferencia t
            where t.nro_ra_sol=p_nroRA) where nro_ra_sol=p_nroRA and ult_ver=0;
            INSERT ALL INTO transferencia SELECT
            nro_ra_sol,NRO_RA_TRANS,p_poliza,p_transferidoA,p_motivo,url_archivos_trans
            --,'U',sysdate,0,p_hojaRutaTrans,to_date(p_fechaTransf||'12:00:00','dd/mm/yyyy hh24:mi:ss') f1,to_date(p_fechaTransf||'12:00:00','dd/mm/yyyy hh24:mi:ss') f2,OBS_TRANS,p_userMod,'P'
            ,'U',sysdate,0,p_hojaRutaTrans,FECHA_TRANS,FECHA_RA_TRANS,OBS_TRANS,p_userMod,vCodEstadoSol
            ,p_nroNotaTrans,to_date(p_fechaNotaTrans,'dd/mm/yyyy'),NRO_INFORME_TEC,FCH_INFORME_TEC,p_userMod as vUserTrans
            FROM transferencia t where t.nro_ra_sol=p_nroRA
            and t.ULT_VER in (select max(ult_ver) from transferencia tr where tr.nro_ra_sol=p_nroRA and tr.lst_ope='U');

            select nro_informe_tec,nvl(nro_ra_trans,'0') into p_nroInformeTec,p_nroRaTra  from transferencia where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_nroRA;

            p_opcion:='UPDATE';
        end if;
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure aprobar_transferencia
    (
        p_RaLiberacion in varchar2,
        p_codEstadoSol in varchar2,
        p_obsTrans in varchar2,
        p_userMod in varchar2,
        p_nro_informe_tec out varchar2,
        p_ra_trans out varchar2,
        p_salida out varchar2
    )
    is
        codSol number;
        vnrora varchar2(20);
    begin
        -- MODIFICA EL VALOR DE LA VERSION+1
        update transferencia set ult_ver=(select max(t.ult_ver)+1 from transferencia t
        where t.nro_ra_sol=p_RaLiberacion) where nro_ra_sol=p_RaLiberacion and ult_ver=0;
        if p_codEstadoSol='A' then
            vnrora:=PKG_SARA.GENERARRESOLUCIONTRANSFERENCIA;
        else
            vnrora:='0';
        end if;
        p_ra_trans:=vnrora;
        INSERT ALL INTO transferencia SELECT
        nro_ra_sol,vnrora,poliza_trans,transferido_a,motivo_trans,url_archivos_trans
        ,'U',sysdate as fecha1,0,hoja_ruta_trans,sysdate fchtrans,sysdate as fchratrans
        ,p_obsTrans,p_userMod,p_codEstadoSol,nro_nota_trans,fecha_nota_trans,nro_informe_tec,fch_informe_tec,user_trans
        FROM transferencia t where t.nro_ra_sol=p_RaLiberacion
        and t.ULT_VER in (select max(ult_ver) from transferencia tr where tr.nro_ra_sol=p_RaLiberacion);
        commit;
        --select nro_informe_tec into p_nro_informe_tec from transferencia where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_RaLiberacion and cod_estado_sol<>'AN';
        p_nro_informe_tec:='0';
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure save_solicitudOtro
    (
        p_fechaSol in varchar2,
        p_fechaResolucionSol in varchar2,
        p_codSecor in solicitud.cod_sector%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_importador in varchar2,
        p_valorCIF in number,
        p_detalleSol in solicitud.detalle_sol%type,
        p_hoja_ruta in solicitud.HOJA_RUTA%type,
        p_informeTecSol in varchar2,
        p_nroRa varchar2,
        p_userMod in solicitud.user_mod%type,
        p_opcionSave in varchar2,
        p_salida out varchar2
    )
    is
        cont number;
        vCodSol number;
        vNroRa varchar2(30):=0;
        vNroInforme varchar2(30) := p_informeTecSol;
    begin
        if p_opcionSave='RO' then
            -- GENERAR NRO INFORME TECNICO
            vNroInforme:=PKG_UTIL.FN_GENERAR_NRO_INFORME;
            select nvl(max(to_number(cod_sol))+1,1) into vCodSol from solicitud;
            insert into solicitud
            (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol
            ,detalle_sol,valor_cif_sol,fecha_sol,nro_ra_sol,cod_estado_sol,user_mod,lst_ope,fch_mod,ult_ver
            ,hoja_ruta,fecha_ra,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_sector,nro_informe_tec
            ,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,tipo_doc_sol,user_sol,importador_sol,cod_proy,cif_saldo
            ,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto,hoja_ruta2,fecha_hoja_ruta2
            ,parrafo_adicional, inicial_tecnico, peso_exacto,factura_emitido,nro_ra_anterior,fch_ra_anterior)

            values (vCodSol,0,0,0,p_codAduana,p_codAgencia,0,0,p_detalleSol,p_valorCIF,to_date(p_fechaSol,'dd/MM/yyyy'),p_nroRa,'A',p_userMod,'U'
            ,sysdate,0,p_hoja_ruta,to_date(p_fechaResolucionSol,'dd/MM/yyyy'),p_valorCIF,'0','0',p_codSecor,vNroInforme
            ,0,0,0,0,0,0,'N',p_userMod,p_importador,0,0
            ,null,'N',sysdate,'0','0',null
            ,'','','ND','','',null);
            commit;
            p_salida:='OK';
        end if;

        if p_opcionSave='MO' then
                -- MODIFICA EL VALOR DE LA VERSION+1
                update solicitud set ult_ver=(select max(s.ult_ver)+1 from solicitud s
                where s.nro_informe_tec=p_informeTecSol) where nro_informe_tec=p_informeTecSol and ult_ver=0;
                -- INSERTAMOS NUEVA VERSION EN LA TABLA DE SOLICITUD
                INSERT ALL INTO SOLICITUD SELECT
                s.COD_SOL,s.NRO_SOL,s.COD_ENT,s.COD_ACRED,p_codAduana,p_codAgencia,s.COD_TIPO_BIEN,s.CANT_SOL
                ,p_detalleSol,p_valorCIF,to_date(p_fechaSol,'dd/mm/yyyy HH:MI:SS AM'),s.NRO_RA_SOL
                ,s.URL_ARCHIVO_SOL,s.COD_ESTADO_SOL,p_userMod,s.LST_OPE,sysdate,0
                ,s.OBS_SOL,p_hoja_ruta,to_date(p_fechaResolucionSol,'dd/mm/yyyy HH:MI:SS AM'),p_valorCIF as vValorCif,s.COD_FRV
                ,s.PESO_BRUTO_SOL,s.COD_CAT,s.COD_SECTOR,s.nro_informe_tec,s.FOB_SOL,s.SEGURO_SOL,s.FLETE_I_SOL,s.FLETE_II_SOL,
                s.GASTO_PORT_SOL,s.OTRO_GASTO_SOL,s.TIPO_DOC_SOL,p_userMod vUser,p_importador,s.cod_proy,s.cif_saldo
                ,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto,hoja_ruta2,fecha_hoja_ruta2
                ,parrafo_adicional, inicial_tecnico, peso_exacto,factura_emitido,s.nro_ra_anterior,s.fch_ra_anterior
                ,s.nombre_tec,cargo_tec,s.parrafoit,s.convenio,s.nomproy,s.nombre_acr,s.fch_emb,s.sol_entidad
                FROM SOLICITUD s where s.nro_informe_tec=p_informeTecSol
                and s.ULT_VER in (select max(ult_ver) from solicitud sol where sol.nro_informe_tec=p_informeTecSol and sol.lst_ope='U');
                commit;
                p_salida:='OK';
        end if;
        --if p_userMod='MERGUETA' then
            select nro_ra_sol into vNroRa from solicitud where ult_ver=0 and nro_informe_tec=vNroInforme;
            p_salida:='OK|'||vNroInforme;
        --end if;
    exception
        when others then
        ROLLBACK;
        p_salida:=SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM||'error:'||vNroInforme, 1, 255);
    end;
procedure save_proyecto
    (
    p_descProy in varchar2,
    p_codEntidad in varchar2,
    p_fchInicioProy in varchar2,
    p_fchFinProy in varchar2,
    p_convenioProy in varchar2,
    p_userMod in proyecto.user_mod%type,
    p_salida out varchar2
    )
    is
        vCodProy number;
    begin

        select nvl(max(to_number(cod_proy))+1,1) into vCodProy from proyecto;
        insert into proyecto (COD_PROY,DESC_PROY,COD_ENTIDAD,FCH_INI_PROY,FCH_FIN_PROY,CONVENIO_PROY,LST_OPE,ULT_VER,USER_MOD,FCH_MOD)
        values(vCodProy,'para uso exclusivo '||p_descProy,p_codEntidad,to_date(p_fchInicioProy,'dd/mm/yyyy'),to_date(p_fchFinProy,'dd/mm/yyyy'),p_convenioProy,'U','0',p_userMod,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure update_proyecto
    (
    p_codProy in varchar2,
    p_descProy in varchar2,
    p_codEntidad in varchar2,
    p_fchInicioProy in varchar2,
    p_fchFinProy in varchar2,
    p_convenioProy in varchar2,
    p_userMod in proyecto.user_mod%type,
    p_salida out varchar2
    )
    is
    begin
        -- ACTUALIZAR VERSION
        update proyecto set ult_ver=(select max(p.ult_ver)+1 from proyecto p
        where p.cod_proy=p_codProy) where cod_proy=p_codProy and ult_ver=0;

        --INSERTAR DATOS
        insert into proyecto (COD_PROY,DESC_PROY,COD_ENTIDAD,FCH_INI_PROY,FCH_FIN_PROY,CONVENIO_PROY,LST_OPE,ULT_VER,USER_MOD,FCH_MOD)
        values(p_codProy,p_descProy,p_codEntidad,to_date(p_fchInicioProy,'dd/mm/yyyy'),to_date(p_fchFinProy,'dd/mm/yyyy'),p_convenioProy,'U','0',p_userMod,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
    procedure anularRET
    (
    p_nroSol in varchar2,
    p_userMod in varchar2,
    p_motivo in varchar2,
    p_estado in varchar2,
    p_salida out varchar2,
    p_msj out varchar2,
    p_tipoBien out number
    )
    is
        cont number:=0;
        contTrans number:=0;
        vCodEstadoSol varchar2(2);
    begin
            p_tipoBien:=0;
            select count(*) into cont from solicitud s where s.lst_ope='U' and s.ult_ver=0 and s.cod_estado_sol not in('AN','SE') and s.nro_ra_sol=p_nroSol;
            if(cont>0) then
                select s.cod_tipo_bien,s.cod_estado_sol into p_tipoBien,vCodEstadoSol from solicitud s where s.lst_ope='U' and s.cod_estado_sol not in('AN','SE') and s.ult_ver=0 and s.nro_ra_sol=p_nroSol;
                if vCodEstadoSol='M' then
                    p_tipoBien:=2;
                end if;
                select count(*) into contTrans from transferencia where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_nroSol;
                if(contTrans<=0) then
                    -- MODIFICA EL VALOR DE LA VERSION+1
                    update solicitud set ult_ver=(select max(s.ult_ver)+1 from solicitud s where s.nro_ra_sol=p_nroSol) where nro_ra_sol=p_nroSol and ult_ver=0;

                    INSERT ALL INTO SOLICITUD SELECT
                    a.cod_sol, a.nro_sol, a.cod_ent, a.cod_acred, a.cod_aduana, a.emp_cod, a.cod_tipo_bien, a.cant_sol,
                    a.detalle_sol, a.valor_cif_sol, a.fecha_sol, a.nro_ra_sol,a.url_archivo_sol, p_estado,p_userMod,a.lst_ope,
                    sysdate, 0, p_motivo, a.hoja_ruta,a.fecha_ra, a.valor_cif_liberado, a.cod_frv, a.peso_bruto_sol,
                    a.cod_cat, a.cod_sector, a.nro_informe_tec, a.fob_sol,a.seguro_sol, a.flete_i_sol, a.flete_ii_sol, a.gasto_port_sol,
                    a.otro_gasto_sol, a.tipo_doc_sol, a.user_sol, a.importador_sol,a.cod_proy, a.cif_saldo
                    ,a.fecha_hoja_ruta,a.sexo_acred,a.fecha_informe_tec,a.tipo_bulto,a.hoja_ruta2,a.fecha_hoja_ruta2
                    ,a.parrafo_adicional, a.inicial_tecnico, a.peso_exacto,a.factura_emitido,a.nro_ra_anterior,a.fch_ra_anterior
                    ,a.nombre_tec,a.cargo_tec,a.parrafoit,a.convenio,a.nomproy,a.nombre_acr,a.fch_emb,a.sol_entidad
                    FROM SOLICITUD a where a.nro_ra_sol=p_nroSol
                    and a.ult_ver in (select max(ult_ver) from solicitud sol where sol.nro_ra_sol=p_nroSol and sol.lst_ope='U');
                    commit;
                    p_salida:='OK';
                    p_msj:='Se registro correctamente la operaci'||chr(243)||'n, Nro. Resoluci'||chr(243)||'n Liberada: '||p_nroSol;
                else
                    p_salida:='Error';
                    p_msj:='El Nro. Resoluci'||chr(243)||'n Liberada '||p_nroSol||', operaci'||chr(243)||'n no permitida.';
                end if;
            else
                p_salida:='Error';
                p_msj:='El Nro. Resoluci'||chr(243)||'n Liberada '||p_nroSol||' NO existe.';
            end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
    procedure anularRTM
    (
    p_nroRa in varchar2,
    p_userMod in varchar2,
    p_motivo in varchar2,
    p_estado in varchar2,
    p_salida out varchar2,
    p_msj out varchar2
    )
    is
    cont number:=0;
    nro varchar2(30);
    begin
        select count(*) into cont from transferencia where lst_ope='U' and ult_ver=0 and cod_estado_sol not in('AN','SE') and  nro_ra_trans=p_nroRa;
       if(cont>0) then
            select nro_ra_sol into nro from transferencia where nro_ra_trans=p_nroRa and ult_ver=0;
           -- MODIFICA EL VALOR DE LA VERSION+1
           update transferencia set ult_ver=(select max(t.ult_ver)+1 from transferencia t
           where t.nro_ra_sol=nro) where nro_ra_sol=nro and ult_ver=0;

           INSERT ALL INTO transferencia SELECT
           a.nro_ra_sol, a.nro_ra_trans, a.poliza_trans, a.transferido_a,
           a.motivo_trans, a.url_archivos_trans,a.lst_ope, sysdate,
           0, a.hoja_ruta_trans, a.fecha_trans, a.fecha_ra_trans,
           p_motivo, p_userMod,p_estado ,a.nro_nota_trans,
           a.fecha_nota_trans, a.nro_informe_tec,a.fch_informe_tec, a.user_trans
            FROM transferencia a where a.nro_ra_trans=p_nroRa
            and a.ult_ver in (select max(ult_ver) from transferencia t where t.nro_ra_trans=p_nroRa and t.lst_ope='U');
            commit;
            p_salida:='OK';
            p_msj:='Se registro correctamente la operaci'||chr(243)||'n, Nro. Resoluci'||chr(243)||'n Transferida: '||p_nroRa;
       else
            p_salida:='Error';
            p_msj:='El Nro. Resoluci'||chr(243)||'n Transferida '||p_nroRa||' NO existe.';
       end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;

    procedure registrarDocAdjuntos
    (
        p_nroSol in varchar2,
        p_codDoc in varchar2,
        p_emitidoPor in varchar2,
        p_nroDoc in varchar2,
        p_fchDoc in varchar2,
        p_itemDoc in varchar2,
        p_opcion varchar2,
        p_salida out varchar2

    )
    is
        cont number:=0;
        vSw number:=0;
    begin
        if p_opcion='R' then
            select count(*) into vSw  from solicitud s where s.lst_ope='U' and s.ult_ver=0 and s.nro_sol=trim(p_nroSol) and s.cod_estado_sol not in('AN','SE');
        end if;
        if vSw=0 then
            if p_itemDoc='0' then
                select nvl(max(to_number(orden)),0)+1 into cont from doc_adjuntosaux where nro_sol=p_nroSol;
                insert into doc_adjuntosaux (nro_sol,cod_doc, emitido, nro_doc, fecha_doc,orden)
                values(p_nroSol,p_codDoc,replace(p_emitidoPor,chr(39),''),replace(p_nroDoc,chr(39),''),to_date(trim(p_fchDoc),'dd/mm/yyyy'),cont);
            else
                delete from doc_adjuntosaux where nro_sol=p_nroSol and orden=p_itemDoc;
            end if;
            commit;
            p_salida:='OK';
        else
            p_salida:='NOOK';
        end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure save_solicitudPasada
    (
        p_codSol in varchar2,
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_fchRa in varchar2,
        p_nroSol in solicitud.nro_sol%type,
        p_fechaSol in varchar2,
        p_codEnt in solicitud.cod_ent%type,
        p_codAduana in solicitud.cod_aduana%type,
        p_codAgencia in solicitud.emp_cod%type,
        p_codTipoBien in solicitud.cod_tipo_bien%type,
        p_cantSol in solicitud.cant_sol%type,
        p_frv in solicitud.cod_frv%type,
        p_detalleSol in solicitud.detalle_sol%type,
        p_valorVifLiberado in number,
        p_userMod in solicitud.user_mod%type,
        p_opcionSave in varchar2,
        p_nombreAcre in varchar2,
        p_codSector in varchar2,
        p_solEntidad in varchar2,
        p_obsSol     in varchar2,
        p_salida out varchar2
    )
    is
    vDetalle varchar2(300):=p_detalleSol;
    cont number;
    vNroVersion number:=0;
    vCodSol number;
    contFRV number;
    begin
        select count(*) into cont  from solicitud where nro_ra_sol=p_nroRa and ult_ver=0 and lst_ope='U' and cod_estado_sol not in('AN','SE');
         if p_codTipoBien=2 then
            select count(*) into contFRV from solicitud s where s.lst_ope='U' and s.ult_ver=0 and s.cod_frv=p_frv and s.cod_frv<>0 and s.cod_estado_sol not in('AN','SE') and s.nro_ra_sol<>p_nroRa and s.cod_sol<>p_codSol;
            vDetalle:=PKG_UTIL.FN_DESCRIPCION_FRV(p_frv);
         end if;
        if p_opcionSave='M' then
            cont:=0;
        else
            select nvl(max(to_number(cod_sol))+1,1) into vCodSol from solicitud;
        end if;
        if cont=0 then
            if contFRV=0 then
                if p_opcionSave='M' then
                    --select cod_sol into vCodSol from solicitud where nro_ra_sol=p_nroRa and ult_ver=0;
                    vCodSol:=p_codSol;
                    update solicitud set ult_ver=(select max(s.ult_ver)+1 from solicitud s where s.cod_sol=p_codSol) where cod_sol=p_codSol and ult_ver=0;
                end if;
                insert into solicitud (cod_sol,nro_ra_sol,fecha_ra,nro_sol,fecha_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol,valor_cif_liberado,cod_frv
                ,detalle_sol,valor_cif_sol,user_mod
                ,lst_ope,fch_mod,cod_estado_sol,ult_ver,user_sol,cod_sector,tipo_doc_sol,nombre_acr,sol_entidad,obs_sol)
                values(vCodSol,p_nroRa,to_date(p_fchRa||'00:01:01','dd/mm/yyyy hh24:mi:ss'),p_nroSol,to_date(p_fechaSol,'dd/mm/yyyy'),p_codEnt,0,p_codAduana,p_codAgencia,p_codTipoBien,p_cantSol,p_valorVifLiberado,p_frv
                ,p_detalleSol,p_valorVifLiberado,p_userMod,'U',sysdate,'M',0,p_userMod,p_codSector,0,p_nombreAcre,p_solEntidad,p_obsSol);
                commit;
                p_salida:='OK';
            else
                p_salida:='El C'||chr(243)||'digo FRV  '||p_frv||' ya cuenta con un registro.';
            end if;
        else
            p_salida:='Ya existe registrado el Nro. de Res. Liberada: '||p_nroRa||'.';
        end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure habilitarRes
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_motivo in varchar2,
        p_user in varchar2,
        p_salida out varchar2
    )
    is
        contSol number;
        vEstado varchar2(3);
        contTrans number;
        contHab number;
        vtipoBien varchar2(3);
    begin
        select count(*) into contSol from solicitud where lst_ope='U' and ult_ver=0 and cod_estado_sol not in('AN','SE') and nro_ra_sol=p_nroRa;
        select count(*) into contHab from habilitar_trans where nro_ra_sol=p_nroRa;
        select count(*) into contTrans from transferencia where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_nroRa;
        if contSol>0 then
            if contHab=0 then
                if contTrans=0 then
                select cod_estado_sol,cod_tipo_bien into vEstado,vtipoBien from solicitud where lst_ope='U' and ult_ver=0 and nro_ra_sol=p_nroRa;
                    if vEstado='F' or vEstado='A' then
                        if vtipoBien='2' then
                            insert into habilitar_trans (nro_ra_sol,motivo,user_mod) values(p_nroRa,p_motivo,p_user);
                            commit;
                            p_salida:='Nro. de Resoluci'||chr(243)||'n '||p_nroRa||' correctamente habilitado.';
                        else
                            p_salida:='Solo puede habilitarse para veh'||chr(237)||'culos.';
                        end if;
                    else
                        p_salida:='Nro. de Resoluci'||chr(243)||'n '||p_nroRa||' NO puede ser habilitado.';
                    end if;
                else
                    p_salida:='Nro. de Resoluci'||chr(243)||'n '||p_nroRa||' NO puede ser habilitado.';
                end if;
            else
                p_salida:='Nro. de Resoluci'||chr(243)||'n '||p_nroRa||' se encuentra habilitado.';
            end if;
        else
            p_salida:='Nro. de Resoluci'||chr(243)||'n '||p_nroRa||' NO existe.';
        end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure validarTransferencia
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_salida out varchar2
    )
    is
        vNroDias number;
        vContTrans number;
        vFechaTrans varchar2(30);
        vEstado varchar2(2);
        vTipoBien number;
        vCodAcred number;
        vContSol number;
        vT number;
        contFch number;
        vContObs number;
        vnrofrv varchar(30);
    begin
        select count(*) into vContSol from solicitud where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0;
        if vContSol=0 then
            p_salida:='El Nro. de Resoluci'||chr(243)||'n Liberada '||p_nroRa||' NO existe.';
            return;
        end if;
        select cod_tipo_bien,cod_estado_sol,cod_acred,trim(cod_frv) into vTipoBien,vEstado,vCodAcred,vnrofrv from solicitud where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0;
        if  vTipoBien=1 then
            p_salida:='Solo puede transferir veh'||chr(237)||'culos.';
            return;
        end if;
        if vEstado='P' or vEstado='O' then
            p_salida:='El Nro. de Resoluci'||chr(243)||'n Liberada '||p_nroRa||' NO existe.';
            return;
        end if;
        select count(*) into vT from transferencia t where t.nro_ra_sol=p_nroRa and t.lst_ope='U' and t.ult_ver=0 and cod_estado_sol not in('AN','SE');
        if vT>0 then
            p_salida:='El Nro. de Resoluci'||chr(243)||'n Liberada '||p_nroRa||' ya cuenta con un registro de transferencia.';
            return;
        end if;
        select count(*) into vContObs from habilitar_trans where nro_ra_sol=p_nroRa;
        if vContObs>0 then
            p_salida:='OK';
            return;
        end if;
        if vCodAcred=0 then
            vNroDias:=1095;
        else
            vNroDias:=730;
        end if;

        select count(*) into vContTrans from solicitud so, ops$asy.sad_trr@asy_db.sidunea ve,ops$asy.sad_gen@asy_db.sidunea sa where SO.COD_FRV=ve.sad_att_ref
        and VE.KEY_YEAR=sa.key_year and ve.key_cuo=sa.key_cuo and ve.key_dec=sa.key_dec and ve.key_nber=sa.key_nber
        and so.ULT_VER=0 and so.LST_OPE='U' and so.cod_tipo_bien='2' and so.nro_ra_sol=p_nroRa
        and ve.sad_num=0 and sa.lst_ope='U' and sa.sad_num=0 and ve.sad_att_cod='996'
        and sa.sad_typ_proc=4 and sa.sad_flw=1 and sa.sad_asmt_nber is not null
        and sysdate>=sa.sad_reg_date+vNroDias;

        if vnrofrv!='020000596' then
            select count(to_char(sa.sad_reg_date+(vNroDias+1),'dd/mm/yyyy')) into contFch from solicitud so, ops$asy.sad_trr@asy_db.sidunea ve,ops$asy.sad_gen@asy_db.sidunea sa where SO.COD_FRV=ve.sad_att_ref
            and VE.KEY_YEAR=sa.key_year and ve.key_cuo=sa.key_cuo and ve.key_dec=sa.key_dec and ve.key_nber=sa.key_nber
            and so.ULT_VER=0 and so.LST_OPE='U' and so.cod_tipo_bien='2' and so.nro_ra_sol=p_nroRa
            and ve.sad_num=0 and sa.lst_ope='U' and sa.sad_num=0 and ve.sad_att_cod='996'
            and sa.sad_typ_proc=4 and sa.sad_flw=1 and sa.sad_asmt_nber is not null;

            if contFch>0 then
                select to_char(sa.sad_reg_date+(vNroDias+1),'dd/mm/yyyy') into vFechaTrans from solicitud so, ops$asy.sad_trr@asy_db.sidunea ve,ops$asy.sad_gen@asy_db.sidunea sa where SO.COD_FRV=ve.sad_att_ref
                and VE.KEY_YEAR=sa.key_year and ve.key_cuo=sa.key_cuo and ve.key_dec=sa.key_dec and ve.key_nber=sa.key_nber
                and so.ULT_VER=0 and so.LST_OPE='U' and so.cod_tipo_bien='2' and so.nro_ra_sol=p_nroRa
                and ve.sad_num=0 and sa.lst_ope='U' and sa.sad_num=0 and ve.sad_att_cod='996'
                and sa.sad_typ_proc=4 and sa.sad_flw=1 and sa.sad_asmt_nber is not null;
            end if;
        end if;
        if vContTrans>=1 or vEstado='M'  then
            p_salida:='OK';
        else
            p_salida:='Podr'||chr(225)||' realizarse la transferencia a partir del '||vFechaTrans||'.';
        end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure validarTransferenciaMod
    (
        p_nroRa in SOLICITUD.NRO_RA_SOL%type,
        p_perfil in varchar2,
        p_salida out varchar2
    )
    is
        vEstado varchar2(2);
        vContT number;
        vContSol number;
    begin
        select count(*) into vContSol from solicitud where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0;
        if vContSol=0 then
            p_salida:='La Resoluci'||chr(243)||'n Liberada '||p_nroRa||' NO existe.';
            return;
        end if;
        select cod_estado_sol into vEstado from solicitud where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0;
        if vEstado='P' or vEstado='O' then
            p_salida:='Resoluci'||chr(243)||'n Liberada '||p_nroRa||' debe registrar antes de modificar.';
            return;
        end if;
        select count(1) into vContT from transferencia where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0 and cod_estado_sol in ('P','O','AN','SE');
        if vContT>0 then
            p_salida:='OK';
        else
            select count(1) into vContT from transferencia where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0 and cod_estado_sol in ('A','F');
            if vContT>0 then
                select cod_estado_sol into vEstado from transferencia where nro_ra_sol=p_nroRa and lst_ope='U' and ult_ver=0;
                if vEstado='A' then
                    if p_perfil='SUPERVISOR' then
                        p_salida:='OK';
                    else
                        p_salida:='Resoluci'||chr(243)||'n Liberada '||p_nroRa||' NO puede se Modificada. Transferencia Aprobada.';
                    end if;
                elsif vEstado='F' then
                    p_salida:='Resoluci'||chr(243)||'n Liberada '||p_nroRa||' NO puede se Modificada. Transferencia Concluida.';
                end if;
            else
                p_salida:='Resoluci'||chr(243)||'n Liberada '||p_nroRa||' debe registrar antes de modificar.';
            end if;
        end if;
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure generarResolucionLiberacion
    (
        p_codSector in varchar2,
        p_salida out varchar2
    )
    is
    vContSol number;
    vNroCorr varchar(30);
    x number;
    vNroVerificador number;
    begin
        select count(*) into vContSol from solicitud where lst_ope='U' and ult_ver=0 and cod_estado_sol<>'M' and cod_sector=p_codSector;
        if vContSol>0 then
            select (NVL(max(to_number(substr(nro_ra_sol,6,4))),0)+1) into vNroCorr from solicitud where to_char(fecha_ra,'yyyy')=to_char(sysdate,'yyyy')
            and cod_sector=p_codSector and cod_estado_sol<>'M';
        else
            select  (NVL(max(to_number(substr(nro_ra_anterior,6,4))),0)+1) into vNroCorr from sector where lst_ope='U' and cod_sector=p_codSector;
        end if;
        x:=length(vNroCorr);
        if x=1 then
            vNroCorr:='000'||vNroCorr;
        elsif x=2 then
            vNroCorr:='00'||vNroCorr;
        elsif x=3 then
            vNroCorr:='0'||vNroCorr;
        end if;
        vNroCorr:=p_codSector||to_char(sysdate,'yy')||vNroCorr;
        vNroVerificador:=PKG_UTIL.FN_NRO_VERIFICADOR(vNroCorr);
        p_salida:=vNroCorr||to_char(vNroVerificador);
    exception
        when others then
        rollback;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
function generarResolucionTransferencia
    return varchar2
    is
    vContTrans number;
    vNroCorr varchar(30);
    x number;
    begin
        select count(*) into vContTrans from transferencia where lst_ope='U' and ult_ver=0 and nro_ra_trans is not null;
        if vContTrans>0 then
            select (NVL(max(to_number(substr(nro_ra_trans,1,3))),0)+1) into vNroCorr from transferencia where to_char(fecha_ra_trans,'yyyy')=to_char(sysdate,'yyyy');
        else
            select (NVL(max(to_number(substr(nro_trans_anterior,1,3))),0)+1) into vNroCorr from sector where lst_ope='U' and cod_sector='104';
        end if;
        x:=length(vNroCorr);
        if x=1 then
            vNroCorr:='00'||vNroCorr;
        elsif x=2 then
            vNroCorr:='0'||vNroCorr;
        end if;
         return vNroCorr||'/TRAN/'||to_char(sysdate,'yyyy');
    exception
        when others then
        rollback;
        return '1';
    end;
procedure save_documento
    (
    p_descDoc in varchar2,
    p_estadoDoc in varchar2,
    p_userMod in varchar2,
    p_salida out varchar2
    )
    is
        vCodDoc number;
    begin
        select nvl(max(to_number(atd_cod))+1,1) into vCodDoc from set_documentos;
        insert into set_documentos (atd_cod,atd_dsc,atd_est,lst_ope,ult_ver,user_mod,fch_mod)
        values(vCodDoc,p_descDoc,p_estadoDoc,'U',0,p_userMod,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure update_documento
    (
    p_codDoc in varchar2,
    p_descDoc in varchar2,
    p_estadoDoc in varchar2,
    p_userMod in varchar2,
    p_salida out varchar2
    )
    is
    begin
        -- ACTUALIZAR VERSION
        update set_documentos set ult_ver=(select max(u.ult_ver)+1 from set_documentos u
        where u.atd_cod=p_codDoc) where atd_cod=p_codDoc and ult_ver=0;

        --INSERTAR DATOS
        insert into set_documentos (atd_cod,atd_dsc,atd_est,lst_ope,ult_ver,user_mod,fch_mod)
        values(p_codDoc,p_descDoc,p_estadoDoc,'U',0,p_userMod,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure save_saldo
    (
    p_codAcred in varchar2,
    p_saldoAcred in number,
    p_tipoBien in varchar2,
    p_salida out varchar2
    )
    is
        vCodSaldo number;
        vContSaldo number;
    begin
        select count(*) into vContSaldo from solicitud_saldo where cod_acred=p_codAcred and cod_tipo_bien=p_tipoBien and lst_ope='U' and ult_ver=0;
        if vContSaldo>0 then
            p_salida:=' Ya existe registro.';
            return;
        end if;

        select nvl(max(to_number(cod_saldo))+1,1) into vCodSaldo from solicitud_saldo;

        insert into solicitud_saldo (cod_saldo,cod_acred, saldo_acred, cod_tipo_bien, lst_ope, ult_ver,fch_mod)
        values(vCodSaldo,p_codAcred,p_saldoAcred,p_tipoBien,'U',0,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure update_saldo
    (
    p_codSaldo in varchar2,
    p_codAcred in varchar2,
    p_saldoAcred in number,
    p_tipoBien in varchar2,
    p_salida out varchar2
    )
    is
        vContSaldo number;
    begin
        select count(*) into vContSaldo from solicitud_saldo where cod_acred=p_codAcred and cod_tipo_bien=p_tipoBien and lst_ope='U' and ult_ver=0 and cod_saldo<>p_codSaldo;
        if vContSaldo>0 then
            p_salida:=' Ya existe registro.';
            return;
        end if;
        -- ACTUALIZAR VERSION
        update solicitud_saldo set ult_ver=(select max(u.ult_ver)+1 from solicitud_saldo u
        where u.cod_saldo=p_codSaldo) where cod_saldo=p_codSaldo and lst_ope='U' and ult_ver=0;

        --INSERTAR DATOS
        insert into solicitud_saldo (cod_saldo,cod_acred, saldo_acred, cod_tipo_bien, lst_ope, ult_ver,fch_mod)
        values(p_codSaldo,p_codAcred,p_saldoAcred,p_tipoBien,'U',0,SYSDATE);
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure mod_documentos_sol
    (
    p_nro_sol in varchar2,
    p_salida  out varchar2
    )
    is
    begin
        delete from doc_adjuntosaux where nro_sol=p_nro_sol;
        insert into doc_adjuntosaux select nro_sol,nro_informe,cod_doc,replace(emitido,chr(39),''),replace(nro_doc,chr(39),''),fecha_doc,orden,imprimir,nro_ra_sol
        from doc_adjuntos where nro_sol=p_nro_sol;
        commit;
        p_salida:='OK';
    exception
        when others then
        ROLLBACK;
        p_salida:=SQLCODE || '-' || SQLERRM;
    end;
procedure save_ret
    (
        p_user_mod          in  varchar2,
        p_nro_ra_sol        in  varchar2,
        p_categoria         in  varchar2,
        p_cuota_anual       in  varchar2,
        p_concedido         in  varchar2,
        p_valor_liberado    in  varchar2,
        p_saldo             in  varchar2,
        p_total_liberado    in  varchar2,
        p_parrafo1          in  varchar2,
        p_parrafo2          in  varchar2,
        p_parrafo3          in  varchar2,
        p_parrafo4          in  varchar2,
        p_parrafo5          in  varchar2,
        p_parrafo6          in  varchar2,
        p_parrafo7          in  varchar2,
        p_parrafo8          in  varchar2,
        p_aduana            in  varchar2
    )
    is
    begin
        delete from RET where user_mod=p_user_mod and nro_ra_sol=p_nro_ra_sol;
        insert into RET (user_mod,nro_ra_sol,categoria,cuota_anual,concedido,valor_liberado,saldo,total_liberado,parrafo1,parrafo2,parrafo3,parrafo4,parrafo5,parrafo6,parrafo7,parrafo8,aduana)
        values(p_user_mod,p_nro_ra_sol,p_categoria,p_cuota_anual,p_concedido,p_valor_liberado,p_saldo,p_total_liberado,replace(p_parrafo1,'&',' y '),replace(p_parrafo2,'&',' y ')
        ,replace(p_parrafo3,'&',' y '),replace(p_parrafo4,'&',' y '),replace(p_parrafo5,'&',' y '),replace(p_parrafo6,'&',' y '),replace(p_parrafo7,'&',' y '),replace(p_parrafo8,'&',' y '),replace(p_aduana,'&',' y '));
        COMMIT;
    exception
        when others then
        ROLLBACK;
    end;

end pkg_sara;
/

