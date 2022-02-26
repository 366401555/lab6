SELECT S.sname,COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE P.pid = C.pid AND S.sid = C.sid
GROUP BY S.sname, S.sid;

SELECT S.sname,COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE P.pid = C.pid AND S.sid = C.sid
GROUP BY S.sid
HAVING COUNT(*) > 2;

SELECT S.sname, COUNT(*)
FROM suppliers S, parts P, catalog C
WHERE P.pid = C.pid AND C.sid = S.sid
GROUP BY S.sname, S.sid
HAVING EVERY (P.color = 'Green');

SELECT S.sname, MAX(C.cost)
FROM suppliers S, parts P, catalog C
WHERE P.pid = C.pid AND S.sid = C.sid AND S.sid IN
(SELECT S.sid
 FROM suppliers S, parts P, catalog C
 WHERE P.pid = C.pid AND S.sid = C.sid AND P.color = 'Green'
 INTERSECT
 SELECT S.sid
 FROM suppliers S, parts P, catalog C
 WHERE P.pid = C.pid AND S.sid = C.sid AND P.color = 'Red'
)GROUP BY S.sname,S.sid;
