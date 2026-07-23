# Theoretical Questions

## 1. What are the main differences between Cloud Run, Compute Engine, and GKE in GCP?

Cloud Run is a serverless platform for running containerized applications without managing the infrastructure, with auto scaling based on incoming traffic. Compute Engine provides full control of virtual machines, making it suitable for legacy applications or workloads that require custom operating system and network configurations. GKE is a managed Kubernetes service designed for container orchestration, making it ideal for microservices and complex deployments. I would choose Cloud Run for simple containerized applications, Compute Engine when I need full infrastructure control, and GKE for applications that require Kubernetes features such as auto-healing, rolling updates, and advanced scaling.

---

## 2. Explain the concept of Infrastructure as Code (IaC) and its main benefits.

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure using code instead of manual configuration. It ensures infrastructure can be created consistently across different environments while reducing configuration drift. IaC also makes infrastructure changes easier to track and review using version control. Another key benefit is faster provisioning with fewer manual errors. I prefer Terraform because it makes infrastructure provisioning more consistent and reduces manual configuration.

---

## 3. How would you configure IAM roles & policies to ensure secure CI/CD deployment in GCP?

I would create a dedicated Service Account for the CI/CD pipeline and assign only the minimum IAM roles required to deploy the application, following the principle of least privilege. Sensitive credentials should be stored securely using a secret management solution or the CI/CD platform's credential store instead of being hardcoded. I would also separate permissions between deployment and administration tasks to reduce security risks. Finally, I would regularly review IAM roles and remove any unnecessary permissions.

---

## 4. If an application in Cloud Run frequently experiences latency spikes during autoscaling, what troubleshooting steps would you take?

I would first check Cloud Monitoring and Cloud Logging to identify when the latency spikes occur and whether they are related to autoscaling events. Then, I would review the application's startup time, CPU and memory utilization, and Cloud Run concurrency settings. If cold starts are the main cause, I would consider increasing the minimum number of instances to keep some containers warm. I would also check database connectivity and application logs to identify any bottlenecks during startup or request processing. Finally, I would monitor the changes to confirm that the latency has improved.

---

## 5. What is the difference between monitoring and logging, and how would you integrate both in GCP?

Monitoring is used to track the health and performance of an application through metrics such as CPU, memory usage, latency, and uptime. Logging records detailed application and system events that help diagnose errors and troubleshoot issues. In GCP, I would use Cloud Monitoring to collect metrics and configure alerts, while Cloud Logging would be used to store and analyze application logs. I would integrate both by linking monitoring alerts to the related logs, making it easier to identify the root cause of an issue. This approach provides both real-time visibility and detailed information for troubleshooting.