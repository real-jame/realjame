---
layout: post
category: note
title: "Jailbreaking a Kindle Voyage and installing KOReader"
tags: [kindle, jailbreak, reading, tech]
date: 2023-08-18
published: true
---
I love my 2014 Kindle Voyage, actively been using it for almost 10 years now. But after finding out update support ended a while ago, why not finally jailbreak it and install more open and featureful e-reader software?

<!-- kindle is so swag :) -->

I'm new to KOReader, so I'll have to see if I actually like using it as a daily driver. But it can't hurt to try, and at the very least, liberating the device might come in handy in the future.

By the way, man I love tiny devices like this. I have an iPod Mini I've been meaning to write about. I think small portable devices that serve a single purpose are pretty cool! The Kindle Voyage is the smallest one they made, with a 6-inch screen. Super thin, too. It may not have USB-C, and it may not be waterproof, but that's OK.

## Jailbreaking

My Kindle Voyage stopped getting updates at 5.13.6. Luckily, there is a known Kindle exploit working up to 5.14.2, so we're good here!

After researching a bit, I found the source for the jailbreak is at a forum called MobileRead, here's the link to the primary resource:

[Tutorial: Open Sesame! (AKA., The New & Improved JailBreak Index)](https://www.mobileread.com/forums/showthread.php?t=320564)

Like with the previous note about [installing the latest Ruby on Debian]({% post_url /note/2023-08-16-ruby-debian %}), I will not directly provide instructions, both because that would take much longer to write, and because **information can change**. There might be a new exploit method, or a new security update by Amazon, or new jailbreak software to install for setup. In all of these cases, the guides will be altered, and my information will become out of date and will be unhelpful or even harmful. A brick or even a ban are near-zero chances, but I can't guarantee. Please read the forum posts if you're here to do what I did, and I'll just provide the basic outline of running through the tutorial here.

### Identification

Alright, I already know my device is a 2014 Kindle Voyage. All good here.

### Device generation concerns

> The main focus of this document will be all current devices with a touchscreen, running FW 5.x.

Yep, this device has a touchscreen. It's not running specifically version 5.x, but that's not important.

### The right tools for the job

The author makes separate threads for each software they make, but the downloads are all on one single thread for convenience. I'll keep it open in a separate tab.

[Tools: Snapshots of NiLuJe's hacks](https://www.mobileread.com/forums/showthread.php?t=225030)

The downloads are provided as tar.xz files. Luckily, I already use 7-Zip, which can unpack this archive format. All good.

### Jailbreak

Now here's where it begins. The current method is called "WatchThis", and is found on a separate thread. Let's do it!

[Tutorial: WatchThis - Software Jailbreak for any Kindle <= 5.14.2](https://www.mobileread.com/forums/showthread.php?t=346037)

The procedure is slightly lengthy, but doesn't require anything but a charging wire that connects to USB and a PC. I have to wipe my Kindle, but all my books are on Calibre so I'm fine with this.

I put the device in "demo mode" which I didn't even know existed. Using the search bar to access these commands is super interesting, honestly...

Then copy some files, do some more stuff.

#### Unique steps

Some stuff did not apply to my Kindle Voyage, and some did.

- I did not need to use the alternative demo mode entry method.
- I accidentally connected to wifi when setting up demo mode. However, this seemed to cause no issues.
- There was no misconfiguration lockout, no need for the "secret gesture" to bypass it.
- I was stupid and didn't see the part that told you to enter `;dsts` (using the homescreen searchbar) to access settings in order to install WatchThis. However, opening the triple-dot menu, selecting Legal, and choosing Safety and Compliance did the trick.
- An application error did occur, so I had to do the appropriate step.

Now, the jailbreak has been installed! Back to the Open Sesame post.

### Making sure your jailbreak survives updates

I severely doubt Amazon will update the Kindle Voyage again, but you never know. It's as simple as installing a tool called "JB Hotfix" on the Snapshots thread, unpacking it to the root of your Kindle, and running Update Your Kindle from the settings. Installing this should do... some stuff that is good for you, I don't know.

> This will also take care of a few other necessary bits and bobs for the following steps.

### Installing custom packages

This part was extremely unintuitive. So, custom applications are installed using a tool called the "MobileRead Package Installer". However, this depends on another tool called KUAL! How am I supposed to install MRPI if I have no way to install KUAL?

Well, according to the author, just install MRPI as if I already installed KUAL. Oh well. Again, just extract to the root.

### KUAL

> This is a GUI frontend that many custom tools will rely on, as such, we consider it a mandatory dependency.
> As it's designed to run across the *full* range of Kindle devices, there are four different variants of it available.

Alright. For the Voyage, we will need the `Booklet (coplate)` version, as our firmware is >= 5.9.

Following the guide further, I dropped the .bin into the `mrpackages` directory that was added from MRPI. Then, I ran `;log mrpi` and now KUAL is installed!

<marquee>TODO: Picture of my Kindle with KUAL open</marquee>

## Side note: My frustration with using forums for this stuff

I ran into this when figuring out how to install LineageOS onto an old Android tablet I had. These forums are just so... labyrinthine at times. Dozens of obscure forum threads, tons of digging, at least a dozen tabs open to find anything, having to pore through pages of *comments* for the real fix or solution. It gives me a headache.

MobileRead was nowhere near as bad, but it still gave me a headache. I don't know why, it was pretty intuitive so I think I'm just stupid. And it worked, so I can't complain too much. Ah well.

## Installing KOReader

Let's get on to the 2nd part: installing KOReader.

This is stupid easy, but took me a few minutes to find out which specific variant I had to use. The proper installation instructions, which you should be using instead of this, can be found here:

[Installation on Kindle devices](https://github.com/koreader/koreader/wiki/Installation-on-Kindle-devices)

For me, I went to their [website](https://koreader.rocks/) and clicked Download. This should take you to a GitHub Releases page for the latest version. Scroll down to the Assets section, there are several versions to choose from. They have Android and Linux ports, as well as other e-readers, which is all in all pretty swag. Reminds me of [Rockbox](https://www.rockbox.org/) in a lot of ways, but for ebook readers.

For the Voyage, I had to use `koreader-kindlepw2-v<VERSION>.zip`. You might have to click "Show all assets" to see it in the list.

Simply just unzip the archive into the root, and that's it! There are additional steps to install dictionaries and OCR language data, but I didn't grab those.

## Complete

Now I have KOReader, an e-reader software that's packed with far more features than the vanilla Kindle firmware. It also has built-in integration with Calibre, which is fantastic.

![Picture of my jailbroken Kindle Voyage showing the KOReader About screen.](/note/media/kindle-jailbreak.jpg)

I'll see if I like it or not, but for now, I'm interested in seeing what else I can do with a jailbroken Kindle!
