# 🧩 SOAP API Demo — SwiftUI + Clean Architecture

[![Swift Version](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)]()
[![Architecture](https://img.shields.io/badge/architecture-Clean%20Architecture-success.svg)]()
[![License](https://img.shields.io/badge/license-MIT-lightgrey.svg)]()
[![Build](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

---

## 🚀 Overview

This project demonstrates how to **consume SOAP APIs** in a modern iOS application using **SwiftUI**, **async/await**, and **Clean Architecture** principles.  
It connects to a public SOAP service to **convert numbers into words** and showcases how to structure your app for scalability, testability, and clarity.

---

## 🧱 Tech Stack

| Layer | Technology / Pattern |
|--------|----------------------|
| **Language** | Swift 5.9 |
| **UI Framework** | SwiftUI |
| **Concurrency** | async / await |
| **Architecture** | Clean Architecture (Presentation / Domain / Data) |
| **Networking** | URLSession + SOAP XML Body |
| **Testing** | XCTest (Unit Tests + UI Tests) |

---

## 🧩 Architecture

This project follows **Clean Architecture**, ensuring a clear separation of concerns:



### 🧠 Layers Description

| Layer | Responsibility |
|--------|----------------|
| **Data** | Handles SOAP networking, XML parsing, and data mapping |
| **Domain** | Defines models and use-case contracts |
| **Presentation** | SwiftUI views and MVVM view models |
| **Tests** | Unit + UI automation tests |

---

## 📱 Features

- 🔹 SOAP API integration using raw XML envelopes  
- 🔹 SwiftUI interface with modern async/await concurrency  
- 🔹 Clean Architecture structure for scalability  
- 🔹 Unit tests for logic and API calls  
- 🔹 UI tests for full end-to-end flow  

---

## 🧪 Testing

### ✅ Unit Tests
Run tests for business logic and SOAP networking:
```bash
⌘ + U
```
# 🧑‍💻 Author

**iSlam AbdelAziz**  
Senior iOS Engineer — Cross Function Squad Lead.  

🔗 [LinkedIn](https://www.linkedin.com/in/islamabdel-aziz/) · [GitHub](https://github.com/IslamAbdelAziz)
