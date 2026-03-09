import { useState } from "react";
import { QRCodeSVG } from "qrcode.react";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { toast } from "sonner";
import { motion } from "framer-motion";
import { IndianRupee, QrCode, Smartphone, LogOut } from "lucide-react";

const UPI_ID = "gkirna4-2@oksbi";
const AMOUNT = 1;
const UPI_URI = `upi://pay?pa=${UPI_ID}&pn=GAI&am=${AMOUNT}&cu=INR&tn=GAI%20Subscription`;

export default function Payment() {
  const { user, signOut } = useAuth();
  const [transactionId, setTransactionId] = useState("");
  const [loading, setLoading] = useState(false);

  const handleConfirmPayment = async () => {
    if (!transactionId.trim()) {
      toast.error("Please enter your UPI transaction/reference ID");
      return;
    }
    if (!user) return;

    setLoading(true);
    try {
      const expiresAt = new Date();
      expiresAt.setMonth(expiresAt.getMonth() + 1);

      const { error } = await supabase.from("payments").insert({
        user_id: user.id,
        amount: AMOUNT,
        upi_transaction_id: transactionId.trim(),
        status: "confirmed",
        paid_at: new Date().toISOString(),
        expires_at: expiresAt.toISOString(),
      });

      if (error) throw error;
      toast.success("Payment confirmed! Welcome to GAI 🎉");
      // The useSubscription hook will pick this up via polling
    } catch (err: any) {
      toast.error(err.message || "Failed to confirm payment");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-background p-4">
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.5 }}
        className="w-full max-w-md space-y-6"
      >
        <div className="text-center">
          <span className="text-5xl mb-4 block">🧠</span>
          <h1 className="text-3xl font-bold text-foreground">GAI</h1>
          <p className="text-muted-foreground mt-2">Activate your learning subscription</p>
        </div>

        <Card className="border-border/50 shadow-xl">
          <CardHeader className="text-center">
            <CardTitle className="flex items-center justify-center gap-2">
              <IndianRupee className="h-5 w-5" /> ₹{AMOUNT}/month
            </CardTitle>
            <CardDescription>
              Scan the QR code or use the UPI ID to pay
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            {/* QR Code */}
            <div className="flex flex-col items-center gap-3">
              <div className="bg-white p-4 rounded-xl shadow-sm border">
                <QRCodeSVG value={UPI_URI} size={200} level="H" />
              </div>
              <div className="flex items-center gap-2 text-xs text-muted-foreground">
                <QrCode className="h-3.5 w-3.5" />
                Scan with any UPI app
              </div>
            </div>

            {/* UPI ID */}
            <div className="text-center space-y-1">
              <p className="text-sm text-muted-foreground">Or pay directly to UPI ID:</p>
              <p className="font-mono text-base font-semibold text-foreground bg-muted/50 rounded-lg py-2 px-4 select-all">
                {UPI_ID}
              </p>
            </div>

            {/* Supported apps */}
            <div className="flex items-center justify-center gap-4 text-xs text-muted-foreground">
              <span className="flex items-center gap-1"><Smartphone className="h-3.5 w-3.5" /> PhonePe</span>
              <span>•</span>
              <span>Google Pay</span>
              <span>•</span>
              <span>Paytm</span>
            </div>

            <div className="border-t pt-4 space-y-3">
              <p className="text-sm font-medium text-foreground">After payment, enter your UPI transaction ID:</p>
              <Input
                placeholder="e.g. 412345678901"
                value={transactionId}
                onChange={(e) => setTransactionId(e.target.value)}
              />
              <Button
                onClick={handleConfirmPayment}
                disabled={loading}
                className="w-full"
              >
                {loading ? "Confirming..." : "I Have Paid ✓"}
              </Button>
            </div>
          </CardContent>
        </Card>

        <div className="text-center">
          <button
            onClick={signOut}
            className="text-sm text-muted-foreground hover:text-foreground flex items-center gap-1 mx-auto"
          >
            <LogOut className="h-3.5 w-3.5" /> Sign out
          </button>
        </div>
      </motion.div>
    </div>
  );
}
