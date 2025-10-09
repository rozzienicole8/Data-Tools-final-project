
```sql
create table users (
  user_id SERIAL PRIMARY KEY,
  name VARCHAR(100)NOT NULL,
  email VARCHAR (150) unique not null,
  phone VARCHAR(20),
  created_at TIMESTAMP DEFAULT current_timestamp
);

create table events (
  event_id SERIAL PRIMARY KEY,
  event_name VARCHAR(150)NOT NULL,
  event_description TEXT,
  location VARCHAR(150),
  event_date DATE NOT NULL,
  event_time TIME NOT NULL,
  organizer_id INT REFERENCES users(user_id)ON DELETE CASCADE,
created_at TIMESTAMP DEFAULT current_timestamp
);

create table tickets (
  ticket_id SERIAL PRIMARY KEY,
  event_id INT REFERENCES events(event_id) ON DELETE CASCADE,
  user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
  ticket_type VARCHAR(50),
  price DECIMAL(10,2) NOT NULL,
  purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) DEFAULT 'valid'
);

create table payments(
  payment_id SERIAL PRIMARY KEY,
  ticket_id INT REFERENCES tickets(ticket_id) ON DELETE CASCADE,
  payment_method VARCHAR(50),
  amount DECIMAL(10,2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(20) DEFAULT 'completed'
);

insert into users (name, email, phone)
values
('Alice Mwangi','alice@gmail.com','+254712345786'),
('Brian Otieno','brian@gmail.com','+254786967393'),
('Clara Njeri','clara@gmail.com', '+254712465890'),
('David Kimani','david@gmail.com','+254794867092');

insert into events (event_name, event_description, location, event_date, event_time, organizer_id)
values
('Nairobi Tech Fest', 'A technology and innovation exhibition.','KICC Nairobi', '2025-11-10','09:00:00',1),
('Afrobeats Live Concert', 'A Night of African music and dance.','Carnivore Grounds','2025-12-05','08:00:00',2),
('Food and Culture Expo', 'Celebrating diverse cuisines and cultures.', 'Sarit Expo Centre','2025-10-25','10:00:00',3);

insert into tickets(event_id, user_id, ticket_type,price)
values
(1,2,'VIP',2500.00),
(1,3,'Regular',1500.00),
(2,1,'Regular', 2000.00),
(3,4,'Student',1000.00),
(3,1,'Regular', 1500.00);

insert into payments (ticket_id, payment_method,amount)
values
(1,'M-Pesa', 2500.00),
(2,'Credit Card',1500.00),
(3,'M-Pesa',2000.00),
(4,'Cash',1000.00),
(5,'M-Pesa', 1500.00);
