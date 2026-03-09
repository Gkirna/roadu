import { ReactNode } from "react";
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/AppSidebar";
import { SubscriptionAlert } from "@/components/SubscriptionAlert";
import { useProfile } from "@/hooks/useProfile";
import { Zap } from "lucide-react";
import { ErrorBoundary } from "@/components/ErrorBoundary";

export function AppLayout({ children }: { children: ReactNode }) {
  const { data: profile } = useProfile();

  return (
    <SidebarProvider>
      <div className="min-h-screen flex w-full">
        <AppSidebar />
        <div className="flex-1 flex flex-col min-w-0">
          <header className="h-14 flex items-center border-b border-border bg-card/80 backdrop-blur-sm sticky top-0 z-10 px-4">
            <SidebarTrigger />
            <div className="ml-auto flex items-center gap-3">
              <span className="xp-badge">
                <Zap className="h-3.5 w-3.5" /> {profile?.xp ?? 0} XP
              </span>
            </div>
          </header>
          <SubscriptionAlert />
          <main className="flex-1 p-4 md:p-6 overflow-auto">
            <ErrorBoundary>
              {children}
            </ErrorBoundary>
          </main>
        </div>
      </div>
    </SidebarProvider>
  );
}