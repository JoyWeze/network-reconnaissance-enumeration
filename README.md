# Network Reconnaissance & Service Enumeration

## Overview

A hands-on cybersecurity project demonstrating network
reconnaissance, port scanning, service enumeration, HTTP
investigation, and Bash automation using Nmap in a controlled
Kali Linux environment.

## Objectives

- Identify exposed TCP ports
- Investigate common UDP ports
- Perform service/version detection
- Enumerate an HTTP service
- Collect and preserve scan evidence
- Automate reconnaissance with Bash
- Interpret findings from a security perspective

## Environment

- Kali Linux
- Nmap
- Bash
- Python HTTP Server
- curl

## Methodology

The assessment began with reconnaissance of the local Kali Linux
host using Nmap.

The default TCP scan found no open ports among the 1,000 most
common ports.

A full TCP scan was then performed across all 65,535 TCP ports,
which also found no open ports.

The 20 most common UDP ports were subsequently examined and were
also closed.

To demonstrate service discovery in a controlled environment, a
temporary Python HTTP server was started on TCP port 8000.

Nmap subsequently detected the open port and identified the HTTP
service. Service/version detection and Nmap scripting were then
used to gather additional information.

## Key Findings

- Initial TCP attack surface: no open TCP ports detected.
- Full TCP scan: 65,535 ports scanned and closed.
- Common UDP scan: no open ports detected.
- Controlled HTTP service: TCP/8000 detected as open.
- Service enumeration successfully identified the HTTP service.

## Automation

The `run-recon.sh` Bash script automates the main reconnaissance
steps and stores the resulting scan evidence in the `scans/`
directory.

## Security Lessons

An open port does not automatically indicate a vulnerability.

However, every exposed service increases the potential attack
surface and should be investigated to determine whether it is
necessary, properly configured, and appropriately secured.

## Skills Demonstrated

- Nmap
- Network reconnaissance
- TCP/UDP port scanning
- Service enumeration
- HTTP enumeration
- Linux command line
- Bash scripting
- Security analysis
- Evidence collection
- Technical documentation
