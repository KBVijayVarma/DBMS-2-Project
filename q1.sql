(select distinct id as ref_id, NULL as citing_id, NULL as citing_title, NULL as citing_authors, NULL as citing_year, NULL as citing_venue, NULL as citing_reference, NULL as citing_abstract from references_table 
except
select distinct reference as ref_id, NULL as citing_id, NULL as citing_title, NULL as citing_authors, NULL as citing_year, NULL as citing_venue, NULL as citing_reference, NULL as citing_abstract from references_table 
order by ref_id)
UNION
(select res_tab.reference, cast(rp.id as text), rp.title, rp.authors, cast(rp.year as text), rp.venue,rp.reference, rp.abstract from references_table res_tab, RESEARCH_PAPERS rp where res_tab.id = rp.id order by res_tab.reference)
;