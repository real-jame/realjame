---
layout: post
category: note
title: "Musing on a bundler for old Roblox projects"
tags: [tech, roblox, oldroblox, devops]
# images: [images/thumbnail.png]
date: 2023-08-11
---
I'm musing. Pondering, even. And when I say that, I mean like this.

![The meme image of the werewolf sitting and thinking](images/wolf.bmp)

I've been thinking about if it'd be worth it to make a tool that can make it easier to distribute versions of my games for both the [Novetus](https://bitl.itch.io/novetus) and [Only Retro Roblox Here](https://onlyretrorobloxhere.itch.io/orrh) launchers. Specifically, this tool would manage the game's assets - the images, music, and other media.

Edits are at the bottom of the post

## Assets, basically

In official Roblox, both modern and old, your assets would be hosted on Roblox's servers by uploading them and getting through their moderation.

This has also worked in the past, both for playing existing games in launchers/revivals and even making new games.

However, Roblox has changed how and *if* assets can be received over recent years:

- The asset endpoint was changed to be on the new `assetdelivery.roblox.com` subdomain, and as far as I know, requires HTTPS.
- Sounds longer than 7 seconds are [now forced to be private](https://devforum.roblox.com/t/new-asset-privacy-and-permissions-features-for-audio-and-video/2725248), mainly due to copyright reasons.
- Users gained the ability to upload meshes in 2016, but even then, you can't use them in your old Roblox game because of the updates Roblox has made to their custom format[^meshversions].

ORRH(I think?) and Novetus snapshot versions feature a web proxy that can intercept Roblox asset requests from old clients and pull them from these modern endpoints, but these issues still apply. Also, it's not on Novetus stable 1.3, and more importantly, why deal with Roblox's website and moderation?? The web proxies aren't designed for this use case, they're basically a way to fix assets for old games.

### Local assets

So, host assets locally. [This is supported](https://rbxlegacy.wiki/index.php/Content#rbxasset://directoryFile/file.type), intended for pulling assets from the `content` directory, but you have the ability to go up a directory (using `..`).

Novetus provides a folder called `shareddata` designed for this. For my new game, [Blox Party](/projects/bloxparty), I created a new folder called "bloxparty" and put all my image and audio assets in there. Then, I can use it in game with, for example, `rbxasset://../../../shareddata/bloxparty/music.mp3` as the URL.

As for ORRH, there is an easier way to distribute and use local assets in your games, called **asset packs**. I haven't looked into it much, but it basically lets you override certain Roblox asset IDs with the web proxy. So when the web proxy intercepts the request, instead of pulling it from Roblox's servers, it uses the local copy stored in your asset pack. Example: `https://roblox.com/asset?id=12345` would correspond to `12345.png`, or `12345.wav`, or `12345.mesh`, etc. in your asset pack's folder. (File extension doesn't matter, only the filename corresponding to the ID)

ORRH asset packs also contain metadata (`AssetPack.json`) for the name, description, author, and version of the pack, as well as what clients it should apply to. Also, 

This is great and all, but here's why I want to automate it:

- ORRH asset packs only support numeric filenames in order to map to Roblox asset IDs, this is an inconvenience for development.
- While it would be possible to use the shareddata ORRH, this is dumb, and it requires you to put a `shareddata` folder under the `clients` directory...
- I would have to rewrite every URL in my game, and maintain 2 copies with the different URLs, or redo it every time I want to release it.
- Also, for development, it would be nice to have the game's RBXL file in a different directory than a specific launcher's map folder, and have *both* launchers able to access it (with symlinks?)
- Probably another reason I forgot

## A bundler tool

IDK if bundler is the right word, but yeah. A program, probably a CLI. This is what it would do, I think.

I make a folder wherever I want that has the game and an `assets` subfolder. This should also be used as the Git repository.

The program would have a few features:

- Init project with metadata (e.g. npm `package.json`):
	- Launchers to track (map and client folder locations)
	- For both:
		- Project name (used for ORRH assetpack name, and Novetus shareddata folder name)
	- For ORRH:
		- Description
		- Author
		- Version
		- Supported clients
- Add launcher: 
	- Provide the directory of a launcher's maps folder (or any folder) and it will link your project folder to there, using either a Windows shortcut or maybe a [symlink](https://www.howtogeek.com/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/), idk, something to research.
	- Provide the directory of a launcher's clients folder, and it will note the `rbxasset` URL to use to pull assets from your project's assets directory. (This would mean to switch launchers during development, you would have to run a script to convert the asset URLs. Maybe instead, it could run a web proxy of its own so your URLs would instead be `roblox.com` or maybe `localhost` and it would then pull from the folder? IDK)
- Feature to auto-convert your project's asset URL links to a different tracked launcher (could either modify the XML directly or generate a Lua script to run in Studio?)
- Build assets for release:
	- Make a `build` directory in the project, and then `build/novetus` and `build/orrh`.
	- For Novetus: no effort needed for shareddata, the assets folder can be copied directly (but renamed to be the project name)
	- For ORRH: build the asset pack by renaming assets to random numeric file names, and generate a metadata file based off the project metadata.
	- Rewrite URLs in the RBXL as necessary and copy to their build directories.
	- Also for Novetus, optional: generate a description .txt file for the map that will show in Novetus's map selection menu.
	- **Could also minify the RBXL file's XML (and Lua scripts inside)[^minify] and/or compress the RBXL file**[^compression]

## I can make this

This isn't a request for someone out there to make it, I can make it. I just wanted to note my ideas down and make a plan, but out in the open.

I'll definitely be writing it in C#, because I like C# and want to use it more, lol.

It will be a terminal app, because that's all *I* need, but I suppose a GUI could be made later.

It could also have a native MacOS and Linux version (although these Roblox versions are Windows-exclusive, you can run them on Wine). [Even the GUI can be cross-platform](https://avaloniaui.net/).

This is surely over-engineered, but it's fun and that's what matters!

## 8/12 update

Fixed typos, I rushed this post out before I had to leave for work lol. So it was basically just an infodump (it still is... just with less typos)

Also, I got some advice after sharing this to the Client Search Discord about how I should go about generating the numeric filenames for ORRH. (Thanks, Lanausse!)
- Custom assets[^assets] should use the 580954-999999 ID range to avoid overriding existing Roblox assets, due to Roblox skipping the ID count to 1000000.
- The 0-769 range is also available, but smaller, and was used in the past for models.

With that in mind, a smarter approach to generating IDs rather than just being totally random numbers is to base it off the file data - get a hash of the file and convert it to an integer, this would likely be out of the unused range, but maybe a simple modulo operation could fix that??

Doing this would mean your assets keep the same IDs between builds, I don't know how beneficial that really is, but there you go. Maybe I'll implement it anyways if it's easy.

[^meshversions]: You can convert meshes to the supported versions by using the mesh converter tool in the Novetus SDK. I don't know if there are any alternatives.
[^minify]: Minifying the XML and Lua is something I've thought about for a while, and it would make for an interesting blog post seeing how much space is saved. But there isn't an off-the-shelf C# library for this, so I'd have to port it from the JS libraries or something lol. It's just regex (at least for the XML minifier), will it really be that hard? (famous last words) 
[^compression]: ORRH and Novetus snapshots support compressed maps by decompressing them on the fly. Novetus built-in maps use [bz2](https://en.wikipedia.org/wiki/Bzip2), while ORRH uses [gzip](https://en.wikipedia.org/wiki/Gzip). I haven't tested if they support the vice-versa format.
[^assets]: ORRH asset packs mainly exist to provide assets where the web proxy can't: music, as well as models for games that insert those (e.g. Catalog Heaven). This is why you have to use fake roblox.com asset links and numeric filenames; it wasn't really designed for original games. (Correct me if I'm wrong on that)