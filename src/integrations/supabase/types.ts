export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.4"
  }
  public: {
    Tables: {
      achievements: {
        Row: {
          created_at: string
          description: string | null
          icon: string | null
          id: string
          title: string
          xp_threshold: number | null
        }
        Insert: {
          created_at?: string
          description?: string | null
          icon?: string | null
          id?: string
          title: string
          xp_threshold?: number | null
        }
        Update: {
          created_at?: string
          description?: string | null
          icon?: string | null
          id?: string
          title?: string
          xp_threshold?: number | null
        }
        Relationships: []
      }
      audit_logs: {
        Row: {
          action: string
          created_at: string
          id: string
          ip_address: string | null
          metadata: Json | null
          resource_id: string | null
          resource_type: string | null
          user_id: string
        }
        Insert: {
          action: string
          created_at?: string
          id?: string
          ip_address?: string | null
          metadata?: Json | null
          resource_id?: string | null
          resource_type?: string | null
          user_id: string
        }
        Update: {
          action?: string
          created_at?: string
          id?: string
          ip_address?: string | null
          metadata?: Json | null
          resource_id?: string | null
          resource_type?: string | null
          user_id?: string
        }
        Relationships: []
      }
      books: {
        Row: {
          cover_image_url: string | null
          created_at: string
          description: string | null
          difficulty: string
          id: string
          order_index: number
          title: string
          total_chapters: number
        }
        Insert: {
          cover_image_url?: string | null
          created_at?: string
          description?: string | null
          difficulty?: string
          id?: string
          order_index?: number
          title: string
          total_chapters?: number
        }
        Update: {
          cover_image_url?: string | null
          created_at?: string
          description?: string | null
          difficulty?: string
          id?: string
          order_index?: number
          title?: string
          total_chapters?: number
        }
        Relationships: []
      }
      chapters: {
        Row: {
          book_id: string
          created_at: string
          description: string | null
          id: string
          order_index: number
          title: string
          total_pages: number
        }
        Insert: {
          book_id: string
          created_at?: string
          description?: string | null
          id?: string
          order_index?: number
          title: string
          total_pages?: number
        }
        Update: {
          book_id?: string
          created_at?: string
          description?: string | null
          id?: string
          order_index?: number
          title?: string
          total_pages?: number
        }
        Relationships: [
          {
            foreignKeyName: "chapters_book_id_fkey"
            columns: ["book_id"]
            isOneToOne: false
            referencedRelation: "books"
            referencedColumns: ["id"]
          },
        ]
      }
      exercise_results: {
        Row: {
          exercise_id: string
          id: string
          is_correct: boolean
          score: number | null
          submitted_at: string
          user_answer: string | null
          user_id: string
        }
        Insert: {
          exercise_id: string
          id?: string
          is_correct?: boolean
          score?: number | null
          submitted_at?: string
          user_answer?: string | null
          user_id: string
        }
        Update: {
          exercise_id?: string
          id?: string
          is_correct?: boolean
          score?: number | null
          submitted_at?: string
          user_answer?: string | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "exercise_results_exercise_id_fkey"
            columns: ["exercise_id"]
            isOneToOne: false
            referencedRelation: "exercises"
            referencedColumns: ["id"]
          },
        ]
      }
      exercises: {
        Row: {
          correct_answer: string
          created_at: string
          exercise_type: string
          explanation: string | null
          id: string
          options: Json | null
          page_id: string
          question: string
          xp_reward: number
        }
        Insert: {
          correct_answer: string
          created_at?: string
          exercise_type?: string
          explanation?: string | null
          id?: string
          options?: Json | null
          page_id: string
          question: string
          xp_reward?: number
        }
        Update: {
          correct_answer?: string
          created_at?: string
          exercise_type?: string
          explanation?: string | null
          id?: string
          options?: Json | null
          page_id?: string
          question?: string
          xp_reward?: number
        }
        Relationships: [
          {
            foreignKeyName: "exercises_page_id_fkey"
            columns: ["page_id"]
            isOneToOne: false
            referencedRelation: "pages"
            referencedColumns: ["id"]
          },
        ]
      }
      pages: {
        Row: {
          chapter_id: string
          content: string | null
          created_at: string
          diagram_url: string | null
          id: string
          order_index: number
          page_type: string
          title: string
        }
        Insert: {
          chapter_id: string
          content?: string | null
          created_at?: string
          diagram_url?: string | null
          id?: string
          order_index?: number
          page_type?: string
          title: string
        }
        Update: {
          chapter_id?: string
          content?: string | null
          created_at?: string
          diagram_url?: string | null
          id?: string
          order_index?: number
          page_type?: string
          title?: string
        }
        Relationships: [
          {
            foreignKeyName: "pages_chapter_id_fkey"
            columns: ["chapter_id"]
            isOneToOne: false
            referencedRelation: "chapters"
            referencedColumns: ["id"]
          },
        ]
      }
      payments: {
        Row: {
          amount: number
          created_at: string
          expires_at: string | null
          id: string
          paid_at: string | null
          status: string
          upi_transaction_id: string | null
          user_id: string
        }
        Insert: {
          amount?: number
          created_at?: string
          expires_at?: string | null
          id?: string
          paid_at?: string | null
          status?: string
          upi_transaction_id?: string | null
          user_id: string
        }
        Update: {
          amount?: number
          created_at?: string
          expires_at?: string | null
          id?: string
          paid_at?: string | null
          status?: string
          upi_transaction_id?: string | null
          user_id?: string
        }
        Relationships: []
      }
      profiles: {
        Row: {
          avatar_url: string | null
          created_at: string
          email: string | null
          id: string
          level: number
          streak_days: number
          total_exercises_completed: number
          total_pages_completed: number
          updated_at: string
          username: string | null
          xp: number
        }
        Insert: {
          avatar_url?: string | null
          created_at?: string
          email?: string | null
          id: string
          level?: number
          streak_days?: number
          total_exercises_completed?: number
          total_pages_completed?: number
          updated_at?: string
          username?: string | null
          xp?: number
        }
        Update: {
          avatar_url?: string | null
          created_at?: string
          email?: string | null
          id?: string
          level?: number
          streak_days?: number
          total_exercises_completed?: number
          total_pages_completed?: number
          updated_at?: string
          username?: string | null
          xp?: number
        }
        Relationships: []
      }
      rate_limits: {
        Row: {
          endpoint: string
          id: string
          request_count: number
          user_id: string
          window_start: string
        }
        Insert: {
          endpoint: string
          id?: string
          request_count?: number
          user_id: string
          window_start?: string
        }
        Update: {
          endpoint?: string
          id?: string
          request_count?: number
          user_id?: string
          window_start?: string
        }
        Relationships: []
      }
      tutor_conversations: {
        Row: {
          created_at: string
          id: string
          title: string
          updated_at: string
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          title?: string
          updated_at?: string
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          title?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
      tutor_messages: {
        Row: {
          content: string
          conversation_id: string
          created_at: string
          id: string
          role: string
        }
        Insert: {
          content: string
          conversation_id: string
          created_at?: string
          id?: string
          role: string
        }
        Update: {
          content?: string
          conversation_id?: string
          created_at?: string
          id?: string
          role?: string
        }
        Relationships: [
          {
            foreignKeyName: "tutor_messages_conversation_id_fkey"
            columns: ["conversation_id"]
            isOneToOne: false
            referencedRelation: "tutor_conversations"
            referencedColumns: ["id"]
          },
        ]
      }
      user_achievements: {
        Row: {
          achievement_id: string
          earned_at: string
          id: string
          user_id: string
        }
        Insert: {
          achievement_id: string
          earned_at?: string
          id?: string
          user_id: string
        }
        Update: {
          achievement_id?: string
          earned_at?: string
          id?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_achievements_achievement_id_fkey"
            columns: ["achievement_id"]
            isOneToOne: false
            referencedRelation: "achievements"
            referencedColumns: ["id"]
          },
        ]
      }
      user_activity: {
        Row: {
          activity_date: string
          exercises_completed: number
          id: string
          pages_completed: number
          user_id: string
          xp_earned: number
        }
        Insert: {
          activity_date?: string
          exercises_completed?: number
          id?: string
          pages_completed?: number
          user_id: string
          xp_earned?: number
        }
        Update: {
          activity_date?: string
          exercises_completed?: number
          id?: string
          pages_completed?: number
          user_id?: string
          xp_earned?: number
        }
        Relationships: []
      }
      user_progress: {
        Row: {
          completed: boolean
          completed_at: string | null
          id: string
          page_id: string
          score: number | null
          user_id: string
        }
        Insert: {
          completed?: boolean
          completed_at?: string | null
          id?: string
          page_id: string
          score?: number | null
          user_id: string
        }
        Update: {
          completed?: boolean
          completed_at?: string | null
          id?: string
          page_id?: string
          score?: number | null
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "user_progress_page_id_fkey"
            columns: ["page_id"]
            isOneToOne: false
            referencedRelation: "pages"
            referencedColumns: ["id"]
          },
        ]
      }
      user_roles: {
        Row: {
          created_at: string
          id: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      leaderboard: {
        Row: {
          avatar_url: string | null
          id: string | null
          level: number | null
          rank: number | null
          username: string | null
          xp: number | null
        }
        Relationships: []
      }
    }
    Functions: {
      add_xp: { Args: { p_user_id: string; p_xp: number }; Returns: undefined }
      calculate_level: { Args: { user_xp: number }; Returns: number }
      check_rate_limit: {
        Args: {
          p_endpoint: string
          p_max_requests?: number
          p_user_id: string
          p_window_minutes?: number
        }
        Returns: boolean
      }
      cleanup_rate_limits: { Args: never; Returns: undefined }
      complete_page: {
        Args: { p_page_id: string; p_user_id: string }
        Returns: undefined
      }
      has_active_subscription: { Args: { p_user_id: string }; Returns: boolean }
      has_role: {
        Args: {
          _role: Database["public"]["Enums"]["app_role"]
          _user_id: string
        }
        Returns: boolean
      }
      log_audit: {
        Args: {
          p_action: string
          p_metadata?: Json
          p_resource_id?: string
          p_resource_type?: string
          p_user_id: string
        }
        Returns: undefined
      }
      submit_exercise: {
        Args: { p_answer: string; p_exercise_id: string; p_user_id: string }
        Returns: boolean
      }
      update_streak: { Args: { p_user_id: string }; Returns: number }
    }
    Enums: {
      app_role: "admin" | "moderator" | "user"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      app_role: ["admin", "moderator", "user"],
    },
  },
} as const
