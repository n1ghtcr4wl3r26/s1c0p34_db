CREATE OR REPLACE 
PACKAGE pkg_util
is
TYPE cursortype IS REF CURSOR;
    function fn_descripcion_frv(p_frv in varchar2)
    return varchar2;
    function fn_generar_nro_informe
    return varchar2;
    function fn_nro_verificador(p_correlativo in varchar2)
    return number;
    function fn_proyecto(p_entidad in varchar2)
    return cursortype;
    function fn_acreditacion(p_entidad in varchar2,p_sw in integer)
    return cursortype;
    function fn_nro_dui(p_nrora in varchar2)
    return varchar2;
    function fn_agencia(p_emp_cod in varchar2)
    return cursortype;
    function fn_agencia_pasada(p_emp_cod in varchar2)
    return cursortype;
    function fn_aduana(p_cuo_cod in varchar2)
    return cursortype;
    function fn_nombre_agencia(p_cuo_cod in varchar2)
    return varchar2;
    function fn_nombre_aduana(p_emp_cod in varchar2)
    return varchar2;
    function fn_nombre_agencia_formato(p_cuo_cod in varchar2)
    return varchar2;
    function fn_docadjuntos(p_doc_cod in varchar2)
    return cursortype;
    function fn_docadjuntosform(p_doc_cod in varchar2,p_nro_sol in varchar2)
    return cursortype;
    function fn_conalpedis
    return cursortype;
end pkg_util;
/

CREATE OR REPLACE 
PACKAGE BODY pkg_util
is
    function fn_descripcion_frv(p_frv in varchar2)
    return varchar2
    is
        vDetalle varchar2(300);
    begin
        select 'clase '||(select lower(u.cla_des) from vehiculos.unclaveh u where s.veh_cla=u.key_cod and u.lst_ope='U')||
        ', marca '||(select INITCAP(m.mar_des) from vehiculos.unmarveh m where m.key_cod=s.veh_mar and m.lst_ope='U')||
        ', a'||chr(241)||'o de fabricaci'||chr(243)||'n '||s.veh_afab||', a'||chr(241)||'o modelo '||s.veh_amod||', motor Nro. '||s.veh_mot||', chasis Nro. '||s.veh_cha into vDetalle
        from vehiculos.sad_veh s where s.sad_num=0  and s.lst_ope='U' and s.key_cod=p_frv;
        return vDetalle;
    exception
    WHEN NO_DATA_FOUND THEN
        return '1';
    end fn_descripcion_frv;

function fn_generar_nro_informe
    return varchar2
    is
        vNroInforme varchar2(30):=0;
        contSol number:=0;
        contTrans number:=0;
        vNroSol number:=0;
        vNroTra number:=0;
        vAnio varchar2(2);
    begin
        select count(*) into contSol from solicitud where lst_ope='U' and ult_ver=0;
        select count(*) into contTrans from transferencia where lst_ope='U' and ult_ver=0;
        if contSol=0 then
            --select  max(substr( s.nro_informe_anterior,0,LENGTH(s.nro_informe_anterior)-3))+1||'/'||to_char(sysdate,'yy') into vNroInforme from sector s where s.lst_ope='U' and s.cod_sector='104';
            select max(to_number(substr( s.nro_informe_anterior,0,LENGTH(s.nro_informe_anterior)-3)))+1 into vNroSol from sector s where s.lst_ope='U' and s.cod_sector='104';
        else
            --select nvl(max(substr( s.nro_informe_tec,0,LENGTH(s.nro_informe_tec)-3))+1,1)||'/'||to_char(sysdate,'yy') into vNroInforme from solicitud s
            --where s.lst_ope='U' and s.ult_ver=0 and substr( s.nro_informe_tec,LENGTH(s.nro_informe_tec)-1,LENGTH(s.nro_informe_tec))=to_char(sysdate,'yy');
            select nvl(max(to_number(substr( s.nro_informe_tec,0,LENGTH(s.nro_informe_tec)-3)))+1,1) into vNroSol from solicitud s
            where s.lst_ope='U' and s.ult_ver=0 and substr( s.nro_informe_tec,LENGTH(s.nro_informe_tec)-1,LENGTH(s.nro_informe_tec))=to_char(sysdate,'yy');
        end if;
        if contTrans=0 then
            select max(to_number(substr( s.nro_informe_anterior,0,LENGTH(s.nro_informe_anterior)-3)))+1 into vNroTra from sector s where s.lst_ope='U' and s.cod_sector='104';
        else
            select nvl(max(to_number(substr( s.nro_informe_tec,0,LENGTH(s.nro_informe_tec)-3)))+1,1) into vNroTra from transferencia s
            where s.lst_ope='U' and s.ult_ver=0 and substr( s.nro_informe_tec,LENGTH(s.nro_informe_tec)-1,LENGTH(s.nro_informe_tec))=to_char(sysdate,'yy');
        end if;
        select to_char(sysdate,'yy') into vAnio from dual;
        if vNroSol>=vNroTra then
            --vNroSol := vNroSol + 1;
            vNroInforme:=vNroSol||'/'||vAnio;
        else
            --vNroTra := vNroTra + 1;
            vNroInforme:=vNroTra||'/'||vAnio;
        end if;
        return vNroInforme;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_generar_nro_informe;
    function fn_nro_verificador(p_correlativo in varchar2)
    return number
    is
        /* Declaramos el tipo VARRAY de nueve elementos NUMBER*/
        TYPE t_cadena IS VARRAY(9) OF NUMBER;
        /*type arr_cadena is table of number index by binary_integer;
        cadena arr_cadena;*/
        /* Asignamos los valores con un constructor */
        v_lista t_cadena:= t_cadena(3,9,7,1,3,9,7,1,3);
        /*variables*/
        vNroVerificador number;
        cont number;
        sumResultado number:=0;
    begin
        /*cadena(1):=3;cadena(2):=9;cadena(3):=7;cadena(4):=1;cadena(5):=3;cadena(6):=9;cadena(7):=7;cadena(8):=1;cadena(9):=3;
        for i in cadena.first..cadena.last loop
            sumResultado:=sumResultado+(to_number(SUBSTR(nro_correlativo, i , 1))*cadena(i));
        end loop;*/
        cont:=length(p_correlativo);
        for i in 1..cont loop
            sumResultado:=sumResultado+(to_number(SUBSTR(p_correlativo, i , 1))*v_lista(i));
        end loop;
        vNroVerificador:=mod(sumResultado,10);
        return vNroVerificador;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_nro_verificador;
    function fn_proyecto(p_entidad in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        --select cod_proy,desc_proy from proyecto where lst_ope='U' and ult_ver=0 and cod_entidad=p_entidad and sysdate between fch_ini_proy and fch_fin_proy+1 order by desc_proy asc;
        --11/01/2012 ----------------------------------------------------------
        select cod_proy,desc_proy from proyecto where lst_ope='U' and ult_ver=0 and cod_entidad=p_entidad order by desc_proy asc;
        return ct;
    end fn_proyecto;
    function fn_acreditacion(p_entidad in varchar2,p_sw in integer)
    return cursortype
    is
        ct cursortype;
    begin

        if p_sw=1 then
            open ct for
            --select cod_acred,nombre from acreditacion where ver=0 and lst_ope='U' and cod_ent=p_entidad and sysdate between fec_llegada and fec_cese order by nombre asc;
            select cod_acred,nombre from acreditacion where ver=0 and lst_ope='U' and cod_ent=p_entidad order by nombre asc;
         elsif p_sw=2 then
            open ct for
            select cod_acred,nombre from acreditacion where ver=0 and cod_ent=p_entidad order by nombre asc;
         end if;
        return ct;
    end fn_acreditacion;

    function fn_nro_dui(p_nrora in varchar2)
    return varchar2
    is
        vNroDui varchar2(30);
        vnrofrv varchar(30);
    begin
        select trim(cod_frv) into vnrofrv from solicitud where nro_ra_sol=p_nrora and lst_ope='U' and ult_ver=0;
        if vnrofrv='020000596' then
            select sa.sad_reg_year||'/'||sa.key_cuo||'/'||sa.sad_reg_serial||'-'||sa.sad_reg_nber into vNroDui from solicitud so, ops$asy.sad_trr@asy_db.sidunea ve,ops$asy.sad_gen@asy_db.sidunea sa
            where so.COD_FRV=ve.sad_att_ref and ve.KEY_YEAR=sa.key_year and ve.key_cuo=sa.key_cuo and ve.key_dec=sa.key_dec and ve.key_nber=sa.key_nber
            and so.ULT_VER=0 and so.LST_OPE='U' and so.cod_tipo_bien='2' and so.nro_ra_sol=p_nrora
            and ve.sad_num=0 and sa.lst_ope='U' and sa.sad_num='0' and ve.sad_att_cod='996'
            and ve.KEY_YEAR='2002' and ve.key_cuo='201' and ve.key_dec='5026849' and ve.key_nber='OSZ151'
            and sa.sad_typ_proc=4 and sa.sad_flw=1 and sa.sad_asmt_nber is not null;
        else
            select sa.sad_reg_year||'/'||sa.key_cuo||'/'||sa.sad_reg_serial||'-'||sa.sad_reg_nber into vNroDui from solicitud so, ops$asy.sad_trr@asy_db.sidunea ve,ops$asy.sad_gen@asy_db.sidunea sa
            where SO.COD_FRV=ve.sad_att_ref and ve.KEY_YEAR=sa.key_year and ve.key_cuo=sa.key_cuo and ve.key_dec=sa.key_dec and ve.key_nber=sa.key_nber
            and so.ULT_VER=0 and so.LST_OPE='U' and so.cod_tipo_bien='2' and so.nro_ra_sol=p_nrora
            and ve.sad_num=0 and sa.lst_ope='U' and sa.sad_num='0' and ve.sad_att_cod='996'
            and sa.sad_typ_proc=4 and sa.sad_flw=1 and sa.sad_asmt_nber is not null;
        end if;
            return vNroDui;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_nro_dui;
function fn_agencia(p_emp_cod in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        select op.emp_cod,op.ope_nit||' - '||op.nom_rzs nom_rzs
        from operador.olopetab@asy_db.sidunea op, operador.olopetip@asy_db.sidunea ot
        where op.emp_cod = ot.emp_cod and ot.ope_tip = 'DES' and op.ult_ver = 0 and ot.ult_ver = 0
        and op.emp_cod<>p_emp_cod and ot.tbl_sta = 'H'
        UNION
        select c.ope_numerodoc emp_cod,c.ope_numerodoc||' - '||replace(ASCIISTR(c.ope_razonsocialnsga),'\FFFD','&Ntilde;') nom_rzs
        from ops$asy.bo_oce_opecab@asy_db.sidunea c, ops$asy.bo_oce_opetipo@asy_db.sidunea t
        where c.ope_numerodoc=t.ope_numerodoc and c.ope_num=0 and t.tip_estado='H' and t.tip_num=0 and t.tip_tipooperador='DES'
        and c.ope_numerodoc<>p_emp_cod
        order by nom_rzs asc;
        return ct;
    end fn_agencia;

function fn_agencia_pasada(p_emp_cod in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        --select op.emp_cod,op.nom_rzs||' (NIT:'||op.ope_nit||')' nom_rzs
        select op.emp_cod,op.ope_nit||' - '||op.nom_rzs nom_rzs
        from operador.olopetab@asy_db.sidunea op, operador.olopetip@asy_db.sidunea ot
        where op.emp_cod = ot.emp_cod and ot.ope_tip = 'DES' and op.ult_ver = 0 and ot.ult_ver = 0
        and op.emp_cod<>p_emp_cod and ot.tbl_sta = 'H'
        UNION
        --select c.ope_numerodoc emp_cod,c.ope_razonsocialnsga||' (NIT:'||c.ope_numerodoc||')' nom_rzs
        select c.ope_numerodoc emp_cod,c.ope_numerodoc||' - '||replace(ASCIISTR(c.ope_razonsocialnsga),'\FFFD','&Ntilde;') nom_rzs
        from ops$asy.bo_oce_opecab@asy_db.sidunea c, ops$asy.bo_oce_opetipo@asy_db.sidunea t
        where c.ope_numerodoc=t.ope_numerodoc and c.ope_num=0 and t.tip_estado='H' and t.tip_num=0 and t.tip_tipooperador='DES'
        and c.ope_numerodoc<>p_emp_cod
        order by nom_rzs asc;
        return ct;
    end fn_agencia_pasada;

function fn_aduana(p_cuo_cod in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        select u.cuo_cod, u.cuo_nam
        from ops$asy.uncuotab@asy_db.sidunea u
        where u.lst_ope = 'U' and u.cuo_cod <> 'ALL' and u.cuo_cod <> 'CUO01' and u.cuo_cod<>p_cuo_cod order by u.cuo_cod asc;
        return ct;
    end fn_aduana;

    function fn_nombre_agencia(p_cuo_cod in varchar2)
    return varchar2
    is
    vCont   number;
    vNombreAgencia varchar2(255);
    begin
            select count(1) into vCont from operador.olopetab@asy_db.sidunea op where op.emp_cod =p_cuo_cod and op.ult_ver = 0;
            if vCont>0 then
                select op.nom_rzs||' (NIT:'||op.ope_nit||')' into vNombreAgencia from operador.olopetab@asy_db.sidunea op where op.emp_cod =p_cuo_cod and op.ult_ver = 0;
            else
                select c.ope_razonsocialnsga||' (NIT:'||c.ope_numerodoc||')' into vNombreAgencia from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=p_cuo_cod;
            end if;
            return vNombreAgencia;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_nombre_agencia;

    function fn_nombre_aduana(p_emp_cod in varchar2)
    return varchar2
    is
    vNombreAduana varchar2(255);
    begin
            select trim(cuo_nam) into vNombreAduana from ops$asy.uncuotab@asy_db.sidunea where lst_ope = 'U' and cuo_cod=p_emp_cod;
            return vNombreAduana;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_nombre_aduana;

    function fn_nombre_agencia_formato(p_cuo_cod in varchar2)
    return varchar2
    is
    vCont   number;
    vNombreAgencia varchar2(255);
    begin
            select count(1) into vCont from operador.olopetab@asy_db.sidunea op where op.emp_cod =p_cuo_cod and op.ult_ver = 0;

            if vCont>0 then
                select trim(op.nom_rzs) into vNombreAgencia
                from operador.olopetab@asy_db.sidunea op where op.emp_cod =p_cuo_cod and op.ult_ver = 0;
            else
                select trim(c.ope_razonsocialnsga) into vNombreAgencia
                from ops$asy.bo_oce_opecab@asy_db.sidunea c where c.ope_num=0 and c.ope_numerodoc=p_cuo_cod;
            end if;
            return vNombreAgencia;
    exception
    WHEN NO_DATA_FOUND THEN
        return 1;
    end fn_nombre_agencia_formato;


    function fn_docadjuntos(p_doc_cod in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for

        SELECT a.atd_cod, a.atd_dsc FROM set_documentos a where a.lst_ope='U' and a.ult_ver=0 and a.atd_cod <> p_doc_cod order by a.atd_dsc asc;

        return ct;
    end fn_docadjuntos;
    function fn_docadjuntosform(p_doc_cod in varchar2,p_nro_sol in varchar2)
    return cursortype
    is
        ct cursortype;
    begin
        open ct for

        SELECT  u.atd_dsc,a.emitido,a.nro_doc,to_char(a.fecha_doc,'dd/mm/yyyy'),a.orden,a.cod_doc
        FROM doc_adjuntosaux a,set_documentos u where a.nro_sol=trim(p_nro_sol) and a.cod_doc=u.atd_cod and u.lst_ope='U' and u.ult_ver=0 and u.atd_cod <> p_doc_cod and atd_est<>'H' order by a.orden asc;

        return ct;
    end fn_docadjuntosform;
function fn_conalpedis
    return cursortype
    is
        ct cursortype;
    begin
        open ct for
        select ope_numerodoc,nvl(ope_razonsocialnsga,'-') ope_razonsocialnsga from ops$asy.bo_oce_opecab@asy_db.sidunea where ope_claseoperador='CO' and ope_num=0;
        return ct;
    end fn_conalpedis;
END pkg_util;
/

