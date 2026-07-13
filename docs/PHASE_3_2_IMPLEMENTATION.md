# Phase 3.2: Network Usage Analytics Engine Implementation

## Architecture
The Usage Analytics module is built upon the existing clean architecture pattern implemented in WiFiPulse. It relies heavily on local persistence using the Drift database (SQLite) for offline-first analytics and privacy-first data handling.

### Layers:
1. **Domain Layer**: Contains the core business entities (`UsageEntity`, `UsageSummary`, `UsageForecast`, `TopDevice`, `DailyUsage`, `WeeklyUsage`, `MonthlyUsage`), use cases for retrieving and aggregating data, and the `UsageRepository` interface.
2. **Data Layer**: 
    - **`UsageRepositoryImpl`**: Implements the repository interface.
    - **`UsageAnalyticsDao`**: Handles direct queries to the `UsageAnalytics` table in the Drift database.
    - **`AnalyticsEngine`**: Contains algorithms to calculate averages, totals, peak hours, top bandwidth consumers, and trend aggregations.
    - **`ForecastEngine`**: Provides a simple, non-AI based prediction model for extrapolating daily/monthly usage and predicting upcoming peak traffic hours.
    - **`UsageDataCollectionService`**: A background service (currently implemented as a simulation/mock generator) that generates network traffic events periodically.
3. **Presentation Layer**: 
    - State is managed via Riverpod (`usage_provider.dart`), using ticker-based streams to refresh the dashboard in real-time.
    - UI components (`UsageScreen`, `UsageOverviewCard`, `UsageCharts`, `ForecastCard`, `TopDevicesCard`) visualize the data using `fl_chart`.

## Folder Structure
```
lib/features/usage/
├── data/
│   ├── engines/
│   │   ├── analytics_engine.dart
│   │   └── forecast_engine.dart
│   ├── repositories/
│   │   └── usage_repository_impl.dart
│   └── services/
│       └── usage_collection_service.dart
├── domain/
│   ├── entities/
│   │   ├── usage_aggregates.dart
│   │   └── usage_entity.dart
│   ├── repositories/
│   │   └── usage_repository.dart
│   └── usecases/
│       ├── export_usage_usecase.dart
│       ├── get_forecast_usecase.dart
│       ├── get_trends_usecase.dart
│       └── get_usage_summary_usecase.dart
└── presentation/
    ├── providers/
    │   └── usage_provider.dart
    ├── screens/
    │   └── usage_screen.dart
    └── widgets/
        ├── export_button.dart
        ├── forecast_card.dart
        ├── top_devices_card.dart
        ├── usage_charts.dart
        └── usage_overview_card.dart
```

## Public Classes
- `UsageEntity`: The raw data representation of a network usage event.
- `UsageSummary`: Aggregated object representing totals across a specific timeframe.
- `UsageForecast`: Aggregated object containing AI/algorithmic predictions.
- `UsageDataCollectionService`: The service responsible for generating/polling data.
- `AnalyticsEngine`: Pure Dart class handling aggregation logic (e.g. `calculateSummary()`, `calculateDailyTrends()`).
- `ForecastEngine`: Pure Dart class handling extrapolation (`generateForecast()`).
- `UsageScreen`: The main entrypoint widget for the Analytics tab.

## Data Flow
1. **Collection**: `UsageDataCollectionService` generates `UsageAnalyticsCompanion` objects and inserts them via `UsageAnalyticsDao` every 30 seconds.
2. **Retrieval**: UI triggers Riverpod providers (`usageSummaryProvider`, `dailyTrendsProvider`), which call Use Cases.
3. **Aggregation**: Use Cases call the `UsageRepositoryImpl`, which fetches raw entries from the database and passes them to `AnalyticsEngine` and `ForecastEngine` for aggregation.
4. **Presentation**: The resulting aggregate objects are returned to Riverpod and injected into the presentation layer components.

## Known Android Limitations
- Flutter currently has no straightforward out-of-the-box plugin to interact with Android's `NetworkStatsManager` API.
- True per-device local network tracking (i.e. capturing exactly what another device on the same WiFi network is downloading/uploading) requires router-level integration or deep packet inspection (ARP spoofing), which is generally blocked on modern Android architectures without root access.
- As such, the current `UsageDataCollectionService` simulates traffic generation for testing and UI completeness. To function in a real-world scenario, this service must be wired up either to a router admin API, an SNMP polling mechanism, or Android's limited per-app `TrafficStats`.

## Extension Points
- **True Network Capture**: Replace the logic inside `UsageDataCollectionService._simulateDataCollection()` with real SNMP traps, custom router API calls (e.g. DD-WRT, pfSense), or `MethodChannel` integrations with Android's `TrafficStats`.
- **Advanced AI Forecast**: Currently, `ForecastEngine` uses simple moving averages and extrapolation. This can be extended by passing the data payload to a local TFLite model or remote API for rigorous predictive analysis.
