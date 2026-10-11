# Intelligent Wellness and Fitness Center (IWFC)

Java Swing GUI prototype for CMP 7001 Advanced Programming PRAC 1.

## Implemented assignment requirements

- Equipment inventory: add, edit, deactivate, status/location tracking
- Cumulative equipment usage hours and preventive-maintenance alert
- Session scheduling and member bookings
- Double-booking prevention for studios/equipment
- Optional enhancement: recurring weekly sessions
- Maintenance fault reporting with urgency/status workflow
- Automatic maintenance-status notifications
- Administrator-only global maintenance log
- Java Collections (`ArrayList`, `HashMap`)
- Generic class (`DataStore<T>`)
- OOP: abstraction, encapsulation, inheritance, polymorphism
- Creational pattern: Factory (`EquipmentFactory`)
- Structural pattern: Facade (`IWFCFacade`)
- Behavioural pattern: Observer (`NotificationObserver` + `MaintenanceRequest`)
- Custom exceptions:
  - `InvalidBookingException`
  - `UnauthorizedAccessException`
  - `DuplicateDataException`
- JUnit 5 tests
- Swing graphical interface with role-aware functions
- No database required

## Requirements

- JDK 17+
- Maven 3.9+

## Run

```bash
mvn clean test
mvn package
java -cp target/classes com.iwfc.ui.IWFCGui
```

You can also import the folder directly into IntelliJ IDEA or Eclipse as a Maven project.

## Design patterns

### Factory
`EquipmentFactory` centralizes Equipment object creation.

### Facade
`IWFCFacade` exposes a simplified interface over equipment, booking, and maintenance services.

### Observer
`MaintenanceRequest` notifies registered `NotificationObserver` objects whenever its status changes.

## OOP examples

- **Abstraction**: `User` is abstract.
- **Inheritance**: `Administrator`, `Instructor`, and `Member` extend `User`.
- **Encapsulation**: fields are private and modified through validated methods.
- **Polymorphism**: different `User` subclasses are handled through the common `User` type.

## Intentional failure demonstration

`IWFCServiceTest` contains:
1. Passing tests that verify invalid operations throw the required custom exceptions.
2. A deliberately failing example marked `@Disabled`, so the normal Maven build remains green while still providing an intentional-failure demonstration for the report/presentation.

Remove `@Disabled` temporarily if you need a screenshot of the deliberate failure.

## Class-count note

The implementation contains exactly **15 classes**, meeting the brief's requested range of 10–15 well-structured classes.
Enums and the Observer interface are supporting Java types rather than additional classes.

## Swing GUI version

A simple desktop GUI has been added at:

`src/main/java/com/iwfc/ui/IWFCGui.java`

### IntelliJ IDEA

1. Open the whole `iwfc-java-prototype` folder.
2. Wait for IntelliJ to index the project.
3. Open `src/main/java/com/iwfc/ui/IWFCGui.java`.
4. Click the green Run icon beside `main()`.
5. Choose **Administrator**, **Instructor**, or **Member** when the role-selection dialog appears.

### Windows quick launcher

If JDK 17+ is installed and `javac` is on PATH, double-click:

`run-gui.bat`

It compiles only `src/main/java` and launches the Swing application; Maven is not required for this launcher.

### GUI role permissions

- **Administrator**: add/edit/deactivate equipment, record usage, view/assign/complete maintenance requests.
- **Instructor**: record equipment usage, schedule one-off or recurring weekly sessions, report maintenance issues.
- **Member**: view sessions and book a selected session.

Use **Switch Role** in the application header to demonstrate authorization and polymorphism during the presentation.
