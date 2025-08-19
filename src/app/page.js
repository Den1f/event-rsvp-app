export default function Home() {
  return (
    <main className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-br from-purple-100 via-purple-200 to-slate-200 text-gray-800">
      <div className="text-center max-w-xl px-6">
        <h1 className="text-4xl font-bold mb-4 text-purple-700">EventHub</h1>
        <p className="text-base mb-8 text-gray-600">
          A simple way to explore upcoming events and RSVP with ease.
        </p>

        <div className="flex justify-center gap-4">
          <a
            href="/events"
            className="px-5 py-2 rounded-xl bg-purple-600 text-white font-medium shadow hover:bg-purple-700 transition">
            View Events
          </a>
          <a
            href="/rsvp"
            className="px-5 py-2 rounded-xl bg-white text-purple-700 border border-purple-300 font-medium shadow hover:bg-purple-50 transition">
            RSVP Now
          </a>
        </div>
      </div>
    </main>
  );
}
