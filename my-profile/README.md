# Profile Guestbook App

A full-stack guestbook application using React (Vite), NestJS, and Supabase.

## Setup

1. Copy `.env.example` to `.env` and fill in your Supabase credentials
2. Run `npm install` in root, backend, and frontend directories
3. Run `npm run dev` in backend and frontend directories

## Deployment

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed deployment instructions.

## Environment Variables

Required environment variables (see `.env.example`):
- `VITE_SUPABASE_URL` - Your Supabase project URL
- `VITE_SUPABASE_ANON_KEY` - Your Supabase anon key

## Project Structure

- `/backend` - NestJS API
- `/frontend` - React frontend
- `vercel.json` - Vercel deployment configuration
- `supabase_schema.sql` - Database schema

## Local Development

**Backend:**
```bash
cd backend
npm install
npm run start:dev
```

**Frontend:**
```bash
cd frontend
npm install
npm run dev
```

Visit http://localhost:5173 to view the app.
