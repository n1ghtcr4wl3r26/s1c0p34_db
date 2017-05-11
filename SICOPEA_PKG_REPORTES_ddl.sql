CREATE OR REPLACE 
PACKAGE pkg_reportes
  IS
    TYPE cursortype IS REF CURSOR;



  FUNCTION versiona_solicitud (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN NUMBER;
      
      
  FUNCTION versiona_transferencia (
      prm_nro_ra_sol       IN   VARCHAR2
   )
      RETURN NUMBER;
   
  FUNCTION adjunta_solicitud   ( 
        prm_cod_sol     IN       VARCHAR2, 
        prm_usu_reg     IN       VARCHAR2, 
        prm_url         IN       VARCHAR2
      )
       RETURN  VARCHAR2;
       
  FUNCTION adjunta_transferencia   ( 
        prm_nro_ra_sol     IN       VARCHAR2, 
        prm_usu_reg     IN       VARCHAR2, 
        prm_url         IN       VARCHAR2
      )
       RETURN  VARCHAR2;
       
  FUNCTION lista_res_adj   ( 
        prm_fecini     IN       VARCHAR2, 
        prm_fecfin     IN       VARCHAR2,
        prm_tipo       IN       VARCHAR2
      )
       RETURN cursortype;
       
  FUNCTION lista_rep_est   ( 
        prm_fecini     IN       VARCHAR2, 
        prm_fecfin     IN       VARCHAR2,
        prm_tipo       IN       VARCHAR2,
        prm_codent     IN       VARCHAR2,
        prm_estado     IN       VARCHAR2,
        prm_sector     IN       VARCHAR2
      )
       RETURN cursortype;
       
       
 FUNCTION devuelve_resolucion (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN VARCHAR;

 FUNCTION devuelve_resoluciont (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN VARCHAR;
 
END;
/

CREATE OR REPLACE 
PACKAGE BODY pkg_reportes
IS

  FUNCTION versiona_solicitud (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN NUMBER
   IS
      VERSION   NUMBER (3) := 0;
   BEGIN
      SELECT MAX (ult_ver)
        INTO VERSION
        FROM solicitud
       WHERE cod_sol = prm_cod_sol;

      UPDATE solicitud
         SET ult_ver = VERSION + 1
       WHERE cod_sol = prm_cod_sol
         AND ult_ver = 0;

      RETURN (VERSION + 1);
   END;

   FUNCTION versiona_transferencia (
      prm_nro_ra_sol       IN   VARCHAR2
   )
      RETURN NUMBER
   IS
      VERSION   NUMBER (3) := 0;
   BEGIN
      SELECT MAX (ult_ver)
        INTO VERSION
        FROM transferencia tr
       WHERE tr.nro_ra_sol = prm_nro_ra_sol;

      UPDATE transferencia
         SET ult_ver = VERSION + 1
       WHERE nro_ra_sol = prm_nro_ra_sol
         AND ult_ver = 0;

      RETURN (VERSION + 1);
   END;


   FUNCTION adjunta_solicitud   (
        prm_cod_sol     IN       VARCHAR2,
        prm_usu_reg     IN       VARCHAR2,
        prm_url         IN       VARCHAR2
      )
       RETURN  VARCHAR2
    IS
        RES VARCHAR2(50) := 'EL ARCHIVO FUE ADJUNTADO SATISFACTORIAMENTE';
        imax number(3);
    BEGIN


        imax := versiona_solicitud (prm_cod_sol);
        insert into solicitud
        (cod_sol,nro_sol,cod_ent,cod_acred,cod_aduana,emp_cod,cod_tipo_bien,cant_sol,detalle_sol,
        valor_cif_sol,fecha_sol,nro_ra_sol,url_archivo_sol,cod_estado_sol,user_mod,lst_ope,fch_mod,ult_ver,
        obs_sol,hoja_ruta,fecha_ra,valor_cif_liberado,cod_frv,peso_bruto_sol,cod_cat,cod_sector,
        nro_informe_tec,fob_sol,seguro_sol,flete_i_sol,flete_ii_sol,gasto_port_sol,otro_gasto_sol,
        tipo_doc_sol,user_sol,importador_sol,cod_proy,cif_saldo,fecha_hoja_ruta,sexo_acred,
        fecha_informe_tec,tipo_bulto,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional,inicial_tecnico,
        peso_exacto,factura_emitido,nro_ra_anterior,fch_ra_anterior,nombre_tec,cargo_tec,parrafoit,convenio,nomproy,nombre_acr,fch_emb)
        select s.cod_sol, s.nro_sol, s.cod_ent, s.cod_acred, s.cod_aduana, s.emp_cod,
        s.cod_tipo_bien, s.cant_sol, s.detalle_sol, s.valor_cif_sol, s.fecha_sol, s.nro_ra_sol, prm_url, 'F',
        prm_usu_reg, 'U', SYSDATE, '0', s.obs_sol, s.hoja_ruta, s.fecha_ra, s.valor_cif_liberado,s.cod_frv,s.peso_bruto_sol,s.cod_cat,s.COD_SECTOR,s.nro_informe_tec
        ,s.fob_sol,s.seguro_sol,s.flete_i_sol,s.flete_ii_sol,s.gasto_port_sol,s.otro_gasto_sol,s.tipo_doc_sol,s.user_sol,s.importador_sol,cod_proy,cif_saldo
        ,fecha_hoja_ruta,sexo_acred,fecha_informe_tec,tipo_bulto,hoja_ruta2,fecha_hoja_ruta2,parrafo_adicional, inicial_tecnico
        ,peso_exacto,factura_emitido,nro_ra_anterior,fch_ra_anterior,nombre_tec,cargo_tec,parrafoit,convenio,nomproy,nombre_acr,fch_emb
        from solicitud s where s.cod_sol = prm_cod_sol and s.ult_ver = imax;
        COMMIT;



   RETURN RES;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
   END;

FUNCTION adjunta_transferencia   (
        prm_nro_ra_sol     IN       VARCHAR2,
        prm_usu_reg     IN       VARCHAR2,
        prm_url         IN       VARCHAR2
      )
       RETURN  VARCHAR2
    IS
        RES VARCHAR2(50) := 'EL ARCHIVO FUE ADJUNTADO SATISFACTORIAMENTE';
        imax number(3);
    BEGIN


        imax := versiona_transferencia (prm_nro_ra_sol);
        insert into transferencia
        (nro_ra_sol,nro_ra_trans,poliza_trans,transferido_a,motivo_trans,url_archivos_trans,lst_ope,fch_mod,
        ult_ver,hoja_ruta_trans,fecha_trans,fecha_ra_trans,obs_trans,user_mod,cod_estado_sol,nro_nota_trans,
        fecha_nota_trans,nro_informe_tec,fch_informe_tec,user_trans)
        select t.nro_ra_sol, t.nro_ra_trans, t.poliza_trans, t.transferido_a,
        t.motivo_trans, prm_url, 'U', SYSDATE, '0', t.hoja_ruta_trans,
        t.fecha_trans, t.fecha_ra_trans, t.obs_trans, prm_usu_reg, 'F',nro_nota_trans,fecha_nota_trans,nro_informe_tec,fch_informe_tec,user_trans
        from transferencia t where t.nro_ra_sol = prm_nro_ra_sol and t.ult_ver = imax;
        COMMIT;
   RETURN RES;
   EXCEPTION
      WHEN OTHERS
      THEN
         ROLLBACK;
         RETURN SUBSTR (TO_CHAR (SQLCODE) || ': ' || SQLERRM, 1, 255);
   END;



   FUNCTION lista_res_adj   (
        prm_fecini     IN       VARCHAR2,
        prm_fecfin     IN       VARCHAR2,
        prm_tipo       IN       VARCHAR2
      )
       RETURN cursortype
   IS
       ct       cursortype;
    BEGIN



      IF (prm_tipo = '0')
      THEN

        OPEN ct FOR
        SELECT * FROM (
        select so.nro_ra_sol,  to_char(so.fecha_ra,'dd/mm/yyyy') as fecha, so.url_archivo_sol, nvl(ac.nombre,'OFICIAL'), en.des_ent,
decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, so.nro_sol, 'L' as tipoc, so.cod_sol as tram
from solicitud so, acreditacion ac, entidad en, sector se
where so.ult_ver = 0 and so.lst_ope = 'U'
and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
and en.ver = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent and en.cod_sector = se.cod_sector
and so.fecha_ra between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
and (so.cod_estado_sol = 'A' or so.cod_estado_sol = 'F')
        UNION ALL
          select tr.nro_ra_trans,  to_char(tr.fecha_ra_trans,'dd/mm/yyyy') as fecha, tr.url_archivos_trans, nvl(ac.nombre,'OFICIAL'),
en.des_ent,
decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc, tr.nro_ra_sol as tram
from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
where so.ult_ver = 0 and so.lst_ope = 'U'
and tr.ult_ver = 0 and tr.lst_ope = 'U'
and tr.nro_ra_sol = so.nro_ra_sol
and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
and en.ver = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent
and en.cod_sector = se.cod_sector
and so.fecha_ra between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and

to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
and (tr.cod_estado_sol = 'A' or tr.cod_estado_sol = 'F') )order by fecha desc;

      END IF;

    IF (prm_tipo = '1') THEN
        OPEN ct FOR
        select nvl(so.nro_ra_sol,'--'),to_char(so.fecha_ra,'dd/mm/yyyy') as fecha,so.url_archivo_sol
        ,nvl((select a.nombre from acreditacion a where a.cod_acred=so.cod_acred and a.ver = 0 and a.lst_ope = 'U' ),'--')
        ,nvl((select en.des_ent from entidad en where en.cod_ent=so.cod_ent and en.ver = 0 and en.lst_ope = 'U'),so.importador_sol)
        ,(select s.desc_sector from sector s where s.cod_sector=so.cod_sector and s.lst_ope='U') as tipo , so.detalle_sol,so.nro_sol, 'L' as tipoc, so.cod_sol as tram
        from solicitud so where so.cod_estado_sol in('A','F') and so.ult_ver = 0 and so.lst_ope = 'U'
        and so.fecha_ra between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        order by so.cod_sector,so.nro_ra_sol,fecha desc;
    END IF;


IF (prm_tipo = '2')
      THEN

        OPEN ct FOR
        select tr.nro_ra_trans, to_char(tr.fecha_ra_trans,'dd/mm/yyyy') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--')),
nvl(en.des_ent,nvl(so.importador_sol,'--')), se.desc_sector as tipo,so.detalle_sol, tr.nro_ra_sol, 'T' as tipoc, tr.nro_ra_sol as tram
from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
where so.ult_ver = 0 and so.lst_ope = 'U'
and tr.ult_ver = 0 and tr.lst_ope = 'U'
and tr.nro_ra_sol = so.nro_ra_sol
and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
and so.cod_sector = se.cod_sector
and so.fecha_ra between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and

to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
and (tr.cod_estado_sol = 'A' or tr.cod_estado_sol = 'F')  order by fecha desc;
 END IF;

   RETURN ct;
   END;


FUNCTION devuelve_resolucion (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN VARCHAR
   IS
       res       VARCHAR(20);
   BEGIN

            select nro_ra_sol into res from solicitud
            where ult_ver = 0
            and lst_ope = 'U'
            and cod_sol = prm_cod_sol;

      RETURN res;
   END;



FUNCTION devuelve_resoluciont (
      prm_cod_sol       IN   VARCHAR2
   )
      RETURN VARCHAR
   IS
       res       VARCHAR(20);
   BEGIN

            select replace(tr.nro_ra_trans,'/','') into res from transferencia tr
            where tr.ult_ver = 0
            and tr.lst_ope = 'U'
            and tr.nro_ra_sol = prm_cod_sol;

      RETURN res;
   END;



FUNCTION lista_rep_est   (
        prm_fecini     IN       VARCHAR2,
        prm_fecfin     IN       VARCHAR2,
        prm_tipo       IN       VARCHAR2,
        prm_codent     IN       VARCHAR2,
        prm_estado     IN       VARCHAR2,
        prm_sector     IN       VARCHAR2
      )
       RETURN cursortype
   IS
       ct       cursortype;
       vEstado varchar2(10):='NINGUNO';
    BEGIN
      IF (prm_tipo = '0')
      THEN

        OPEN ct FOR
        SELECT * FROM (
        select nvl(so.nro_ra_sol,' '), nvl(to_char(so.fecha_ra,'dd/mm/yyyy'),' ') as fecha, so.url_archivo_sol, nvl(ac.nombre,'OFICIAL'), en.des_ent,
decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, so.nro_sol, 'L' as tipoc,
so.cant_sol, nvl(so.detalle_sol,' '),so.valor_cif_sol as CIF, so.cod_sol as codide, decode(so.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado
from solicitud so, acreditacion ac, entidad en, sector se
where so.ult_ver = 0 and so.lst_ope = 'U'
and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
and en.ver = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent and en.cod_sector = se.cod_sector

and so.fecha_ra between to_date(prm_fecini, 'dd/mm/yyyy') and to_date(prm_fecfin, 'dd/mm/yyyy')
and so.cod_estado_sol like prm_estado
and en.cod_ent like prm_codent
        UNION ALL
          select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,'OFICIAL'),
en.des_ent, decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc,
so.cant_sol, nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado
from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
where so.ult_ver = 0 and so.lst_ope = 'U'
and tr.ult_ver = 0 and tr.lst_ope = 'U'
and tr.nro_ra_sol = so.nro_ra_sol
and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
and en.ver = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent
and en.cod_sector = se.cod_sector
and so.fecha_sol between to_date(prm_fecini, 'dd/mm/yyyy') and to_date(prm_fecfin, 'dd/mm/yyyy')
and tr.cod_estado_sol like prm_estado
and en.cod_ent like prm_codent and so.cod_sector like prm_sector) order by fecha,nro_sol desc;

      END IF;
-- REPORTE DE ESTADOS DE TRAMITE LIBERACIONES
IF (prm_tipo = '1')
      THEN
        OPEN ct FOR
        select
        nvl(so.nro_ra_sol,'--'), nvl(to_char(so.fecha_ra,'dd/mm/yyyy'),' ') as fecha, so.url_archivo_sol
        ,nvl((select a.nombre from acreditacion a where a.cod_acred=so.cod_acred and a.ver = 0 and a.lst_ope = 'U' ),nvl(so.nombre_acr,'--'))
        ,nvl(nvl((select en.des_ent from entidad en where en.cod_ent=so.cod_ent and en.ver = 0 and en.lst_ope = 'U'),so.importador_sol),'--')
        ,nvl((select s.desc_sector from sector s where s.cod_sector=so.cod_sector and s.lst_ope='U'),'--') as tipo
        ,decode(so.nro_sol,'0','--',so.nro_sol),'L' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        , nvl(so.detalle_sol,' '),so.valor_cif_sol as CIF, so.cod_sol as codide
        ,decode(so.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','M','Tr'||chr(225)||'mite Concluido - Res. Manual','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot
        ,decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' --') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,so.user_sol
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        from solicitud so where
        so.ult_ver = 0 and so.lst_ope = 'U'
        and trunc(so.fecha_ra) between to_date(prm_fecini, 'dd/mm/yyyy') and to_date(prm_fecfin, 'dd/mm/yyyy')
        and so.cod_estado_sol like prm_estado
        and so.cod_sector like prm_sector
        and so.cod_ent like prm_codent order by so.cod_sector,so.nro_ra_sol,fecha desc;

 END IF;

-- REPORTE DE ESTADOS DE TRAMITE TRANSFERENCIA
IF (prm_tipo = '2') THEN
    if prm_estado='AN' or prm_estado='SE' then
        OPEN ct FOR
         select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--'))
        ,nvl(en.des_ent,'--'), decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        ,nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,tr.user_trans
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        ,tr.motivo_trans
        from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
        where so.ult_ver = 0 and so.lst_ope = 'U'
        and tr.ult_ver = 0 and tr.lst_ope = 'U'
        and tr.nro_ra_sol = so.nro_ra_sol
        and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
        and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
        and so.cod_sector = se.cod_sector
        and tr.fecha_ra_trans between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        and tr.cod_estado_sol like prm_estado
        and en.cod_ent(+) like prm_codent
        and so.cod_sector like prm_sector
        UNION
         select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--'))
        ,nvl(en.des_ent,'--'), decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        ,nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,tr.user_trans
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        ,tr.motivo_trans
        from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
        where so.ult_ver = 0 and so.lst_ope = 'U'
        and tr.ult_ver <> 0 and tr.lst_ope = 'U'
        and nro_ra_trans is not null
        and tr.nro_ra_sol = so.nro_ra_sol
        and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
        and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
        and so.cod_sector = se.cod_sector
        and nvl(tr.fecha_ra_trans,fch_informe_tec) between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        and tr.cod_estado_sol like prm_estado
        and en.cod_ent(+) like prm_codent
        and so.cod_sector like prm_sector
        order by fecha,nro_ra_sol desc;
    elsif prm_estado='%' then
        OPEN ct FOR
         select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--'))
        ,nvl(en.des_ent,'--'), decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        ,nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,tr.user_trans
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        ,tr.motivo_trans
        from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
        where so.ult_ver = 0 and so.lst_ope = 'U'
        and tr.ult_ver = 0 and tr.lst_ope = 'U'
        and tr.nro_ra_sol = so.nro_ra_sol
        and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
        and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
        and so.cod_sector = se.cod_sector
        and nvl(tr.fecha_ra_trans,fch_informe_tec) between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        and tr.cod_estado_sol like prm_estado
        and en.cod_ent(+) like prm_codent
        and so.cod_sector like prm_sector
        UNION
         select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--'))
        ,nvl(en.des_ent,'--'), decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        ,nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,tr.user_trans
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        ,tr.motivo_trans
        from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
        where so.ult_ver = 0 and so.lst_ope = 'U'
        and tr.ult_ver <> 0 and tr.lst_ope = 'U'
        and nro_ra_trans is not null
        and tr.nro_ra_sol = so.nro_ra_sol
        and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
        and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
        and so.cod_sector = se.cod_sector
        and nvl(tr.fecha_ra_trans,fch_informe_tec) between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        and tr.cod_estado_sol in ('AN','SE')
        and en.cod_ent(+) like prm_codent
        and so.cod_sector like prm_sector
        order by fecha,nro_ra_sol desc;
    else
        OPEN ct FOR
         select nvl(tr.nro_ra_trans,' '), nvl(to_char(tr.fecha_ra_trans,'dd/mm/yyyy'),' ') as fecha, tr.url_archivos_trans, nvl(ac.nombre,nvl(so.nombre_acr,'--'))
        ,nvl(en.des_ent,'--'), decode(so.cod_acred, 0 ,se.desc_sector, 'PARTICULAR') as tipo, tr.nro_ra_sol, 'T' as tipoc
        ,decode(so.emp_cod,'0','--',nvl((select op.nom_rzs from operador.olopetab@asy_db.sidunea op where op.emp_cod =so.emp_cod and op.ult_ver = 0),(select c.ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=so.emp_cod))) as agenciaSol
        ,nvl(so.detalle_sol,' '), so.valor_cif_sol as CIF, tr.nro_ra_sol as codide, decode(tr.cod_estado_sol,'P','Tr'||chr(225)||'mite Pendiente', 'A','Tr'||chr(225)||'mite Aprobado','O','Tr'||chr(225)||'mite Observado','F','Tr'||chr(225)||'mite Concluido','AN','Tr'||chr(225)||'mite Anulado','SE','Tr'||chr(225)||'mite Sin Efecto',' ' ) as estadot, decode(so.cod_tipo_bien,'1','Bienes de uso y consumo','2','Veh'||chr(237)||'culo',' ') AS tipobien, nvl(so.valor_cif_liberado,0) as valorliberado,tr.user_trans
        ,(select trim(ad.cuo_nam) from ops$asy.uncuotab@asy_db.sidunea ad where ad.lst_ope = 'U' and ad.cuo_cod=so.cod_aduana) as aduana
        ,tr.motivo_trans
        from transferencia tr, solicitud so, acreditacion ac, entidad en, sector se
        where so.ult_ver = 0 and so.lst_ope = 'U'
        and tr.ult_ver = 0 and tr.lst_ope = 'U'
        and tr.nro_ra_sol = so.nro_ra_sol
        and ac.ver(+) = 0 and ac.lst_ope(+) = 'U'
        and en.ver(+) = 0 and so.cod_acred = ac.cod_acred(+) and so.cod_ent = en.cod_ent(+)
        and so.cod_sector = se.cod_sector
        and nvl(tr.fecha_ra_trans,fch_informe_tec) between to_date(prm_fecini ||' 00:00:01', 'dd/mm/yyyy hh24:MI:ss') and to_date(prm_fecfin||' 23:59:59', 'dd/mm/yyyy hh24:MI:ss')
        and tr.cod_estado_sol like prm_estado
        and en.cod_ent(+) like prm_codent
        and so.cod_sector like prm_sector
        order by fecha,nro_ra_sol desc;
    end if;
 END IF;
   RETURN ct;
   END;





END;
/

