create database Ola;
Use Ola;

# Retrieve all successful bookings:
Create View Successful_Bookings as
SELECT * FROM Bookings
WHERE Booking_Status ='Success';

SELECT * FROM Successful_Bookings;

# Find the average ride distance for each vehicle type:
Create view ride_distance_for_rach_vehicle AS
SELECT Vehicle_type, AVG(Ride_Distance)
AS avg_distance FROM Bookings
GROUP BY Vehicle_type;

SELECT * FROM ride_distance_for_rach_vehicle;

# Get the total number of cancelled rides by customers:
Create view  cancelled_rides_by_customers As
SELECT COUNT(*) FROM Bookings
WHERE Booking_Status ='Canceled by Customer';

SELECT * FROM cancelled_rides_by_customers;

#List the top 5 customers who booked the highest number of rides:
create view top_5_customers As
SELECT Customer_ID, Count(Booking_ID) AS total_rides
FROM Bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;

SELECT * FROM top_5_customers;

#Get the number of rides cancelled by drivers due to personal and car-related issues:
create View cancelled_by_drivers_P_C_Issues As
SELECT COUNT(*) FROM Bookings
WHERE Canceled_Rides_by_Driver ='Personal & Car related issue';

Select * From cancelled_by_drivers_P_C_Issues;

#Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Ratings AS
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM Bookings
WHERE Vehicle_Type ='Prime Sedan'; 

SELECT * FROM Max_Min_Driver_Ratings;

#Retrieve all rides where payment was made using UPI:
Create View Payments_Through_UPI As
SELECT * FROM Bookings 
WHERE Payment_Method = 'UPI';

SELECT * From Payments_Through_UPI;

#Find the average customer rating per vehicle type:

#Calculate the total booking value of rides completed successfully:
Create View total_successful_booking_rides_completed As
SELECT SUM(Booking_Value) As Total_Success_Value 
FROM Bookings
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_booking_rides_completed;

#List all incomplete rides along with the reason:
Create View Incomplete_Rides As
SELECT Booking_ID, Incomplete_Rides_Reason
FROM Bookings
WHERE Incomplete_Rides ='Yes';

SELECT * FROM Incomplete_Rides;

