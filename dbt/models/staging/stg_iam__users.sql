select
    user_id,
    lower(email) as email,
    full_name,
    department,
    employment_status,
    termination_date
from {{ source('raw_iam', 'users') }}