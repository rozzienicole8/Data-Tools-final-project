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
| users → events | A user can organize many events |
| users → tickets | A user can buy many tickets |
| events → tickets | An event can have many tickets |
| tickets → payments | Each ticket has one or more payments |

---

## 📅 Notes
- All timestamps are in UTC format.
- Cascade delete ensures related records are removed automatically.
- Designed and tested using **PostgreSQL (Supabase)
