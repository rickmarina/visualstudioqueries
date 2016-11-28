select tipoEquipoNombre,        nombreEstacion,        
count(*) as numeroequipamientosxtipoequipoyestacion,        
(        select count(*)     
         from    (        
            select fkcatalogotiposequipospkcodigo, EstacionesPKCodigo        
            from VW_EquipamientosEstacion as vw                 
            where vw.fkcatalogotiposequipospkcodigo = VW_EquipamientosEstacion.fkcatalogotiposequipospkcodigo         
            and EstacionModeloEstadoNombre='OPER'     
            and EstacionesPKCodigo in  (49,336,339,357,358,104,118,14,466,510,6,22,536,513,139,387,385,83,384,386,
            350,393,378,382,15,552,132,87,477,28,140,390,366,4,103,326,344,495,474,359,353,490,71,73,465,55,23,93,361,500,509,79,128,558,129,
            367,80,545,580,566,567,577,570,569,565,568,574,341,342,467,550,52,56,149,491,130,11,12,340,131,503,72,531,356,470,553,5,333,338,
            368,32,492,142,504,33,469,487,31,159,59,472,145,556,76,349,155,352,354,479,111,527,374,78,331,50,97,148,581,394,542,105,348,24,114
            ,332,525,325,554,392,107,478,526,539,82,106,573,530,365,345,143,119,319,64,101,506,549,66,39,126,388,150,58,318,375,40,343,372,146
            ,30,373,335,482,462,151,153,152,518,54,362,138,323,321,322,486,328,330,120,110,588,381,9,8,13,505,136,57,113,122,463,371,137,16,147
            ,133,225,347,3,563,75,156,369,337,484,18,19,564,231,48,232,494,370,535,557,508,329,21,99,521,493,141,124,10,135,96,538,112,109,117,
            62,533,541,154,34,35,158,389,108,121,115,123,351,134,391)          
            group by fkCatalogoTiposEquiposPkCodigo,EstacionesPKCodigo  ) as sq1
) as numeroequipamientosxtipoequipo,          
(select count(*) as numeroincidencias         
    from vw_report_incidenciasdetalle         
    where vw_report_incidenciasdetalle.tipoequipopkcodigo=VW_EquipamientosEstacion.fkcatalogotiposequipospkcodigo               
    and incidenciafechacreacion >= '2016-10-1'               and incidenciafechacreacion <= '2016-10-3'           
    and vw_report_incidenciasdetalle.estacionpkcodigo in  (49,336,339,357,358,104,118,14,466,510,6,22,536,513,139,387,385,83,384,386,
    350,393,378,382,15,552,132,87,477,28,140,390,366,4,103,326,344,495,474,359,353,490,71,73,465,55,23,93,361,500,509,79,128,558,129,
    367,80,545,580,566,567,577,570,569,565,568,574,341,342,467,550,52,56,149,491,130,11,12,340,131,503,72,531,356,470,553,5,333,338,
    368,32,492,142,504,33,469,487,31,159,59,472,145,556,76,349,155,352,354,479,111,527,374,78,331,50,97,148,581,394,542,105,348,24,114
    ,332,525,325,554,392,107,478,526,539,82,106,573,530,365,345,143,119,319,64,101,506,549,66,39,126,388,150,58,318,375,40,343,372,146
    ,30,373,335,482,462,151,153,152,518,54,362,138,323,321,322,486,328,330,120,110,588,381,9,8,13,505,136,57,113,122,463,371,137,16,147
    ,133,225,347,3,563,75,156,369,337,484,18,19,564,231,48,232,494,370,535,557,508,329,21,99,521,493,141,124,10,135,96,538,112,109,117,
    62,533,541,154,34,35,158,389,108,121,115,123,351,134,391)          ) as numeroincidenciasxtipoequipo,        
    
(select count(*) as numeroincidencias         
from vw_report_incidenciasdetalle         
where vw_report_incidenciasdetalle.tipoequipopkcodigo=VW_EquipamientosEstacion.fkcatalogotiposequipospkcodigo               
and vw_report_incidenciasdetalle.estacionpkcodigo=VW_EquipamientosEstacion.estacionespkcodigo               
and incidenciafechacreacion >= '2016-10-1'               and incidenciafechacreacion <= '2016-10-3'         ) as numeroincidenciasxtipoequipoyestacion 

from VW_EquipamientosEstacion 
where EstacionModeloEstadoNombre='OPER'  
AND  estacionespkcodigo IN  (49,336,339,357,358,104,118,14,466,510,6,22,536,513,139,387,385,83,384,386,350,393,378,382,15,552,132,87,477,
28,140,390,366,4,103,326,344,495,474,359,353,490,71,73,465,55,23,93,361,500,509,79,128,558,129,367,80,545,580,566,567,577,570,569,565,568,
574,341,342,467,550,52,56,149,491,130,11,12,340,131,503,72,531,356,470,553,5,333,338,368,32,492,142,504,33,469,487,31,159,59,472,145,556,
76,349,155,352,354,479,111,527,374,78,331,50,97,148,581,394,542,105,348,24,114,332,525,325,554,392,107,478,526,539,82,106,573,530,365,345,
143,119,319,64,101,506,549,66,39,126,388,150,58,318,375,40,343,372,146,30,373,335,482,462,151,153,152,518,54,362,138,323,321,322,486,328,
330,120,110,588,381,9,8,13,505,136,57,113,122,463,371,137,16,147,133,225,347,3,563,75,156,369,337,484,18,19,564,231,48,232,494,370,535,557,
508,329,21,99,521,493,141,124,10,135,96,538,112,109,117,62,533,541,154,34,35,158,389,108,121,115,123,351,134,391)  
AND    fkcatalogofuncionespkcodigo  IN  (2)  
AND    fkcatalogotiposequipospkcodigo  IN  (117) 
group by tipoEquipoNombre,fkCatalogoTiposEquiposPkCodigo,nombreEstacion,estacionespkcodigo 
order by 1,2 
