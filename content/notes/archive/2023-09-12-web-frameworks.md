---
layout: post
category: note
title: "React: When everything looks like a nail..."
section: til
tags: [textarea, react, web, frontend, tech]
date: 2023-09-12
published: true
---

I've been working on [textarea.site](https://github.com/real-jame/textarea/tree/next) as a way to dive back into the beautiful and the ugly parts of front-end web development. After a few days of work, I decided to rewrite the entire project in [Svelte](https://svelte.dev). Surprising? Maybe not. It's about the right tool for the job, and here, [React](https://react.dev) is not it.

I'm sure people have written countless times about this. But it's true that being versatile is one of the best skills you can have as a software developer.

textarea.site is not much more than a textbox and some utility features; that's kinda the point of it. When I first made it a year ago, I wrote it in React. It's a pretty good learning project, after all. But...

![212kb transferred of JavaScript for textarea.site](/note/media/web-frameworks-reactsize.png)

Loading 200kb of JavaScript for a textbox is not fun, though. There are projects where 200kb is worth it. After all, React was made by **Facebook**. That's something a large framework would be vital for, as a way to handle the complexity.

But in this case? Why not just use vanilla, plain JavaScript? Or a lighter framework?

I could have gone with vanilla JS, sure. The [Web Components technologies](https://developer.mozilla.org/en-US/docs/Web/API/Web_components) seems alright for small projects like this. But I decided to go with Svelte, just because it seemed more similar to React and was easier to pick up. So I spent a few hours going over [the tutorials](https://learn.svelte.dev/), and then spent a day rewriting my progress in the new framework.

And now, it's (mostly) done! [This commit](https://github.com/real-jame/textarea/commit/866cc6f7e23241cd510e35befc9975f4ca5d2ef2) is where I applied all the rewriting to the development branch.

## Why Svelte

Svelte is pretty cool, actually. It compiles down to vanilla JS, so its effectively not very different from if I decided to write vanilla in the first place. But it provides a development experience similar to React, but even better. And just look at that size! Just under 9kb when gzipped, and 24.67kb unzipped is still a massive reduction in size.

![A terminal screenshot of the logs for a production build of the Svelte textarea.site, showing the sizes of the bundled HTML, CSS, and JS files.](/note/media/web-frameworks-sveltesize.png)

## End of note

Frontend development has exploded in complexity over the last decade. It's not inherently bad - you should just explore more than the first thing you learn, so the technologies you use in your projects are properly suited.

And of course, you shouldn't be thinking about technologies if you want to build a project. As shown with textarea.site, rewriting or optimizing can be done later when necessary.

Now I'm just rambling... but I just wanted to share what I gained from rewriting the project. BTW, if you want to test these new updates, you can find the development build [here on GitHub Pages](https://real-jame.github.io/textarea). Have a good day, thanks for reading!
