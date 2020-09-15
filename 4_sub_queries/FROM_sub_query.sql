-- SELECT * FROM (
--   SELECT something_id
--   FROM someTable
--   WHERE something
-- ) as sub_table;

SELECT avg(total_students) as average_students 
FROM (
  SELECT count(students) as total_students,
  cohorts.name as cohort_name
  FROM students
  JOIN cohorts ON cohorts.id = cohort_id
  GROUP BY cohorts.name
) as totals_table;