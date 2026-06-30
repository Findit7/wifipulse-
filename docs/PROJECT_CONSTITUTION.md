# WiFiPulse Project Constitution v1.0

## Purpose

WiFiPulse is a premium Flutter application for monitoring, analyzing, and securing home Wi-Fi networks.

This document defines the permanent engineering, architecture, and quality rules that every future implementation must follow.

These rules override any conflicting implementation decisions.

---

# Core Principles

WiFiPulse must be developed as a production-quality application.

Priorities:

1. Stability
2. Maintainability
3. Scalability
4. Performance
5. Beautiful UX
6. Security

Never sacrifice architecture for speed.

---

# Technology Stack

Flutter (latest stable)

Riverpod

Clean Architecture

Repository Pattern

GoRouter

Material 3

Firebase

SQLite

Freezed

Build Runner

JSON Serializable

---

# Architecture Rules

Never create duplicate modules.

Never overwrite unrelated code.

Every feature must follow:

Feature
→ Domain
→ Data
→ Presentation

Every feature must remain isolated.

---

# Folder Structure

Follow feature-first architecture.

Every feature contains:

data/

domain/

presentation/

Widgets remain inside their feature.

Shared widgets go inside core/.

---

# Coding Rules

Always write production-ready code.

No temporary hacks.

No commented dead code.

No duplicated business logic.

No magic numbers.

No unnecessary dependencies.

Always prefer reusable components.

---

# UI Principles

Material 3 only.

Premium appearance.

Consistent spacing.

Rounded corners.

Smooth animations.

Responsive layout.

Light and dark themes.

Accessibility first.

---

# Navigation Rules

GoRouter only.

No Navigator.push.

Routes remain centralized.

Deep linking ready.

---

# State Management

Riverpod only.

Business logic never inside widgets.

Providers remain feature scoped.

---

# Error Handling

Every async call must handle:

Loading

Success

Failure

Retry

Offline

---

# Performance

Cold startup under 2 seconds.

Smooth 60 FPS animations.

Avoid unnecessary rebuilds.

Lazy loading where possible.

---

# Security

Never store passwords.

Use Secure Storage.

Follow least-privilege permissions.

Validate all inputs.

Protect sensitive data.

---

# Git Rules

Small commits.

One feature per commit.

Meaningful commit messages.

Push only after successful analysis.

---

# Mandatory Verification

Before completing any task always run:

flutter pub get

dart run build_runner build --delete-conflicting-outputs

dart analyze

Fix every compiler error before finishing.

---

# Completion Report

Every completed implementation must end with:

Files created

Files modified

Commands executed

Build status

Known limitations

Next recommended sprint

---

# Future Development

Every future sprint must reference this constitution.

If a prompt conflicts with this document, this document takes precedence.
