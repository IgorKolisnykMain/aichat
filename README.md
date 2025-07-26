# aichat

A pet project with riverpod arch + firebase auth and firestore

## Architecture

The project follows Clean Architecture principles with clear separation of concerns:

![Architecture Diagram](architecture.png)

- **Presentation Layer**: Widgets, States, and Controllers (Riverpod)
- **Application Layer**: Services for business logic coordination  
- **Domain Layer**: Core business models and entities
- **Data Layer**: Repositories, DTOs, and Data Sources (Firebase)

## Automated Testing

The project includes comprehensive test coverage:

- **Unit Tests**: Testing business logic and data layer components
- **Widget Tests**: Testing UI components and interactions
- **Golden Tests**: Visual regression testing for UI consistency
- **Integration Tests**: End-to-end testing of complete user flows
