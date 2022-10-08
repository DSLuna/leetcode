-- https://leetcode.com/problems/trips-and-users  [Hard]
-- output  Day  | Cancellation Rate
-- cancellation rate =  # of cancelled requests / total # of requests with unbanned users on the day 


-- 1. all requests by unbanned users
WITH unbanned_customers(client_id, status, request_at )
AS 
(
    SELECT client_id, status, request_at
    FROM Trips t
    -- not banned clients
    INNER JOIN Users u on t.client_id = u.users_id and u.banned = 'No'
    -- not banned drivers
    INNER JOIN Users d on t.driver_id = d.users_id and d.banned = 'No'
    WHERE t.request_at between '2013-10-01' and '2013-10-03'
)
-- 2.  count status either ('cancelled_by_driver', 'cancelled_by_client')

SELECT request_at Day,  
round( 1.0 * sum(case when status in  ('cancelled_by_driver', 'cancelled_by_client') then 1 else 0 end) / count(status),2)  'Cancellation Rate'
FROM unbanned_customers
group by request_at



/*Success
Details 
Runtime: 417 ms, faster than 93.62% of MS SQL Server online submissions for Trips and Users.
Memory Usage: 0B, less than 100.00% of MS SQL Server online submissions for Trips and Users.*/