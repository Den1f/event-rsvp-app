-- Data (10 users, 5 events, 20 RSVPs)
-- Run after the table schema has been created.

-- Users
INSERT INTO public.users (name, email) VALUES
('Alice Sharma', 'alice@example.com'),
('Rahul Verma', 'rahul@example.com'),
('Sneha Patel', 'sneha@example.com'),
('Arjun Mehta', 'arjun@example.com'),
('Priya Singh', 'priya@example.com'),
('Karan Kapoor', 'karan@example.com'),
('Riya Nair', 'riya@example.com'),
('Vikram Joshi', 'vikram@example.com'),
('Neha Gupta', 'neha@example.com'),
('Amit Rao', 'amit@example.com')
ON CONFLICT (email) DO NOTHING;

-- Events
INSERT INTO public.events (title, description, date, city, created_by) VALUES
('Tech Meetup',   'Networking and coding event', '2025-09-01', 'Bangalore', (SELECT id FROM public.users WHERE email='alice@example.com')),
('Startup Pitch', 'Startup ideas presentation',  '2025-09-05', 'Hyderabad', (SELECT id FROM public.users WHERE email='rahul@example.com')),
('AI Workshop',   'Hands-on AI training',        '2025-09-10', 'Mumbai',    (SELECT id FROM public.users WHERE email='sneha@example.com')),
('Music Fest',    'Live music and fun',          '2025-09-15', 'Delhi',     (SELECT id FROM public.users WHERE email='arjun@example.com')),
('Art Expo',      'Art and culture exhibition',  '2025-09-20', 'Chennai',   (SELECT id FROM public.users WHERE email='priya@example.com'))
ON CONFLICT DO NOTHING;

-- RSVPs (20 deterministic rows, unique per user/event)
INSERT INTO public.rsvps (user_id, event_id, status) VALUES
((SELECT id FROM public.users WHERE email='alice@example.com'),  (SELECT id FROM public.events WHERE title='Tech Meetup'),   'Yes'),
((SELECT id FROM public.users WHERE email='alice@example.com'),  (SELECT id FROM public.events WHERE title='AI Workshop'),   'Maybe'),
((SELECT id FROM public.users WHERE email='rahul@example.com'),  (SELECT id FROM public.events WHERE title='Tech Meetup'),   'No'),
((SELECT id FROM public.users WHERE email='rahul@example.com'),  (SELECT id FROM public.events WHERE title='Startup Pitch'), 'Yes'),
((SELECT id FROM public.users WHERE email='sneha@example.com'),  (SELECT id FROM public.events WHERE title='Tech Meetup'),   'Yes'),
((SELECT id FROM public.users WHERE email='sneha@example.com'),  (SELECT id FROM public.events WHERE title='AI Workshop'),   'Yes'),
((SELECT id FROM public.users WHERE email='arjun@example.com'),  (SELECT id FROM public.events WHERE title='Music Fest'),    'Maybe'),
((SELECT id FROM public.users WHERE email='arjun@example.com'),  (SELECT id FROM public.events WHERE title='Startup Pitch'), 'No'),
((SELECT id FROM public.users WHERE email='priya@example.com'),  (SELECT id FROM public.events WHERE title='Art Expo'),      'Yes'),
((SELECT id FROM public.users WHERE email='priya@example.com'),  (SELECT id FROM public.events WHERE title='Music Fest'),    'Yes'),
((SELECT id FROM public.users WHERE email='karan@example.com'),  (SELECT id FROM public.events WHERE title='Tech Meetup'),   'Maybe'),
((SELECT id FROM public.users WHERE email='karan@example.com'),  (SELECT id FROM public.events WHERE title='Art Expo'),      'No'),
((SELECT id FROM public.users WHERE email='riya@example.com'),   (SELECT id FROM public.events WHERE title='AI Workshop'),   'Yes'),
((SELECT id FROM public.users WHERE email='riya@example.com'),   (SELECT id FROM public.events WHERE title='Startup Pitch'), 'Maybe'),
((SELECT id FROM public.users WHERE email='vikram@example.com'), (SELECT id FROM public.events WHERE title='Startup Pitch'), 'Yes'),
((SELECT id FROM public.users WHERE email='vikram@example.com'), (SELECT id FROM public.events WHERE title='Music Fest'),    'No'),
((SELECT id FROM public.users WHERE email='neha@example.com'),   (SELECT id FROM public.events WHERE title='Art Expo'),      'Maybe'),
((SELECT id FROM public.users WHERE email='neha@example.com'),   (SELECT id FROM public.events WHERE title='AI Workshop'),   'No'),
((SELECT id FROM public.users WHERE email='amit@example.com'),   (SELECT id FROM public.events WHERE title='Tech Meetup'),   'Yes'),
((SELECT id FROM public.users WHERE email='amit@example.com'),   (SELECT id FROM public.events WHERE title='Art Expo'),      'Yes');
