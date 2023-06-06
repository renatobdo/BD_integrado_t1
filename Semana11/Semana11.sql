#1) Buscar os empregados que possuem dependentes
select e.employee_id as 'teste', e.first_name, e.last_name,
	d.dependent_id, d.first_name, d.last_name 
    from employees e 
	inner join dependents d on 
		e.employee_id = d.employee_id order by e.employee_id;
# 2) Contar quantos dependentes cada empregado possui
select count(distinct employee_id) from dependents;
select count(*) from dependents;
insert into dependents (first_name, last_name, relationship, 
employee_id) values ('Ezequiel', 'Melo', 'child',100);
insert into dependents (first_name, last_name, relationship, 
employee_id) values ('Leticia', 'Gomes', 'child',100);


select employee_id, count(*) as 'quantidade de filhos'
	from dependents group by employee_id;  
    
    
    
    
select e.employee_id, e.first_name, e.last_name,
	 count(d.employee_id) 
		as 'quantidade de filhos' 
    from employees e 
	inner join dependents d on 
		e.employee_id = d.employee_id 
        group by d.employee_id order by e.employee_id;

# Quais funcionários não têm filhos?
select e.employee_id, e.first_name, e.last_name,
	d.first_name, d.last_name
	from employees e  RIGHT JOIN
		dependents d on e.employee_id = d.employee_id
       order by e.employee_id ;


select e.employee_id, e.first_name, e.last_name
	from employees e  LEFT JOIN
		dependents d on e.employee_id = d.employee_id
       where d.employee_id IS NULL ;
	
#Quantos funcionários trabalham em determinado departamento?
select * from departments;
select count(*) as 'quantidade de funcionarios',
 department_id as 'departamento'
	from employees group by department_id;

select count(*) as 'quantidade de funcionarios',
 d.department_id as 'departamento', department_name
	from employees e inner join departments d 
		on e.department_id = d.department_id 
			group by d.department_id;    
            
            
            
            
            
# funcionários que não estão em um departamento
select * from employees e right join
	departments d on e.department_id = d.department_id 
    where e.department_id is null;
        
        
# Qual a localização dos departamentos
select locations.city as 'cidade', departments.department_name 
	from locations inner join departments on
		departments.location_id = locations.location_id;

# Qual a região de determinado departamento?
select * from regions;
select locations.city as 'cidade', departments.department_name,
	countries.country_name , regions.region_name
	from locations 
		inner join departments on
			departments.location_id = locations.location_id
        inner join countries on
			locations.country_id = countries.country_id
		inner join regions on
			countries.region_id = regions.region_id;        
        
        