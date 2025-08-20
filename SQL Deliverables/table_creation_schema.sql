
-- Enable UUID generator 
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Tables
CREATE TABLE IF NOT EXISTS public.users (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL UNIQUE,
  created_at timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS public.events (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  date date NOT NULL,
  city text,
  created_by uuid NOT NULL REFERENCES public.users(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.rsvps (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL REFERENCES public.users(id) ON DELETE CASCADE,
  event_id uuid NOT NULL REFERENCES public.events(id) ON DELETE CASCADE,
  status text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT rsvps_status_check CHECK (status IN ('Yes','No','Maybe')),
  CONSTRAINT rsvps_unique_user_event UNIQUE (user_id, event_id)
);

-- Helpful indexes
CREATE INDEX IF NOT EXISTS idx_events_date  ON public.events(date);
CREATE INDEX IF NOT EXISTS idx_events_city  ON public.events(city);
CREATE INDEX IF NOT EXISTS idx_rsvps_user   ON public.rsvps(user_id);
CREATE INDEX IF NOT EXISTS idx_rsvps_event  ON public.rsvps(event_id);
