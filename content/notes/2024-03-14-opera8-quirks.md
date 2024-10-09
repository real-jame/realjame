---
layout: post
category: note
title: "2 Opera 8 quirks with the simple layout"
tags: [tech, web, retro]
date: 2024-03-14
---

I was testing this with Opera 8. I wasn't sure which version the DSi browser was built on (my target when making this layout), so I just went for the lowest one, and a bit lower to be safe: Opera 8.<!--more-->

So, here are 2 quick little quirks I noticed that occured in Opera 8, but not in my modern browser.

I could put clean this up but I'm lazy and I'll just share the quick notes I took.

For my footer, the a elements would only center if I wrapped it in a p element first.

For the sidebar nav, putting margin: 0 on the list elements would have them clip into the box on an old browser.
modern browsers still keep a left margin for the bullet points if you set margin to 0, but opera 8 does not.
