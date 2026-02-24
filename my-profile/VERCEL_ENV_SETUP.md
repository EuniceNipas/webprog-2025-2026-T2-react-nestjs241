# Vercel Environment Variables Setup

## Required Environment Variables

Add these in your Vercel project settings:
**Settings → Environment Variables**

### Variables to Add:

1. **VITE_SUPABASE_URL**
   - Value: `https://natekawjtezgjijlkckp.supabase.co`
   - Available for: Production, Preview, Development

2. **VITE_SUPABASE_ANON_KEY**
   - Value: `sb_publishable_qEkttLUihKSAIBmNfvVL_g_WkwjxBD5`
   - Available for: Production, Preview, Development

## How to Add in Vercel Dashboard

1. Go to your project on Vercel
2. Click on "Settings"
3. Click on "Environment Variables"
4. Add each variable:
   - Name: `VITE_SUPABASE_URL`
   - Value: (paste your Supabase URL)
   - Select: Production, Preview, Development
   - Click "Save"
5. Repeat for `VITE_SUPABASE_ANON_KEY`

## Or Use Vercel CLI

```bash
# Add environment variables via CLI
vercel env add VITE_SUPABASE_URL production
# Paste: https://natekawjtezgjijlkckp.supabase.co

vercel env add VITE_SUPABASE_ANON_KEY production
# Paste: sb_publishable_qEkttLUihKSAIBmNfvVL_g_WkwjxBD5
```

## After Adding Variables

Redeploy your project for the changes to take effect:
```bash
vercel --prod
```

---

**Note:** These credentials are already set in your local `.env` files for development.
