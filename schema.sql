create table settings (key text primary key, value text);
create table applications (
  id bigint generated always as identity primary key,
  created_at timestamptz default now(),
  student_name text, age int, parent_name text, email text, phone text,
  country text, course text, timing text, notes text,
  status text default 'pending'
);
alter table settings enable row level security;
alter table applications enable row level security;
create policy "read settings" on settings for select using (true);
create policy "admin write settings" on settings for all to authenticated using (true) with check (true);
create policy "anyone apply" on applications for insert to anon, authenticated with check (true);
create policy "admin manage apps" on applications for all to authenticated using (true) with check (true);
