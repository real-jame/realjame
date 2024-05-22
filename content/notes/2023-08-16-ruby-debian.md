---
layout: post
category: note
title: "Installing the latest Ruby with rbenv on Debian"
tags: [ruby, linux, tech]
date: 2023-08-16
published: true
---
I decided to switch from running Ruby natively on Windows to WSL, because Ruby on Windows is pretty bad. Installing the rbenv tool to manage multiple versions of Ruby is simple, but in order to add (by compiling) a Ruby version, there are a few dependencies to install.<!--more-->

For context, [rbenv](https://github.com/rbenv/rbenv) is a version manager tool for Ruby. This allows me to have multiple versions of Ruby installed at once and switch between at any time. Also, Debian has very outdated packages by design. Installing Ruby through their repositories would give me 2.7.4. Along with having 4 patches since, the 2.7.x line has been [unsupported](https://www.ruby-lang.org/en/news/2023/03/30/ruby-2-7-8-released/) since March 2023.

Not like having the latest version is the end of the world, but it's nice (and also to keep things consistent across devices and servers).

{% include callout.html type="note" content="I've followed these steps on Ubuntu 22.04.3 WSL - this guide should apply to any Linux distribution based on Debian, not just Debian itself." %}

The simplest way is to install one of many Ruby manager tools and build it from source. I chose **rbenv** for not much reason other than the other tools were more finicky to install, wasn't easy to set up [fish shell](https://fishshell.com/) integration for, or just not recommended by the Ruby community.

## Installation

The installation process is pretty simple. Instructions are on the GitHub repo, I used the [git checkout method](https://github.com/rbenv/rbenv#basic-git-checkout), as like Ruby, rbenv is in the Debian repos but is out of date.

But that installs rbenv, the manager. We still need to install a Ruby version to use.

So, I continued the guide, using this command to install 3.2.2, the latest Ruby version as of writing:

```bash
    rbenv install 3.2.2
```

Of course, it didn't go smoothly. I don't know if I would be writing this just to tell you to follow GitHub instructions. There were specific packages I had to install on Debian to make it successfully compile and install Ruby:

```bash
    apt install -y build-essential bison zlib1g-dev libyaml-dev libssl-dev libgdbm-dev libreadline-dev libffi-dev
```

Now I can get back to [working on my website](https://github.com/real-jame/realjame/commits/master), which uses a framework that relies on Ruby. Hence, today's note.

[By the way, this note is the first one! Here's a blog post I wrote to explain this section of the site.]({% post_url /blog/2023-08-30-update-3 %}) Hopefully, these notes can get on search engines and help people who are running into my problems.
