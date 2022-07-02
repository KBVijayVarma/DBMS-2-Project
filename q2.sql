select all ref_tb.id, rp.id, rp.title from references_table ref_tb, RESEARCH_PAPERS rp where ref_tb.reference = rp.id order by ref_tb.id;


select ref_tb.id, NULL as cited_id, NULL as cited_title, NULL as cited_authors, NULL as cited_year, NULL as cited_venue, NULL as cited_reference, NULL as cited_abstract from references_table ref_tb where ref_tb.reference is NULL 
UNION
select all ref_tb.id, rp.id, rp.title, rp.authors, rp.year, rp.venue,rp.reference, rp.abstract from references_table ref_tb, RESEARCH_PAPERS rp where ref_tb.reference = rp.id
order by id;