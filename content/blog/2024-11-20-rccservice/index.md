---
layout: post
category: note
title: "Connecting 2008 Roblox RCCService to Bluesky and Mastodon"
tags: [tech, oldroblox, socialmedia]
date: 2024-11-20
published: true
---
Just because you can, doesn't mean you should... but at least we have 2008 Roblox thumbnails on social media now.<!--more-->

This post is about my project for a few days: a Mastodon and Bluesky bot that generates and posts a thumbnail of a random Roblox map in the 2008 engine. It uses Roblox's backend service called RCCService. This could also probably be considered an introduction to RCCService, but it's not really a good tutorial. It was for me, at least. **Huge thanks to [KeyboardCombination](https://keyboardcombination.com) for helping me understand it! Wouldn't have gotten it done without you.**

## The idea

There's a bot called "Alpha Screenshots" over on the Fediverse, I really like it. The bot posts a screenshot of a randomly generated Minecraft Alpha world every few hours. I randomly got the grand idea of "what if that... but *old Roblox my beloved*?!??!"

You can't easily mod old Roblox to, say, generate a world and take a screenshot (assuming that is how they did it), but there is actually still a very easy way. Easier, in fact, because it uses Roblox's very own program for it! This is how some revivals have clean thumbnails for games, avatars, and free models: the Roblox Cloud Compute Service (RCCService).

## Using RCCService

RCCService is a version of the Roblox engine for running on their backend; it can be used to host game servers and generate thumbnails. For my purposes, I'll be using it to generate thumbnails.

Basically, I'll have a folder of maps, and pass a Lua script to RCCService that instructs it to load the place file. This entails asking RCCService to open a job, and passing it a script. This script can do anything, and here it will load in a map from a local RBXL file and then take a screenshot. (This uses a special class, ThumbnailGenerator, which is not accessible in the standard Roblox client after 2007.)

ThumbnailGenerator is interesting because it lets you provide a boolean argument, "HideSky". So it'll have a transparent background, right? Well, it does more. It's actually how Roblox differentiates avatar/free-model thumbnails (a usually isometric view that tries to fit the whole thing into view with a transparent background) and game thumbnails (a camera position set by the developer with the skybox). This leads to a pretty cool side effect of letting me display a birds-eye view of the game alongside the original thumbnail, so I'll have the bot generate that too.

By the way, did you know the thumbnail camera info is part of the RBXL file? It's just the Roblox Studio freecam's position and angle at the last save, which is pretty cool. Developers used this before Roblox let you upload pictures for thumbnails: they would center the camera on a brick displaying a picture they uploaded. Either that, or just a pretty cool sight in the map.

![](images/ropictionary.jpg "The thumbnail for Ro-Pictionary (2012)")

## SOAP is...

SOAP is not fun to deal with. Actually, it worked fine in C#, my original codebase for the bot. But then I decided to rewrite the (admittedly tiny) bot into TypeScript, because I wanted it on Bluesky directly, and unfortunately they only really make a Bluesky library for Python and Node.

I'm not an expert in SOAP, but the gist is that it's an alternative to REST from the 2000s that really fell out of favor. Because it's just so complex and verbose for little gain!

Instead of putting your request in the URL, like `POST https://localhost:64989/job`, you have to get a WSDL file that has all the definitions for what you do. You can then load (or generate beforehand) a class/object thing with all these methods. What this does is send a lot of XML that very verbosely explains what you want to do. Very fiddly and very inconvenient all in all. As demonstrated by the WSDL file successfully working in C#, but not in Node.

In the end, I had to simply hardcode the request to RCCService.

## Interfacing

First, forming the job request. This is what my Lua script looks like:

```lua
game:Load("INSERT_MAP_HERE")
return game:GetService('ThumbnailGenerator'):click('PNG', 1920, 1080, HIDE_SKY_BOOLEAN)
```

RCCService is essentially loading a new place and then running this as a script inside of it, so there's no filesystem access. However, it allows me to let my bot better communicate what map it wants to load, and if it wants the skybox visible or not (more on this later).

## Posting