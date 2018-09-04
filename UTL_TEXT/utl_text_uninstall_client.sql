-- Parameters:
-- 1: Owner of UTL_TEXT
-- 2: Remote user UTL_TEXT is granted to

@init_client.sql &1. &2.

prompt &h1.Revoking access to UTL_TEXT from &REMOTE_USER.

alter session set current_schema=&INSTALL_USER.;
prompt &h3.Revoke user rights
prompt &s1.Revoke execute on UTL_TEXT
revoke execute on &INSTALL_USER..UTL_TEXT from &REMOTE_USER.;


alter session set current_schema=&REMOTE_USER.;
prompt &h3.Drop synonyms
prompt &s1.Drop synonym for UTL_TEXT
drop synonym UTL_TEXT;

prompt &h1.UTL_TEXT revoked from &REMOTE_USER.

exit
