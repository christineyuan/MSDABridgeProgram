

CREATE TABLE example (
	id INT,
	title VARCHAR(100),
	length_min INT,
	url_100 VARCHAR(100)
	);
    
--select * from example

INSERT INTO example (id,title,length_min,url_100) VALUES (1, "MySQL Tutorial", 5, "https://www.youtube.com/watch?v=yPu6qV5byu4")
INSERT INTO example (id,title,length_min,url_100) VALUES (2, "MySQL Tutorial 1 - What is mySQL?", 10, "https://www.youtube.com/watch?v=6pbxQQG25Jw")
INSERT INTO example (id,title,length_min,url_100) VALUES (3, "Introduction to mySQL Workbench", 12, "https://www.youtube.com/watch?v=RSHevYMwCVw")

CREATE TABLE reviewers (
	review_id INT,
    example_id INT,
    name VARCHAR(100),
	rating INT,
	text_review VARCHAR(100)
	);

INSERT INTO reviewers (review_id,example_id,name,rating,text_review) VALUES (1, 1, "Sisi", 5, "Loved it!")
INSERT INTO reviewers (review_id,example_id,name,rating,text_review) VALUES (2, 1, "Aaron", 4, "Really Helpful")

INSERT INTO reviewers (review_id,example_id,name,rating,text_review) VALUES (3, 2, "Chris", 3, "Hated it!")
INSERT INTO reviewers (review_id,example_id,name,rating,text_review) VALUES (4, 2, "Gene", 3, "Audio was choppy")

select * from example left join reviewers on id=example_id
drop 