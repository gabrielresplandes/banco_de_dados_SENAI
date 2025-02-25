select * from employees;

-- CHAR LENGHT(Contagem de caracteres); AS(Renomeia de acordo com o que deseja)
select first_name , char_length(first_name) as qtd_caracteres from employees;

-- CONCAT (Concatenar)
select concat(first_name, " nasceu em ", birth_date) as nome_data_nascm from employees;

-- CONCAT_WS(Concatena com separador)
select concat_ws(" * ", first_name, last_name) from employees;

-- CASE
-- U-UPPER: MAIÚSCULO
-- L-LOWER: MINÚSCULO
select first_name, ucase(first_name) from employees;

-- REPLACE
select replace (first_name, "georgi", "apenas um cara tranquilo"), last_name from employees where emp_no = 10001;

-- LEFT "picotar" quem e até onde
select first_name , left(first_name,3) from employees;

-- RIGHT "picotar" quem e até onde
select first_name , right(first_name,3) from employees;

select hire_date, birth_date from employees;
-- DATEDIFF diferença entre datas
select datediff(hire_date, birth_date) from employees;