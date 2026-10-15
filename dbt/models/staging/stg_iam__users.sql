select
    user_id,
    {{ normalize_email('email')}} as email,
    full_name,
    department,
    employment_status,
    termination_date
from {{ source('raw_iam', 'users') }}