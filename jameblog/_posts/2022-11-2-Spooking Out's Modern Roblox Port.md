---
layout: post
title: "Spooking Out's Modern Roblox Port"
categories: [Update, Roblox, Project]
---

Hey everyone, I am proud to announce the modern Roblox port of _Spooking Out!_ has been published to the Roblox website under our group!

_Don't know about Spooking Out or Tobic Bay? Read the [previous article](https://realja.me/blog/update/old%20roblox/project/2022/10/24/Introducing-Spooking-Out!.html)._

This means you can now play our game on modern Roblox. Oh, and we also went back and improved the experience to make playing it on mobile, controller, and Xbox just as playable and fun!

# [Play it here!](https://www.roblox.com/games/11373614692/Spooking-Out)

_[Or check out the Novetus 2010L version!](blog/update/old roblox/project/2022/10/24/Introducing-Spooking-Out!.html)_

There are also 5 badges -- essentially, achievements. Here's one of them:

| ![A brown bag with a yellow and brown rectangle with the word "Tix" printed on it, overlayed on top of a Spooking Out map with a orange-yellow filter.](/blog/media/SpookingOutModernBadge.png) |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: |
|                                                                                     _Can you get them all?_                                                                                     |

## TL;DR

Here's a list of this port's additions/changes to the 2010L Novetus version.

- Based off a patch made after the original release, `v1.0.2`, which has a couple more bug fixes. This will be the version included in the Novetus launcher, I'll talk about that more in a later blog post!
- Partial rewrite of the codebase to make it work on modern Roblox.
- Menu buttons now stacked vertically on the left center side of the screen.
- Grab tool charge UI is now bigger and positioned higher up (to fit on mobile).
- New menu button: "Invite Friends" which opens a built-in Roblox menu to send your friends an invite link to your server.
- 5 badges to earn by reaching various goals in the game!
- Now can be played on MacOS, Xbox, iOS, Android, and with a controller thanks to modern Roblox's cross-platform-ness!
- Menu buttons have controller bindings and button icons to make life easier, they use the D-pad.

## Release Date

You might notice that I am publishing this article on November 1, which is not, in fact, Halloween. Except I DID RELEASE IT ON TIME!

![Screenshot of my Tweet with a text body of "LET IT BE KNOWN THAT I HAVE RELEASED 'Spooking Out!' ON OCTOBER 31 2022 (Halloween) AND NOT November 1 2022 (not Halloween). literally turning it in at 11:59 pm like it's homework lol. #Roblox #RobloxDev". A screenshot image of the game page for Spooking Out on modern Roblox is attached to the Tweet. The tweet is dated October 31, 2022 at 11:48 PM.](/blog/media/SpookingOutModernTweet.png)

Though, I'm releasing this a few days late. Sorry... some things got in the way, schoolwork being one of them. I hope you still enjoy the game in it's own right!

## Behind the scenes

This was a solo effort because Tobu.fi already wanted to take a break and he doesn't know modern Roblox development very well. Plus, this was pretty simple, so I could do it by myself.

Work was split into 2 phases of development. Fixing the code to run on modern (the important part), and then "bonus features" in the remaining time I have.

### Fixing the code

So, who would've thought that 12 years of engine updates would break our game? Actually, it mostly worked. Rounds, shop, and leaderboards all worked perfectly. But the tools don't. Because the former runs code on the server, and the latter on the client... and that's where Roblox's most devastating change that breaks old games lies.

#### Filtering Enabled

That's what it's called. It was added in 2014, and it became mandatory some time after, a few years or so. I'll be brief about it to not get too boring, if you want to read more about it, [check the Roblox ~~Wiki~~ ~~Developer Hub~~ Documentation.](https://create.roblox.com/docs/scripting/networking/client-server-model)
<sub><i>Also, don't take this as the complete truth, this is all from memory.</i></sub>

You have your clients and your server. The server handles most of the data, and the clients are each player connecting to it. This is how hackers can perform exploits; they manipulate what their client tells the server to do or change. For example, they could instantly have 1 million gold by telling the server that they have 1 million gold, if there are no proper checks in place.

This is why exploiting is so rampant on old Roblox servers (besides the fact new anticheats can't be very easily modded on): there is much less security in place for what clients can manipulate. There is _some_, but in general, you can do basically whatever you want in a tool, such as placing a bomb, or killing a player, all done from a clientsided Script.

This is fun and easy for developers to work with! But, exploiters are annoying too, of course. Roblox added this "Filtering Enabled" thing some years afterwards, where the server pretty much does not trust the client at all. If the client wants to place a bomb or kill a player, they have to **ask the server** to do it by activating a "RemoteEvent" or "RemoteFunction", which signals a function in a server-sided script to run.

![A diagram of the Filtering Enabled flow in modern Roblox. A LocalScript has an action: "Player presses 'Buy' button". A remote event links an arrow from the LocalScript to the (server) Script's flowchart: "Does player have enough money?" A "NO" arrow links to "Don't give item", and a "YES" arrow links to "Give item to player".](/blog/media/SpookingOutModernRemoteEventFlow.png)

---

With that said, fixing the tools to be FE compatible was a fairly easy effort. Move the function that should be run on the server to a server script, and have the client call a RemoteEvent to run that function instead of directly running the function. Simple.

Although, our from-scratch Grab tool designed solely for this game is a bit more complicated than the 2007-era tools found in the shop. The Grab tool relies on maintaining a state and flow of the code and events.

- What part does the player want to pick up?
- Are we currently holding a ghost?
- How long has the player held the left click to charge their throw?
- Should we pick up a ghost or start charging the one we might possibly have?

But, it was not very hard to do either.

### Bonus features

#### Mobile, controller, and Xbox support

Roblox already has built-in support for all these control options. Even though the code was designed only with old Roblox's single platform in mind, Windows keyboard+mouse, they have great backwards compatibility. So when the tools trigger on "Mouse left click", in actuality a controller right trigger press or mobile tap activates this as well.

#### Ghostwalk

This was the simplest. It actually all works, but I added a very simple quality-of-life feature for mobile and controllers.

The Ghostwalk ability lets you hold down left click to float into the air for a bit, like a ghost. But on controllers, it's a bit uncomfortable to always hold down right trigger, and on mobile, you need to let go of the tap to move the camera or player!

So, I made the "stop floating" part of the code not run if the last input type was a touchscreen or controller. Thanks, [UserInputService](https://create.roblox.com/docs/reference/engine/classes/UserInputService)!

#### Grab tool

Simple too, utilize [ContextActionService](https://create.roblox.com/docs/reference/engine/classes/ContextActionService) to replace the Mouse events with "Context Bindings" which maps the actions to multiple inputs - a mouse click, a touchscreen tap, and a controller button press.

No new behavior was added in this refactoring, but I had to do it for one specific thing: a mobile button. You can use ContextActionService to display a UI button to trigger the action on mobile.

The reason I did this was due to a tap anywhere on the screen triggering the Mouse actions. This is fine for picking up, but what about throwing? Simply tapping the screen to move the character or camera will throw the ghost - very annoying!

#### GUI

This is what the gui looked like as-is from the 2010L version on mobile.

![A mobile screenshot with the menu buttons overlapping with the banner and chat UI, and the charge UI overlapping with the tools list.](/blog/media/SpookingOutModernGuiBefore.png)

Now here's after my redesign.

![A mobile screenshot with the menu buttons positioned vertically on the left center side of the screen and the charge UI placed neatly above the tools list.](/blog/media/SpookingOutModernGuiAfter.png)

![A screenshot of the menu buttons, with a controller ]

- Moved menu buttons to the center left side of the screen
- Made the charge gui bigger and positioned higher up to not overlap with the tools menu on mobile
- Menu button text now scales to fit the size of the button
- Added controller button mappings for the menu buttons (d-pad) and controller indicator icons for them when one is connected

#### Badges

Badges were pretty simple. Just add the check for the requirement to get it in the script that handles that behavior. The "buy everything" badge will be awarded by the shop script, the perfect score badge in the rounds script, etc.

You can see how to get each badge on the [Roblox page](https://www.roblox.com/games/11373614692/Spooking-Out).

#### The rest

As I said, Roblox has surprisingly good backwards compatibility with old code. Every other part of the game, such as the shop, round status text banner, and the other shop tools, work just fine on mobile, controllers, and Xbox.

Of course, I could have worked more. I could have ported it to [ContextActionService](https://create.roblox.com/docs/reference/engine/classes/UserInputService) and give mobile users a dedicated button on some tools. Or, add a lock-on feature for controller users so they don't have to look straight at the ghosts? But, those things are more complicated and would take time, time I don't have. It should be quite playable on mobile, controller, and Xbox nonetheless : ]

## Wrap-up

Here's how everything came together, allowing me to play our game on modern Roblox, on my phone!

![A 15-second gameplay recording of Spooking Out's modern port, recorded on an Android phone. In the video, a player knocks out a ghost with the Skullshot and throws it into the hole.](/blog/media/SpookingOutModernGameplay.mp4)

I've tried making modern Roblox projects before, but like with old Roblox, this is my first time releasing a finished product. All in all, it was fun. We hope you continue enjoying it just as much as we did porting it!

After almost a month of active work on this project from the both of us, it's finally 100% complete. We'll be taking a break for a few weeks to figure out where to go from here. Stay tuned for more blog posts (unrelated to Tobic Bay, but sometimes related to old Roblox) and other tech projects from me in that time!

Hope you had a great Halloween!

_- Tobic Bay_
