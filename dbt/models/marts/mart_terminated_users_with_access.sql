select
    u.user_id,
    u.full_name,
    u.email,
    u.department,
    u.termination_date,
    datediff('day', u.termination_date, current_date()) as days_since_termination,
    a.app_name,
    a.criticality,
    aa.role_name
from {{ ref('stg_iam__users') }} as u
join {{ ref('stg_iam__access_assignments') }} as aa
    on u.user_id = aa.user_id
join {{ ref('stg_iam__applications') }} as a
    on aa.app_id = a.app_id
where u.employment_status = 'TERMINATED'