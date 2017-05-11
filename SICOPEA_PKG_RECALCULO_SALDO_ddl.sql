CREATE OR REPLACE 
package pkg_recalculo_saldo
is               
    procedure recalculo(nro varchar2,sw varchar2);                    
end pkg_recalculo_saldo;
/

CREATE OR REPLACE 
PACKAGE BODY pkg_recalculo_saldo
is
    procedure recalculo(nro varchar2,sw varchar2)
    is
        vValorCifBien number;
        vTiempoBien integer;
        vCodAcreditado varchar2(10);
        cursor c_bien(pCod in varchar2) is
        select nro_ra_sol,valor_cif_liberado from solicitud where cod_acred=pCod and lst_ope='U' and ult_ver=0
        --and cod_tipo_bien='1' and cod_estado_sol not in('O','AN','M') order by nvl(fch_emb,fecha_sol),TO_NUMBER(nro_ra_sol) asc;
        and cod_tipo_bien='1' and cod_estado_sol not in('O','AN','M','SE') order by TO_NUMBER(nro_ra_sol) asc;
        vNroRa varchar2(15);
        vValorLiberado number;
        vCantDiasHastaHoy integer;
        vCantDiasHastaHoyAux integer;
        vSaldoBien number;
        vCantA integer;
        vDif integer;
        vDifAux integer;
        vCont integer;
        vValorCifAux number;
        contSw integer;

        vContTransferencia integer;
        vContSaldoInicialB integer;
    begin
        select c.valor_cif_bien,c.tiempo_bien,s.cod_acred into vValorCifBien,vTiempoBien,vCodAcreditado from solicitud s,categorias c where s.cod_cat=c.cod_cat and s.ult_ver=0 and c.lst_ope='U' and s.nro_ra_sol=nro and s.cod_acred>1;
        vSaldoBien:=vValorCifBien;
        vTiempoBien:=vTiempoBien+1;
        SELECT count(*) into vContSaldoInicialB  FROM solicitud_saldo where lst_ope='U' and ult_ver=0 and cod_tipo_bien='1' and cod_acred=vCodAcreditado;
        if vContSaldoInicialB>0 then
            SELECT saldo_acred into vSaldoBien FROM solicitud_saldo where lst_ope='U' and ult_ver=0 and cod_tipo_bien='1' and cod_acred=vCodAcreditado;
        end if;
        vCont:=0;vDifAux:=0;vValorCifAux:=0;contSw:=0;
        open c_bien(vCodAcreditado);
        loop
            fetch c_bien into vNroRa,vValorLiberado;
            exit when c_bien%notfound;
            vCantDiasHastaHoy:=0;vCantDiasHastaHoyAux:=0;contSw:=contSw+1;
            select (nvl(s.fch_emb,s.fecha_sol)-ac.fec_llegada) into vCantDiasHastaHoy  from solicitud s, acreditacion ac where s.COD_ACRED=ac.COD_ACRED and s.cod_ent=ac.cod_ent
            and s.LST_OPE='U' and s.ult_ver=0 and ac.lst_ope='U' and ac.VER=0 and s.cod_acred=vCodAcreditado and s.nro_ra_sol=vNroRa
            and s.cod_estado_sol not in('O','AN','M','SE');
            vCantA:=0;vDif:=0;
            if vTiempoBien>0 then
                vCantA:=trunc(vCantDiasHastaHoy/vTiempoBien);
            end if;
            if vCantA>0 then
                vCantDiasHastaHoyAux:=trunc(vCantDiasHastaHoy-(vTiempoBien*vCantA));
                vDif:=trunc((vCantDiasHastaHoyAux/vTiempoBien)+1);
                if vCantA=vDifAux then
                    vCont:=vCont+1;
                else
                    vCont:=0;
                end if;
                vDifAux:=vCantA;
            end if;
            vContTransferencia:=0;
            select count(*) into vContTransferencia from transferencia where nro_ra_sol=vNroRa and lst_ope='U' and ult_ver=0 and  cod_estado_sol in ('A','F');
            if vCantDiasHastaHoyAux>=0 and vCantDiasHastaHoyAux<=vTiempoBien and vCantDiasHastaHoy>180 and vContTransferencia=0 then
                if vDif=1 and vCont=0 then
                    if contSw>1 then
                        vSaldoBien:=vValorCifBien;
                    end if;
                end if;
                vSaldoBien:=vSaldoBien-vValorLiberado;
                update solicitud set cif_saldo=(vSaldoBien+vValorLiberado) where lst_ope='U' and ult_ver=0 and cod_acred=vCodAcreditado and cod_tipo_bien=1 and nro_ra_sol=vNroRa;
                commit;
            end if;
        end loop;
        close c_bien;
    end recalculo;
end pkg_recalculo_saldo;
/

