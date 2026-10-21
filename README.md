# Notion Alternative v1 — Mobile-only PWA

## Features
- Mobile-first Notion-inspired UI, light/dark mode
- Pages with editable text lines (not a full Notion rich-text editor)
- Database table: name, status, date, notes; CSV export
- Calendar: monthly view, create tasks on a day
- Search across pages and tasks
- Local-first edits and offline PWA cache
- Supabase email/password login and sync with polling (about 25 seconds while app is open)
- JSON backup/import

## Deploy with only an iPhone or Android

1. Create a free Supabase project at https://supabase.com/dashboard in your phone browser.
2. Open **SQL Editor**, create a query, paste the entire `supabase.sql`, then run it. This sets up tables and user-specific Row Level Security (RLS).
3. Under **Project Settings → API** (names may vary), copy **Project URL** and **publishable key** (`sb_publishable_...`) or legacy `anon` key. NEVER use `service_role` or secret keys in the app.
4. Create a free GitHub account/repository from your phone browser, upload the contents of this ZIP to the repository root (extract the ZIP first with Files on iOS or a file manager on Android).
5. In GitHub **Settings → Pages**, select **Deploy from a branch**, branch `main`, folder `/ (root)`, and save. Wait for the published `https://USERNAME.github.io/REPOSITORY/` URL. GitHub Pages provides HTTPS, required for PWA service workers.
6. Open the published URL on your phone. Go to **Settings** inside the app, paste Project URL and publishable/anon key, enter email/password and tap **Sign up**. If email confirmation is enabled in Supabase, open the confirmation email and then **Sign in**.
7. On iPhone (Safari), Share → **Add to Home Screen**. On Android (Chrome), menu → **Install app** or **Add to Home screen**.
8. Repeat step 7 on your other phone and sign in with the same account and project credentials. Tap **Sync now** to verify.

## Important limitations
- This is a usable MVP, not a feature-complete Notion clone: text editor is plain-text lines; there are no nested pages, advanced database views, attachments, rich-text marks, or shared workspaces.
- Offline cache activates after the first successful online visit. Content is stored in browser localStorage. Avoid clearing site data; export backups regularly.
- Synchronization requires the app to be open and online. Browsers do not guarantee background sync when closed.
- Concurrent edits are resolved by timestamp (last write wins), not real-time collaborative merging. Device clock skew can affect ordering.
- Before your first sign-in, locally created pages are associated with the account used at first sync. Avoid sharing a browser profile between multiple users.
- Supabase configuration is stored in localStorage per browser/device. Password is not stored by this app, but the Supabase session token is stored locally.
- HTTPS required for service worker and secure use. Test sync with two devices before relying on it for important data.
- This is a personal MVP and has not undergone an independent security audit.

## Files
- `index.html` — app shell
- `style.css` — responsive Notion-inspired styling
- `app.js` — UI, local storage, authentication, REST sync
- `sw.js` — offline cache
- `manifest.webmanifest`, `icon.svg` — installable PWA
- `supabase.sql` — tables, indexes and RLS
