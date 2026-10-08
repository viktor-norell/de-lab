select
    assignment_id,
    user_id,
    app_id,
    role_name,
    granted_at
from {{ source('raw_iam', 'access_assignments') }}