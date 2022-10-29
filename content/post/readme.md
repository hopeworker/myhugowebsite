---
title:       "Setup your website using 'clean white' theme"
subtitle:    "setup your website"
description: "setup your website"
date:        2022-10-16
author:      ""
image:       ""
tags:        ["hugo", "personal website"]
categories:  ["Tech" ]
---


### Install


```sh
brew install hugo  
hugo version  
hugo new site myhugowebsite
```

### Download theme  

```sh
cd myhugowebsite  
git init  
cd themes  
git submodule add https://github.com/hopeworker/hugo-theme-cleanwhite themes/hugo-theme-cleanwhite

git clone https://github.com/hopeworker/hugo-theme-cleanwhite.git  
cp -r hugo-theme-cleanwhite/exampleSite/** ../
```

### Add post  

```sh
hugo new post/my-first-post.md
```

### Launch  

```sh
hugo server -D
```

### Build static pages  

```sh
hugo -D
```


![](/img/setup-your-website/screenshot.png)  

### Reference  
https://gohugo.io/getting-started/quick-start/  
https://themes.gohugo.io/  
https://themes.gohugo.io/themes/hugo-theme-cleanwhite/  
https://themes.gohugo.io/themes/hugo-theme-cleanwhite/#comment-systems  
