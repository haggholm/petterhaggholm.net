# petterhaggholm.net

Source code for a new version of my personal website,
[petterhaggholm.net](https://petterhaggholm.net).
Mostly for learning purposes/to play with Express &c. Additionally, I want to
retain the property of my current (Django based) website of generating the same
content either through clientside routing (for faster and smoother transitions)
and ordinary `GET` requests. Ideally, I should like to recover graceful
degradation. After all, its’ a *website*, not a fancy webapp.

* [Express](http://expressjs.com/) and [Bootstrap](http://getbootstrap.com/)
* [Hogan](http://twitter.github.io/hogan.js/) to render Mustache templates,
  because it is fast and works both client and server side
* [Page.js](http://visionmedia.github.io/page.js/) with the
  [Page.js Express mapper](https://github.com/kethinov/page.js-express-mapper.js)
  to reuse the same routes
