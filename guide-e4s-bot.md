---
layout: single
title: "E4S Guide Bot"
permalink: /guide-e4s-bot/
classes: wide
sidebar:
  nav: "botmenu"
---

{% include e4s-page-actions.html %}


<style>
/* Inline style: E4S theme-adaptive pill button with white text */
.btn--e4s {
  background-color: var(--e4s-blue);
  color: #ffffff !important;           /* Force white text */
  border: none;
  border-radius: 9999px;
  padding: 0.6em 1.6em;
  font-weight: 600;
  display: inline-block;
  transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
  text-decoration: none;
}

/* Hover and focus */
.btn--e4s:hover,
.btn--e4s:focus {
  background-color: var(--e4s-blue-hover);
  color: #ffffff !important;           /* Keep white text on hover */
  text-decoration: none;
}

/* Light theme */
:root {
  --e4s-blue: #0092ca;        /* E4S blue */
  --e4s-blue-hover: #006b99;
}

/* Dark theme */
[data-theme="dark"] {
  --e4s-blue: #33b8f2;
  --e4s-blue-hover: #66ccff;
}
</style>


The "Software Ecosystem for Science Guide" (E4S Guide Bot) is a GPT generated from ChatGPT to address questions about E4S and provide detailed guidance in using E4S, Spack, and the libraries and tools that are part of the E4S community. Start a chat now or visit one of the prompt guides below to get assistance in building a custom prompt and obtain a more precise response

<p style="text-align:center;">
    Construct your prompt from the instructions below then use the E4S Guide Bot
</p>
{% include e4s-bot-button.html %}


- [Build Tools Prompt Guide](/guide-buildtools/)
- [Programming Systems Prompt Guide](/guide-programmingsystems/)
- [Performance Analysis Tools Prompt Guide](/guide-perftools/)
- [Math Libraries Prompt Guide](/guide-mathlibs/)
- [Data and Visualization Libraries and Tools Prompt Guide](/guide-dav/)
- [AI & ML Libraries and Tools Prompt Guide](/guide-aiml/)
