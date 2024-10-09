---
layout: post
category: note
title: "Website snowstorm effect"
tags: [tech, web]
date: 2023-12-27
---
For the holidays, I added a simple snowing effect.<!--more-->

![Recording of a falling snow effect being overlayed on my website](images/snowstorm.gif)

It's not actually my code, but I did make a simple control to toggle the snow effect.

## Adding the snowing effect

I was playing around with the classic [snowstorm.js script by Scott Schiller](https://www.schillmania.com/projects/snowstorm/), but I could never get it to properly turn on and off without requiring a page reload when making button. Plus, it always looked super distracting no matter what I did.

There's another popular(?) alternative that's implemented without any JavaScript, which is excellent.

[CSSnowflakes](https://pajasevi.github.io/CSSnowflakes/)

## Some tweaks

I replaced the snowflake symbol (❅) used with a simple white circle emoji (⚪). I also made every other snowflake slightly smaller and more transparent, using a bit of CSS.

```css
.snowflake:nth-child(odd) {
  color: rgba(1, 1, 1, 0.8);
  font-size: 0.5em;
}
```

## Implementing an on/off toggle

Here's my code.

```html
<button id="snow-toggle" onclick="toggleClick()">
  <img
    src="/assets/silk/weather_snow.png"
    alt="Toggle Snow"
    id="snow-icon">
</button>
<style>
  #snow-toggle {
    position: fixed;
    bottom: 1em;
    right: 2em;
    padding: 0;
  }

  #snow-icon {
    max-width: unset;
    height: 32px;
    width: 32px;
    image-rendering: pixelated;
  }
</style>
<script>
  const savedSettings = JSON.parse(localStorage.getItem("snowSettings")) || {
    snowEffect: !(window.matchMedia && window.matchMedia("(prefers-reduced-motion: reduce)").matches),
  };

  let snow = savedSettings.snowEffect;
  function updateSnowing() {
    document.getElementById("snowflakes").style.display = snow ? "block" : "none";
    document.getElementById('snow-icon').src = snow ? '/assets/silk/weather_snow.png' : '/assets/silk/weather_sun.png';
    saveSettings();
  }
  if (!snow) {
    updateSnowing() // apply previously saved changes on page load
  }

  function toggleClick() {
    snow = !snow;
    updateSnowing();
  }

  function saveSettings() {
    const settings = {
        snowEffect: snow,
    };
    localStorage.setItem('snowSettings', JSON.stringify(settings));
  }
</script>
```

The code creates a button with an image (pulled from the icon pack I'm using) in HTML. It makes it absolutely positioned in CSS, so it'll always show on the bottom right corner of the screen.

In JS, it simply toggles displaying the snow by setting the `display` style rule of the `<div>` containing snowflakes between `none` and `block`. It also saves the user's preference with [LocalStorage](https://developer.mozilla.org/en-US/docs/Web/API/Web_Storage_API), which I think is pretty neat. There's probably a more efficient way to write it than all the boilerplate I did with JSON and objects and stuff, but oh well.

If there's no saved preference, the code hides snow by default if the user [prefers reduced motion](https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-reduced-motion), because accessibility is swag.

Happy holidays!

\-jame
