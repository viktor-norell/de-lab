select
    app_id,
    app_name,
    criticality
from {{ source('raw_iam', 'applications') }}