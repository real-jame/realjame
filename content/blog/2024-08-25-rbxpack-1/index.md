---
layout: post
category: note
title: "Progress and ideas for rbxpack"
tags: [tech, oldroblox, devlog]
date: 2024-08-25
published: true
---
I started working on rbxpack last week, here's what's up with the project.<!--more-->

**Note: this work is from before I [took a break](https://wetdry.world/@jame/113007000571244590) from things for the last week, due to personal reasons.**

## What rbxpack is

I've found it hard to easily describe this tool, because it does a few different things in one package:

The main thing is taking your game and assets and processes it to play in different places, each with their own structure for assets.

- Novetus with shareddata folder
- ORRH with asset packs

It also allows you to link your project and assets folders to multiple launchers, which has several benefits in itself:

- Store your project and assets in a single folder and outside of a single launcher
- Edit and test your game in multiple launchers simultaneously

As for what rbxpack isn't: it's not like [Rojo](https://rojo.space/). That is, rbxpack will not allow you to code your game in other code editors or adapt your rbxl for better version control.

## Getting feedback

I'd like to hear feedback on it, because while my original goal was Novetus and ORRH, if there are any other workflows and platforms people do, I would like to support it! Simple as that!

A few people have reached out to me with some things since then. But first, some loredumping about it.

### Roblogs and storing assets inside the rbxl

Up to December 2010, it was possible to encode assets directly inside the RBXL file as Base64 data.

This was a trick people did back in the day to get custom meshes in a time where only admins could upload meshes to Roblox.[^binarymesh]

Basically, you could convert the binary data of your mesh, image, audio, etc. file to a base64 string and inject it into the XML data of your RBXL by wrapping it in a `<binary></binary>` tag. It was that easy. You could also do this directly in Studio!

This doesn't work in multiplayer(I think?), and the feature was patched out in late 2010. Probably because it really inflates the file size, not to mention how it's unmoderated.

Still, this was brought up to me by a Roblogs user. Never heard of Roblogs before but it's a pretty cool platform! Just a place for people to share games, and to my surprise, they don't use launchers?? Just the vanilla clients.

Surprising to me, but rbxpack would still work for this. I think it would be best to add custom workflows to rbxpack, that is, in rbxpack's project config, you could create a series of instructions for what to do on build. You would name these workflows, and you can have multiple. A roblogs workflow might look like this, for example:

```json
"Workflows": [
	{
		"Name": "roblogs",
		"Actions": [
			"base64-inject-assets",
			"minify-rbxl",
			"compress-project-zip"
		]
	}
]
```

(The "Name" property would be used for the folder name in the build directory.)

This might also be overengineered and just coding in a roblogs workflow that people can disable in the config would also work.

Although, splitting these pieces of workflow into separate little functions is good for the next point anyways.

### Running rbxpack without a project file

If rbxpack keeps gaining capabilites to manipulate rbxl files in all kinds of unique and practical ways like this, it might be a good idea to let people run rbxpack on rbxl's without a project file setup.

Like, to run a simple action such as extracting Base64 assets from an RBXL into individual files, or vice versa.

The command would probably look like this, based off of the workflow action names:

```
rbxpack run base64-extract-assets HappyHome.rbxl
```

[^binarymesh]: This works for all assets, not just meshes. But meshes were the main use case back then.