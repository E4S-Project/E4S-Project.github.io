---
layout: single
title: "Introduction to E4S"
permalink: /about-e4s-intro/
classes: wide
sidebar:
  nav: "aboutmenu"
---

_**E4S turns expensive supercomputers into powerful engines for discovery by giving scientists the software ecosystem they need.**_

Scientific discovery today depends on powerful computers—machines that can build and execute new AI models, design new medicines, improve energy systems, and simulate the behavior of stars. But just as important as the hardware are the software tools that scientists need to harness this computing power. Developing, maintaining, and making these tools widely available is the mission of the Ecosystem for Scientific Software (E4S), a collection of software for compute-intensive modeling, simulation, and AI.

{% include e4s-card-style.html %}

{% capture what_front_raw %}
E4S is a **curated ecosystem**  of **open-source** software that scientists and engineers use to do large-scale computing. Think of E4S as an app store of reliable, tested, and interoperable tools for solving scientific problems.
{% endcapture %}

{% assign what_front = what_front_raw | markdownify %}

{% capture what_back_raw %}
- **Curated:** The collection is tested, documented, and supported so that scientists can focus on research.
- **Ecosystem:** Many products, working together.
- **Open-source:** Anyone can inspect, use, and contribute, ensuring transparency and long-term availability.
{% endcapture %}

{% assign what_back = what_back_raw | markdownify %}

{% capture why_front_raw %}
With E4S, scientific teams avoid building common computing tools from scratch, avoid duplicating effort and delaying discovery. **E4S ensures U.S. R&D investments have sustained impact.**
{% endcapture %}

{% assign why_front = why_front_raw | markdownify %}

{% capture why_back_raw %}
- **Scientists work better and faster:** Ready-to-use tools mean less time reinventing the wheel.
- **Taxpayer supercomputer investments are maximized:** Software investments unlock hardware capabilities.
- **The U.S. maintains leadership:** E4S keeps America at the forefront of scientific innovation.
{% endcapture %}

{% assign why_back = why_back_raw | markdownify %}

{% include e4s-two-card-content.html

   card1_title="What is E4S?"
   card1_front_text=what_front
   card1_back_text=what_back

   card2_title="Why Does E4S Matter?"
   card2_front_text=why_front
   card2_back_text=why_back

%}

{% include e4s-card-script.html %}

## A Simple Analogy

Imagine trying to build a house if every team had to design its own hammers, saws, and measuring tapes. Progress would be slow and costly.
E4S provides the shared toolkit of reliable instruments that every scientific team can use, so they can focus on building new knowledge instead of tools.

### Stewarding Community Software Resources

Scientific challenges—clean energy, climate resilience, national security, advanced manufacturing—depend on the ability to simulate complex systems on the world’s fastest computers.
E4S makes these computers usable, productive, and accessible. With sustained investment, the U.S. preserves investments in efficiency, talent, and leadership in science and technology.

### How to Access E4S Products
E4S products are accessible in many ways:
1. Each product is directly installable using Spack.
1. E4S has its own Spack scripts that install the full collection of products that are part of E4S.  This script can be copied and pruned to suit your needs.
1. E4S is available in containers on AWS and Google Cloud environments.
1. E4S is available from a variety of containers including several minimal base containers that enable to you to establish a base image and install compatible versions of the products you want to use.

In all cases, products benefit from being part of E4S by participating in the integration and testing support that E4S provides.  Even when using an E4S-supported product independent of E4S, you benefit from the portability testing and version compatibility that E4S efforts enhance.

{% include e4s-footer.html %}