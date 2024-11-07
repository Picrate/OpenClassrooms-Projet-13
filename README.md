[![forthebadge](https://forthebadge.com/images/badges/made-with-typescript.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/made-with-java.png)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/build-with-spring.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/code-it-test-it-break-it.svg)](https://forthebadge.com)

# Angular Spring WebSocket Chatboard POC
This is a prove of concept for a instant chatboard made with Angular, Spring and WebSockets.

## 🔥Features

- Login
- Chat

# Requirements
## Frontend
- [NodeJS](https://nodejs.org/en)
## Backend
- [Java jdk](https://www.oracle.com/en/java/technologies/downloads/) >= v.17

# Technologies

## Frontend

- NodeJS v.20.18.0
- npm v.10.8.2
- Angular v.18
- RxJs v.7.8.0
- rx-stomp v2.0.0
- primeflex v.3.3.1
- primeicons v.7.0.0
- primeng v.17.18.11

## Backend

- Java jdk >= v.17
- Gradle
- Spring boot v.3.3.5
- spring-boot-starter-actuator
- spring-boot-starter-websocket
- Lombok

# Authors

- Coder : [Patrice](https://github.com/Picrate)

# 🧬 Installing and running

## Running locally for development

To install locally, you must first clone the repository.
```shell
git clone https://github.com/Picrate/OpenClassrooms-Projet-13.git
```

## Backend
cd to 'back' directory and run
```bash
./gradlew bootRun
```
It will launch chatserver on ws://localhost:8080

## Frontend
The frontend project is located at 'front' directory.
### Installation
To build and run this project, NodeJS is required on you computer.
- In a terminal located in the front directory:
```bash
npm install
```
It will download all required dependencies.
### Running in developpement mode
In a Terminal under the front directory:
```bash
ng serve
```
It will launch frontend project in http://localhost:4200

connect to app with any username

