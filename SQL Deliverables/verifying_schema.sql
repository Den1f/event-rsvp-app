-- Quick verification queries

-- Counts
SELECT 'users' AS table, COUNT(*) AS rows FROM public.users
UNION ALL
SELECT 'events', COUNT(*) FROM public.events
UNION ALL
SELECT 'rsvps', COUNT(*) FROM public.rsvps;

-- Upcoming events list
SELECT e.title, e.date, e.city, u.name AS created_by
FROM public.events e
JOIN public.users u ON u.id = e.created_by
ORDER BY e.date;

-- RSVP breakdown per event
SELECT e.title,
       SUM(CASE WHEN r.status='Yes' THEN 1 ELSE 0 END) AS yes_count,
       SUM(CASE WHEN r.status='No' THEN 1 ELSE 0 END) AS no_count,
       SUM(CASE WHEN r.status='Maybe' THEN 1 ELSE 0 END) AS maybe_count
FROM public.events e
LEFT JOIN public.rsvps r ON r.event_id = e.id
GROUP BY e.title
ORDER BY e.title;

-- Demonstrate referential integrity (CASCADE) --
-- Try deleting a user and see their RSVPs disappear.
-- BEGIN;
-- DELETE FROM public.users WHERE email='riya@example.com';
-- SELECT COUNT(*) AS rsvps_for_riya FROM public.rsvps r
-- WHERE r.user_id NOT IN (SELECT id FROM public.users);
-- ROLLBACK;  -- undo the delete during testing
