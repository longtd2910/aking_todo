-- Add 50 dummy users
INSERT INTO User (email, name, avatar)
SELECT 'user' || CAST(ROW_NUMBER() OVER() AS TEXT), 'User ' || CAST(ROW_NUMBER() OVER() AS TEXT), '#' || substr(md5(random()), 1, 6)
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy projects
INSERT INTO Project (title, color, is_default)
SELECT 'Project ' || CAST(ROW_NUMBER() OVER() AS TEXT), '#' || substr(sha1(random()), 1, 6), CAST(ROW_NUMBER() OVER() AS INTEGER) % 2
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy tasks (linked to random projects)
INSERT INTO Task (title, description, due_date, project_id)
SELECT 'Task ' || CAST(ROW_NUMBER() OVER() AS TEXT), 'Task description ' || CAST(ROW_NUMBER() OVER() AS TEXT), datetime('now', 'localtime', '+' || CAST((ROW_NUMBER() OVER() % 30) AS TEXT) || ' days'), (SELECT id FROM Project ORDER BY RANDOM() LIMIT 1)
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy notes (linked to random projects)
INSERT INTO Note (description, color, project_id)
SELECT 'Note description ' || CAST(ROW_NUMBER() OVER() AS TEXT), '#' || substr(sha1(random()), 1, 6), (SELECT id FROM Project ORDER BY RANDOM() LIMIT 1)
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy checklists (linked to random projects)
INSERT INTO CheckList (title, description, color, project_id)
SELECT 'CheckList ' || CAST(ROW_NUMBER() OVER() AS TEXT), 'CheckList description ' || CAST(ROW_NUMBER() OVER() AS TEXT), '#' || substr(sha1(random()), 1, 6), (SELECT id FROM Project ORDER BY RANDOM() LIMIT 1)
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy checklist items (linked to random checklists)
INSERT INTO CheckListItem (check_list_id, title, is_done, index)
SELECT (SELECT id FROM CheckList ORDER BY RANDOM() LIMIT 1), 'CheckListItem ' || CAST(ROW_NUMBER() OVER() AS TEXT), 0, CAST(ROW_NUMBER() OVER() AS INTEGER)
FROM sqlite_master
LIMIT 50;

-- Add 50 dummy task comments (linked to random tasks and users)
INSERT INTO TaskComment (task_id, user_id, comment, date)
SELECT (SELECT id FROM Task ORDER BY RANDOM() LIMIT 1), (SELECT id FROM User ORDER BY RANDOM() LIMIT 1), 'Task comment ' || CAST(ROW_NUMBER() OVER() AS TEXT), datetime('now', 'localtime', '-' || CAST((ROW_NUMBER() OVER() % 10) AS TEXT) || ' hours')
FROM sqlite_master
LIMIT 50;
