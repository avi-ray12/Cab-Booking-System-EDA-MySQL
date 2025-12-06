-- CREATING AND USING DATABASE 'cb'
create database cb;
use cb;

-- Creating Customer table
create table Customers(
	CustomerID INT PRIMARY KEY, 
    Name VARCHAR(100), 
    Email VARCHAR(100), 
    RegistrationDate DATE
);

-- Creating Drivers table
create table Drivers(
	DriverID INT PRIMARY KEY, 
    Name VARCHAR(100), 
    JoinDate DATE
);

-- Creating Cabs table
create table Cabs(
	CabID INT PRIMARY KEY, 
    DriverID INT, 
    VehicleType VARCHAR(20), 
    PlateNumber VARCHAR(20), 
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);

-- Creating Bookings table
create table Bookings(
	BookingID INT PRIMARY KEY, 
    CustomerID INT, 
    CabID INT, 
    BookingDate DATETIME, 
    Status VARCHAR(20), 
    PickupLocation VARCHAR(100), 
    DropoffLocation VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), 
    FOREIGN KEY (CabID) REFERENCES Cabs(CabID)
);

-- Creating TripDetails table
create table TripDetails(
	TripID INT PRIMARY KEY, 
    BookingID INT, 
    StartTime DATETIME, 
    EndTime DATETIME, 
    DistanceKM FLOAT, 
    Fare FLOAT, 
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Creating Feedback table
create table Feedback(
	FeedbackID INT PRIMARY KEY, 
    BookingID INT, 
    Rating FLOAT, 
    Comments TEXT, 
    FeedbackDate DATE, 
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

-- Inserting values into Customers table
INSERT INTO Customers (CustomerID, Name, Email, RegistrationDate) 
VALUES (1, 'Alice Johnson', 'alice@example.com', '2023-01-15'), 
(2, 'Bob Smith', 'bob@example.com', '2023-02-20'), 
(3, 'Charlie Brown', 'charlie@example.com', '2023-03-05'), 
(4, 'Diana Prince', 'diana@example.com', '2023-04-10'),
(5, 'Mickey Mouse', 'mickey@example.com', '2025-04-15'),
(6, 'Karan Kumar', 'karan@example.com', '2025-05-03'),
(7, 'Avinash Ray', 'avinash@example.com', '2025-05-10'),
(8, 'Anjali Kumari', 'anjali@example.com', '2025-05-23'),
(9, 'Anita Ray', 'anita@example.com', '2025-06-12'),
(10, 'Awadh Kishor', 'awadh@example.com', '2025-06-18');

-- Inserting values into Drivers table
INSERT INTO Drivers (DriverID, Name, JoinDate) 
VALUES (101, 'John Driver', '2022-05-10'), 
(102, 'Linda Miles', '2022-07-25'), 
(103, 'Kevin Road', '2023-01-01'), 
(104, 'Sandra Swift', '2022-11-11'),
(105, 'Devendra Jacks','2021-08-14'),
(106, 'Binod Bhatade', '2022-10-21'),
(107, 'Tejas Kamble', '2023-06-17'),
(108, 'Rahul Kadam', '2022-04-13'),
(109, 'Gaurav Sawant', '2022-05-20'),
(110, 'Sachin Bane', '2021-03-18');

-- Inserting values into Cabs table
INSERT INTO Cabs (CabID, DriverID, VehicleType, PlateNumber) 
VALUES (1001, 101, 'Sedan', 'ABC1234'), 
(1002, 102, 'SUV', 'XYZ5678'), 
(1003, 103, 'Sedan', 'LMN8901'), 
(1004, 104, 'SUV', 'PQR3456'),
(1005, 105, 'Toyota', 'ADS2435'),
(1006, 106, 'Hyundai', 'KHJ3672'),
(1007, 107, 'Sedan', 'GHF6752'),
(1008, 108, 'Toyota', 'YUH5623'),
(1009, 109, 'Hyundai', 'JGF7823'),
(1010, 110, 'SUV', 'KYD9834');

-- Inserting values into Bookings tables
INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingDate, Status, PickupLocation, DropoffLocation) 
VALUES (201, 1, 1001, '2024-10-01 08:30:00', 'Completed', 'Downtown', 'Airport'), 
(202, 2, 1002, '2024-10-02 09:00:00', 'Completed', 'Mall', 'University'), 
(203, 3, 1003, '2024-10-03 10:15:00', 'Canceled', 'Station', 'Downtown'), 
(204, 4, 1004, '2024-10-04 14:00:00', 'Completed', 'Suburbs', 'Downtown'), 
(205, 1, 1002, '2024-10-05 18:45:00', 'Completed', 'Downtown', 'Airport'), 
(206, 2, 1001, '2024-10-06 07:20:00', 'Canceled', 'University', 'Mall'),
(207, 3, 1003, '2024-10-07 11:10:00', 'Completed', 'Mall', 'Airport'),
(208, 4, 1004, '2024-10-08 12:00:00', 'Completed', 'Downtown', 'Suburbs'),
(209, 1, 1001, '2024-10-09 15:30:00', 'Canceled', 'University', 'Station'),
(210, 2, 1002, '2024-10-10 17:45:00', 'Completed', 'Station', 'Downtown'),
(211, 3, 1003, '2024-10-11 08:50:00', 'Completed', 'Mall', 'University'),
(212, 4, 1004, '2024-10-12 14:20:00', 'Completed', 'Suburbs', 'Airport'),
(213, 1, 1002, '2024-10-13 09:15:00', 'Canceled', 'Downtown', 'Station'),
(214, 2, 1001, '2024-10-14 13:40:00', 'Completed', 'University', 'Mall'),
(215, 3, 1003, '2024-10-15 16:05:00', 'Completed', 'Station', 'Downtown'),
(216, 4, 1004, '2024-10-16 10:25:00', 'Completed', 'Mall', 'Airport'),
(217, 1, 1001, '2024-10-17 18:55:00', 'Completed', 'Downtown', 'University'),
(218, 2, 1002, '2024-10-18 07:35:00', 'Canceled', 'Suburbs', 'Downtown'),
(219, 3, 1003, '2024-10-19 11:45:00', 'Completed', 'Airport', 'Mall'),
(220, 4, 1004, '2024-10-20 12:30:00', 'Completed', 'Station', 'Suburbs'),
(221, 1, 1002, '2024-10-21 14:15:00', 'Completed', 'Mall', 'Airport'),
(222, 2, 1003, '2024-10-22 16:50:00', 'Canceled', 'University', 'Station'),
(223, 3, 1001, '2024-10-23 09:05:00', 'Completed', 'Downtown', 'Mall'),
(224, 4, 1004, '2024-10-24 10:55:00', 'Completed', 'Suburbs', 'Airport'),
(225, 1, 1001, '2024-10-25 18:10:00', 'Completed', 'Downtown', 'Suburbs'),
(226, 2, 1002, '2024-10-26 08:40:00', 'Canceled', 'Mall', 'Downtown');
INSERT INTO Bookings (BookingID, CustomerID, CabID, BookingDate, Status, PickupLocation, DropoffLocation) 
VALUES (227, 2, 1005, '2024-10-27 09:25:00', 'Completed', 'Mall', 'Airport'),
(228, 3, 1006, '2024-10-28 11:55:00', 'Completed', 'Downtown', 'Station'),
(229, 1, 1007, '2024-10-29 14:10:00', 'Canceled', 'Suburbs', 'University'),
(230, 4, 1008, '2024-10-30 16:30:00', 'Completed', 'Station', 'Mall'),
(231, 2, 1009, '2024-10-31 07:50:00', 'Completed', 'University', 'Downtown'),
(232, 3, 1010, '2024-11-01 10:40:00', 'Completed', 'Airport', 'Mall'),
(233, 1, 1006, '2024-11-02 13:20:00', 'Canceled', 'Downtown', 'Airport'),
(234, 4, 1007, '2024-11-03 18:05:00', 'Completed', 'Suburbs', 'Downtown'),
(235, 2, 1008, '2024-11-04 08:15:00', 'Completed', 'Mall', 'University'),
(236, 3, 1009, '2024-11-05 12:45:00', 'Completed', 'Station', 'Suburbs'),
(237, 1, 1010, '2024-11-06 15:55:00', 'Completed', 'Downtown', 'Mall'),
(238, 4, 1005, '2024-11-07 17:20:00', 'Canceled', 'Airport', 'Station'),
(239, 2, 1006, '2024-11-08 09:35:00', 'Completed', 'University', 'Airport'),
(240, 3, 1007, '2024-11-09 11:25:00', 'Completed', 'Mall', 'Downtown'),
(241, 1, 1008, '2024-11-10 14:50:00', 'Completed', 'Suburbs', 'University'),
(242, 4, 1009, '2024-11-11 16:10:00', 'Canceled', 'Station', 'Airport'),
(243, 2, 1010, '2024-11-12 07:45:00', 'Completed', 'Mall', 'Suburbs'),
(244, 3, 1005, '2024-11-13 10:55:00', 'Completed', 'Downtown', 'Mall'),
(245, 1, 1006, '2024-11-14 13:30:00', 'Completed', 'University', 'Station'),
(246, 4, 1007, '2024-11-15 18:40:00', 'Completed', 'Airport', 'Downtown');


-- Inserting values into TripDetails table
INSERT INTO TripDetails (TripID, BookingID, StartTime, EndTime, DistanceKM, Fare) 
VALUES (301, 201, '2024-10-01 08:45:00', '2024-10-01 09:20:00', 18.5, 250.00), 
(302, 202, '2024-10-02 09:10:00', '2024-10-02 09:40:00', 12.0, 180.00), 
(303, 204, '2024-10-04 14:10:00', '2024-10-04 14:40:00', 10.0, 150.00), 
(304, 205, '2024-10-05 18:50:00', '2024-10-05 19:30:00', 20.0, 270.00),
(305, 206, '2024-10-06 07:30:00', '2024-10-06 08:05:00', 14.0, 200.00),
(306, 207, '2024-10-07 11:20:00', '2024-10-07 11:55:00', 16.5, 230.00),
(307, 208, '2024-10-08 12:10:00', '2024-10-08 12:45:00', 13.0, 190.00),
(308, 209, '2024-10-09 15:40:00', '2024-10-09 16:15:00', 17.0, 240.00),
(309, 210, '2024-10-10 17:55:00', '2024-10-10 18:25:00', 11.0, 160.00),
(310, 211, '2024-10-11 09:00:00', '2024-10-11 09:30:00', 12.5, 175.00),
(311, 212, '2024-10-12 14:30:00', '2024-10-12 15:10:00', 19.0, 260.00),
(312, 213, '2024-10-13 09:25:00', '2024-10-13 10:00:00', 15.0, 210.00),
(313, 214, '2024-10-14 13:50:00', '2024-10-14 14:20:00', 9.5, 140.00),
(314, 215, '2024-10-15 16:15:00', '2024-10-15 16:50:00', 18.0, 245.00),
(315, 216, '2024-10-16 10:35:00', '2024-10-16 11:05:00', 10.5, 155.00),
(316, 217, '2024-10-17 19:05:00', '2024-10-17 19:45:00', 21.0, 290.00),
(317, 218, '2024-10-18 07:45:00', '2024-10-18 08:20:00', 13.5, 185.00),
(318, 219, '2024-10-19 11:55:00', '2024-10-19 12:30:00', 14.8, 205.00),
(319, 220, '2024-10-20 12:40:00', '2024-10-20 13:15:00', 16.2, 225.00);
INSERT INTO TripDetails (TripID, BookingID, StartTime, EndTime, DistanceKM, Fare) 
VALUES
(320, 239, '2024-02-14 14:20:00', '2024-02-14 14:45:00', 5.7, 98.00),
(321, 225, '2024-07-03 16:50:00', '2024-07-03 17:10:00', 3.4, 72.00),
(322, 244, '2024-01-26 09:05:00', '2024-01-26 09:30:00', 6.9, 118.00),
(323, 233, '2024-09-18 11:10:00', '2024-09-18 11:30:00', 4.6, 82.00),
(324, 242, '2024-03-09 18:35:00', '2024-03-09 18:55:00', 7.5, 128.00),
(325, 230, '2024-12-22 08:55:00', '2024-12-22 09:15:00', 2.8, 57.00),
(326, 246, '2024-05-15 09:30:00', '2024-05-15 09:55:00', 6.1, 106.00),
(327, 222, '2024-08-27 12:00:00', '2024-08-27 12:20:00', 3.9, 74.00),
(328, 241, '2024-04-11 14:25:00', '2024-04-11 14:50:00', 7.8, 133.00),
(329, 226, '2024-06-29 16:40:00', '2024-06-29 17:00:00', 4.3, 80.00),
(330, 235, '2024-11-13 08:30:00', '2024-11-13 08:50:00', 5.2, 92.00),
(331, 223, '2024-04-23 10:45:00', '2024-04-23 11:05:00', 3.1, 66.00),
(332, 245, '2024-02-28 13:40:00', '2024-02-28 14:00:00', 6.4, 112.00),
(333, 231, '2024-10-06 18:10:00', '2024-10-06 18:35:00', 7.1, 120.00),
(334, 238, '2024-03-18 08:20:00', '2024-03-18 08:40:00', 4.0, 76.00),
(335, 221, '2024-12-03 12:50:00', '2024-12-03 13:10:00', 2.6, 54.00),
(336, 243, '2024-05-07 16:10:00', '2024-05-07 16:30:00', 5.9, 104.00),
(337, 236, '2024-09-01 17:30:00', '2024-09-01 17:55:00', 7.6, 129.00),
(338, 229, '2024-01-12 09:40:00', '2024-01-12 10:00:00', 3.3, 70.00),
(339, 234, '2024-07-25 11:30:00', '2024-07-25 11:55:00', 6.7, 115.00);

-- Inserting into Feedback table
INSERT INTO Feedback (FeedbackID, BookingID, Rating, Comments, FeedbackDate) 
VALUES (401, 201, 4.5, 'Smooth ride', '2024-10-01'), 
(402, 202, 3.0, 'Driver was late', '2024-10-02'), 
(403, 204, 5.0, 'Excellent service', '2024-10-04'), 
(404, 205, 2.5, 'Cab was not clean', '2024-10-05'),
(405, 204, 4.0, 'Good ride', '2024-10-06'),
(406, 207, 3.5, 'Average experience', '2024-10-07'),
(407, 210, 5.0, 'Very professional driver', '2024-10-08'),
(408, 213, 2.0, 'Driver took long route', '2024-10-09'),
(409, 218, 4.5, 'Smooth and quick trip', '2024-10-10'),
(410, 221, 3.0, 'Could be better', '2024-10-11'),
(411, 226, 4.8, 'Excellent overall', '2024-10-12'),
(412, 209, 1.5, 'Cab was smelly', '2024-10-13'),
(413, 215, 5.0, 'Very comfortable ride', '2024-10-14'),
(414, 220, 3.8, 'Good but slightly delayed', '2024-10-15'),
(415, 212, 2.5, 'Driver was rude', '2024-10-16'),
(416, 224, 4.2, 'Nice and clean cab', '2024-10-17'),
(417, 208, 3.7, 'Decent ride', '2024-10-18'),
(418, 219, 4.9, 'Perfect experience', '2024-10-19'),
(419, 214, 2.0, 'Too slow', '2024-10-20'),
(420, 217, 4.3, 'Friendly driver', '2024-10-21'),
(421, 222, 3.2, 'Satisfactory service', '2024-10-22'),
(422, 225, 5.0, 'Loved the ride', '2024-10-23'),
(423, 211, 2.8, 'Not very clean', '2024-10-24'),
(424, 223, 4.7, 'Very smooth journey', '2024-10-25');
INSERT INTO Feedback (FeedbackID, BookingID, Rating, Comments, FeedbackDate) 
VALUES
(425, 238, 3.6, 'Good ride overall', '2024-10-29'),
(426, 231, 2.4, 'Driver needs improvement', '2024-10-18'),
(427, 244, 3.2, 'Decent experience', '2024-10-27'),
(428, 233, 2.9, 'Average service', '2024-11-03'),
(429, 240, 3.8, 'Comfortable and smooth', '2024-10-14'),
(430, 245, 2.1, 'Cab was not very clean', '2024-11-06'),
(431, 229, 3.4, 'Overall satisfactory', '2024-10-20'),
(432, 242, 3.0, 'Service was okay', '2024-11-02'),
(433, 235, 2.7, 'Could have been better', '2024-10-12'),
(434, 246, 3.9, 'Very comfortable ride', '2024-11-08'),
(435, 230, 2.3, 'Driver was a bit rude', '2024-10-31'),
(436, 239, 3.1, 'Smooth but a little slow', '2024-10-26'),
(437, 228, 3.7, 'Pleasant trip', '2024-11-04'),
(438, 241, 2.8, 'Average but acceptable', '2024-10-22'),
(439, 227, 3.5, 'Good and timely service', '2024-11-01'),
(440, 234, 2.6, 'Cab condition was mediocre', '2024-10-19'),
(441, 237, 3.9, 'Nice and comfortable', '2024-10-30'),
(442, 243, 2.2, 'Ride was not smooth', '2024-11-07'),
(443, 232, 3.3, 'Service was decent', '2024-10-24'),
(444, 236, 3.0, 'Okay experience', '2024-11-05');

select * from customers;
select * from Bookings;
select * from cabs;
select * from drivers;
select * from tripdetails;
select * from feedback;

-- 1. Write an SQL query to display each customer’s ID, name, and the total number of bookings they have completed.
-- Only count bookings where the status is 'Completed'.
-- Sort the result in ascending order based on the number of completed bookings."
select c.CustomerID, c.Name, count(*) as CompletedBookings from Customers c
join Bookings b on c.CustomerID = b.CustomerID
where b.status = 'Completed'
group by c.CustomerID, c.Name
order by CompletedBookings;

-- 2. Write an SQL query to find customers whose booking cancellation rate is more than 20%.
-- The output should display CustomerID, number of cancelled bookings, total bookings, and cancellation percentage (rounded to 2 decimals).
select CustomerID,
	sum(case when status = 'Canceled' then 1 else 0 end) as Cancelled,
    count(*) as TotalBookings,
    round(100.0 * sum(case when status = 'Canceled' then 1 else 0 end ) / count(*), 2) as CancellationRate
from Bookings
group by CustomerID
Having CancellationRate > 20;

-- 3. Write an SQL query to find out on which day of the week the highest number of bookings were made.
-- Display each day of the week along with the total number of bookings and sort the results from highest to lowest.
select date_format(BookingDate, '%W') as DayofWeek, count(*) as TotalBookings from Bookings
group by date_format(BookingDate, '%W')
order by TotalBookings DESC;

-- 4. Write an SQL query to find drivers whose average feedback rating is Below 3.0.
-- Use the Drivers, Cabs, Bookings, and Feedback tables.
select d.DriverID, d.name, round(avg(f.Rating),2) as AvgRating from Drivers d
join Cabs c on d.DriverID = c.DriverID
join Bookings b on c.CabID = b.CabID
join Feedback f on b.BookingID = f.BookingID
WHERE f.Rating IS NOT NULL
group by d.DriverID, d.name
having avg(f.Rating) < 3;

-- 5. Write an SQL query to find the top 5 drivers who have traveled the highest total distance in completed trips.
select d.DriverID, d.Name, round(sum(t.DistanceKM),2) as TotalDistanceKM from Drivers d
join Cabs c on d.DriverID = c.DriverID
join Bookings b on c.CabID = b.CabID
join Tripdetails t on b.BookingID = t.BookingID
where b.Status = 'Completed'
group by d.DriverID, d.Name
order by TotalDistanceKM DESC
LIMIT 5;

-- 6. Write an SQL query to find all drivers whose trip cancellation rate is greater than 25%.
select d.DriverID, d.name,
	round(sum(case when b.status = 'Canceled' then 1 else 0 end) * 100 / count(*),2) as TotalCancelledRate
from drivers d
join cabs c on d.DriverID = c.DriverID
join Bookings b on c.CabID = b.CabID
group by d.DriverID, d.name
having TotalCancelledRate > 25;

-- 7. Write an SQL query to calculate the monthly revenue generated from all completed trips.
-- Use the TripDetails and Bookings tables.
select date_format(t.endtime, '%M') as MonthName, sum(t.fare) as Revenue from tripdetails t
join bookings b on t.bookingid = b.bookingid
where b.status = 'Completed'
group by MonthName
order by MonthName;

-- 8. Write an SQL query to generate a performance summary of each driver, 
-- showing their average feedback rating, total number of trips completed, and total earnings generated. 
-- The result should group data by DriverID and sort by average rating in descending order
select d.DriverID, d.Name, round(avg(f.Rating),2) as AvgRating, 
	count(*) as TotalTrips, 
	sum(t.Fare) as TotalEarnings  
from drivers d
	join cabs c on d.DriverID = c.DriverID
	join bookings b on c.CabID = b.CabID
	join feedback f on b.BookingID = f.BookingID
	join tripdetails t on f.BookingID = t.BookingID
where b.Status = 'Completed'
group by d.DriverID, d.Name
order by AvgRating desc;

select * from bookings;
select * from tripdetails;
-- 9. Write an SQL query to find the average customer wait time (in minutes) for each pickup location.
-- The wait time should be calculated as the time difference between the booking time and the trip start time, but only for completed bookings.
-- Display each PickupLocation along with the average wait time, ordered from highest to lowest wait time.
select b.PickupLocation, AVG(
        TIMESTAMPDIFF(
            MINUTE,
            LEAST(b.BookingDate, t.StartTime),
            GREATEST(b.BookingDate, t.StartTime)
        )
    ) as AvgWaitingTime from bookings b
join tripdetails t on b.BookingID = t.BookingID
where b.Status = 'Completed'
group by b.PickupLocation
order by AvgWaitingTime;

-- 10. Write an SQL query to classify each trip as either a Short trip (less than 12 km) or a Long trip (12 km or more), 
-- and then calculate for each trip type the total number of trips and the total revenue generated.
select case when distancekm < 12 then 'Short' else 'Long' end as TripType, 
	count(*) 'Number Of Trip', 
	sum(fare) as TotalRevenue
from tripdetails
-- group by case when distancekm < 12 then 'Short' else 'Long' end;
group by TripType;

-- 11. Write an SQL query to calculate the total revenue generated by each vehicle type. 
-- The revenue should only include trips from completed bookings.
-- Use the Cabs, Bookings, and TripDetails tables, and group the results by vehicle type.
select c.VehicleType, sum(t.fare) as TotalRevenue from cabs c
join bookings b on c.cabid = b.cabid
join tripdetails t on b.BookingID = t.BookingID
where b.status = 'Completed'
group by c.VehicleType
order by TotalRevenue desc;

-- 12. Write an SQL query to categorize each booking as either a Weekday or Weekend based on the booking date, 
-- and then calculate the following for each category:
--     1. Total number of bookings, and
--     2. Total revenue earned (by summing the fare from TripDetails).
select 
	case 
		when date_format(b.bookingdate, '%W') in ('Saturday', 'Sunday') 
        then 'Weekend' else 'Weekdays' end as WeekType,
    count(*) as TotalBookings,
    sum(t.fare) as TotalRevenue from bookings b
join tripdetails t on b.bookingid = t.bookingid
group by WeekType;




