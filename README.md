# SAVVY — Smart Meal Planning & Delivery Platform

**SAVVY** is a centralized digital platform that empowers individuals, families, and companies to plan, customize, and receive meals from a variety of existing restaurants — all in one seamless experience. By integrating with multiple food providers, SAVVY allows users to maintain dietary goals, manage time, and enjoy culinary variety without the hassle.

---

##  Project Status: MVP in Progress

We are currently developing the Minimum Viable Product (MVP) of SAVVY, which includes:
* Partner restaurant integration (menu syncing)
* Personalized meal planning engine
* Smart scheduling system (calendar-based)
* M-Pesa integration for payments
* Basic web app interface for user orders & admin tracking

---

##  Core Features

| Feature                  | Description                                                                  |
| :----------------------- | :--------------------------------------------------------------------------- |
|  Smart Meal Planning   | Tailor meals by preferences, dietary needs, allergies, and fitness goals     |
|  Multi-Restaurant Access | Users can order from different restaurants within a single meal plan         |
|  Weekly Scheduling     | Plan meals ahead of time via a calendar interface                            |
|  Seamless Payments     | Integrated with M-Pesa for easy checkouts                                    |
|  Order Tracking        | Real-time updates for preparation and delivery statuses                      |
|  Analytics for Partners | Restaurants receive demand insights to optimize menus and prep               |

---

## Target Users

* Busy professionals & students needing healthy, time-saving options
* Fitness enthusiasts with tailored nutritional goals
* Families seeking flexible, affordable meal routines
* Restaurants looking to expand reach & revenue without owning delivery tech

---

##  Tech Stack

Frontend (User & Admin Interface)
We are adopting a single codebase approach to cover both the Web POC and the future mobile applications.

Component	Technology	Rationale
Language	Dart	Fast, efficient, and the native language of Flutter.
Framework	Flutter	Enables building high-performance, natively compiled apps for Web, iOS, and Android from a single codebase.
State Management	Riverpod	Recommended for robust, scalable state management, supporting complex features like the Meal Planning Engine.

Export to Sheets
Backend (API & Data)
The backend is structured to handle API calls, complex meal planning logic, and external integrations reliably.

Component	Technology	Rationale
API/Logic	Dart (Shelf/Aqueduct) or Python (FastAPI/Django)	Recommended to maintain language consistency (Full-Stack Dart) or leverage team expertise in Python for backend development.
Database	PostgreSQL	Ideal for handling structured data like user profiles, payment records, and menu details, ensuring data integrity.
Cloud Hosting	Google Cloud Platform (GCP) or AWS	Provides the necessary scalability and serverless options (e.g., Cloud Run) to manage fluctuating order demand.

Export to Sheets
Core Integrations
Integration	Purpose
M-Pesa API	Seamless, secure checkout process for users.
API Gateway	Normalizing and securing menu data pulled from diverse partner restaurant systems.
Google Calendar API	Facilitating the Smart Scheduling System for meal planning.
---

##  My Contribution

* Led the conceptualization and platform design for SAVVY, focusing on user experience and restaurant integration.
* Developed initial wireframes and core features for the web app interface, including meal planning and scheduling components.
* Researched and outlined the technical specifications for M-Pesa API integration and multi-restaurant menu syncing.
* Contributed to defining the MVP scope and future roadmap, aligning with user needs and market opportunities.

---

###  Testing & MVP Limitations

* **Meal Plan Logic:** Currently rule-based; future plans include ML-driven suggestions.
* **Restaurant Onboarding:** Manual process via admin panel in the MVP.
* **Platform Scope:** Limited to web only in the MVP phase; mobile apps are a roadmap item.
* **Delivery Area:** MVP scope is focused on Nairobi.

---

## 🗺 Roadmap

* Implement AI-powered meal suggestions based on user history and preferences.
* Develop a robust user ratings and preferences learning engine.
* Expand to multi-city operations and streamline delivery partner onboarding.
* Build native mobile applications for both customers and restaurant partners.
* Develop APIs for third-party health & fitness integrations.

---

##  Partner With Us

Are you a restaurant or food brand? Join the SAVVY platform to reach new customers, streamline deliveries, and be part of the smart eating revolution.

 **Email:** mwende.curtis@gmail.com

---

##  License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

##  Acknowledgements

* Restaurant partners helping test the integration pipeline.
* Early users providing valuable meal planning feedback.
* The Open Source and developer communities for powering innovation.
