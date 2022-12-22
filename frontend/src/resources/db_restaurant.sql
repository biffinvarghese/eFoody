CREATE TABLE user( 
    user_id INT(11) PRIMARY KEY AUTO_INCREMENT, 
    user_name VARCHAR(255), 
    user_email VARCHAR(255),
    user_phone VARCHAR(255),
    user_password VARCHAR(255),
    user_birth VARCHAR(255),
    user_gender VARCHAR(255)
) ENGINE=INNODB;

CREATE TABLE taleconfig( 
    table_id INT(11) PRIMARY KEY AUTO_INCREMENT, 
    table_type VARCHAR(255), 
    table_name VARCHAR(255),
    count INT(11),
    table_description VARCHAR(255),
    table_image VARCHAR(255)
) ENGINE=INNODB;

CREATE TABLE food( 
    food_id INT(11) PRIMARY KEY AUTO_INCREMENT, 
    food_name VARCHAR(255), 
    food_star VARCHAR(255),
    food_vote VARCHAR(255),
    food_price VARCHAR(255),
    food_discount VARCHAR(255),
    food_desc VARCHAR(255),
    food_status VARCHAR(255),
    food_type VARCHAR(255),
    food_category VARCHAR(255),
    food_src VARCHAR(255)
) ENGINE=INNODB;

INSERT INTO food (food_name, food_star, food_vote, food_price, food_discount, food_desc, food_status, food_type, food_category, food_src)
VALUES("irani","4.5", "500", "500.00", "0.00", "full", "best seller", "meat", "al-faham", "taco/taco-1.png"),
("peri peri","4.5", "500", "600.00", "3.00", "full", "best seller", "meat", "al-faham", "taco/taco-1.png"),
("pepper","4.5","500","480.00","0.00","full","best seller","meat","al-faham","taco/taco-1.png"),
("normal","4.5","500","400.00","2.00","full","best seller","meat","al-faham","taco/taco-1.png"),
("peri peri","4","250","320.00","0.00","half","normal","meat","al-faham","taco/taco-1.png"),
("normal","4","500","220.00","1.00","half","new dishes","meat","al-faham","taco/taco-1.png"),
("pepper","4.5","500","240.00","2.00","half","seasonal dishes online only","meat","al-faham","taco/taco-1.png"),
("burger","4.5","100","120.00","2.00","Veg","new dishes","veg","snacks","taco/burrito-6.png"),
("sandwich","4.5","600","150.00","0.00","NonVeg","new dishes","meat","snacks","burrito/burrito-6.png"),
("burger","4.5","500","150.00","3.00","NonVeg","best seller","meat","snacks","burrito/burrito-6.png"),
("sandwich","4.5","250","120.00","0.00","Veg","best seller","veg","snacks","burrito/burrito-6.png"),
("green apple","4.5","300","110.00","2.00","Special","new dishes","veg","mojito","drink/drink-2.png"),
("strawberry","4.5","500","130.00","0.00","Special","best seller","veg","mojito","drink/drink-2.png"),
("mint","4","400","170.00","2.00","Special","seasonal dishes","veg","mojito","drink/drink-2.png"),
("blue mint","4","500","140.00","2.00","Special","best seller","veg","mojito","drink/drink-2.png"),
("pineapple","4.5","500","110.00","0.00","Special","best seller","veg","mojito","drink/drink-2.png"),
("blackcurrant","4.5","500","210.00","2.00","Special","best seller","veg","mojito","drink/drink-2.png"),
("fresh lime","4.5","500","60.00","0.00","Special Drink","best seller","veg","drinks","drink/drink-5.png"),
("soda lime","4","500","40.00","2.00","Special","normal","veg","drinks","drink/drink-5.png"),
("mint lime","4.5","500","70.00","2.00","Special","best seller","veg","drinks","drink/drink-5.png"),
("passion fruit lime","4","699","80.00","2.00","Special","best seller","veg","drinks","drink/drink-5.png"),
("sp lime","4.5","500","60.00","2.00","Special","seasonal dishes","veg","drinks","drink/drink-5.png"),
("vannilla","4.5","500","160.00","2.00","Icecream shake","best seller","veg","shake","drink/drink-1.png"),
("strawberry","4.5","500","180.00","2.00","Icecream shake","best seller","veg","shake","drink/drink-1.png"),
("pista","3.5","500","160.00","1.00","Icecream shake","new dishes seasonal dishes","veg","shake","drink/drink-1.png"),
("chocolate","4.5","500","140.00","0.00","Icecream shake","best seller","veg","shake","drink/drink-1.png"),
("shamam","4","200","350.00","0.00","Fruit shake","normal","veg","shake","drink/drink-1.png"),
("banana","4","100","310.00","0.00","Fruit shake","new dishes","veg","shake","drink/drink-1.png"),
("chikkoos","3.5","300","340.00","2.00","Fruit shake","new dishes","veg","shake","drink/drink-1.png"),
("manthi","4.5","500","740.00","0.00","Chicken half","best seller","meat","al-faham","taco/taco-1.png"),
("manthi","4.5","500","360.00","1.00","Chicken qtr","best seller","meat","al-faham","taco/taco-1.png"),
("manthi","4.5","500","1250.00","0.00","Chicken full","new dishes","meat","al-faham","taco/taco-1.png"),
("irani","3","500","210.00","1.00","Qtr","seasonal dishes online only","meat","al-faham","taco/taco-1.png"),
("peri peri","4","199","230.00","0.00","Qtr","normal","meat","al-faham","taco/taco-1.png"),
("laham shorba","4","299","1300.00","0.00","Special","normal","meat","al-faham","taco/taco-1.png"),
("grape","4.5","999","120.00","0.00","Special","normal","veg","shake","drink/drink-1.png"),
("anar","4.5","999","800.00","0.00","Cashewnut special","best seller","veg","snacks","burrito/burrito-6.png"),
("avacado","4.5","999","450.00","0.00","Special","best seller","veg","drinks","drink/drink-5.png"),
("paloma","4.5","599","350.00","0.00","Special drink","new dishes seasonal dishes","veg","drinks","drink/drink-5.png"),
("orange","4","999","50.00","1.00","juice","best seller","veg","drinks","drink/drink-5.png"),
("pappaya","3.5","999","70.00","0.00","juice","seasonal dishes best seller","veg","drinks","drink/drink-5.png"),
("roll","4.5","9999","30.00","0.00","Meat","best seller","meat","snacks","burrito/burrito-6.png"); 





CREATE TABLE cart (
  user_id INT,
  food_id INT,
  item_qty INT,
  primary key (user_id, food_id)
);


CREATE TABLE booktable( 
    book_id INT(11) PRIMARY KEY AUTO_INCREMENT, 
    book_seat VARCHAR(255),
    book_tables INT,
    user_id INT,
    book_when VARCHAR(255)
) ENGINE=INNODB;



