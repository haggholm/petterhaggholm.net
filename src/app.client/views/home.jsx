'use strict';

const staticRoot = require('../../config').staticRoot;


exports.view = (ctrl) => <div class="text-justify" style="margin-top: 5ex;">
  <p class="lead">
    Welcome to the website of the one and only Petter Häggholm, who believes
    that the personal website isn’t all dead,
    only <a href="https://www.youtube.com/watch?v=D9tAKLTktY0#t=1m49s">mostly dead</a>.
  </p>

  <p>
    Here you’ll find information about <a href="/aboutme">about me</a> and
    some of my <a href="/gallery">artwork</a>.
    You can also grab my <a href={ staticRoot + 'misc/petter_haggholm_resume.pdf' }
                            target="_blank">résumé <i class="fa fa-download"></i></a> and
    my <a href={ staticRoot + 'misc/petterhaggholm.net-0x892C8636-pub.asc' }
       target="_blank">PGP public key <i class="fa fa-key"></i></a>.
    To find more of me, just follow the links at the top.
  </p>

  <div class="alert alert-info" style="margin-top:5ex;">
    <p>
      If you’re technically inclined, you might like to note that although
      this site uses <a href="http://angularjs.org/">AngularJS</a> in
      HTML5 <code>pushState</code> mode, you can still deep link and view
      page source <em>and it works</em>. The page transition smoothness of
      single-page apps with the parseability and crawlability of a traditional
      HTML page … <a href="https://www.youtube.com/watch?v=_wEVBjP3Kk8#t=30s">it’s
      cool,
      huh?</a>
    </p>
  </div>
</div>;

// <!--div style="margin-top: 3em;">
// <p style="text-align:center;">
//     <a href="https://www.digitalocean.com/?refcode=75b24f7a845b"><img
//         src="https://www.digitalocean.com/assets/v2/badges/digitalocean-badge-blue.png"
//         title="DigitalOcean: SSD cloud VPS"
//         alt="DigitalOcean" /></a>
// </p>
// -->
