-- ========================================
-- MIGRATION: Aggiungi titolo e prezzo a order_items
-- ========================================

-- Verifica se le colonne esistono già prima di aggiungerle
DO $$ 
BEGIN
    -- Aggiungi colonna titolo se non esiste
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'order_items' AND column_name = 'titolo') THEN
        ALTER TABLE order_items ADD COLUMN titolo VARCHAR(255);
    END IF;
    
    -- Aggiungi colonna prezzo se non esiste
    IF NOT EXISTS (SELECT 1 FROM information_schema.columns 
                   WHERE table_name = 'order_items' AND column_name = 'prezzo') THEN
        ALTER TABLE order_items ADD COLUMN prezzo DECIMAL(10,2);
    END IF;
END $$;

-- Popola le colonne con i dati esistenti dal menu (solo se sono NULL)
UPDATE order_items 
SET titolo = (SELECT titolo FROM menu WHERE menu.id = order_items.menu_id),
    prezzo = (SELECT prezzo FROM menu WHERE menu.id = order_items.menu_id)
WHERE menu_id IS NOT NULL 
  AND (titolo IS NULL OR prezzo IS NULL);

-- Imposta NOT NULL dopo aver popolato i dati
ALTER TABLE order_items 
  ALTER COLUMN titolo SET NOT NULL,
  ALTER COLUMN prezzo SET NOT NULL;


-- Insert admin user (password è "admin" con BCrypt)
INSERT INTO users (email, password, name) VALUES 
('admin@admin.com', '$2a$10$GRLdNijSQMUvl/au9ofL.eDwmoohzzS7.rmNSJZ.0FxO/BTk76klW', 'Admin');
ON CONFLICT (email) DO NOTHING;

-- Insert menu items - Antipasti
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Edamame', 'Fagioli di soia, sale', 'edamame.png', 'Antipasti', 4.5, true),
('Gyoza', 'Ravioli, carne di maiale, verdure', 'Gyosa.png', 'Antipasti', 5.0, true),
('Involtini Primavera', 'Verdure, pasta fillo', 'involtini-primavera.png', 'Antipasti', 3.5, true),
('Takoyaki', 'Polpo, farina, uova, tempura', 'takoyaki.png', 'Antipasti', 6.0, true),
('Tempura di Gamberi', 'Gamberi, pastella, olio', 'tempura-special.png', 'Antipasti', 7.0, true),
('Moyashi', 'Germogli di soia', 'moyashi.webp', 'Antipasti', 4.0, true),
('Wakame', 'Alghe giapponesi', 'wakame.webp', 'Antipasti', 4.0, true),
('Wakame spicy', 'Alghe giapponesi agro-piccanti', 'wakame_spicy.webp', 'Antipasti', 4.0, true);

-- Insert menu items - Zuppe
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Miso Soup', 'Brodo di miso, tofu, alghe', 'misoshiru.png', 'Zuppe', 3.0, true),
('Zuppa di Shoio Ramen', 'Brodo, wonton, verdure', 'ramen.png', 'Zuppe', 4.5, true),
('Zuppa di udon', 'Zuppa di miso, shiitake, cipollotto, pasta udon, scaloppine di manzo e uovo sodo', 'zuppa_udon.webp', 'Zuppe', 5.0, true),
('Tantanmen con ramen', 'zuppa giapponese, tahina, carne macinata di manzo, pak choi e pasta', 'Tantanmen.webp', 'Zuppe', 5.0, true),
('Zuppa di miso ai funghi', 'Zuppa di miso, carote, cipollotti, funghi shiitake, alghe nori e fondo di pollame', 'Zuppadimisoconfunghishiitake.webp', 'Zuppe', 5.0, true),
('Zuppa di miso con wakame e tofu', 'Zuppa di miso, con tofu e due tipi di alghe, wakame e kombu', 'zuppa-di-miso-e-wakame.webp', 'Zuppe', 5.0, true),
('Zuppa di miso e vermicelli cinesi', 'Zuppa di miso, vermicelli cinesi, germogli, carote e uova sode', 'Zuppa di miso e vermicelli cinesi.webp', 'Zuppe', 5.0, true),
('Ramen in zuppa di miso con germogli di soia', 'Pasta di miso bianco, soba giapponesi, soba giapponesi', 'ramen_germogli.webp', 'Zuppe', 6.0, true);

-- Insert menu items - Primi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Riso di pollo', 'Riso, piselli, prosciutto, uova', 'rise-chicken.png', 'Primi', 5.5, true),
('Riso di pesce', 'Noodles, verdure, pollo, salsa di soia', 'rice-fish.png', 'Primi', 7.5, true),
('Yakisoba', 'Noodles, verdure, carne', 'soba-pesce-e-verdura-1.png', 'Primi', 7.0, true),
('Udon pollo e verdure', 'Noodles di riso, gamberi, uova, arachidi', 'udon-pollo-e-verdure-1.png', 'Primi', 7.5, true),
('Udon pesce e verdure', 'Udon, brodo, verdure', 'udon-pesce-e-verdure-1.png', 'Primi', 6.5, true),
('Soba freddi', 'Spaghetti soba freddi, alghe kombu, funghi shiitake, bonito, mirin e salsa di soia', 'soba-freddi-0-4-3.webp', 'Primi', 5.0, true),
('Soba noodles alle verdure', 'Spaghetti soba, con piselli, rafano, pomodori, cipollotti, salsa di soia e wasabi', 'soba-noodles-con-verdure.webp', 'Primi', 5.0, true),
('Soba noodles con melanzana al miso', 'Spaghetti soba, con miso, dadi di melanzana, succo di limetta, miele e salsa di soia', 'soba-noodles-con-melanzana-al-miso.webp', 'Primi', 5.0, true);

-- Insert menu items - Hosomaki
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Hosomaki Salmone', 'Riso, salmone, alga nori', 'salmon-tagorashi.png', 'Hosomaki', 6.0, true),
('Hosomaki Tonno', 'Riso, tonno, alga nori', 'hosomaki-tonno.png', 'Hosomaki', 6.5, true),
('Hosomaki Avocado', 'Riso, avocado, alga nori', 'avoc-hosomaki.png', 'Hosomaki', 5.5, true),
('Hosomaki tamago', 'Riso, cetriolo, alga nori', 'hosomaki-tamago.png', 'Hosomaki', 5.0, true),
('Hosomaki takuan', 'Riso, polpa di granchio, alga nori', 'takuan-hosomaki.png', 'Hosomaki', 6.0, true),
('Hosomaki fritto', 'Riso fritto, salmone grigliato e philadelphia', 'Hosso-salmone-fritto.webp', 'Hosomaki', 5.0, true),
('Hosomaki mango', 'Mango, philadelphia, riso, alga nori', 'hosomaki-mango.webp', 'Hosomaki', 5.0, true),
('Hosomaki ebi', 'Gamberi cotti, riso, alga nori', 'hosomaki_ebi.webp', 'Hosomaki', 5.0, true);

-- Insert menu items - Uramaki
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Uramaki California', 'Riso, granchio, avocado, cetriolo', 'california.png', 'Uramaki', 8.0, true),
('Uramaki Philadelphia', 'Riso, salmone, avocado, formaggio cremoso', 'philadelphia-maki.png', 'Uramaki', 8.5, true),
('Uramaki Dragon', 'Riso, gamberi tempura, avocado, salsa unagi', 'spicy-tuna.png', 'Uramaki', 9.0, true),
('Uramaki Spicy Tuna', 'Riso, tonno piccante, avocado', 'tuna-avocado.png', 'Uramaki', 8.5, true),
('Uramaki Ebi', 'Riso, gamberi, avocado, cetriolo', 'manhattan.png', 'Uramaki', 8.0, true),
('Uramaki black salmon', 'Riso venere con salmone', 'Uramaki black salmon.webp', 'Uramaki', 9.0, true),
('Mango roll', 'Riso con salmone, philadelphia, mango', '1mango.webp', 'Uramaki', 8.0, true),
('Uramaki spicy tuna', 'Riso con tonno piccante, alghe piccanti', 'Uramaki spicy tuna.webp', 'Uramaki', 9.0, true);

-- Insert menu items - Temaki  
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Temaki Salmone', 'Riso, salmone, avocado, alga nori', 'spicy-salmon-temaki.png', 'Temaki', 7.0, true),
('Temaki Tonno', 'Riso, tonno, avocado, alga nori', 'red-and-green-temaki.png', 'Temaki', 7.5, true),
('Temaki California', 'Riso, granchio, avocado, cetriolo, alga nori', 'california-temaki.png', 'Temaki', 8.0, true),
('Temaki Ebi', 'Riso, gamberi, avocado, alga nori', 'surimi-and-tamago-temaki.png', 'Temaki', 7.0, true),
('Temaki vegetariano', 'Riso, alga nori, avocado, insalata e cetriolo', 'Temaki vegetariano.png', 'Temaki', 7.0, true),
('Temaki ebiten', 'Riso, alga nori, gambero fritto e maionese', 'Temaki ebiten.webp', 'Temaki', 8.0, true),
('Temaki Miura', 'Riso, alga nori, salmone cotto, philadelphia, insalata e salsa kabayaki', 'Temaki miura.webp', 'Temaki', 7.0, true),
('Temaki Unagi', 'Riso, alga nori, anguilla, teriyaki e cetriolo', 'Temaki-Unaji.webp', 'Temaki', 9.0, true);

-- Insert menu items - Sushi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Sushi Nigiri Salmone', 'Riso, salmone', 'nigiri-salmone-1.png', 'Sushi', 6.0, true),
('Sushi Nigiri Tonno', 'Riso, tonno', 'nigiri-tonno.png', 'Sushi', 6.5, true),
('Sushi Sashimi Misto', 'Salmone, tonno, branzino', 'sashimi-mix.png', 'Sushi', 10.0, true),
('Sushi Gunkan', 'Riso, salmone, uova di pesce', 'sashimi-pesce-spada.png', 'Sushi', 7.0, true),
('Sushi Futomaki', 'Riso, tonno, salmone, avocado, cetriolo', 'sashimi-salmone.png', 'Sushi', 8.5, true),
('Nighiri salmone scottato', 'Riso, salmone scottato', 'nigiri-salmone-scottato.webp', 'Sushi', 9.0, true),
('Nighiri branzino', 'Riso, branzino', 'nigiri-branzino-taiki.webp', 'Sushi', 9.0, true),
('Nighiri ebi', 'Riso, gambero cotto', 'nigiri-ebi.webp', 'Sushi', 9.0, true);

-- Insert menu items - Secondi
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Carpaccio pesce spada', 'Pesce spada, salsa teriyaki, sesamo', 'carpaccio-pesce-spada.png', 'Secondi', 9.0, true),
('Carpaccio salmone', 'Salmone, verdure, salsa di soia', 'carpaccio-salmone.png', 'Secondi', 10.0, true),
('Carpaccio tonno', 'Tonno, salsa al curry, riso', 'carpaccio-tonno.png', 'Secondi', 11.0, true),
('Ooebi no shioyaki', 'Gamberoni alla griglia', 'Ooebi no shioyaki.webp', 'Secondi', 9.0, true),
('Salmone wok', 'Salmone cotto con zenzero e lime', 'Wok-al-salmone.webp', 'Secondi', 9.0, true),
('Yaki ebi', 'Spiedini di gamberi', 'Yaki ebi.webp', 'Secondi', 9.0, true),
('Yaki tori', 'Spiedini di pollo in salsa satè e piccante', 'Yaki tori.webp', 'Secondi', 9.0, true),
('Salmone scottato con crosta di sesamo', 'Salmone scottato con crosta di sesamo', 'Salmone scottato con crosta di sesamo.webp', 'Secondi', 9.0, true);

-- Insert menu items - Bibite
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Tè Verde', 'Tè verde', 'The-verde-giapponese.png', 'Bibite', 2.5, true),
('Sake', 'Riso fermentato', 'sake.png', 'Bibite', 5.0, true),
('Acqua naturale', 'Bottiglia 75ml', '13051.png', 'Bibite', 3.0, true),
('Acqua frizzante', 'Bottiglia 75ml', 'OIP.png', 'Bibite', 3.0, true),
('Coca Cola', 'Bottiglia 1 lt', 'coca-cola-1-litro.png', 'Bibite', 4.0, true),
('Birra Asahi', 'Bottiglia 33 cl', 'Asahi.webp', 'Bibite', 5.0, true),
('Birra Sapporo', 'Bottiglia 33 cl', 'sapporo-330ml-5.webp', 'Bibite', 5.0, true),
('Fanta', 'Bottiglia 1 lt', 'fanta.webp', 'Bibite', 4.0, true);

-- Insert menu items - Dolci
INSERT INTO menu (titolo, ingredienti, img, categoria, prezzo, disponibile) VALUES 
('Mochi al Tè Verde', 'Riso glutinoso, tè verde, zucchero', 'mochi-te-verde.png', 'Dolci', 4.0, true),
('Dorayaki', 'Pancake, anko (marmellata di fagioli rossi)', 'Dorayaki.png', 'Dolci', 3.5, true),
('Taiyaki', 'Pasta dolce, anko (marmellata di fagioli rossi)', 'Taiyaki.png', 'Dolci', 3.5, true),
('Gelato al Tè Verde', 'Latte, tè verde, zucchero', 'gelato-al-te-verde.png', 'Dolci', 4.5, true),
('Mochi alla Fragola', 'Riso glutinoso, fragole, zucchero', 'mochi-fragola.webp', 'Dolci', 4.0, true),
('Wagashi', 'Riso glutinoso, pasta di azuki rossi, zucchero', 'Wagashi.webp', 'Dolci', 5.0, true),
('Dango', 'Riso glutinoso, silken tofu, amido di mais, salsa di soia, zucchero', 'Dango.webp', 'Dolci', 4.5, true),
('Manju', 'Farina, pasta dolce di fagioli azuki rossi, kansui, zucchero', 'Manju.webp', 'Dolci', 5.0, true);