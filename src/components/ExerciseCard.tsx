import { useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth } from "@/hooks/useAuth";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { toast } from "sonner";
import { motion } from "framer-motion";
import { CheckCircle, XCircle, Lightbulb } from "lucide-react";
import type { Exercise } from "@/types/learning";

interface Props {
  exercise: Exercise;
  onCorrectAnswer?: () => void;
}

export default function ExerciseCard({ exercise, onCorrectAnswer }: Props) {
  const { user } = useAuth();
  const [selected, setSelected] = useState<string | null>(null);
  const [answer, setAnswer] = useState("");
  const [result, setResult] = useState<boolean | null>(null);
  const [showExplanation, setShowExplanation] = useState(false);
  const [submitting, setSubmitting] = useState(false);

  const options = Array.isArray(exercise.options) ? exercise.options as string[] : [];

  const handleSubmit = async () => {
    if (!user) return;
    const userAnswer = exercise.exercise_type === "multiple_choice" ? selected : answer;
    if (!userAnswer) {
      toast.error("Please select or type an answer");
      return;
    }
    setSubmitting(true);
    try {
      const { data, error } = await supabase.rpc("submit_exercise", {
        p_user_id: user.id,
        p_exercise_id: exercise.id,
        p_answer: userAnswer,
      });
      if (error) throw error;
      const isCorrect = data as unknown as boolean;
      setResult(isCorrect);
      if (isCorrect) {
        toast.success(`+${exercise.xp_reward} XP ⚡`, { description: "Correct answer!" });
        onCorrectAnswer?.();
      } else {
      } else {
        toast.error("Not quite right", { description: "Try reviewing the explanation" });
      }
    } catch {
      toast.error("Failed to submit");
    } finally {
      setSubmitting(false);
    }
  };

  return (
    <Card className="border-border/50 bg-muted/30">
      <CardContent className="p-4 space-y-3">
        <p className="font-semibold text-foreground">{exercise.question}</p>

        {exercise.exercise_type === "multiple_choice" && options.length > 0 && (
          <div className="space-y-2">
            {options.map((opt, i) => (
              <button
                key={i}
                onClick={() => result === null && setSelected(opt)}
                disabled={result !== null}
                className={`w-full text-left px-4 py-2.5 rounded-lg border transition-all text-sm ${
                  selected === opt
                    ? result === null
                      ? "border-primary bg-primary/10 text-primary"
                      : result && opt === exercise.correct_answer
                      ? "border-secondary bg-secondary/10 text-secondary"
                      : opt === selected && !result
                      ? "border-destructive bg-destructive/10 text-destructive"
                      : "border-border"
                    : result !== null && opt === exercise.correct_answer
                    ? "border-secondary bg-secondary/10 text-secondary"
                    : "border-border hover:border-primary/30 hover:bg-primary/5"
                }`}
              >
                <span className="font-medium mr-2">{String.fromCharCode(65 + i)}.</span>
                {opt}
              </button>
            ))}
          </div>
        )}

        {(exercise.exercise_type === "fill_blank" || exercise.exercise_type === "code_completion") && (
          <input
            type="text"
            value={answer}
            onChange={(e) => setAnswer(e.target.value)}
            disabled={result !== null}
            placeholder="Type your answer..."
            className="w-full px-4 py-2.5 rounded-lg border border-border bg-background text-sm focus:outline-none focus:border-primary"
          />
        )}

        {result === null ? (
          <Button onClick={handleSubmit} disabled={submitting} size="sm">
            {submitting ? "Submitting..." : "Submit Answer"}
          </Button>
        ) : (
          <motion.div
            initial={{ opacity: 0, scale: 0.95 }}
            animate={{ opacity: 1, scale: 1 }}
            className={`flex items-center gap-2 p-3 rounded-lg ${
              result ? "bg-secondary/10 text-secondary" : "bg-destructive/10 text-destructive"
            }`}
          >
            {result ? (
              <>
                <CheckCircle className="h-5 w-5" />
                <span className="font-semibold">Correct! +{exercise.xp_reward} XP</span>
              </>
            ) : (
              <>
                <XCircle className="h-5 w-5" />
                <span className="font-semibold">Incorrect</span>
              </>
            )}
          </motion.div>
        )}

        {exercise.explanation && (
          <div>
            <button
              onClick={() => setShowExplanation(!showExplanation)}
              className="text-sm text-primary flex items-center gap-1 hover:underline"
            >
              <Lightbulb className="h-3.5 w-3.5" />
              {showExplanation ? "Hide Explanation" : "Show Explanation"}
            </button>
            {showExplanation && (
              <motion.p
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: "auto" }}
                className="text-sm text-muted-foreground mt-2 pl-5 border-l-2 border-primary/20"
              >
                {exercise.explanation}
              </motion.p>
            )}
          </div>
        )}
      </CardContent>
    </Card>
  );
}
