---
layout: single
title: "E4S Contribution Guide"
permalink: /contribution-guide/
classes: wide
sidebar:
  nav: "joinmenu"
---

E4S (Ecosystem for Science) is a community-driven, open-source software ecosystem that provides a curated collection of interoperable scientific libraries, tools, and frameworks. Contributing your software to E4S connects your project to a broad network of HPC and AI software stakeholders, improves discoverability and interoperability, and supports long-term sustainability.

This guide helps prospective contributors understand why and how to join E4S, what prerequisites exist, and what ongoing responsibilities are expected once accepted.

---

## Should You Contribute?

| Consideration | Explanation |
|----------------|-------------|
| **Why you might want to contribute** | **Contributing connects your project to a curated ecosystem recognized by DOE, NSF, and HPC centers worldwide, increasing visibility, adoption, and credibility.** |
| Broader user reach | E4S packaging through Spack and container delivery expands your software’s availability across multiple HPC systems and cloud platforms. |
| Integration and interoperability | Participation enables collaboration on APIs, standards, and testing across related projects, improving interoperability and reducing user friction. |
| Sustainability and recognition | E4S highlights contributors through documentation, website listings, and release announcements, ensuring recognition and institutional visibility. |
| Access to infrastructure | Contributors gain access to shared CI pipelines, build caches, binary mirrors, and other infrastructure maintained by the E4S team. |
| Collaboration opportunities | E4S participation fosters interaction with other developers, researchers, and facilities using the same software stack. |
| **Why you might not want to contribute** | **If your product is proprietary, closed-source, or not intended for distribution in open HPC environments, E4S may not be a good fit.** |
| Limited resources for compliance | Projects without stable releases, automated builds, or maintainers able to respond to integration issues may struggle to meet E4S quality and support expectations. |
| Independent branding focus | If your primary goal is to maintain an independent brand identity without association with a broader ecosystem, joining E4S might dilute that independence. |
| Early-stage experimental code | Prototype or research-only projects without installation scripts, packaging, or testing may be better developed further before joining. |

---

## What Are the Steps?

| Step | Description |
|------|-------------|
| 1. Review E4S prerequisites | Ensure your software is open source, uses a standard build system (CMake, Autotools, etc.), and is packaged or can be packaged in Spack. |
| 2. Evaluate readiness | Check for existing test coverage, documentation, and stable releases. Projects with continuous integration are preferred. |
| 3. Contact the E4S team | Initiate contact via GitHub Discussions, the E4S Slack workspace, or email to introduce your project and its role in the scientific software ecosystem. |
| 4. Create or update your Spack package | If your software is not yet available in Spack, create a new package. If it exists, ensure it builds cleanly across supported compilers and architectures. |
| 5. Validate using E4S CI | Work with the E4S CI team to test your package within the E4S build pipeline and verify that it can be included in E4S releases. |
| 6. Submit inclusion request | Open a pull request to the E4S release repository referencing your validated Spack package, license, and build status. |
| 7. Review and acceptance | The E4S technical team will review your submission for readiness, reproducibility, and alignment with E4S goals. |
| 8. Integration and announcement | Once accepted, your product is added to the next E4S release and listed on the E4S website and product catalog. |

---

## What Are Your Ongoing Responsibilities?

| Responsibility | Description |
|----------------|-------------|
| Maintain package compatibility | Keep your Spack recipe up to date with new releases, dependencies, and supported architectures. |
| Participate in CI testing | Respond to test failures and integration issues identified by the E4S continuous integration infrastructure. |
| Communicate updates | Notify the E4S team of major version releases, build changes, or deprecations. |
| Support interoperability | Participate in shared efforts for API, ABI, and documentation standardization where relevant. |
| Engage in community discussions | Join GitHub Discussions, Slack channels, or working groups to share insights and align with ecosystem needs. |
| Promote E4S affiliation | Reference E4S participation in your documentation, publications, and outreach to help build the shared ecosystem identity. |
| Contribute to sustainability | Support the E4S ecosystem by participating in contributor meetings, workshops, and collaborative roadmap activities. |

---

## Addressing Common Skepticism

| Concern | E4S Perspective |
|----------|----------------|
| “Joining E4S reduces our project’s independence.” | E4S emphasizes project autonomy. Each product retains its own governance, repositories, and branding; E4S simply provides shared infrastructure and visibility. |
| “We can reach users ourselves without E4S.” | While independent outreach is valuable, E4S enhances discoverability within a trusted ecosystem used by major HPC facilities and research teams worldwide. |
| “Integration might be too much work.” | Most projects that already build with Spack require minimal extra effort. E4S CI and support teams assist with integration and testing. |
| “Our project isn’t ready yet.” | That’s fine—E4S welcomes projects when they’re ready. Early coordination, however, helps identify gaps in packaging, testing, and documentation. |
| “What if E4S changes direction?” | E4S operates as an open, community-driven effort with transparent processes, public discussions, and broad stakeholder representation across labs, universities, and vendors. |

---

E4S thrives on community participation. If your product supports scientific computing, HPC, or AI workflows and aligns with open-source values, joining E4S is a meaningful way to extend its impact and ensure it remains part of a sustainable ecosystem for science.
