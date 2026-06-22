# DYSIN — Dispensing & Field Service Management Tool

DYSIN is a web application for managing customers, machines, field-visit plans, and service/installation reporting. It combines a **React** single-page frontend with a **PHP (PDO + JWT)** REST backend backed by a **MySQL** database, and is designed to run on a standard XAMPP stack.

## Features

- **Authentication & Authorization** — JWT-based login with user roles and role-to-menu permission mapping.
- **Master Data** — Customers, suppliers, products & product categories, business lines, teams, departments, designations, and users.
- **Machine Management** — Machines, machine parts, models, and serials.
- **Field Operations** — Visit plans, customer visit punch ledger & summary, local conveyance, and conveyance reports.
- **Service Reporting** — Machinery service reports and machinery installation reports.
- **Reporting & Export** — PDF generation via TCPDF and Excel export via PhpSpreadsheet.
- **Auditing** — Audit logs and error logs.
- **Internationalization** — Multi-language support (English / French) via i18next.
- **Dashboard** — Charts and KPIs powered by Highcharts.

## Tech Stack

| Layer     | Technology |
| --------- | ---------- |
| Frontend  | React 16, React Router 5, Material-UI 4, Reactstrap, Highcharts, i18next |
| Backend   | PHP 7.4, PDO, JWT |
| Database  | MySQL / MariaDB |
| Reporting | TCPDF (PDF), PhpSpreadsheet (Excel) |
| Server    | Apache (XAMPP) |

## Project Structure

```
dysin/
├── backend/              # PHP REST API
│   ├── source/           # API entry points, routes, JWT, middlewares
│   │   ├── api/          # API pages, languages, PDO libraries
│   │   └── v1/           # Versioned API pages
│   ├── report/           # TCPDF + PhpSpreadsheet libraries
│   ├── upload/           # Uploaded files
│   ├── env.php           # Backend DB/site configuration
│   └── env_for_web.php   # Web environment configuration
├── src/                  # React frontend
│   ├── actions/          # API action helpers
│   ├── components/       # Reusable UI (tables, headers, navbars, controls)
│   ├── context/          # React context providers (user info)
│   ├── locales/          # i18n translations (en, fr)
│   ├── services/         # API service layer
│   ├── views/            # Pages / screens
│   ├── i18n.js           # i18next setup
│   └── index.js          # App entry + routes
├── public/               # Static assets and HTML template
├── Database/             # Database backups (zipped SQL dumps)
├── databasebackup/       # Backup scripts
├── .env                  # Frontend environment configuration
└── package.json
```

## Prerequisites

- [XAMPP](https://www.apachefriends.org/) with **PHP 7.4** and **MySQL/MariaDB**
- [Node.js](https://nodejs.org/) (v14+ recommended) and npm

## Setup

### 1. Clone into the XAMPP web root

Place the project in your XAMPP `htdocs` directory so it is served under `/dysin`:

```
D:\xampp_74\htdocs\dysin
```

### 2. Database

1. Open **phpMyAdmin** and create a database named `dysin_db`.
2. Import the latest SQL dump from the `Database/` folder (unzip it first).
3. Update the database credentials in `backend/env.php` if they differ from the defaults:

```php
define("DB_NAME", "dysin_db");
define("DB_USER", "root");
define("DB_PASSWORD", "");
define("DB_SERVER", "localhost");
```

### 3. Backend configuration

The backend is served directly by Apache from `backend/`. Verify the URLs in the frontend `.env` match your local setup:

```
REACT_APP_BASE_NAME=/dysin
REACT_APP_API_URL=http://localhost/dysin/backend/
REACT_APP_FRONT_URL=http://localhost/dysin/
```

> Set `loginonlyadmin` to `1` in `backend/env.php` to enable maintenance mode, or `0` for production.

### 4. Frontend

Install dependencies and start the development server:

```bash
npm install
npm start
```

## Available Scripts

| Command | Description |
| ------- | ----------- |
| `npm start` | Run the app in development mode |
| `npm run build` | Build the production bundle |
| `npm test` | Run tests |
| `npm run compile-sass` | Compile SCSS to CSS |
| `npm run minify-sass` | Compile and minify SCSS |

## Production Build

```bash
npm run build
```

The optimized output is generated in the `build/` directory. Deploy it together with the `backend/` folder under the Apache web root.

## License

Proprietary — for internal use. All rights reserved.
