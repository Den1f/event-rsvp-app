"use client";
import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabaseClient";

export default function EventsPage() {
  const [events, setEvents] = useState([]);

  useEffect(() => {
    const fetchEvents = async () => {
      let { data, error } = await supabase.from("events").select("*");
      if (error) console.error(error);
      else setEvents(data);
    };
    fetchEvents();
  }, []);

  return (
    <main className="min-h-screen bg-gradient-to-br from-purple-100 via-purple-200 to-slate-200 text-gray-800 p-8">
      <div className="max-w-3xl mx-auto">
        <h1 className="text-3xl font-bold text-purple-700 mb-6 text-center">
          Upcoming Events
        </h1>

        {events.length === 0 ? (
          <p className="text-center text-gray-600">No events found.</p>
        ) : (
          <ul className="space-y-4">
            {events.map((event) => (
              <li
                key={event.id}
                className="p-5 bg-white rounded-xl shadow border border-purple-100 hover:shadow-md transition">
                <h2 className="text-xl font-semibold text-purple-700">
                  {event.name}
                </h2>
                <p className="text-gray-600 text-sm">{event.date}</p>
                <p className="text-gray-700 mt-2">{event.description}</p>
              </li>
            ))}
          </ul>
        )}
      </div>
    </main>
  );
}
