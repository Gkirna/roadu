import { useSubscription } from "@/hooks/useSubscription";
import { useAuth } from "@/hooks/useAuth";
import { useProfile } from "@/hooks/useProfile";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";
import { motion } from "framer-motion";
import { CreditCard, Download, Calendar, AlertTriangle, CheckCircle, Clock } from "lucide-react";
import { format, differenceInDays, parseISO } from "date-fns";

function generateInvoiceHTML(payment: any, profile: any) {
  const paidDate = payment.paid_at ? format(parseISO(payment.paid_at), "dd MMM yyyy") : "N/A";
  const expiryDate = payment.expires_at ? format(parseISO(payment.expires_at), "dd MMM yyyy") : "N/A";
  return `
<!DOCTYPE html>
<html>
<head><title>GAI Invoice</title>
<style>
  body { font-family: 'Segoe UI', sans-serif; max-width: 600px; margin: 40px auto; padding: 20px; color: #333; }
  .header { text-align: center; border-bottom: 2px solid #e85d26; padding-bottom: 20px; margin-bottom: 30px; }
  .header h1 { margin: 0; font-size: 28px; color: #e85d26; }
  .header p { color: #888; margin: 5px 0 0; }
  .details { margin-bottom: 30px; }
  .details table { width: 100%; border-collapse: collapse; }
  .details td { padding: 8px 0; border-bottom: 1px solid #eee; }
  .details td:first-child { font-weight: 600; color: #555; width: 40%; }
  .total { background: #f9f5f0; padding: 15px; border-radius: 8px; text-align: right; font-size: 20px; font-weight: 700; color: #e85d26; }
  .footer { margin-top: 30px; text-align: center; color: #aaa; font-size: 12px; }
</style></head>
<body>
  <div class="header">
    <h1>🧠 GAI</h1>
    <p>Learning Subscription Invoice</p>
  </div>
  <div class="details">
    <table>
      <tr><td>Invoice To</td><td>${profile?.username || profile?.email || "Learner"}</td></tr>
      <tr><td>Email</td><td>${profile?.email || "N/A"}</td></tr>
      <tr><td>Plan</td><td>GAI Monthly Subscription</td></tr>
      <tr><td>Payment Date</td><td>${paidDate}</td></tr>
      <tr><td>Valid Until</td><td>${expiryDate}</td></tr>
      <tr><td>Transaction ID</td><td>${payment.upi_transaction_id || "N/A"}</td></tr>
      <tr><td>Payment Method</td><td>UPI</td></tr>
      <tr><td>Status</td><td>✅ Confirmed</td></tr>
    </table>
  </div>
  <div class="total">Total: ₹${payment.amount}</div>
  <div class="footer">
    <p>GAI — Generative AI Learning Platform</p>
    <p>This is a computer-generated invoice. No signature required.</p>
  </div>
</body>
</html>`;
}

function downloadInvoice(payment: any, profile: any) {
  const html = generateInvoiceHTML(payment, profile);
  const blob = new Blob([html], { type: "text/html" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url;
  a.download = `GAI-Invoice-${format(parseISO(payment.paid_at || payment.created_at), "yyyy-MM-dd")}.html`;
  a.click();
  URL.revokeObjectURL(url);
}

export default function Subscription() {
  const { data: subscription, isLoading } = useSubscription();
  const { data: profile } = useProfile();

  if (isLoading) {
    return (
      <div className="max-w-2xl mx-auto p-4">
        <div className="animate-pulse space-y-4">
          <div className="h-8 bg-muted rounded w-1/3" />
          <div className="h-48 bg-muted rounded" />
        </div>
      </div>
    );
  }

  const payment = subscription?.payment;
  const isActive = subscription?.active;
  const expiresAt = payment?.expires_at ? parseISO(payment.expires_at) : null;
  const daysLeft = expiresAt ? differenceInDays(expiresAt, new Date()) : 0;
  const isNearExpiry = isActive && daysLeft <= 5 && daysLeft >= 0;

  return (
    <div className="max-w-2xl mx-auto space-y-6">
      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}>
        <h1 className="text-2xl font-bold flex items-center gap-2">
          <CreditCard className="h-6 w-6 text-primary" /> Subscription
        </h1>
        <p className="text-muted-foreground text-sm mt-1">Manage your GAI learning subscription</p>
      </motion.div>

      {isNearExpiry && (
        <Alert className="border-destructive/50 bg-destructive/5">
          <AlertTriangle className="h-4 w-4 text-destructive" />
          <AlertTitle className="text-destructive">Subscription expiring soon</AlertTitle>
          <AlertDescription>
            Your subscription expires in <strong>{daysLeft} day{daysLeft !== 1 ? "s" : ""}</strong>.
            Please renew to continue learning without interruption.
          </AlertDescription>
        </Alert>
      )}

      {!isActive && (
        <Alert className="border-destructive/50 bg-destructive/5">
          <AlertTriangle className="h-4 w-4 text-destructive" />
          <AlertTitle className="text-destructive">Subscription expired</AlertTitle>
          <AlertDescription>
            Your subscription has expired. You will be redirected to the payment page to renew.
          </AlertDescription>
        </Alert>
      )}

      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }}>
        <Card className="border-border/50">
          <CardHeader>
            <div className="flex items-center justify-between">
              <div>
                <CardTitle className="text-lg">GAI Monthly Plan</CardTitle>
                <CardDescription>Full access to all AI learning content</CardDescription>
              </div>
              <Badge variant={isActive ? "default" : "destructive"} className="text-sm">
                {isActive ? (
                  <span className="flex items-center gap-1"><CheckCircle className="h-3 w-3" /> Active</span>
                ) : (
                  <span className="flex items-center gap-1"><Clock className="h-3 w-3" /> Expired</span>
                )}
              </Badge>
            </div>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="text-3xl font-bold text-foreground">
              ₹1<span className="text-base font-normal text-muted-foreground">/month</span>
            </div>

            {payment && (
              <div className="grid grid-cols-2 gap-4 text-sm">
                <div className="space-y-1">
                  <p className="text-muted-foreground">Payment Date</p>
                  <p className="font-medium flex items-center gap-1">
                    <Calendar className="h-3.5 w-3.5" />
                    {payment.paid_at ? format(parseISO(payment.paid_at), "dd MMM yyyy") : "N/A"}
                  </p>
                </div>
                <div className="space-y-1">
                  <p className="text-muted-foreground">Expires On</p>
                  <p className="font-medium flex items-center gap-1">
                    <Calendar className="h-3.5 w-3.5" />
                    {expiresAt ? format(expiresAt, "dd MMM yyyy") : "N/A"}
                  </p>
                </div>
                <div className="space-y-1">
                  <p className="text-muted-foreground">Transaction ID</p>
                  <p className="font-mono text-xs">{payment.upi_transaction_id || "N/A"}</p>
                </div>
                <div className="space-y-1">
                  <p className="text-muted-foreground">Days Remaining</p>
                  <p className="font-medium">{isActive ? `${daysLeft} days` : "Expired"}</p>
                </div>
              </div>
            )}

            {payment && (
              <Button
                variant="outline"
                className="w-full"
                onClick={() => downloadInvoice(payment, profile)}
              >
                <Download className="h-4 w-4 mr-2" /> Download Invoice
              </Button>
            )}
          </CardContent>
        </Card>
      </motion.div>

      <motion.div initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}>
        <Card className="border-border/50">
          <CardHeader>
            <CardTitle className="text-lg">Plan Features</CardTitle>
          </CardHeader>
          <CardContent>
            <ul className="space-y-2 text-sm">
              {[
                "Access to all 10 AI learning books",
                "Interactive exercises & quizzes",
                "AI Tutor powered by Gemini",
                "Progress tracking & streaks",
                "Achievements & leaderboard",
                "Downloadable invoices",
              ].map((f) => (
                <li key={f} className="flex items-center gap-2">
                  <CheckCircle className="h-4 w-4 text-secondary" />
                  <span className="text-muted-foreground">{f}</span>
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      </motion.div>
    </div>
  );
}
