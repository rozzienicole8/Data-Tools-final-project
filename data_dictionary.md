# 🎟️ Event Ticketing System 

This document describes all database tables, their fields, and relationships used in the Event Ticketing System.

--------------------------------------------------------------------

## 🧍‍♂️ TABLE: users
| Field Name | Data Type | Constraints | Description |
|-------------|------------|--------------|--------------|
| user_id | SERIAL | PRIMARY KEY | Unique ID for each user |
| full_name | VARCHAR(100) | NOT NULL | User’s full name |
| email | VARCHAR(150) | UNIQUE, NOT NULL | User’s email address |
| phone | VARCHAR(20) | NULL | User’s phone number |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Time when the user record was created |

---

## 🎤 TABLE: events
| Field Name | Data Type | Constraints | Description |
|-------------|------------|--------------|--------------|
| event_id | SERIAL | PRIMARY KEY | Unique ID for each event |
| event_name | VARCHAR(150) | NOT NULL | Name of the event |
| event_description | TEXT | NULL | Details about the event |
| location | VARCHAR(150) | NULL | Where the event will be held |
| event_date | DATE | NOT NULL | Date of the event |
| event_time | TIME | NOT NULL | Time the event starts |
| organizer_id | INT | FOREIGN KEY → users(user_id) | Event organizer |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Record creation time |

---

## 🎫 TABLE: tickets
| Field Name | Data Type | Constraints | Description |
|-------------|------------|--------------|--------------|
| ticket_id | SERIAL | PRIMARY KEY | Unique ID for each ticket |
| event_id | INT | FOREIGN KEY → events(event_id) | Related event |
| user_id | INT | FOREIGN KEY → users(user_id) | Buyer or attendee |
| ticket_type | VARCHAR(50) | NULL | Type of ticket (e.g. VIP, Regular) |
| price | DECIMAL(10,2) | NOT NULL | Price of the ticket |
| purchase_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Time of purchase |
| status | VARCHAR(20) | DEFAULT 'valid' | Ticket status (valid, canceled, etc.) |

---

## 💳 TABLE: payments
| Field Name | Data Type | Constraints | Description |
|-------------|------------|--------------|--------------|
| payment_id | SERIAL | PRIMARY KEY | Unique ID for each payment |
| ticket_id | INT | FOREIGN KEY → tickets(ticket_id) | Related ticket |
| payment_method | VARCHAR(50) | NULL | Payment method (M-Pesa, Card, Cash) |
| amount | DECIMAL(10,2) | NOT NULL | Amount paid |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Date and time of payment |
| status | VARCHAR(20) | DEFAULT 'completed' | Payment status (completed, pending, failed) |

---

## 🔗 RELATIONSHIPS SUMMARY

| Relationship | Description |
|---------------|-------------|
| users → events | A user (organizer) can organize many events |
| users → tickets | A user can buy many tickets |
| events → tickets | An event can have many tickets |
| tickets → payments | Each ticket has one or more payments |

---

## 📅 Notes
- All timestamps are in UTC format.
- Cascade delete ensures related records are removed automatically.
- Designed and tested using **PostgreSQL (Supabase)


The following sample data demonstrates the structure  within the **Event Ticketing System** database.

| **Table** | **Sample Records (Preview)** |
|------------|------------------------------|
| **users** | (1, *Alice Mwangi*, *alice@example.com*, *+254712345678*)<br>(2, *Brian Otieno*, *brian@example.com*, *+254701234567*)<br>(3, *Clara Njeri*, *clara@example.com*, *+254798765432*)<br>(4, *David Kimani*, *david@example.com*, *+254723456789*) |
| **events** | (1, *Nairobi Tech Fest*, *KICC, Nairobi*, *2025-11-10*, *09:00:00*, organizer_id = 1)<br>(2, *Afrobeats Live Concert*, *Carnivore Grounds*, *2025-12-05*, *19:00:00*, organizer_id = 2)<br>(3, *Food and Culture Expo*, *Sarit Expo Centre*, *2025-10-25*, *10:00:00*, organizer_id = 3) |
| **tickets** | (1, event = 1, user = 2, *VIP*, *2500.00*)<br>(2, event = 1, user = 3, *Regular*, *1500.00*)<br>(3, event = 2, user = 1, *Regular*, *2000.00*)<br>(4, event = 3, user = 4, *Student*, *1000.00*)<br>(5, event = 3, user = 1, *Regular*, *1500.00*) |
| **payments** | (1, ticket = 1, *M-Pesa*, *2500.00*)<br>(2, ticket = 2, *Credit Card*, *1500.00*)<br>(3, ticket = 3, *M-Pesa*, *2000.00*)<br>(4, ticket = 4, *Cash*, *1000.00*)<br>(5, ticket = 5, *M-Pesa*, *1500.00*) |

---

### 🧾 Sample Data Overview

| **Metric** | **Value** |
|-------------|-----------|
| Total Users | 4 |
| Total Events | 3 |
| Total Tickets Sold | 5 |
| Total Payments | 5 |
| Highest Ticket Price | 2500.00 |
| Most Used Payment Method | M-Pesa |
| Earliest Event | Food and Culture Expo — 2025-10-25 |
| Latest Event | Afrobeats Live Concert — 2025-12-05 |

---

### 💬 Insights

- Each event is **organized by a user**, and users can also **purchase tickets** for other events.
- **M-Pesa** is the most common payment method among attendees.
- **VIP tickets** have the highest price and represent premium event access.

