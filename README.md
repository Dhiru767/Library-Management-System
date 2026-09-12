# Library-Management-System
  # Library Management System

A web-based library management system built with PHP and MySQL. It supports
two user roles — **admin** and **member** — and covers the full lifecycle of
managing a library's books, members, borrowing, reservations, fines, and
feedback.

## Features

**Admin**
- Manage books and book categories (add, edit, delete, list)
- Manage members (add, edit, delete, list)
- Track borrow records (issue and return books)
- Manage reservations, including cancellation and expiry handling
- Generate and update fines for overdue or lost books
- Track and record payments against fines
- View and respond to member feedback
- Manage notifications
- Admin dashboard with an overview of library activity

**Member**
- Register and log in securely (hashed passwords)
- Browse the book catalog and view book details
- Borrow and reserve books
- View personal borrowing history (`my_borrowed_books.php`)
- View and manage personal reservations (`my_reservations.php`)
- View and pay outstanding fines (`my_fines.php`, `pay.php`)
- Submit feedback
- Update profile photo and password

## Tech Stack

- **Backend:** PHP (procedural, mysqli)
- **Database:** MySQL / MariaDB
- **Frontend:** HTML, CSS, JavaScript
- **Auth:** Session-based login with hashed passwords (`hashing_password.php`)

## Database Schema

The database (`library.sql`) includes the following tables:

`admin`, `books`, `borrow_records`, `categories`, `feedback`, `fines`,
`issues`, `members`, `notifications`, `payments`, `reservations`, `users`

An entity-relationship diagram is included in the repo for reference.

## Project Structure

```
├── BooksCategory/     # Category CRUD
├── Fines/             # Fine generation, listing, updates
├── books/             # Book CRUD and viewing
├── borrow/            # Borrow/return workflow
├── config/            # DB connection and auth
├── dashboard/         # Admin and member dashboards
├── feedbacks/         # Feedback CRUD
├── issues/            # Book issue tracking
├── members/           # Member CRUD
├── payments/          # Payment handling
├── reservation/       # Reservation workflow
├── img/, css/         # Static assets
├── login.php, register.php, logout.php
├── update_password.php, changePhoto.php
├── hashing_password.php
├── member_guard.php   # Access control for member-only pages
├── library.sql        # Database schema
└── index.php          # Entry point
```

## Setup

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   ```

2. **Set up the database**
   - Create a MySQL database named `library`
   - Import `library.sql` into it (e.g. via phpMyAdmin or the MySQL CLI):
     ```bash
     mysql -u root -p library < library.sql
     ```

3. **Configure the database connection**
   - Open `config/db.php` and update `$user` / `$pass` to match your local
     MySQL setup if different from the defaults.

4. **Run with a local PHP server** (e.g. XAMPP, WAMP, or PHP's built-in server)
   ```bash
   php -S localhost:8000
   ```
   Or place the project folder inside your XAMPP/WAMP `htdocs` directory and
   visit it through `http://localhost/Library-Management`.

5. Open the app in your browser and register a new member account, or use
   the admin credentials set up in your `admin` table.

## What I Learned

This project gave me practical experience with CRUD operations, relational
databases, SQL queries, authentication, database relationships, and
real-world application workflows.

## License

This project was built for academic purposes as part of my studies.
