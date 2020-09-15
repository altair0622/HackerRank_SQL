select A.start_date, min(B.end_date)
from 
(select start_date 
from projects 
where start_date not in (select end_date from projects)) A,

(select end_date 
from projects 
where end_date not in (select start_date from projects)) B

where A.start_date < B.end_date
group by A.start_date
order by datediff(A.start_date, min(B.end_date)) desc, A.start_date
