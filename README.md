
<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ (OPTIONAL)](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# Event Ticketing System <a name="about-project"></a>

A web application that allows users to browse upcoming events, purchase tickets and manage event attendance records in real time.

Event Ticketing is a database-driven project that manages events, ticket sales and payments using Supabase (PostgreSQL).It allows event organizers to create events and users to book and pay for the tickets seamlessly. 

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> Describe the tech stack and include only the relevant sections that apply to your project e.g SQL.

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://supabase.com/">Supabase</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Describe between 1-3 key features of the application.

- **User Management:** Register users with unique emails and phone numbers.
- **Event Creation:** Organizers can create and manage multiple events.
- **Ticketing and payments:** Users can purchase tickets and make secure payments.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

> This project is designed to be deployed on Supabase.

- Database Schema: Available in `schema.sql`
- Documentation: See `data_dictionary.md` and `erd.md`



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

> Describe how a new developer could make use of your project.

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

To run this project, you need:

- [A Supabase account](https://supabase.com/)
- [Knowledge on SQL](https://www.w3schools.com/sql/)
- A schema for creating your tables in the DB

### Setup

Clone this repository to your desired folder:

```sh 
  cd Data-Tools-final-project
  git clone https://github.com/rozzienicole8/Data-Tools-final-project
```
--->

### Install

Install this project with:

```sh
1. **Open your Supabase project dashboard**  
   - Go to [https://app.supabase.com](https://app.supabase.com) and log in to your account.  
   - Select your project or create a new one if you haven’t already.  

2. **Navigate to the SQL Editor**  
   - In the left sidebar, click on **SQL Editor** to open the query editor window.  

3. **Copy and paste the contents of `schema.sql`**  
   - Open the `schema.sql` file from this repository.  
   - Copy all the SQL code (it includes tables like `users`, `events`, `tickets`, and `payments`).  
   - Paste it into the Supabase SQL Editor.  

4. **Execute the SQL script**  
   - Click the **Run** button to execute the script.  
   - This will automatically create the database tables, relationships, and insert any sample data included.  

5. **Verify the setup**  
   - Go to **Table Editor** in Supabase to confirm that all tables (e.g., `users`, `events`, `tickets`, and `payments`) were created successfully.  
   - Run a simple test query to confirm data exists:  
     ```sql
     SELECT * FROM events LIMIT 5;
     ```  
--->
```
### Usage

To run the project, execute the following command:

<!--
Example command:

```sh
  rails server
```
--->

### Run tests

To run tests, run the following command:

Example command:
```sql
 -- View all data in a table
SELECT * FROM users;

-- Users who purchased tickets and event details
SELECT
u.name, e.event_name, t.ticket_type, t.price
FROM tickets t
JOIN users u ON t.user_id = u.user_id
JOIN events e ON t.event_id = e.event_id;

-- Payments made with M-Pesa
SELECT
u.name, e.event_name, p.amount, p.payment_method
FROM payments p
JOIN tickets t ON p.ticket_id = t.ticket_id
JOIN users u ON t.user_id = u.user_id
JOIN events e ON t.event_id = e.event_id
WHERE p.payment_method = 'M-Pesa';
```
--->

### Deployment

You can deploy this project using:
```
Deploy using Supabase
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

--->

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Mention all of the collaborators of this project.

👤 **Author**

- GitHub: [@nicolerozzie9@gmail.com] (https://github.com/nicolerozzie9)

- LinkedIn:[LinkedIn] (https://linkedin.com/in/RozzieNicole)



<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

-  **QR Code Tickets for easy event check-in.**
-  **Admin Dashboard for managing users and events.**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

> Write a message to encourage readers to support your project

If you like this project, please ⭐️ it on GitHub and share it with others!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

> Give credit to everyone who inspired your codebase.

-  Supabase for providing an excellent PostgreSQL database platform that made development and deployment seamless.

- The Data Tools Course for the comprehensive database fundamentals curriculum that inspired and guided the creation of this project.

- My peer, Emmanuel Petit for his valuable guidance throughout the development process.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ (OPTIONAL) <a name="faq"></a>

-**Q1: Does the database automatically update event statuses after the date passes?**

-**A1: Not by default. You can create a SQL view or scheduled function to handle event status updates automatically.**

-**Q2: Can I add more entities like venues or sponsors?**

-**A2: Absolutely ,the schema is designed to be extensible using Supabase by adding or removing entities or editing the tables in schema.sql.**

  <p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.


