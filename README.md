# 🎉 Event RSVP App  

A simple **Next.js + Supabase** app where users can RSVP to events.  
Deployed on **Vercel** 

---

## Features  
- View upcoming events  
- Submit RSVP (Yes / No / Maybe)  
- Data stored securely in Supabase  
- Clean UI with Tailwind CSS  

---

## Setup  

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

#### `users` table  
| Column     | Type        | Notes                           |  
|------------|-------------|---------------------------------|  
| id         | uuid        | Primary Key                     |  
| name       | text        | User’s full name                |  
| email      | text        | Unique identifier (login/contact) |  
| created_at | timestamptz | Default `now()`                 |  

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

## Deployment  
1. Push your project to GitHub.  
2. Go to [Vercel](https://vercel.com) → **New Project → Import Repo**.  
3. Add environment variables from `.env.local`.  
4. Deploy ✅ 

---

# Database Documentation

This folder contains all database-related deliverables for the Event RSVP App.

## Files
- **SUPABASE_SETUP.docx** → Documentation of schema, design choices, and setup guide.  
- **ER_diagram.png** → Visual ER diagram for quick reference.  
- **schema.sql** → SQL dump to create the required tables.  
- **sample_data.sql** → Sample insert queries (optional, for testing).  

## Usage
1. Run `schema.sql` in your Supabase SQL editor to create the tables.  
2. (Optional) Run `sample_data.sql` to populate tables with demo records.  
3. Refer to **SUPABASE_SETUP.docx** for screenshots, explanations, and design rationale.  

---

## Screenshots  
### Homepage
![Homepage](./homepage.png)

### Events Page
![Events](./events.png)

### RSVP Form
![RSVP](./rsvp.png) 

---

## Author  
Built by **Deep** 
