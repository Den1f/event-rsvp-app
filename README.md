# 🎉 Event RSVP App  

A simple **Next.js + Supabase** app where users can RSVP to events.  
Deployed on **Vercel** 🚀  

---

## 📦 Features  
- View upcoming events  
- Submit RSVP (Yes / No / Maybe)  
- Data stored securely in Supabase  
- Clean UI with Tailwind CSS  

---

## ⚡️ Setup  

### 1️⃣ Clone Repo  
```bash
git clone https://github.com/your-username/event-rsvp-app.git
cd event-rsvp-app
```

### 2️⃣ Install Dependencies  
```bash
npm install
```

### 3️⃣ Configure Supabase  
1. Create a free [Supabase](https://supabase.com) project.  
2. Create the following tables:  

#### `events` table  
| Column     | Type       | Notes           |  
|------------|-----------|-----------------|  
| id         | uuid      | Primary Key     |  
| name       | text      | Event name      |  
| created_at | timestamptz | Default `now()` |  

#### `rsvp` table  
| Column     | Type       | Notes                      |  
|------------|-----------|----------------------------|  
| id         | uuid      | Primary Key                |  
| user_id    | uuid      | FK → users table           |  
| event_id   | uuid      | FK → events table          |  
| status     | text      | ('yes', 'no', 'maybe')     |  
| created_at | timestamptz | Default `now()`           |  

3. Add your Supabase credentials in `.env.local`:  
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
```

---

### 4️⃣ Run Locally  
```bash
npm run dev
```
Your app will be live at 👉 [http://localhost:3000](http://localhost:3000)  

---

## 🚀 Deployment  
1. Push your project to GitHub.  
2. Go to [Vercel](https://vercel.com) → **New Project → Import Repo**.  
3. Add environment variables from `.env.local`.  
4. Deploy ✅  

---

## 📂 Project Structure  
```
event-rsvp-app/
├── src/app/
│   ├── page.js       # Homepage
│   ├── rsvp/page.js  # RSVP Form
│   └── layout.js     # Root Layout
├── public/           # Static assets
├── styles/           # Tailwind styles
├── .env.local        # Supabase keys (not committed)
├── README.md         # Project docs
```

---

## 📸 Screenshots  
(Add screenshots of the homepage & RSVP form here 📷)  

---

## 👨‍💻 Author  
Built by **Your Name** 🚀  
