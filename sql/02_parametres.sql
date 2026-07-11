-- PARAMÈTRES RESTAURANT Chez Fanny
CREATE TABLE IF NOT EXISTS public.parametres (
  id             INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  nom_restaurant TEXT DEFAULT 'Chez Fanny',
  logo_url       TEXT,
  adresse        TEXT DEFAULT '5, Avenue de la Montagne, Ngalema, Kinshasa',
  telephone      TEXT DEFAULT '+243 975 286 614',
  whatsapp       TEXT DEFAULT '243975286614',
  horaires       TEXT DEFAULT 'Tous les jours 08h00 - 22h00',
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);
INSERT INTO public.parametres (id, nom_restaurant, adresse, telephone, whatsapp, horaires)
VALUES (1, 'Chez Fanny', '5, Avenue de la Montagne, Ngalema, Kinshasa', '+243 975 286 614', '243975286614', 'Tous les jours 08h00 - 22h00')
ON CONFLICT (id) DO NOTHING;
CREATE TRIGGER trg_parametres_updated_at BEFORE UPDATE ON public.parametres FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
ALTER TABLE public.parametres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "param_select" ON public.parametres FOR SELECT USING (true);
CREATE POLICY "param_update" ON public.parametres FOR UPDATE USING (auth.uid() IN (SELECT id FROM public.admin_profiles));
SELECT 'Chez Fanny — paramètres OK' AS status;
