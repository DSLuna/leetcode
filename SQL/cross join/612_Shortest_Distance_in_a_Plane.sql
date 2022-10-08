-- https://leetcode.com/problems/shortest-distance-in-a-plane/description/. [Medium]
/* Table: Point2D

+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
+-------------+------+
(x, y) is the primary key column for this table.
Each row of this table indicates the position of a point on the X-Y plane.
 

The distance between two points p1(x1, y1) and p2(x2, y2) is sqrt((x2 - x1)2 + (y2 - y1)2).

Write an SQL query to report the shortest distance between any two points from the Point2D table. Round the distance to two decimal points.

*/ 

-- calculate the distance between two points, then find the min

SELECT min(d) as shortest
FROM (SELECT round(sqrt(square(p2.x - p1.x) + square(p2.y - p1.y)),2) as d
        FROM Point2D p1
        CROSS JOIN Point2D p2
        WHERE not (p1.x = p2.x and p1.y = p2.y)) t


-- Runtime 658ms Beats 40%