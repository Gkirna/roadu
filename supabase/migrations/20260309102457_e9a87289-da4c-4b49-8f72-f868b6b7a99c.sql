
-- Verify the update policy is gone and re-drop if needed (idempotent)
DROP POLICY IF EXISTS "Users can update own payments" ON public.payments;
