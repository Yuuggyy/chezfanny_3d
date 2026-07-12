-- ── SEED PRODUITS : Chez Fanny ──────────────────────────────
INSERT INTO public.restaurants (nom, slug)
VALUES ('Chez Fanny', 'chezfanny')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE rid UUID;
BEGIN
  SELECT id INTO rid FROM public.restaurants WHERE slug = 'chezfanny';
  INSERT INTO public.produits (restaurant_id, nom, description, prix, categorie, disponible) VALUES
    (rid, 'Soso ya Mwamba', 'Poulet au mwamba - plat national congolais', 12.00, 'Plats Congolais', true),
    (rid, 'Pondu au Poisson Fume', 'Feuilles de manioc, poisson fume, huile de palme', 10.00, 'Plats Congolais', true),
    (rid, 'Makayabu', 'Morue salee preparee a la congolaise, tomates, piment', 11.00, 'Plats Congolais', true),
    (rid, 'Fufu au Gombo', 'Fufu de manioc, sauce gombo avec poisson', 8.00, 'Plats Congolais', true),
    (rid, 'Liboke de Capitaine', 'Capitaine cuit en feuilles de bananier, epices', 14.00, 'Plats Congolais', true),
    (rid, 'Saka-saka Viande', 'Feuilles de manioc mijotees avec viande de boeuf', 12.00, 'Plats Congolais', true),
    (rid, 'Poulet Braise Entier', 'Poulet marine aux epices, braise au feu de bois', 14.00, 'Viandes et Grillades', true),
    (rid, 'Ngolo Braise', 'Porc braise, sauce locale, piment', 13.00, 'Viandes et Grillades', true),
    (rid, 'Cotes de Porc Grillees', 'Cotes de porc grillees, marinade citron-epices', 12.00, 'Viandes et Grillades', true),
    (rid, 'Brochettes de Boeuf', 'Brochettes marinees, grillees, legumes', 11.00, 'Viandes et Grillades', true),
    (rid, 'Tilapia Braise', 'Tilapia entier braise, citron, piment', 12.00, 'Poissons', true),
    (rid, 'Capitaine Frit', 'Capitaine frit entier, sauce tomate-piment', 14.00, 'Poissons', true),
    (rid, 'Ndakala', 'Petits poissons frits croustillants', 8.00, 'Poissons', true),
    (rid, 'Buffet Complet', 'Entree + plat au choix + boisson', 15.00, 'Buffet du Jour', true),
    (rid, 'Buffet Famille 4 personnes', 'Assortiment complet pour 4 personnes', 50.00, 'Buffet du Jour', true),
    (rid, 'Riz Blanc', NULL, 3.00, 'Accompagnements', true),
    (rid, 'Plantain Frit', NULL, 3.00, 'Accompagnements', true),
    (rid, 'Kwanga', 'Pain de manioc', 2.00, 'Accompagnements', true),
    (rid, 'Fufu de Manioc', NULL, 3.00, 'Accompagnements', true),
    (rid, 'Biere Primus 65cl', NULL, 4.00, 'Boissons', true),
    (rid, 'Biere Turbo King 65cl', NULL, 4.00, 'Boissons', true),
    (rid, 'Jus de Fruit Frais', 'Mangue, passion, ananas', 3.00, 'Boissons', true),
    (rid, 'Eau Minerale', '75cl', 2.00, 'Boissons', true),
    (rid, 'Soda', 'Coca, Fanta, Sprite 33cl', 2.50, 'Boissons', true)
  ON CONFLICT DO NOTHING;
END $$;
