# Guestbook Application - Deployment Guide

This is a full-stack guestbook application built with React (Vite) frontend and NestJS backend, using Supabase as the database.

## 🚀 Quick Start

### Prerequisites
- Node.js 20.x or higher
- Supabase account
- Vercel account (for deployment)

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd my-profile
   ```

2. **Set up Supabase Database**
   - Go to [Supabase](https://supabase.com) and create a new project
   - Go to the SQL Editor and run the contents of `supabase_schema.sql`
   - Copy your project URL and anon key from Settings > API

3. **Configure Environment Variables**
   
   Update the `.env` files in the project root, frontend, and backend directories:
   
   **Root `.env`:**
   ```env
   VITE_SUPABASE_URL=https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```
   
   **Frontend `.env`:**
   ```env
   VITE_SUPABASE_URL=https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```
   
   **Backend `.env`:**
   ```env
   VITE_SUPABASE_URL=https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY=your-anon-key-here
   ```

4. **Install Dependencies and Run Locally**
   
   ```bash
   # Install root dependencies
   npm install
   
   # Install backend dependencies
   cd backend
   npm install
   
   # In one terminal, run the backend
   npm run start:dev
   
   # In another terminal, run the frontend
   cd ../frontend
   npm install
   npm run dev
   ```

5. **Access the Application**
   - Frontend: http://localhost:5173
   - Backend API: http://localhost:3000/api

## 🌐 Deploying to Vercel

### Step 1: Prepare Your Repository
Ensure all your changes are committed and pushed to GitHub.

### Step 2: Import Project to Vercel
1. Go to [Vercel](https://vercel.com)
2. Click "Add New Project"
3. Import your GitHub repository
4. Vercel will auto-detect the configuration from `vercel.json`

### Step 3: Configure Environment Variables on Vercel
In your Vercel project settings, add the following environment variables:

1. Go to your project settings
2. Navigate to "Environment Variables"
3. Add the following variables:

   ```
   VITE_SUPABASE_URL = https://your-project-id.supabase.co
   VITE_SUPABASE_ANON_KEY = your-anon-key-here
   ```

   Make sure to add these for **Production**, **Preview**, and **Development** environments.

### Step 4: Deploy
1. Click "Deploy"
2. Vercel will build and deploy your application
3. Your app will be available at `https://your-project-name.vercel.app`

### Step 5: Update CORS (if needed)
If you encounter CORS issues, update the backend CORS configuration in:
- `backend/api/index.ts` - Add your Vercel domain to the `origin` array
- `backend/src/main.ts` - Add your Vercel domain (for local development)

## 📁 Project Structure

```
my-profile/
├── backend/               # NestJS backend
│   ├── api/
│   │   └── index.ts      # Vercel serverless function entry
│   ├── src/
│   │   ├── main.ts       # Local development entry
│   │   ├── app.module.ts
│   │   ├── guestbook.controller.ts
│   │   └── guestbook.service.ts
│   └── package.json
├── frontend/             # React + Vite frontend
│   ├── src/
│   │   ├── App.jsx
│   │   ├── supabaseClient.js
│   │   └── main.jsx
│   └── package.json
├── vercel.json          # Vercel configuration
├── supabase_schema.sql  # Database schema
└── .env                 # Environment variables (gitignored)
```

## 🔑 Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `VITE_SUPABASE_URL` | Your Supabase project URL | Yes |
| `VITE_SUPABASE_ANON_KEY` | Your Supabase anonymous key | Yes |

## 🛠️ Available Scripts

### Root
- `npm run build` - Build both frontend and backend for production

### Backend
- `npm run start:dev` - Start backend in development mode (port 3000)
- `npm run build` - Build backend for production
- `npm run start:prod` - Start backend in production mode

### Frontend
- `npm run dev` - Start frontend in development mode (port 5173)
- `npm run build` - Build frontend for production
- `npm run preview` - Preview production build

## 🐛 Troubleshooting

### Issue: "Failed to fetch entries"
- Verify your Supabase credentials in `.env` files
- Ensure the `guestbook` table exists in your Supabase database
- Check that RLS policies are set correctly

### Issue: CORS errors
- Make sure your Vercel domain is added to the CORS configuration
- Check that credentials are set to `true` in CORS settings

### Issue: Build fails on Vercel
- Check the build logs in Vercel dashboard
- Ensure all environment variables are set correctly
- Verify that `vercel.json` configuration is correct

### Issue: API routes not working
- Ensure the API path in `vercel.json` routes configuration is correct
- Check that the backend `api/index.ts` is properly configured
- Verify the frontend is calling the correct API endpoints

## 📝 API Endpoints

- `GET /api/guestbook` - Get all guestbook entries
- `POST /api/guestbook` - Create a new guestbook entry
- `PUT /api/guestbook/:id` - Update an existing entry
- `DELETE /api/guestbook/:id` - Delete an entry
- `GET /api/guestbook/hello` - Test endpoint

## 📄 License

This project is open source and available under the MIT License.

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

---

**Happy Coding! 🎉**
