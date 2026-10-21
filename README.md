# Notion Alternative v2.1 — Liquid Glass

## Update via Android / iPhone
1. Export JSON backup from Settings in the current application.
2. Extract the ZIP, then upload the 8 files to the ROOT of the existing GitHub repository using Add file → Upload files.
3. Commit directly to main. Do not create a new Supabase project or run supabase.sql again.
4. Wait for GitHub Pages deployment, close the standalone PWA completely, then reopen. If an older version persists, visit the site in Safari, refresh, and reopen the Home Screen shortcut.

## Changes
- Sidebar removed; bottom dock available globally. Pages remain accessible in Home and Search.
- Glass accent, blur and opacity sliders in Settings.
- Bouncy button feedback, respecting reduced-motion preferences.
- iOS standalone top safe area and dark overscroll canvas.
- Existing local data keys and Supabase schema preserved.

Note: Do not put a Supabase secret/service_role key into the app. Only use publishable/anon keys.
