@AbapCatalog.sqlViewName: 'ZYH_V_EG2_CDS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Eğitim 2 Çalışma 2'
define view zyh_ddl_egit2_cds2
as select from zyh_ddl_egit2_cds1 as cds1 
inner join vbrk on vbrk.vbeln = cds1.vbeln

{    
    cds1.vbeln,
    sum( cds1.conversion_netwr ) as toplam_net_deger,
    cds1.kunnrad,
    count( * ) as toplam_fatura_adedi,
    division( cast( cds1.conversion_netwr as abap.curr( 15, 2 )), cast( count( * ) as abap.int4) , 2) as ortalama_miktar,
    substring( cds1.fkdat, 1, 4 ) as faturalama_yili,
    substring( cds1.fkdat, 5, 2 ) as faturalama_ayi,
    substring( cds1.fkdat, 7, 2 ) as faturalama_gunu,
    substring( vbrk.inco2_l, 1, 3 ) as incoterm_yeri
}

group by cds1.vbeln,
         cds1.kunnrad,
         cds1.conversion_netwr,
         cds1.fkdat,
         vbrk.inco2_l
