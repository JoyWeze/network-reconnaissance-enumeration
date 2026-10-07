# Network Reconnaissance & Service Enumeration Report

## 1. Objective

The objective of this project was to perform network reconnaissance
against a controlled local Kali Linux environment, identify exposed
network ports and services, and document the security implications
of the findings.

## 2. Target

Target: 127.0.0.1 (local Kali Linux host)

The target was owned and controlled by the analyst.

## 3. Tools

- Nmap
- Bash
- Python HTTP Server
- curl
- ss

## 4. Reconnaissance Results

### Initial TCP Scan

The default Nmap scan checked the 1,000 most common TCP ports.

Result:

- Host was reachable.
- All 1,000 scanned TCP ports were closed.
- No network services were initially exposed.

### Full TCP Scan

A full TCP scan was performed against ports 1–65,535.

Result:

- All 65,535 TCP ports were initially closed.
- No TCP services were initially identified.

### UDP Scan

The 20 most common UDP ports were examined.

Result:

- All 20 scanned UDP ports were closed.
- No common UDP services were identified.

## 5. Controlled Service Deployment

A temporary Python HTTP server was started on TCP port 8000
to create a controlled service for enumeration.

Command:

python3 -m http.server 8000

After deployment, Nmap identified:

- TCP/8000 as open
- HTTP service associated with the port

## 6. Service Enumeration

Service/version detection was performed against TCP port 8000.

The investigation also used Nmap's default NSE scripts to gather
additional information about the HTTP service.

## 7. HTTP Exposure

The HTTP service was queried locally using curl.

The investigation assessed what content the service exposed and
whether directory listing information was available.

## 8. Security Interpretation

The initial scans demonstrated a host with no exposed TCP services
among the tested ports.

The temporary HTTP service demonstrated how introducing a network
service changes the host's attack surface.

An open port is not inherently a vulnerability. However, every
network-facing service should be reviewed to determine:

- Whether it is necessary
- Who can reach it
- What information it exposes
- Whether it is appropriately configured
- Whether the software is maintained and patched

The Python HTTP server was intentionally created for this lab and
was not treated as evidence of a vulnerability in the underlying
Kali system.

## 9. Key Finding

The most important observation was the change in network exposure
before and after the controlled HTTP service was started.

Before deployment:

- 65,535 TCP ports closed.

After deployment:

- TCP/8000 became open.
- Nmap identified an HTTP service.

This demonstrated the relationship between running services and
network attack surface.

## 10. Automation

A Bash script was created to automate:

- Basic TCP scanning
- Service/version detection
- Full TCP scanning
- Common UDP scanning
- HTTP service enumeration

## 11. Recommendations

1. Disable unnecessary network services.
2. Restrict services to required interfaces where appropriate.
3. Review what information exposed services make available.
4. Keep network-facing software updated.
5. Periodically scan systems to identify unexpected services.

## 12. Conclusion

This project demonstrated a basic security reconnaissance workflow
using Nmap and Bash in a controlled Linux environment.

The exercise progressed from host and port discovery to service
enumeration, HTTP investigation, evidence collection, and
automation.
