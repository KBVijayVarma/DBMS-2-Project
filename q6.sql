create table reference_ij_author as
select r1.id as x_id, r1.reference as y_id, a_tab.authors as y_authors from references_table r1 inner join authors_table a_tab 
on r1.reference = a_tab.id;

create table xy as
select distinct ra.x_id,a2_tab.authors as x_author,ra.y_id,ra.y_authors from authors_table a2_tab inner join reference_ij_author ra
on a2_tab.id=ra.x_id where a2_tab.authors<>ra.y_authors
order by ra.x_id
;


create table xyz as
select a1.x_id,a1.x_author,a1.y_id,a1.y_authors,ra.y_id as z_id,ra.y_authors as z_author from xy a1 inner join reference_ij_author ra on a1.y_id=ra.x_id 
where (a1.x_author>a1.y_authors) and (a1.y_authors>ra.y_authors);

select tab1.x_author,tab1.y_authors,tab1.z_author,count(distinct(tab1.x_author,tab1.y_authors,tab1.z_author)) as repetations from
(select * from xyz a1,references_table rt
where rt.reference = z_id and rt.id= x_id and a1.y_authors<>a1.z_author) as tab1
group by tab1.x_author,tab1.y_authors,tab1.z_author 
order by repetations desc
;