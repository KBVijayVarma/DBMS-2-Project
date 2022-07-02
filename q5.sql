select * from
(select counts.authors, counts.a2_author, count((counts.authors, counts.a2_author)) as cou from
(select distinct au_tb.authors, pairs.a2_author, pairs.paper_id from authors_table au_tb inner join
(select pair_authors.a1_author,pair_authors.a2_author, pair_authors.paper_id from 
(select all a1.id as paper_id, a1.authors as a1_author, a2.authors as a2_author from authors_table a1 inner join authors_table a2 on a1.id = a2.id where a1.authors <> a2.authors)
as pair_authors) as pairs on au_tb.authors = pairs.a1_author
 ) as counts
group by counts.authors, counts.a2_author) as author_pairs_count
where author_pairs_count.cou > 1
order by author_pairs_count.cou desc
;