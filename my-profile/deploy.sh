#!/bin/bash

# Vercel Deployment Helper Script
# This script helps you prepare and deploy to Vercel

echo "🚀 Vercel Deployment Helper"
echo "=========================="
echo ""

# Check if .env files exist
if [ ! -f ".env" ]; then
    echo "❌ Error: .env file not found in root directory"
    echo "   Please copy .env.example to .env and fill in your Supabase credentials"
    exit 1
fi

if [ ! -f "frontend/.env" ]; then
    echo "❌ Error: frontend/.env file not found"
    echo "   Please copy frontend/.env.example to frontend/.env and fill in your credentials"
    exit 1
fi

if [ ! -f "backend/.env" ]; then
    echo "❌ Error: backend/.env file not found"
    echo "   Please copy backend/.env.example to backend/.env and fill in your credentials"
    exit 1
fi

echo "✅ All .env files found"
echo ""

# Read environment variables
source .env

# Check if Supabase credentials are set
if [ -z "$VITE_SUPABASE_URL" ] || [ "$VITE_SUPABASE_URL" = "https://your-project-id.supabase.co" ]; then
    echo "❌ Error: VITE_SUPABASE_URL not properly configured"
    echo "   Please update your .env file with actual Supabase credentials"
    exit 1
fi

if [ -z "$VITE_SUPABASE_ANON_KEY" ] || [ "$VITE_SUPABASE_ANON_KEY" = "your-anon-key-here" ]; then
    echo "❌ Error: VITE_SUPABASE_ANON_KEY not properly configured"
    echo "   Please update your .env file with actual Supabase credentials"
    exit 1
fi

echo "✅ Supabase credentials configured"
echo ""

# Install Vercel CLI if not installed
if ! command -v vercel &> /dev/null; then
    echo "📦 Vercel CLI not found. Installing..."
    npm install -g vercel
fi

echo "🔧 Preparing for deployment..."
echo ""

# Show instructions
echo "📝 Deployment Instructions:"
echo ""
echo "1. Run: vercel"
echo "   (This will link your project and deploy to preview)"
echo ""
echo "2. Set environment variables in Vercel:"
echo "   vercel env add VITE_SUPABASE_URL"
echo "   vercel env add VITE_SUPABASE_ANON_KEY"
echo ""
echo "   Or set them in Vercel Dashboard:"
echo "   https://vercel.com/dashboard -> Your Project -> Settings -> Environment Variables"
echo ""
echo "3. Deploy to production:"
echo "   vercel --prod"
echo ""
echo "Your Environment Variables:"
echo "VITE_SUPABASE_URL=$VITE_SUPABASE_URL"
echo "VITE_SUPABASE_ANON_KEY=${VITE_SUPABASE_ANON_KEY:0:20}..."
echo ""
echo "=========================="
echo "Ready to deploy! 🎉"
echo ""
echo "Run 'vercel' to start deployment"
