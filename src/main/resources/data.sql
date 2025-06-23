-- Insert admin user (password è "admin" con BCrypt)
INSERT INTO users (email, password, name) VALUES ('admin@admin.com', '$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW', 'Admin');

-- Insert menu items - Antipasti
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Edamame', 'Fagioli di soia, sale', 'edamame.png', 'Antipasti', 4.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Gyoza', 'Ravioli, carne di maiale, verdure', 'Gyosa.png', 'Antipasti', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Involtini Primavera', 'Verdure, pasta fillo', 'involtini-primavera.png', 'Antipasti', 3.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Takoyaki', 'Polpo, farina, uova, tempura', 'takoyaki.png', 'Antipasti', 6.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Tempura di Gamberi', 'Gamberi, pastella, olio', 'tempura-special.png', 'Antipasti', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Moyashi', 'Germogli di soia', 'moyashi.webp', 'Antipasti', 4.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Wakame', 'Alghe giapponesi', 'wakame.webp', 'Antipasti', 4.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Wakame spicy', 'Alghe giapponesi agro-piccanti', 'wakame_spicy.webp', 'Antipasti', 4.0, true);

-- Insert menu items - Zuppe
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Miso Soup', 'Brodo di miso, tofu, alghe', 'misoshiru.png', 'Zuppe', 3.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Zuppa di Shoio Ramen', 'Brodo, wonton, verdure', 'ramen.png', 'Zuppe', 4.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Zuppa di udon', 'Zuppa di miso, shiitake, cipollotto, pasta udon, scaloppine di manzo e uovo sodo', 'zuppa_udon.webp', 'Zuppe', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Tantanmen con ramen', 'zuppa giapponese, tahina, carne macinata di manzo, pak choi e pasta', 'Tantanmen.webp', 'Zuppe', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Zuppa di miso ai funghi', 'Zuppa di miso, carote, cipollotti, funghi shiitake, alghe nori e fondo di pollame', 'Zuppadimisoconfunghishiitake.webp', 'Zuppe', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Zuppa di miso con wakame e tofu', 'Zuppa di miso, con tofu e due tipi di alghe, wakame e kombu', 'zuppa-di-miso-e-wakame.webp', 'Zuppe', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Zuppa di miso e vermicelli cinesi', 'Zuppa di miso, vermicelli cinesi, germogli, carote e uova sode', 'Zuppa di miso e vermicelli cinesi.webp', 'Zuppe', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Ramen in zuppa di miso con germogli di soia', 'Pasta di miso bianco, soba giapponesi, soba giapponesi', 'ramen_germogli.webp', 'Zuppe', 6.0, true);

-- Insert menu items - Primi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Riso di pollo', 'Riso, piselli, prosciutto, uova', 'rise-chicken.png', 'Primi', 5.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Riso di pesce', 'Noodles, verdure, pollo, salsa di soia', 'rice-fish.png', 'Primi', 7.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Yakisoba', 'Noodles, verdure, carne', 'soba-pesce-e-verdura-1.png', 'Primi', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Udon pollo e verdure', 'Noodles di riso, gamberi, uova, arachidi', 'udon-pollo-e-verdure-1.png', 'Primi', 7.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Udon pesce e verdure', 'Udon, brodo, verdure', 'udon-pesce-e-verdure-1.png', 'Primi', 6.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Soba freddi', 'Spaghetti soba freddi, alghe kombu, funghi shiitake, bonito, mirin e salsa di soia', 'soba-freddi-0-4-3.webp', 'Primi', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Soba noodles alle verdure', 'Spaghetti soba, con piselli, rafano, pomodori, cipollotti, salsa di soia e wasabi', 'soba-noodles-con-verdure.webp', 'Primi', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Soba noodles con melanzana al miso', 'Spaghetti soba, con miso, dadi di melanzana, succo di limetta, miele e salsa di soia', 'soba-noodles-con-melanzana-al-miso.webp', 'Primi', 5.0, true);

-- Insert menu items - Hosomaki
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki Salmone', 'Riso, salmone, alga nori', 'salmon-tagorashi.png', 'Hosomaki', 6.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki Tonno', 'Riso, tonno, alga nori', 'hosomaki-tonno.png', 'Hosomaki', 6.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki Avocado', 'Riso, avocado, alga nori', 'avoc-hosomaki.png', 'Hosomaki', 5.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki tamago', 'Riso, cetriolo, alga nori', 'hosomaki-tamago.png', 'Hosomaki', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki takuan', 'Riso, polpa di granchio, alga nori', 'takuan-hosomaki.png', 'Hosomaki', 6.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki fritto', 'Riso fritto, salmone grigliato e philadelphia', 'Hosso-salmone-fritto.webp', 'Hosomaki', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki mango', 'Mango, philadelphia, riso, alga nori', 'hosomaki-mango.webp', 'Hosomaki', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Hosomaki ebi', 'Gamberi cotti, riso, alga nori', 'hosomaki_ebi.webp', 'Hosomaki', 5.0, true);

-- Insert menu items - Uramaki
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki California', 'Riso, granchio, avocado, cetriolo', 'california.png', 'Uramaki', 8.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki Philadelphia', 'Riso, salmone, avocado, formaggio cremoso', 'philadelphia-maki.png', 'Uramaki', 8.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki Dragon', 'Riso, gamberi tempura, avocado, salsa unagi', 'spicy-tuna.png', 'Uramaki', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki Spicy Tuna', 'Riso, tonno piccante, avocado', 'tuna-avocado.png', 'Uramaki', 8.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki Ebi', 'Riso, gamberi, avocado, cetriolo', 'manhattan.png', 'Uramaki', 8.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki black salmon', 'Riso venere con salmone', 'Uramaki black salmon.webp', 'Uramaki', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Mango roll', 'Riso con salmone, philadelphia, mango', '1mango.webp', 'Uramaki', 8.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Uramaki spicy tuna', 'Riso con tonno piccante, alghe piccanti', 'Uramaki spicy tuna.webp', 'Uramaki', 9.0, true);

-- Insert menu items - Temaki  
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki Salmone', 'Riso, salmone, avocado, alga nori', 'spicy-salmon-temaki.png', 'Temaki', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki Tonno', 'Riso, tonno, avocado, alga nori', 'red-and-green-temaki.png', 'Temaki', 7.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki California', 'Riso, granchio, avocado, cetriolo, alga nori', 'california-temaki.png', 'Temaki', 8.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki Ebi', 'Riso, gamberi, avocado, alga nori', 'surimi-and-tamago-temaki.png', 'Temaki', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki vegetariano', 'Riso, alga nori, avocado, insalata e cetriolo', 'Temaki vegetariano.png', 'Temaki', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki ebiten', 'Riso, alga nori, gambero fritto e maionese', 'Temaki ebiten.webp', 'Temaki', 8.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki Miura', 'Riso, alga nori, salmone cotto, philadelphia, insalata e salsa kabayaki', 'Temaki miura.webp', 'Temaki', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Temaki Unagi', 'Riso, alga nori, anguilla, teriyaki e cetriolo', 'Temaki-Unaji.webp', 'Temaki', 9.0, true);

-- Insert menu items - Sushi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sushi Nigiri Salmone', 'Riso, salmone', 'nigiri-salmone-1.png', 'Sushi', 6.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sushi Nigiri Tonno', 'Riso, tonno', 'nigiri-tonno.png', 'Sushi', 6.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sushi Sashimi Misto', 'Salmone, tonno, branzino', 'sashimi-mix.png', 'Sushi', 10.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sushi Gunkan', 'Riso, salmone, uova di pesce', 'sashimi-pesce-spada.png', 'Sushi', 7.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sushi Futomaki', 'Riso, tonno, salmone, avocado, cetriolo', 'sashimi-salmone.png', 'Sushi', 8.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Nighiri salmone scottato', 'Riso, salmone scottato', 'nigiri-salmone-scottato.webp', 'Sushi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Nighiri branzino', 'Riso, branzino', 'nigiri-branzino-taiki.webp', 'Sushi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Nighiri ebi', 'Riso, gambero cotto', 'nigiri-ebi.webp', 'Sushi', 9.0, true);

-- Insert menu items - Secondi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Carpaccio pesce spada', 'Pesce spada, salsa teriyaki, sesamo', 'carpaccio-pesce-spada.png', 'Secondi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Carpaccio salmone', 'Salmone, verdure, salsa di soia', 'carpaccio-salmone.png', 'Secondi', 10.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Carpaccio tonno', 'Tonno, salsa al curry, riso', 'carpaccio-tonno.png', 'Secondi', 11.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Ooebi no shioyaki', 'Gamberoni alla griglia', 'Ooebi no shioyaki.webp', 'Secondi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Salmone wok', 'Salmone cotto con zenzero e lime', 'Wok-al-salmone.webp', 'Secondi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Yaki ebi', 'Spiedini di gamberi', 'Yaki ebi.webp', 'Secondi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Yaki tori', 'Spiedini di pollo in salsa satè e piccante', 'Yaki tori.webp', 'Secondi', 9.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Salmone scottato con crosta di sesamo', 'Salmone scottato con crosta di sesamo', 'Salmone scottato con crosta di sesamo.webp', 'Secondi', 9.0, true);

-- Insert menu items - Bibite
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Tè Verde', 'Tè verde', 'The-verde-giapponese.png', 'Bibite', 2.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Sake', 'Riso fermentato', 'sake.png', 'Bibite', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Acqua naturale', 'Bottiglia 75ml', '13051.png', 'Bibite', 3.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Acqua frizzante', 'Bottiglia 75ml', 'OIP.png', 'Bibite', 3.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Coca Cola', 'Bottiglia 1 lt', 'coca-cola-1-litro.png', 'Bibite', 4.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Birra Asahi', 'Bottiglia 33 cl', 'Asahi.webp', 'Bibite', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Birra Sapporo', 'Bottiglia 33 cl', 'sapporo-330ml-5.webp', 'Bibite', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Fanta', 'Bottiglia 1 lt', 'fanta.webp', 'Bibite', 4.0, true);

-- Insert menu items - Dolci
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Mochi al Tè Verde', 'Riso glutinoso, tè verde, zucchero', 'mochi-te-verde.png', 'Dolci', 4.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Dorayaki', 'Pancake, anko (marmellata di fagioli rossi)', 'Dorayaki.png', 'Dolci', 3.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Taiyaki', 'Pasta dolce, anko (marmellata di fagioli rossi)', 'Taiyaki.png', 'Dolci', 3.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Gelato al Tè Verde', 'Latte, tè verde, zucchero', 'gelato-al-te-verde.png', 'Dolci', 4.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Mochi alla Fragola', 'Riso glutinoso, fragole, zucchero', 'mochi-fragola.webp', 'Dolci', 4.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Wagashi', 'Riso glutinoso, pasta di azuki rossi, zucchero', 'Wagashi.webp', 'Dolci', 5.0, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Dango', 'Riso glutinoso, silken tofu, amido di mais, salsa di soia, zucchero', 'Dango.webp', 'Dolci', 4.5, true);
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES ('Manju', 'Farina, pasta dolce di fagioli azuki rossi, kansui, zucchero', 'Manju.webp', 'Dolci', 5.0, true);