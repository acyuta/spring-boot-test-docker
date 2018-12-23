-----------------------------
-- CREATE VOTING TABLE
-----------------------------
create sequence
  if not exists voting_seq
  increment by 1;

create table voting
(
  id         bigint primary key default nextval('voting_seq'),
  title      text      not null,
  created_at timestamp not null default CURRENT_TIMESTAMP,
  votes      int       not null default 0,
  last_vote  timestamp
);

alter sequence voting_seq owned by voting.id;

create table answer
(
  id        uuid primary key not null,
  voting_id bigint references voting (id)
    on delete cascade
    on update cascade,
  answer    text             not null
);

create table vote
(
  id        uuid primary key not null,
  voting_id bigint references voting (id)
    on delete cascade
    on update cascade,
  answer_id uuid references answer (id)
    on delete cascade
    on update cascade
);
----------------------
-- create trigger count answers
----------------------

CREATE OR REPLACE FUNCTION count_answers_fun() RETURNS TRIGGER AS
$$
BEGIN
  if (TG_OP = 'INSERT') THEN
    UPDATE voting SET last_vote = NOW(), votes = votes + 1 WHERE id = NEW.voting_id;
    return NEW;
  elseif (TG_OP = 'UPDATE') THEN
    UPDATE voting SET last_vote = NOW() WHERE id = NEW.voting_id;
    return NEW;
  elseif (TG_OP = 'DELETE') THEN
    UPDATE voting SET votes = votes - 1 WHERE id = OLD.voting_id;
    return OLD;
  end if;
  return null;
end;
$$ LANGUAGE plpgsql;


create trigger add_voting_table
  AFTER INSERT OR UPDATE OF answer_id OR DELETE
  ON vote
  FOR EACH ROW
EXECUTE PROCEDURE count_answers_fun();