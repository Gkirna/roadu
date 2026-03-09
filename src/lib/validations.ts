import { z } from "zod";

// Auth validations
export const loginSchema = z.object({
  email: z
    .string()
    .trim()
    .min(1, "Email is required")
    .email("Invalid email address")
    .max(255, "Email must be less than 255 characters"),
  password: z
    .string()
    .min(8, "Password must be at least 8 characters")
    .max(128, "Password must be less than 128 characters"),
});

export const signupSchema = loginSchema.extend({
  username: z
    .string()
    .trim()
    .min(2, "Username must be at least 2 characters")
    .max(30, "Username must be less than 30 characters")
    .regex(/^[a-zA-Z0-9_-]+$/, "Username can only contain letters, numbers, hyphens, and underscores"),
});

// AI Tutor input validation
export const chatMessageSchema = z.object({
  content: z
    .string()
    .trim()
    .min(1, "Message cannot be empty")
    .max(2000, "Message must be less than 2000 characters"),
});

// Exercise answer validation
export const exerciseAnswerSchema = z.object({
  answer: z
    .string()
    .trim()
    .min(1, "Answer cannot be empty")
    .max(500, "Answer must be less than 500 characters"),
});

export type LoginInput = z.infer<typeof loginSchema>;
export type SignupInput = z.infer<typeof signupSchema>;
export type ChatMessageInput = z.infer<typeof chatMessageSchema>;
export type ExerciseAnswerInput = z.infer<typeof exerciseAnswerSchema>;
