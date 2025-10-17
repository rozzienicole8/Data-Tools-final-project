# Entity Relationship Diagram (ERD)
## Event Ticketing System

### Text-Based ERD Description

```
USERS:
- user_id (PK)
- full_name
- email (UNIQUE)
- phone
- created_at

EVENTS:
- event_id (PK)
- event_name
- event_description
- location
- event_date
- event_time
- organizer_id (FK → users.user_id)
- created_at

TICKETS:
- ticket_id (PK)
- event_id (FK → events.event_id)
- user_id (FK → users.user_id)
- ticket_type
- price
- purchase_date
- status
- created_at

PAYMENTS:
- payment_id (PK)
- ticket_id (FK → tickets.ticket_id)
- payment_method
- amount
- payment_date
- status
- created_at
```


### ASCII Diagram

## 📊 Entity Relationship Diagram (ERD)
### Event Ticketing System (ASCII Version)

```text
┌────────────┐         ┌────────────┐         ┌────────────┐         ┌──────────────┐
│   users    │ 1     ∞ │   events   │ 1     ∞ │   tickets  │ 1     1 │   payments   │
│------------│---------│------------│---------│------------│---------│--------------│
│ user_id PK │◄────────│ event_id PK│◄────────│ ticket_id PK│◄───────│ payment_id PK│
│ name       │         │ event_name │         │ event_id FK │         │ ticket_id FK │
│ email      │         │ organizer_id FK──────►│ user_id FK  │         │ amount       │
│ phone      │         │ location   │         │ price       │         │ status       │
│ created_at │         │ event_date │         │ status      │         │ payment_date │
└────────────┘         └────────────┘         └────────────┘         └──────────────┘
```

### Relationship Details

| Relationship           | Type  | Description                                  |
| ---------------------- | ----- | -------------------------------------------- |
| **Users → Events**     | 1 → ∞ | One user (organizer) can create many events. |
| **Users → Tickets**    | 1 → ∞ | One user can purchase many tickets.          |
| **Events → Tickets**   | 1 → ∞ | One event can have multiple tickets.         |
| **Tickets → Payments** | 1 → 1 | Each ticket corresponds to one payment.      |


### Business Rules

-**Each user must have a unique email.**

-**An event must belong to a valid organizer (user).**

-**A ticket must link to a valid event and buyer.**

-**A payment must be tied to a valid ticket.**

-Deleting a user or event cascades to related records.

-Ticket price and payment amount must be positive.

-Event dates cannot be in the past.


