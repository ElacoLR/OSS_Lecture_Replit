# Dillinger
## _The Last Markdown Editor, Ever_

![Static Badge](https://img.shields.io/badge/Powered%20By%20N%20Solid-lightgreen)

![unknown](https://img.shields.io/badge/build-unknown-grey)

Dillinger is a cloud-enabled, mobile-ready, offline-storage compatible,<br>
Angular JS-powered HTML5 Markdown editor.

- Type some Markdown on the left
- See HTML in the right
- :sparkles:Magic:sparkles:

## Features

- Import a HTML file and watch it magically convert to Markdown
- Drag and drop images (requires your Dropbox account be linked)
- Import and save files from GitHub, Dropbox, Google Drive and One Drive
- Drag and drop markdown and HTML files into Dillinger
- Export documents as Markdown, HTML and PDF

Markdown is a lightweight markup language based on the formatting conventions<br>
that people naturally use in email.<br>
As [John Gruber] writes on the [Markdown site]
```
for i in range(10):
  print(hello)
```
> The overriding design goal for Markdown's<br>
> formatting syntax is to make it as readable<br>
> as possible. The idea is that a<br>
> Markdown-formatted document should be<br>
> publishable as-is, as plain text, without<br>
> looking like it's been marked up with tags<br>
> or formatting instructions.

This text you see here is *actually-written in Markdown! To get a feel<br>
for Markdown's syntax, type some text into the left window and<br>
watch the results in the right.

## Tech

Dillinger uses a number of open source projects to work properly:

- [AngularJS] - HTML enhanced for web apps!
- [Ace Editor] - awesome web-based text editor
- [markdown-it] - Markdown parser done right. Fast and easy to extend.
- [Twitter Bootstrap] - great UI boilerplate for modern web apps
- [node.js] - evented I/O for the backend
- [Express] - fast node.js network app framework [@tjholowaychuk]
- [Gulp] - the streaming build system
- [Breakdance] - HTML

## Installation

Dillinger requires [Node.js] v10+ to run.<br>

Install the dependencies and devDependencies and start the server.

```sh
cd dillinger
npm i
node app
```

For production environments...

```sh
npm install --production
NODE_ENV=production node app
```

## Plugins
Dillinger is currently extended with the following plugins.<br>
Instructions on how to use them in your own application are linked below.
|Plugin|README|
|:---|:---|
|Dropbox|[plugins/dropbox/README.md][dMD]|
|GitHub|[plugins/github/README.md][gMD]|
|Google Drive|[plugins/googledrive/README.md][gDMD]|
|OneDrive|[plugins/onedrive/README.md][oMD]|
|Medium|[plugins/medium/README.md][mMD]|

## Development
Want to contribute? Great!<br>

Dillinger uses Gulp + Webpack for fast developing.<br>
Make a change in your file and instantaneously see your updates!<br>

Open your favorite Terminal and run these commands.<br>

First Tab:<br>
```
node app
```

Second Tab:<br>
```
gulp watch
```

(optional) Third:<br>
```
karma test
```

[AngularJS]: <https://en.wikipedia.org/wiki/AngularJS>
[Ace Editor]: <https://en.wikipedia.org/wiki/Ace_(editor)>
[markdown-it]: <https://en.wikipedia.org/wiki/Markdown>
[Twitter Bootstrap]: <https://en.wikipedia.org/wiki/Bootstrap_(front-end_framework)>
[node.js]: <https://en.wikipedia.org/wiki/Node.js>
[Express]: <https://en.wikipedia.org/wiki/Express.js>
[@tjholowaychuk]: <https://github.com/tj>
[Gulp]: <https://en.wikipedia.org/wiki/Gulp.js>
[Breakdance]: <https://breakdance.github.io/breakdance/>

[John Gruber]: <https://en.wikipedia.org/wiki/John_Gruber>
[Markdown site]: <https://daringfireball.net/projects/markdown/>

[dMD]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
[gMD]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
[gDMD]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
[oMD]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
[mMD]:<https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>