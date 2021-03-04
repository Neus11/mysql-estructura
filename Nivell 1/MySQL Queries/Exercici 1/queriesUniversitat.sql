
--20 queries bases de dades Tienda
--1.
SELECT nombre FROM producto;
--2.
SELECT nombre, precio FROM producto;
--3.
SELECT * FROM producto;
--4.
SELECT nombre, concat(precio, "€"), concat(precio*1.21, "$") FROM producto;
--5.
SELECT nombre AS 'nom de producte', concat(precio, "€") AS Euro, concat(precio*1.21, "$") AS Dolars FROM producto;
--6.
SELECT upper(nombre), precio FROM producto;
--7.
SELECT lower(nombre), precio FROM producto;
--8.
SELECT nombre, ucase(LEFT(nombre, 2)) AS Iniciales FROM fabricante;
--9.
SELECT nombre, round(precio) FROM producto;
--10.
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
--11.
SELECT f.codigo FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;
--12.
SELECT DISTINCT f.codigo FROM fabricante f JOIN producto p ON p.codigo_fabricante = f.codigo;
--13.
SELECT nombre FROM fabricante ORDER BY nombre ASC;
--14.
SELECT nombre FROM fabricante ORDER BY nombre DESC;
--15.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
--16.
SELECT * FROM fabricante LIMIT 5;
--17.
SELECT nombre, codigo FROM fabricante WHERE codigo IN (4,5);
--18.
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
--19.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
--20.
SELECT DISTINCT p.nombre FROM producto p, fabricante WHERE codigo_fabricante = 2;


-- 20 Queries de bases dades Universitat.

--1.
SELECT apellido1, apellido2, nombre from persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC;
--2.
SELECT nombre, apellido1, apellido2 FROM persona WHERE tippo = 'alumno' AND telefono IS NULL;
--3.
SELECT nombre FROM persona WHERE fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31' AND tipo = 'alumno';
--4.
SELECT nombre FROM persona WHERE nif LIKE '%K' AND tipo = 'profesor' AND telefono IS NULL;
--5.
SELECT DISTINCT tipo FROM asignatura WHERE cuatrimestre = 1 AND id_grado = 7 AND curso = 3;
--6.
SELECT apellido1, apellido2, p.nombre, d.nombre FROM persona p, departamento d WHERE p.id = d.id ORDER BY apellido1 ASC;
--7.
SELECT a.nombre, anyo_inicio, anyo_fin FROM persona, curso_escolar, asignatura a WHERE a.id = curso_escolar.id AND nif = '26902806M';
--8.
SELECT DISTINCT d.nombre FROM departamento d, grado g, profesor p WHERE d.id = p.id_departamento AND g.id = 4;
--9.
SELECT DISTINCT nombre FROM persona, alumno_se_matricula_asignatura a WHERE persona.id = a.id_alumno AND id_curso_escolar = 5 AND  tipo = 'alumno';

--Exercicis LEFT and RIGHT JOIN
--1.
SELECT d.nombre, apellido1, apellido2, p.nombre FROM departamento d RIGHT JOIN persona p ON d.id = p.id WHERE tipo = 'profesor' ORDER BY d.nombre ASC;
--2.
SELECT p.nombre, apellido1 FROM persona p RIGHT JOIN departamento d ON p.id = d.id WHERE tipo = 'profesor';
--3.
SELECT d.nombre FROM departamento d RIGHT JOIN profesor p ON d.id = p.id_profesor;
--4.
SELECT p.id_profesor FROM asignatura a RIGHT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
--5.
SELECT a.nombre FROM asignatura a LEFT JOIN profesor p ON a.id_profesor = p.id_profesor WHERE a.id_profesor IS NULL;
--6.
SELECT  d.nombre AS DepartNom FROM departamento d LEFT JOIN profesor p ON d.id = p.id_profesor JOIN  asignatura a ON p.id_profesor = a.id  ORDER BY d.nombre DESC;

-- Consultes resum Universitat

--1.
SELECT count(*) FROM persona WHERE tipo = 'alumno';
--2.
SELECT count(*) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';
--3.
SELECT d.nombre, count(*) AS total FROM profesor p JOIN departamento d WHERE d.id = p.id_departamento GROUP BY id_departamento ORDER BY total DESC;
--4.
SELECT d.nombre, count(p.nombre) AS Total FROM persona p JOIN profesor pro ON p.id = pro.id_profesor RIGHT JOIN departamento d ON pro.id_departamento = d.id GROUP BY d.nombre ORDER BY count(p.nombre) DESC;
--5.
SELECT g.nombre AS Grado, count(a.id) AS TotalAsig FROM asignatura a RIGHT JOIN grado g ON g.id = a.id_grado GROUP BY g.nombre ORDER BY a.id_grado DESC;
--6.
SELECT g.nombre AS Grado, count(a.id) AS TotalAsig FROM asignatura a RIGHT JOIN grado g ON g.id = a.id_grado GROUP BY g.nombre HAVING TotalAsig > 40;
