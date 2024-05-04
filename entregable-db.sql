SELECT titulo, unidades
FROM cursos_base_de_datos.cursos
Group by titulo, unidades
order by unidades desc 
limit 5;

select titulo, avg(unidades) as media_unidades 
from cursos_base_de_datos.cursos
group by titulo;

select nombre,apellido,cursos_asociados
from cursos_base_de_datos.usuarios
where cursos_asociados > 3
order by nombre, apellido, cursos_asociados asc;

select * from cursos_base_de_datos.clases
where fecha_inicio > '2024-05-10'
order by fecha_inicio asc 
limit 10;

select tipo_bloque, count(*) as cantidad_bloques  
from cursos_base_de_datos.clases
where curso_id = 2
group by tipo_bloque;

select ifnull(nombre,'') as nombre, ifnull(apellido, '') as apellido  
from cursos_base_de_datos.usuarios; 

select titulo,usuarios_asociados 
from cursos_base_de_datos.cursos
order by usuarios_asociados desc
limit 3;

select cursos.titulo, count(clases.clase_id)/ cursos.unidades as promedio_clases_por_unidad 
from cursos_base_de_datos.cursos
left join clases on cursos.id_curso = clases.curso_id
group by cursos.titulo, cursos.unidades;

select nombre, apellido, cursos_asociados
from cursos_base_de_datos.usuarios
where usuario_id in (
select usuario_id
from cursos
join clases on cursos.id_curso = clases.curso_id
where clases.fecha_inicio > '2024-05-10'
group by usuario_id
having count(*) > 2 
)
order by nombre asc;

select*from cursos_base_de_datos.clases
where fecha_inicio > '2024-05-10'
order by fecha_inicio desc 
limit 5;  

select usuarios.categoria, count(*) as num_usuarios   
from cursos_base_de_datos.usuarios
join cursos_base_de_datos.cursos on cursos.id_curso = cursos.id_curso
where cursos.id_curso = 3
group by usuarios.categoria;