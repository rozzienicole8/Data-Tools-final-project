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
┌────────────┐        ┌────────────┐        ┌────────────┐        ┌──────────────┐
│   USERS    │        │   EVENTS   │        │   TICKETS  │        │   PAYMENTS   │
│------------│        │------------│        │------------│        │--------------│
│ user_id PK │◄────┐  │ event_id PK│◄──┐    │ ticket_id PK│◄──┐  │ payment_id PK │
│ full_name  │     │  │ event_name │   │    │ event_id FK │   │  │ ticket_id FK  │
│ email (UQ) │     │  │ description│   │    │ user_id FK  │   │  │ method        │
│ phone      │     │  │ location   │   │    │ ticket_type │   │  │ amount        │
│ created_at │     │  │ event_date │   │    │ price       │   │  │ payment_date  │
└────────────┘     │  │ event_time │   │    │ purchase_dt │   │  │ status        │
                   │  │ organizer_id│──┘    │ status      │   │  └──────────────┘
                   │  │ created_at  │        └────────────┘   │
                   │  └────────────┘                          │
                   └──────────────────────────────────────────┘

```

### Relationship Details

1. USERS → EVENTS (1 → ∞)
  • One user (organizer) can create many events.

2. USERS → TICKETS (1 → ∞)
    • One user can buy many tickets.

 3. EVENTS → TICKETS (1 → ∞)
    • Each event can have multiple tickets.

 4. TICKETS → PAYMENTS (1 → ∞)
    • Each ticket can have multiple payments.
    


