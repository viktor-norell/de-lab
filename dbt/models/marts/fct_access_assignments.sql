{{ config(materialized='incremental', unique_key='assignment_id') }}

select     
    assignment_id,
    user_id,
    app_id,
    role_name,
    granted_at
from {{ ref('stg_iam__access_assignments') }}

{% if is_incremental() %}
where granted_at > (select max(granted_at) from {{ this }})
{% endif %}