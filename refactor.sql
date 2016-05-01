alter table authors
  rename column author to person_id;
alter table authors
  rename column book to book_id;
alter table authors
  drop column id;

alter table people
  rename to persons;

alter table translations
  rename column translation to translation_id;
alter table translations
  rename column person to person_id;

alter table volumes
  rename column series to series_id;
alter table translations
  rename column book to book_id;


drop table auth_group;
drop table auth_group_permissions;
drop table auth_message;
drop table auth_permission;
drop table auth_user_groups;
drop table auth_user_permissions;
drop table django_admin_log;
drop table django_content_type;
drop table django_session;
drop table django_site;
drop table tg_group;
drop table tg_group_permission;
drop table tg_user;
drop table tg_user_group;
