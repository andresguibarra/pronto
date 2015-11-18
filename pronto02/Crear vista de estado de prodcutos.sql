CREATE VIEW [dbo].[Vn_Estado_Productos]
	AS SELECT p.Id, p.Nombre,
	 case
	  when p.Stock < pr.Cantidad_Minima then 'POCO' 
	  when p.Stock>= pr.Cantidad_Minima AND P.Stock < pr.Cantidad_Media then 'MEDIO' 
	  ELSE 'SUFICIENTE' 
	  END AS Estado 
	   FROM [PRODUCTO] p, [Prioridad] pr

