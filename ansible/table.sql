CREATE TABLE IF NOT EXISTS todos (
  id int,
  message varchar(255) NOT NULL
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8;
  INSERT INTO todos(id, message) VALUES(1, 'Fix stuff');
  INSERT INTO todos(id, message) VALUES(2, 'Create new stuff')
