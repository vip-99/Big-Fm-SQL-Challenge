create database big_fm;
use big_fm;

                            
                            
                            
Questions
1)Retrieve all stations in the "East" region?
SELECT stationid,stationname AS Stations,location 
FROM stations 
WHERE location='east';





2)List all shows hosted by "Vrajesh Hirjee"?
SELECT h.hostid,s.showname AS shows,h.hostname 
FROM Hosts h 
LEFT JOIN Shows s
ON h.hostid=s.hostid
WHERE h.hostname='Vrajesh Hirjee';




3)Count the number of awards each show has won?
SELECT s.showid,s.showname,COUNT(a.awardid) AS num_of_awards
FROM awards a 
JOIN shows s
ON a.showid=s.showid
GROUP BY s.showname,s.showid;

4)Find shows that have partnerships with "Spotify"?
SELECT s.showname as shows,p.partnername 
FROM partnerships p JOIN showpartnerships sp
ON p.partnershipid=sp.partnershipid
JOIN shows s ON sp.showid=s.showid
WHERE p.partnername='Spotify';


5)Retrieve hosts who joined before 2010?
SELECT hostid,hostname AS host,joindate 
FROM hosts
WHERE YEAR(joindate)<2010;




6)List the shows and their launch dates in descending order of launch date?
SELECT showid,showname AS shows,launchdate 
FROM shows
ORDER BY launchdate DESC;



7)Find the total count of shows for each host?
SELECT hostname AS host,SUM(showcount) AS total_show_count 
FROM hosts
GROUP BY hostname
ORDER BY total_show_count DESC;



8)Show the online presence platforms with their links?
SELECT platformname,link FROM onlinepresence;



9)Retrieve the stations in the "South" region launched after 2010?
SELECT st.stationname,st.location,sh.launchdate 
FROM stations st 
JOIN shows sh
ON st.stationid=sh.stationid
WHERE st.location='south' AND YEAR(sh.launchdate)>2010;



10)Rank hosts based on the number of shows they have hosted?
SELECT hostname ,showcount,
DENSE_RANK() OVER(ORDER BY showcount DESC) AS host_ranks
FROM hosts;


