# Kubernetes Monitoring for Capabilities

- [Kubernetes Monitoring for Capabilities](#kubernetes-monitoring-for-capabilities)
  - [To do](#to-do)
  - [Installation](#installation)
    - [Pre-requisites](#pre-requisites)
    - [Preparing variables](#preparing-variables)
    - [Deploying Grafana](#deploying-grafana)
      - [PowerShell](#powershell)
      - [Bash](#bash)

## To do

- [x] Description on how to export dashboards, and import as configmaps
- [ ] How to enable scraping of capability apps metrics
- [ ] Review sample dashboards (Rasmus)
- [x] Update deployment script to use token replacement
- [x] Make PowerShell deployment script
- [x] Revise /README.md
- [x] Revise /grafana/README.md
- [ ] Create "How to get Slack Webhook URL" guide (Stanley)

## Installation

### Pre-requisites

Before you can install Grafana into your Kubernetes namespace through Helm, you must first:

- Install the Helm client on your deployment machine
- Install Tiller into your Kubernetes namespace
- Git installed on your deployment machine
- PowerShell or Bash installed on your deployment machine

For Helm and Tiller, guide can be found in the [DFDS Helm Playbook.](https://playbooks.dfds.cloud/kubernetes/helm.html)

First, you must clone repository onto your deployment machine:

1. `git clone https://github.com/dfds/k8s-monitoring.git`
2. `cd k8s-monitoring`

### Preparing variables

The deployment scripts requires that you supply 4 parameters:

`NAMESPACE`: The Kubernetes namespace of you will be deploying Grafana into.

`SLACK_CHANNEL`: The handle of the slack channel you wish to receive alerting into. By default we suggest your capability slack channel.

`SLACK_URL`: The token URL used for creating webhooks into your slack channel, used for alerting. A guide on how to get the URL for your slack channel can be found here:

`ADMIN_PASSWORD`: The administrator password you want for your Grafana deployment, this will be saved as a secret in your kubernetes namespace.

### Deploying Grafana

#### PowerShell

Execute the script, giving it parameters like the example below:

```powershell
./deploy-grafana.ps1 -NAMESPACE 'capabilitynamespace-xyzvw' `
-SLACK_CHANNEL 'channelname' `
-SLACK_URL 'https://hooks.slack.com/services/XXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZZZZZZZZZZZ' `
-ADMIN_PASSWORD 'GrafanaAdminPassword'
```

#### Bash

Before running the script file, make sure it has been given execution rights `chmod +x ./deploy-grafana.sh`

Then execute the script giving it parameters like the example below:

```bash
NAMESPACE="capabilitynamespace-xyzvw" \
SLACK_CHANNEL="channelname" \
SLACK_URL="https://hooks.slack.com/services/XXXXXXXXX/YYYYYYYYY/ZZZZZZZZZZZZZZZZZZZZZZZZ" \
ADMIN_PASSWORD="GrafanaAdminPassword" \
./deploy-grafana.sh
```
