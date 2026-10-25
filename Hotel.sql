create table Reservation(
	ReservationId int Primary Key identity,
	BookingDate DateTime,
	ChickInDate DateTime,
	ChickOutDate DateTime,
	ReservationStatus varChar(10),
	TotalPrice Decimal(10,2),
	NumberOfAdults int,
	NumberOfChildren int
)

Create Table Payments
(
	PaymentId int Primary Key identity,
	Method Varchar(100),
	#Date Date,
	Amount Decimal(10,2),
	ConfirmationNumber int
)

Create Table Guests
(
	GuestId int Primary Key identity,
	Nationality varchar(50),
	FullName varchar(100),
	PassportNumber int,
	DateOfBirth Date
)

Create Table Guest_Contact_Details
(
	GuestId int references Guests(GuestId),
	Detail varchar(500),
	Primary Key(GuestId, Detail)
)

Create Table Reservations_PaymentYY
(
	ReservationId int references Reservation(ReservationId),
	PaymentId int references Payments(PaymentId),
	Primary Key(PaymentId, ReservationId)
)

Create Table Reservations_Guest
(
	ReservationId int references Reservation(ReservationId),
	GuestId int references Guests(GuestId),
	Primary Key(ReservationId, GuestId)
)

Create Table Hotel
(
	HotelId int Primary Key identity,
	#Name VarChar(100),
	#Address VarChar(50),
	City VarChar(20),
	StarRating int,
	ContactNumber int,
)
Create Table Staff
(
	StaffId int Primary Key identity,
	FullName varchar(100),
	Position VarChar(50),
	Salary Decimal(10,2),
	HotelId int References Hotel(HotelId)
)


Create Table Services
(
	ServicesId int Primary Key identity,
	ServicesName VarChar(100),
	Charge VarChar(200),
	RequestDate Date,
	StaffId int References Staff(StaffId)
)


Create Table Rooms
(
	RoomNumber int Primary Key,
	RoomType VarChar(20),
	Capacity int,
	DailyRate int,
	#Availability VarChar(50),
	HotelId int References Hotel(HotelId)
)

Create Table Amenities
(
	RoomNumber int references Rooms(RoomNumber),
	Amenity VarChar(100),
	Primary Key(Amenity, RoomNumber)
)

Create Table Reservation_Services
(
	ReservationId int references Reservation(ReservationId),
	ServicesId int references Services(ServicesId),
	Primary Key(ReservationId, ServicesId)
)

Create Table Reservation_Room
(
	ReservationId int references Reservation(ReservationId),
	RoomNumber int references Rooms(RoomNumber),
	Primary Key(ReservationId, RoomNumber)
)

Alter Table Hotel
Add ManageId int References
Staff(StaffId)

use Hotel

Insert into Guests
Values ('Egyptian', 'Youssef', 12346789, '01/01/2009')

Insert into Guests
Values ('Egyptian', 'Youssef', '12346789', '01/01/2009'),
('Egyptian', 'Emad', '6548658', '11/23/2007')

Update Rooms
Set DailyRate = DailyRate * 1.15
WHERE RoomType = 'Suite';

Update Reservation
Set ReservationStatus =
			Case 
				When ChickOutDate < GETDATE() then 'Complet'
				When ChickInDate > GETDATE() then 'Upcoming' 
				Else 'Active'
			End

