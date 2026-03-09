import { supabase } from "@/integrations/supabase/client";

type AuditAction =
  | "auth.login"
  | "auth.signup"
  | "auth.logout"
  | "page.complete"
  | "exercise.submit"
  | "tutor.message"
  | "profile.view";

export async function logAudit(
  action: AuditAction,
  resourceType?: string,
  resourceId?: string,
  metadata?: Record<string, string | number | boolean | null>
) {
  try {
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) return;

    await supabase.rpc("log_audit", {
      p_user_id: user.id,
      p_action: action,
      p_resource_type: resourceType ?? null,
      p_resource_id: resourceId ?? null,
      p_metadata: metadata ?? {},
    });
  } catch {
    // Audit logging should never break the app
    console.warn("Audit log failed silently");
  }
}
