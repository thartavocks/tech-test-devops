# Monitoring & Alerting Setup

## Overview

This document describes the monitoring and alerting configuration
for the Cloud Run application.

Prometheus is used to monitor application availability through the
`/healthz` endpoint. Alerting is configured using Prometheus Alert Rules,
and notifications are sent through Alertmanager.

## Monitoring Flow

```text
Cloud Run Application
        |
        v
GET /healthz Endpoint
        |
        v
Prometheus HTTP Probe
        |
        v
Prometheus Alert Rule
        |
        v
Alertmanager
        |
        v
Email / Slack Notification
```

## Prometheus Alert Rule

The following rule triggers an alert when the application health endpoint
is unavailable for 5 consecutive minutes.

```yaml
groups:
  - name: application-alerts

    rules:
      - alert: CloudRunApplicationDown

        expr: probe_success{job="cloud-run-health-check"} == 0

        for: 5m

        labels:
          severity: critical

        annotations:
          summary: "Cloud Run application is down"

          description: >
            The /healthz endpoint has failed health checks
            for more than 5 minutes.
```

## Alert Condition

The alert will be triggered when:

```text
Condition:
probe_success == 0

Duration:
5 minutes
```

The alert indicates that:

- The application health endpoint is unreachable.
- The endpoint does not return HTTP 200 response.
- The failure continues for 5 consecutive minutes.

## Notification Setup

Alertmanager is configured to forward alerts to notification channels:

- Email
- Slack

Example notification:

```text
Alert Name:
CloudRunApplicationDown

Severity:
Critical

Status:
FIRING

Description:
Health endpoint /healthz is not responding with HTTP 200.
```

## Recovery

When the application becomes healthy again:

```text
GET /healthz

Response:
HTTP 200 OK
```

Prometheus will automatically resolve the alert and Alertmanager will send
a recovery notification.