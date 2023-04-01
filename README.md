# viyukta

Viyukta means offline in Sanskrit.

This app was developed to transfer public finance data of Yemen to central database without using internet.

## Tech Stack

- App Development: Flutter
- Data Serialization: ProtoBuf, JSON
- Data Encryption: AES algorithm

## Demo

[![Demo](https://img.youtube.com/vi/HybwjlJrkDM/0.jpg)](https://www.youtube.com/watch?v=HybwjlJrkDM)

## Screenshots

![Viyukta App Screenshots](/assets/images/screenshots/viyukta-app-screeenshots.png)

## Advantages

- Output size is very small as it is serialized using ProtoBuf.
- Data is encrypted using AES algorithm.

## How to Install

- Install Flutter SDK on your machine.
- Download VS Code, then install Flutter & Dart extensions.
- Fork this repo.
- Clone your forked repo.
- First, Run "flutter pub get" (in terminal) in the project directory to install dependencies.
- Run "flutter run" (in terminal) [OR] press F5 to run the app on your device or emulator.

## How we can implement?

We can implement this prototype by the below steps,

1. Get proper requirement details.
2. Fine tune app frontend with the final requirements & build ProtoBuf schema(.proto) file.
3. Build server which receives SMS from this number, authorizes this number and saves it on central database.
4. Build a service where the server dashboard generates unique secret key for each device while registering.
5. Update the frontend of the server.

## How we can improve?
