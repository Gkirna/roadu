import { useSubscription } from "@/hooks/useSubscription";
import { Alert, AlertDescription } from "@/components/ui/alert";
import { AlertTriangle } from "lucide-react";
import { differenceInDays, parseISO } from "date-fns";
import { useNavigate } from "react-router-dom";

export function SubscriptionAlert() {
  const { data: subscription } = useSubscription();
  const navigate = useNavigate();

  if (!subscription?.active || !subscription.payment?.expires_at) return null;

  const daysLeft = differenceInDays(parseISO(subscription.payment.expires_at), new Date());
  if (daysLeft > 5) return null;

  return (
    <Alert
      className="border-destructive/30 bg-destructive/5 cursor-pointer mx-4 mt-2"
      onClick={() => navigate("/subscription")}
    >
      <AlertTriangle className="h-4 w-4 text-destructive" />
      <AlertDescription className="text-xs text-destructive">
        Subscription expires in <strong>{daysLeft} day{daysLeft !== 1 ? "s" : ""}</strong>. Tap to view.
      </AlertDescription>
    </Alert>
  );
}
