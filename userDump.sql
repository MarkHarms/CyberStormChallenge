CREATE USER 'injectuser'@'%' IDENTIFIED BY 'injectuser';
GRANT SELECT ON injectiondb.* TO 'injectuser'@'%';

CREATE USER 'hsbuser'@'%' IDENTIFIED BY 'hsbpasswordisareallygoodpassword';
GRANT ALL PRIVILEGES ON hsbcyberstorm.* TO 'hsbuser'@'%';