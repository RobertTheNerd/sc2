-- delete all the post ids with a place holder image.

delete pm
	FROM sc2_postmeta AS pm
INNER JOIN sc2_posts AS p ON pm.post_id=p.ID and pm.meta_key='_thumbnail_id'
INNER JOIN sc2_postmeta AS imgpm ON imgpm.post_id=pm.meta_value 
	AND imgpm.meta_key='_wp_attached_file' 
	AND imgpm.meta_value like '%PlaceHolder%'
WHERE p.post_type='progamer';

-- after running this script, also remember to drop db.progamer in mongodb.
