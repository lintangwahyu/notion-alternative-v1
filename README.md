# Notion Alternative v2.0 — Liquid Glass Edition

## Upgrade from v1 without deleting your data

1. **Back up first:** in the running v1 app, open Settings → Export JSON. Keep this file safe.
2. In your existing GitHub repository `notion-alternative-v1`, upload the **replacement** `index.html`, `app.js`, `style.css`, `sw.js`, `manifest.webmanifest`, `icon.svg` and `README.md` from this package to the **repository root**. Choose overwrite/commit when prompted. Do not upload the enclosing folder.
3. Keep your existing Supabase project and tables. **Do not rerun supabase.sql.** No database migration is needed.
4. GitHub Pages will redeploy automatically. Wait for Actions → pages build and deployment to finish. Reopen the URL, then reload once. If the old UI remains, close the PWA and reopen it; service worker cache changes with v2.
5. Settings: confirm your Project URL, publishable key, and login. If settings were lost because of a different browser/site storage, enter the same Supabase credentials again.
6. Test editing a page on Android and opening it on iPhone; when both apps are online and foregrounded, sync runs periodically (12 seconds) and on focus/return online. The app does not provide background push synchronization when closed.

## Features and limitations
- Responsive Liquid Glass-inspired UI, mobile bottom navigation, light/dark/system theme.
- Local-first pages, editable database, calendar, search, JSON backup, CSV export, Supabase email authentication.
- Cloud sync retains the v1 table schema and uses periodic foreground polling; **not** instant collaborative editing. Simultaneous edits to the same item can overwrite one another. Keep backups.
- Offline changes are kept in browser localStorage; clearing site data can erase unsynced changes.
- Works over HTTPS on Safari iOS 16 and Chrome Android. Glass blur is progressively enhanced; may vary by device.
- For safer public deployment, Supabase Row Level Security must remain enabled with per-user policies.


## v2.0.1 bug fixes
- Sidebar backdrop catches taps outside drawer and closes it without click-through; Escape closes drawer.
- iOS standalone PWA header respects status-bar safe-area, including iPhone X notch.
- Updated service worker cache version. No Supabase schema changes.
- Replace files in the existing GitHub repository; do not rerun SQL. Backup JSON before updating.


## v2.0.2 fixes
- iOS Home Screen PWA: separate top safe clearance (54px fallback) without shifting Android.
- Drawer backdrop moved outside #app to avoid stacking-context hit testing issues in Safari; click and touchend close it.
- Versioned JS/CSS URLs and service-worker cache name updated.
- No database migrations needed.
