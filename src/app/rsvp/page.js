"use client";

import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabaseClient";

export default function RSVPPage() {
  const [events, setEvents] = useState([]);
  const [selectedEvent, setSelectedEvent] = useState("");
  const [status, setStatus] = useState("Yes");
  const [message, setMessage] = useState("");
  const [selectedResponse, setSelectedResponse] = useState("");

  // Fetch events on page load
  useEffect(() => {
    const fetchEvents = async () => {
      const { data, error } = await supabase.from("events").select("id, title");
      if (error) {
        console.error("Error fetching events:", error);
      } else {
        setEvents(data);
      }
    };
    fetchEvents();
  }, []);

  // Handle RSVP submit
  const handleSubmit = async (e) => {
    e.preventDefault();

    const { error } = await supabase.from("rsvps").insert([
      {
        event_id: selectedEvent,
        user_id: "014c0b82-b0b1-439c-a37d-debd2a902af5", // replace with dynamic user later
        status: selectedResponse,
      },
    ]);

    if (error) {
      console.error(error);
      setMessage("❌ Error submitting RSVP.");
    } else {
      setMessage("✅ RSVP submitted successfully!");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-purple-100 via-white to-purple-50">
      <div className="w-full max-w-md p-8 bg-white rounded-2xl shadow-lg">
        <h1 className="text-2xl font-semibold text-center text-purple-700 mb-6">
          RSVP for Event
        </h1>
        <form onSubmit={handleSubmit} className="space-y-4">
          {/* Event Dropdown */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Select Event
            </label>
            <select
              value={selectedEvent}
              onChange={(e) => setSelectedEvent(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-purple-400">
              <option value="">-- Choose an event --</option>
              {events.map((event) => (
                <option key={event.id} value={event.id}>
                  {event.title}
                </option>
              ))}
            </select>
          </div>

          {/* RSVP Status */}
          <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Your Response
            </label>
            <select
              value={status}
              onChange={(e) => setSelectedResponse(e.target.value)}
              className="w-full border border-gray-300 rounded-lg px-3 py-2 text-gray-800 focus:outline-none focus:ring-2 focus:ring-purple-400">
              <option value="Yes">Yes</option>
              <option value="No">No</option>
              <option value="Maybe">Maybe</option>
            </select>
          </div>

          {/* Submit Button */}
          <button
            type="submit"
            className="w-full bg-purple-600 text-white py-2 rounded-lg hover:bg-purple-700 transition">
            Submit RSVP
          </button>
        </form>

        {message && (
          <p className="mt-4 text-center text-sm text-gray-600">{message}</p>
        )}
      </div>
    </div>
  );
}
