---
layout: post
title: "Introducing Spooking Out!"
categories: [Update, Old-Roblox, Project]
image: /blog/media/SpookingOutThumbnail.png
description: "I made a brand new game for old Roblox with the help of a friend!"
date: 2022-10-24
---

Hello! I'm proud to announce a brand new game made for the classic Roblox engine (2010 specifically), made in collaboration with my friend, Tobu.fi.
![Thumbnail image for Spooking Out! featuring the game title overlayed on a blurred background of a map from the game; a bay filled with ghosts.](/blog/media/SpookingOutThumbnail.png)
Come play the game with us on a 24/7 server I'm hosting for the game, or [download a copy of the game for yourself](https://cdn.discordapp.com/attachments/1033943226727542887/1033943288463511692/Spooking_Out.rbxl).

```
Client: 2010L
IP: court-michelle.at.playit.gg

Port: 41927
Map: Spooking Out!
Players: 12
Version: Novetus 1.3 v8.2022.1
```

Not sure how long I will keep this server running... at least until Halloween.

**12/4/22 edit: the server went down after Halloween. It was a ton of fun playing with everyone! Thank you so much for your feedback and appreciation for what we made : ]**

Speaking of which, we want to make more projects in the future, so we have a team name! "Tobic Bay"! And it won't just be Roblox games ;)

# How to Play

_Spooking Out!_ is a round based co-op game about catching ghosts. When the round starts, explore the map to find ghosts and use the Skullshot tool to sling skulls at ghosts.

After you deplete the ghost's health, switch to the Grab tool and click on it. You'll pick it up, now walk to the big hole and click again to throw it in! You can hold down the letting-go click to charge up your shot and throw it a farther distance.

Work together with everyone in the server to capture all the ghosts before time runs out. In the lobby, spend your hard-earned tickets in the shop to buy secondary items.

Speaking of which, secondary items! You can choose a 2nd item to equip alongside your Skullshot. This tool or ability can help you and your team out, so try all of them to find your favorite!

# Screenshots

_Sorry for the black bar on the bottom, I didn't record it correctly. In that area would be a status bar telling you the amount of ghosts left and when the next round will start._

<video height="320" width="480" controls>
  <source src="/blog/media/SpookingOutGameplay.mp4" type="video/mp4">
</video>

![A player standing on a dirt pathway in a campsite surrounded by a forest, and ghosts.](/blog/media/SpookingOutScreenshot-1.png)

![A player attacking a ghost with the Skullshot tool in a city.](/blog/media/SpookingOutScreenshot-2.png)

![A player sitting on a bench alone in the lobby, a peaceful grassy field at night next to a forest with autumn leaves and a campfire.](/blog/media/SpookingOutScreenshot-3.png)

# What is Novetus?

If you're interested in playing, you can install Novetus [here](https://bitl.itch.io/novetus)! Novetus is a free and open-source launcher for old Roblox clients that allows you to host servers, edit maps in Studio, and play solo or online.

In order to join our server, make sure you download the current "Stable" release, not "Unstable Beta/Snapshot/Pre-Release". (It doesn't matter if you choose "Full" or "Lite", lite simply isn't bundled with any classic maps.) Unzip it and launch "NovetusBootstrapper.exe". In the launcher, set the IP, port, and client version to the ones specified in the server info, and you'll be able to join!

Novetus is Windows-exclusive, but it works well in Wine if you're on Linux. And if you're running into issues opening Novetus or 2010L, make sure you install the required dependencies (found in the "\_redist" or using the "Dependency Installer" tool in Novetus):

- Microsoft Visual C++ Redistributables 2008
  - Required to run clients from 2008 and above.
- Microsoft .NET Framework 4.0
  - Required for the Novetus launcher to run.
- .NET 4.0 Update (KB2468871)
  - Required to run the Novetus launcher on Windows XP and Vista machines.

If you're on Linux, you don't need to install Microsoft .NET Framework 4.0. When running Novetus for the first time, Wine will prompt you to install Mono if you haven't already, so install that instead.

Speaking of which, this is unrelated to our game but if you are trying out Novetus and would like to play the 2007 or 2011+ clients, check the Dependency Installer to see what special dependencies you need to install to run them.

# Behind the scenes

This game started because Tobu.fi wanted to submit a game to a Halloween game contest in the [Novetus Discord server](https://discord.gg/Jfrdmx3ZwQ). The best game will be included in the launcher's pre-installed map collection.

We've been working on a game for about a month before that point, so our plan was to make it Halloween-themed. Brand new maps and a lobby, as well as a new challenge for the rounds - instead of simply picking up boxes, you have to first kill ghosts with a separate tool, while they're moving around. Development was pretty smooth because we were able to reuse the existing code for rounds, the shop, the Grab tool, and some shop items - with a few modifications.

Tobu.fi first created the original prototype of the game, he created the ghosts. I took that prototype and merged it with the base game to create a fork of it. I reworked the scripts to accomodate what's changed.

Unlike the base game, where we wish to only include 2 or 3 maps and have the community build more maps, this game was on a lot shorter deadline, so I made just 1 map and the lobby, and the other maps are reused from classic Roblox games.

We submitted it to the Novetus contest on October 22, and we got a couple players on the server. You can see them in the player list of the screenshots I provided, and it was a joy to finally share our work with the public!

In fact, one of the players, [Lachrymogenic](https://lachrymogenic.gitlab.io), created a thumbnail for our game, which we've adopted as the logo and branding. Thank you so much!!!

# Wrap-up

_Spooking Out!_ as well as the existing work from the original game took a lot of effort from both of us in all parts of development. We hope you enjoy playing it just as much we did making it!

As I mentioned at the start, you can currently play it on Novetus. But what if you don't have a computer or simply don't wish to install Novetus? Well, we plan to **port the game to modern Roblox**, and it's being worked on right now! When it's done, I'll write another article to introduce the modern port and it's behind-the-scenes when it releases.

Enjoy!

_- Tobic Bay_
