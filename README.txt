# TechZone Online Result Portal

## Included files
- `index.html` — responsive student result search + centered admin panel + A4 result card.
- `worker.js` — Cloudflare Worker API, admin login, exact-detail result lookup, student/course management, JSON backup/restore.
- `schema.sql` — D1 database tables.
- `wrangler.toml` — Worker + static asset + D1 binding example.

## Cloudflare setup
1. Create a new Cloudflare D1 database (for example `techzone-results`).
2. Open its Console and run the complete contents of `schema.sql`.
3. Create a new Worker project. Upload/paste `worker.js` as the Worker code.
4. Bind the D1 database to the Worker with variable name `DB`.
5. Configure the Worker static assets directory as `./public` (put `index.html` in that folder), or use the dashboard's Static Assets upload workflow. The Worker must serve the HTML and `/api/*` routes from the same origin.
6. Add Worker secrets:
   - `ADMIN_PASSWORD` = choose a strong private admin password.
   - `SESSION_SECRET` = a long random secret (at least 32 random characters).
7. Deploy and open the Worker URL.

`wrangler.toml` is an example configuration. Replace the database name and database ID with your own values.

## Backup and restore
Admin Panel → Database Backup:
- **Download Full Backup** downloads one JSON file containing all student profiles and all course results.
- **Upload Backup File** restores that JSON. Restore replaces the current records, so download a fresh backup before restoring.

## Important
- Student lookup requires exact Student Name, Father Name, Student ID/Access Code, and CNIC. CNIC comparison ignores hyphens and spaces; the other fields are case-insensitive and trim outside spaces.
- The student-facing result displays the latest saved course result for that student. The admin record list shows all saved course results.
- Marks are whole numbers from 0 to 75; percentage is calculated from 75.
- Keep the backup file and admin password private. Do not publish the backup JSON.
- This is a starter deployment package. Configure D1, secrets and static assets before public use. Test with sample records before entering real student data.
