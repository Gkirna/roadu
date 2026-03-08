import { motion, AnimatePresence } from "framer-motion";
import { useEffect, useState } from "react";
import type { UnlockedAchievement } from "@/hooks/useAchievements";
import { Trophy } from "lucide-react";

interface Props {
  achievements: UnlockedAchievement[];
  onDone: () => void;
}

export default function AchievementUnlock({ achievements, onDone }: Props) {
  const [currentIndex, setCurrentIndex] = useState(0);

  const current = achievements[currentIndex];

  useEffect(() => {
    if (!current) {
      onDone();
      return;
    }
    const timer = setTimeout(() => {
      if (currentIndex < achievements.length - 1) {
        setCurrentIndex((i) => i + 1);
      } else {
        onDone();
      }
    }, 3500);
    return () => clearTimeout(timer);
  }, [currentIndex, achievements.length, current, onDone]);

  if (!current) return null;

  return (
    <AnimatePresence>
      <motion.div
        key={current.id}
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        className="fixed inset-0 z-50 flex items-center justify-center pointer-events-none"
      >
        {/* Backdrop glow */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 0.6 }}
          exit={{ opacity: 0 }}
          className="absolute inset-0 bg-background/80 backdrop-blur-sm"
        />

        {/* Card */}
        <motion.div
          initial={{ scale: 0.3, opacity: 0, y: 40 }}
          animate={{ scale: 1, opacity: 1, y: 0 }}
          exit={{ scale: 0.8, opacity: 0, y: -20 }}
          transition={{ type: "spring", stiffness: 300, damping: 20, delay: 0.1 }}
          className="relative pointer-events-auto"
          onClick={() => {
            if (currentIndex < achievements.length - 1) {
              setCurrentIndex((i) => i + 1);
            } else {
              onDone();
            }
          }}
        >
          {/* Particle ring */}
          <motion.div
            initial={{ scale: 0.5, opacity: 0 }}
            animate={{ scale: 1.8, opacity: [0, 0.8, 0] }}
            transition={{ duration: 1.2, ease: "easeOut" }}
            className="absolute inset-0 rounded-full border-2 border-primary/40"
          />

          <div className="bg-card border border-border/50 rounded-2xl p-8 text-center shadow-2xl max-w-xs mx-4">
            {/* Icon */}
            <motion.div
              initial={{ rotate: -180, scale: 0 }}
              animate={{ rotate: 0, scale: 1 }}
              transition={{ type: "spring", stiffness: 200, damping: 12, delay: 0.3 }}
              className="text-6xl mb-4"
            >
              {current.icon || "🏆"}
            </motion.div>

            {/* Label */}
            <motion.div
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.5 }}
              className="flex items-center justify-center gap-1.5 text-xs uppercase tracking-widest text-primary font-semibold mb-2"
            >
              <Trophy className="h-3.5 w-3.5" />
              Achievement Unlocked
            </motion.div>

            {/* Title */}
            <motion.h3
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.6 }}
              className="text-xl font-bold text-foreground mb-1"
            >
              {current.title}
            </motion.h3>

            {/* Description */}
            <motion.p
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.7 }}
              className="text-sm text-muted-foreground"
            >
              {current.description}
            </motion.p>

            {/* Tap hint */}
            <motion.p
              initial={{ opacity: 0 }}
              animate={{ opacity: 0.5 }}
              transition={{ delay: 1.5 }}
              className="text-xs text-muted-foreground mt-4"
            >
              Tap to continue
            </motion.p>
          </div>
        </motion.div>
      </motion.div>
    </AnimatePresence>
  );
}
