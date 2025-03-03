-- 1] Performing mult. and div. using Package
-- Package Specification
create or replace package pkg_first is
procedure p_mult(a in int, b in int, c out int);
function f_div(a int, b int) return int ;
end;
/

-- Package Body
create or replace package body pkg_first is
procedure p_mult(a in int, b in int, c out int) is
begin
    c := a * b;
    end;

function f_div(a int, b int) return int is
c int;
begin
    c := a / b;
    return c;
    end;
end;
/

-- Package Run
declare 
a int := &a;
b int := &b;
c int;
z int;
begin
    pkg_first.p_mult(a,b,c);
    dbms_output.put_line('Multiplication:'||c);

    z := pkg_first.f_div(a,b);
    dbms_output.put_line('Division:'||z);
end;
/

-- 2] Returning name and salary using Package
-- Package Specification
create or replace package pkg_second is
procedure p_sal(pid in int,sal out int);
function f_name(pid int) return varchar2;
end;
/

-- Package Body
create or replace package body pkg_second is
procedure p_sal(pid in int, sal out int) is
begin
    select salary into sal from emp where id = pid;
end;

function f_name(pid int) return varchar2 is
eid int := pid;
e_name varchar2(20);
begin
    select name into e_name from emp where id = eid;
    return e_name;
    end;
end;
/

-- Package Run
declare
pid int := &pid;
sal int;
e_name varchar2(20);
begin
    e_name := pkg_second.f_name(pid);
    dbms_output.put_line('Emp Name:'||e_name);
    
    pkg_second.p_sal(pid,sal);
    dbms_output.put_line('Emp Salary:'||sal);

end;
/


