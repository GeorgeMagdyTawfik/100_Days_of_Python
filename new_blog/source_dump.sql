PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
--CREATE TABLE blog_post (id INTEGER NOT NULL, title VARCHAR (250) NOT NULL, date VARCHAR (250) NOT NULL, body TEXT NOT NULL, author VARCHAR (250) NOT NULL, img_url VARCHAR (250) NOT NULL, subtitle VARCHAR (250) NOT NULL, PRIMARY KEY (id), UNIQUE (title));
INSERT INTO blog_post VALUES(1,'Example Post','July 18, 2023',replace(replace('<p>Just some content</p>\r\n\r\n<p>&quot;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n','\r',char(13)),'\n',char(10)),'Magan Cambell','https://imgs.search.brave.com/BW__i2u-_aUDX7WcqOc0ZZIrdXUDN73s-jcnwRqSN8k/rs:fit:1024:704:1/g:ce/aHR0cHM6Ly9zdGF0/aWMwMS5ueXQuY29t/L2ltYWdlcy8yMDEx/LzAxLzE0L2FydHMv/MTRNT1ZJTkctc3Bh/bi9NT1ZJTkctanVt/Ym8uanBn','Check out my example');
INSERT INTO blog_post VALUES(2,'Lego is fun','July 19, 2023',replace(replace('<p><strong>Lego</strong> (<a href="https://en.wikipedia.org/wiki/Help:IPA/English">/ˈlɛɡoʊ/</a> <a href="https://en.wikipedia.org/wiki/Help:Pronunciation_respelling_key"><em>LEG-oh</em></a>, <small>Danish:&nbsp;</small><a href="https://en.wikipedia.org/wiki/Help:IPA/Danish">[ˈle̝ːko]</a>;<a href="https://en.wikipedia.org/wiki/Lego#cite_note-1">[1]</a> stylized as <strong>LEGO</strong>) is a line of plastic <a href="https://en.wikipedia.org/wiki/Construction_toy">construction toys</a> that are manufactured by <a href="https://en.wikipedia.org/wiki/The_Lego_Group">the Lego Group</a>, a privately held company based in <a href="https://en.wikipedia.org/wiki/Billund,_Denmark">Billund</a>, <a href="https://en.wikipedia.org/wiki/Denmark">Denmark</a>. Lego consists of variously colored <a href="https://en.wikipedia.org/wiki/Interchangeable_parts">interlocking</a> plastic bricks made of <a href="https://en.wikipedia.org/wiki/Acrylonitrile_butadiene_styrene">acrylonitrile butadiene styrene</a> that accompany an array of <a href="https://en.wikipedia.org/wiki/Gear">gears</a>, figurines called <a href="https://en.wikipedia.org/wiki/Lego_minifigure">minifigures</a>, and various other parts. Lego pieces can be assembled and connected in many ways to construct objects, including vehicles, buildings, and working robots. Anything constructed can be taken apart again, and the pieces reused to make new things.</p>\r\n\r\n<p>The Lego Group began manufacturing the interlocking toy bricks in 1949. <a href="https://en.wikipedia.org/wiki/List_of_Lego_films_and_TV_series">Films</a>, <a href="https://en.wikipedia.org/wiki/List_of_Lego_video_games">games</a> competitions, and eight <a href="https://en.wikipedia.org/wiki/Legoland">Legoland</a> <a href="https://en.wikipedia.org/wiki/Amusement_park">amusement parks</a> have been developed under the brand. As of July&nbsp;2015, 600&nbsp;billion Lego parts had been produced.</p>\r\n','\r',char(13)),'\n',char(10)),'Arav Pant','https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Lego_Color_Bricks.jpg/2560px-Lego_Color_Bricks.jpg','Lego is awsome');
INSERT INTO blog_post VALUES(3,'Python Trivia','July 20, 2023',replace(replace('<p><strong>Monty Python</strong> (also collectively known as <strong>the Pythons</strong>) were a British <a href="https://en.wikipedia.org/wiki/Comedy_troupe">comedy troupe</a> formed in 1969 consisting of <a href="https://en.wikipedia.org/wiki/Graham_Chapman">Graham Chapman</a>, <a href="https://en.wikipedia.org/wiki/John_Cleese">John Cleese</a>, <a href="https://en.wikipedia.org/wiki/Terry_Gilliam">Terry Gilliam</a>, <a href="https://en.wikipedia.org/wiki/Eric_Idle">Eric Idle</a>, <a href="https://en.wikipedia.org/wiki/Terry_Jones">Terry Jones</a>, and <a href="https://en.wikipedia.org/wiki/Michael_Palin">Michael Palin</a>. The group came to prominence for the <a href="https://en.wikipedia.org/wiki/Sketch_comedy">sketch comedy</a> series <em><a href="https://en.wikipedia.org/wiki/Monty_Python%27s_Flying_Circus">Monty Python&#39;s Flying Circus</a></em> (1969&ndash;1974). Their work then developed into a larger collection that included live shows, films, albums, books, and musicals; their influence on comedy has been compared to <a href="https://en.wikipedia.org/wiki/The_Beatles">the Beatles</a>&#39; influence on music. Their sketch show has been called &quot;an important moment in the evolution of television comedy&quot;</p>\r\n','\r',char(13)),'\n',char(10)),'Jack Bauer','https://upload.wikimedia.org/wikipedia/commons/4/47/Monty_Python_Live_02-07-14_12_46_43_%2814415411808%29.jpg','Where did the name come from?');
COMMIT;
