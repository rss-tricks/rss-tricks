---
title: How to display RSS feeds in Safari
date: 2021-12-10
---
In getting this site set up, We needed to render xml files in the Safari browser.

After some digging around, I came across [this answer](https://stackoverflow.com/a/49874683).

The key is to have your XML files be sent with the following headers:
```
Content-Type=text/xml; charset=utf-8
X-Content-Type-Options=nosniff
```

So there you go. Our First RSS Trick.

