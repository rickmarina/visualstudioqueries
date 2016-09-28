/* VW Artemis */

select CodigoEstacionArtemis, 
       CodigoEuroshellEstacion,
EstacionNombre as NombreEstacion, Denominacion as DenominacionEquipamiento, 
EquipamientoDescripcion as Estado, 

FabricanteNombre as Marca, 
ModeloNombre as Modelo, 
NumeroSerie, 
(FabricanteNombre + ' / ' + ModeloNombre + ' / ' + NumeroSerie) as MarcaModeloNumeroSerie,

case 
	when patindex('%/%/%',NumeroSerie) > 0 then 
		REVERSE(SUBSTRING(REVERSE(NumeroSerie),0,CHARINDEX('/',REVERSE(NumeroSerie)))) 
	else 
		numeroSerie
end as NumeroSerieVista,
FechaInstalacion,LimiteGarantia, ContratistaNombre as Contratista, 
Descripcion as DescripcionEquipamiento, 
Comentarios as ComentariosEquipamiento,  
FechaModificacion as FechaModificacionEquipamiento
from VW_AA_BusquedaEstacionesModelos
where FuncionPkCodigo = '27'