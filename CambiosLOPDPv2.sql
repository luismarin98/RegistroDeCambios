USE LOPDP_DV

/*----Inicio Estructura compa�ia -------*/

/*----ELIMINA TABLAS DEBIDO AL CAMBIO DE ESTRUCTURA---*/
DROP TABLE [dbo].[Compania_Caracteristicas];
ALTER TABLE [dbo].[Empleado_Hacienda] DROP CONSTRAINT [FK_Empleado_Hacienda_Compania];
DROP TABLE [dbo].[Compania];

/*--CREA TABLA COMPA�IA---*/
CREATE TABLE [dbo].[Compania](
	[id] [int] identity NOT NULL,
	[id_compania] [nvarchar](10) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
 CONSTRAINT [PK_Compania] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/*---Inserta registros de prueba validados con las compa�ias de JDE----*/
insert into [dbo].[Compania] values ('00010','REYBANPAC, REY BANANO DEL PAC','A', getdate(),null);
insert into [dbo].[Compania] values ('00012','REYLACTEOS C.L.','A', getdate(),null);
insert into [dbo].[Compania] values ('00014','EXPOPLAST C.L.','A', getdate(),null);
insert into [dbo].[Compania] values ('00018','Fertisa, Fertilizantes, Termin','A', getdate(),null);
insert into [dbo].[Compania] values ('00108','FERTISA AGIF C.L.','A', getdate(),null);
GO


/*--CREA TABLA COMPA�IA CARACTERISTICAS---*/
CREATE TABLE [dbo].[Compania_Caracteristicas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_compania] [int] NOT NULL,
	[logo] [ntext] NOT NULL,
	[color_bg] [nvarchar](10)  NULL,
	[color_fg] [nvarchar](10)  NULL,
 CONSTRAINT [PK_Compania_Caracteristicas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Compania_Caracteristicas]  WITH CHECK ADD  CONSTRAINT [FK_Compania_Caracteristicas_Compania] FOREIGN KEY([id_compania])
REFERENCES [dbo].[Compania] ([id])
GO

ALTER TABLE [dbo].[Compania_Caracteristicas] CHECK CONSTRAINT [FK_Compania_Caracteristicas_Compania]
GO

/*---Inserta registros con los datos existentes----*/
insert into [dbo].[Compania_Caracteristicas] values (1,'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',null,null);
GO

/*----Fin Estructura compa�ia -------*/

/*----Inicio Estructura dispositivo -------*/

/*----SE A�ADE CAMPO COMPA�IA----*/
alter table [dbo].[Dispositivo]
add id_compania int  ;

/*---Se actualizan los registros existente----*/
update [dbo].[Dispositivo] 
set id_compania = 1;
GO
/*----Fin Estructura dispositivo -------*/


/*----Inicio Estructura Hacienda -------*/

ALTER TABLE [dbo].[Permiso_Dispositivo] DROP CONSTRAINT [FK_Permiso_Dispositivo_Hacienda];
ALTER TABLE [dbo].[Empleado_Localidad] DROP CONSTRAINT [FK_Empleado_Localidad_Id];
GO

drop table [dbo].[Localidad];
CREATE TABLE [dbo].[Localidad](
	[id] int IDENTITY,
	[id_compania] [int] NOT NULL,
	[codigo_localidad][nvarchar](20) NOT NULL,
	[nombre] [nvarchar](20) NOT NULL,
	[estado] [nvarchar](1) NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_actualizacion] [datetime] NULL,
	
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

insert into [dbo].[Localidad]  
SELECT y.id, x.EMCODHAC,x.EMNOMHAC,'A',GETDATE(),null
  FROM [LOPDP_TRANSITO_DV].[dbo].[EMHACDAS] x 
  inner join [dbo].[Compania] y  on (x.ABAN8 = y.id_compania)
/*----Fin Estructura Hacienda -------*/

/*----Inicio Estructura Empleado Hacienda -------*/
exec sp_rename '[dbo].[Empleado_Hacienda]', 'Empleado_Localidad'
EXEC sp_rename N'dbo.PK_Empleado_Hacienda', N'PK_Empleado_Localidad', N'OBJECT'
EXEC sp_rename N'dbo.FK_Empleado_Hacienda_Persona', N'FK_Empleado_Localidad_Persona', N'OBJECT'
EXEC sp_rename N'dbo.FK_Empleado_Hacienda_Zona', N'FK_Empleado_Localidad_Zona', N'OBJECT'

/*----Fin Estructura Hacienda -------*/

/*----Inicio Estructura Permiso Dispositivo-------*/
alter table [dbo].[Permiso_Dispositivo] add id_localidad int;

UPDATE
[dbo].[Permiso_Dispositivo]  
SET
id_localidad = y.id
FROM
[dbo].[Permiso_Dispositivo] AS x
INNER JOIN [dbo].[Localidad] AS y
ON x.id_hacienda = trim(y.codigo_localidad)

alter table [dbo].[Permiso_Dispositivo] drop column id_hacienda;
  
alter table [dbo].[Permiso_Dispositivo] add habilitarencuesta bit;
alter table [dbo].[Permiso_Dispositivo] add habilitarformulario  bit;
alter table [dbo].[Permiso_Dispositivo] add habilitarvideo   bit;
alter table [dbo].[Permiso_Dispositivo] add habilitarfirma    bit;
alter table [dbo].[Permiso_Dispositivo] add trabajaroffline     bit;
alter table [dbo].[Permiso_Dispositivo] add consultardatos      bit;
GO

update [dbo].[Permiso_Dispositivo]
set 
habilitarencuesta = 1,
habilitarformulario = 0,
habilitarvideo = 1,
habilitarfirma = 1, 
trabajaroffline = 1,
consultardatos = 1;
GO
/*----Fin Estructura Permiso Dispositivo-------*/

/*----Inicio Estructura Registro Consentimiento -------*/
alter table [dbo].[Registro_Consentimiento] add id_compania int;
alter table [dbo].[Registro_Consentimiento] add id_localidad int;

with list_archivos as 
(
select  id_consentimiento,nombre_archivo,
       SUBSTRING(nombre_archivo,1,CHARINDEX('_',nombre_archivo,1)-1) localidad,
       SUBSTRING(nombre_archivo,
	   	        CHARINDEX('_',nombre_archivo,CHARINDEX('_',nombre_archivo,1))+1,
		        CHARINDEX('_',nombre_archivo,CHARINDEX('_',nombre_archivo,CHARINDEX('_',nombre_archivo,1)+1))
				- CHARINDEX('_',nombre_archivo,CHARINDEX('_',nombre_archivo,1))-1
				) persona
	   from Archivos_Consentimiento
)
, list_localidad as (
select id_consentimiento, localidad
from list_archivos
group by id_consentimiento, localidad 
), list_final as 
(
select x.id_consentimiento, y.id
from list_localidad x 
inner join [dbo].[Localidad] y on (x.localidad = trim(y.codigo_localidad))
group by x.id_consentimiento, y.id
)
UPDATE
[dbo].[Registro_Consentimiento]  
SET
id_localidad = y.id
FROM
[dbo].[Registro_Consentimiento] AS x
INNER JOIN list_final AS y
ON x.id = y.id_consentimiento

/*----Fin Estructura Registro Consentimiento -------*/
