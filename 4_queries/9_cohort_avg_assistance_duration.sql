SELECT avg(total_duration) AS average_total_duration
FROM (
SELECT cohorts.name AS name, SUM(assistance_requests.completed_at - assistance_requests.started_at) AS total_duration
  FROM assistance_requests
  JOIN students ON assistance_requests.student_id = students.id
  JOIN cohorts ON cohorts.id = students.cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;