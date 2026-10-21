-- Run in Supabase SQL Editor, in a project you control.
create table if not exists public.pages (
 id uuid primary key, user_id uuid not null references auth.users(id) on delete cascade,
 title text not null default 'Untitled', icon text not null default '📄',
 content text not null default '', updated_at timestamptz not null default now(),
 deleted boolean not null default false
);
create table if not exists public.records (
 id uuid primary key, user_id uuid not null references auth.users(id) on delete cascade,
 name text not null default '', status text not null default 'Not started',
 date date, notes text not null default '', updated_at timestamptz not null default now(),
 deleted boolean not null default false
);
create index if not exists pages_user_id_idx on public.pages(user_id);
create index if not exists records_user_id_idx on public.records(user_id);
alter table public.pages enable row level security;
alter table public.records enable row level security;
drop policy if exists "pages owner" on public.pages;
drop policy if exists "records owner" on public.records;
create policy "pages owner" on public.pages for all to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "records owner" on public.records for all to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
grant select, insert, update, delete on public.pages, public.records to authenticated;
