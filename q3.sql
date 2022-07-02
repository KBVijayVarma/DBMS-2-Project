select layer2.x_id, layer2.x_title, layer2.x_authors, layer2.x_year, layer2.x_venue, layer2.x_reference, layer2.x_abstract, 
layer2.y_id, 
layer2.z_id, rp.title as z_title, rp.authors as z_authors, rp.year as z_year, rp.venue as z_venue, rp.reference as z_reference, rp.abstract as z_abstract 
from RESEARCH_PAPERS rp,
(select distinct lay1.cited_title as x_title, lay1.cited_authors as x_authors, lay1.cited_year as x_year, lay1.cited_venue as x_venue, lay1.cited_reference as x_reference, lay1.cited_abstract as x_abstract, lay1.ref_id as x_id, lay1.citing_id as y_id, ref_tab.id as z_id
from references_table ref_tab,
((select distinct id as ref_id, NULL as citing_id, NULL as cited_title, NULL as cited_authors, NULL as cited_year, NULL as cited_venue, NULL as cited_reference, NULL as cited_abstract from references_table 
except
select distinct reference as ref_id, NULL as citing_id, NULL as cited_title, NULL as cited_authors, NULL as cited_year, NULL as cited_venue, NULL as cited_reference, NULL as cited_abstract from references_table 
order by ref_id)
UNION
(select res_tab.reference, cast(res_tab.id as text), rp.title, rp.authors, cast(rp.year as text), rp.venue, rp.reference, rp.abstract from references_table res_tab, RESEARCH_PAPERS rp where res_tab.reference = rp.id order by res_tab.reference))
as lay1 
where lay1.citing_id = cast(ref_tab.reference as text)
order by lay1.ref_id)
as layer2
where layer2.z_id = rp.id
order by layer2.x_id
;