'use strict';

const config = require('../../config');


exports.view = (ctrl) => <div>
  <div class="text-justify">
    <p>
        <img src={ config.staticRoot + 'img/grapplersinc150.jpg' }
             alt="At Grapplers Inc"
             title="At Grapplers Inc"
             id="aboutme-portrait" />
    <span class="lead">Call me Petter. Some years ago—never mind how long
    precisely</span><a class="popover-dynamic"
                       data-toggle="popover"
                       data-content="It was in 2001."><span class="lead">⁽¹⁾</span></a><span class="lead">—having
    little or no money in my purse, and nothing particular to interest me in
    Sweden, I thought I would fly about a little and see the North American
    part of the world.</span> So it is that (spleen or no spleen, grimness
    or no grimness about the mouth) I now live in Vancouver, British Columbia,
    via a brief stint in <i><abbr title="Québec">la belle province</abbr></i>:
    Programmer, sesquipedalian, and general geek; possessor of slight
    alphabet soup (M.Sc., Hon.B.Sc.) in Computer Science; enthusiastically
    plying my trade, reading whatever falls into my lap, and refusing to
    accept that the personal website is
    <a href="https://www.youtube.com/watch?v=D9tAKLTktY0#t=1m49s">all dead</a>.
    </p>

    <h2>
        <a href="https://www.youtube.com/watch?v=kdrjzE1SE58#t=21s">Would you
            like to know more?</a>
    </h2>

    <p>
        I’m from <a href="https://en.wikipedia.org/wiki/Finspång">Finspång</a>,
        Sweden, a town which earned its one-time wealth by manufacturing cannon
        and cannonballs and now produces large turbines and expatriates (much like
        Lancre, it is more a place to be <em>from</em> than to live in). I grew up
        on a steady diet of Astrid Lindgren, Biggles,
        J.R.R. Tolkien<a class="popover-dynamic"
                         data-toggle="popover"
                         data-content="<abbr title='The Lord of the Rings'>LotR</abbr> about 50 times by now, the Silmarillion about 30. Questions?">⁽²⁾</a>,
        and fantasy fiction (both the good and the majority).
    </p>

    <p>
        In 2001, I cast my twenty-sided die and crossed my Rubicon to get out of
        Sweden and shake up my life. I got my B.Sc. at
        <a href="http://www.ubishops.ca">Bishop’s University</a> in a little
        town called <a href="https://en.wikipedia.org/wiki/Lennoxville,_Quebec">Lennoxville</a>,
        Québec (legally, it’s not a town anymore). I also grew up a little. In
        retrospect, a bigger school (like a proper university) might have offered
        more academically—I liked most of my professors, but there weren’t enough
        of them to do much about the course selection—but I like to think that I
        needed a little university like that during my metamorphosis. On
        pupation or graduation, I moved on to a rather bigger town with a rather
        bigger university, <i>viz.</i> the <a href="http://cs.ubc.ca">Department
        of Computer Science</a> at the <a href="http://www.ubc.ca">University of
        British Columbia</a>, <a href="https://en.wikipedia.org/wiki/Vancouver">Vancouver</a>.
        It was also a good experience, although I’m kind of glad I didn’t do my
        undergrad there. One might drown, while the scale of the graduate
        departments allowed for a more personal experience.
    </p>

    <p>
        I sort of miss Lennoxville. The summers were dreadful, but the autumns
        were aflame with countless millions of maples, and the winters were
        crisp and fresh. Better thirty above than thirty below, I like to say;
        and at forty below, everything is great—it even solves communication
        problems, since the benighted Fahrenheit scale coincides with my
        compatriot Celsius scale at −40°C=−40°F. (For reference, what I like to
        say per the above translates to “better 22 below than 86 above”, which is
        not very catchy.) Also, Québec
        has <a href="https://en.wikipedia.org/wiki/Poutine">poutine</a> as a kind of
        artiosclerotic apology for the language laws.
    </p>

    <p>
        In 2007, I finished up my master’s
        thesis<a class="popover-dynamic"
                 data-toggle="popover"
                 data-content="<cite>PyRemote: Object mobility in the Python programming language</cite>. …Honestly, I’m not proud of it."
        >⁽²⁾</a> and got a real job as a Software Developer at <a href="http://one45.com">one45 Software</a>; briefly, as my department
        was spun off as <a href="http://erezlife.com">eRezLife</a>.

        We were a very small shop, so everyone’s finger was in every pie. Hygiene
        aside, I think that’s an experience every developer should have, being
        forced to learn the entire software stack—not only was I working on the
        product itself from top (HTML, Javascript, AJAX) to bottom
        (<a href="http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/">PHP</a>,
        MySQL), but since I had some experience with Linux from running my own
        boxen from time to time, I also did a bunch of work on deployment and
        backup scripts, &amp;c.
    </p>
    <p>
        Probably the most interesting thing I did at eRezLife was the residence
        assignment module—a subsystem that allowed university residence admins to
        automatically assign students to residence beds, with custom weights given
        to various qualifications and preferences. That was a lot of fun, both due
        to the complexity of the algorithm and the optimisation it took (I learned
        my first true lesson on the cost of DB roundtrips when I improved the speed
        by a factor of 600 by moving some logic from PHP to a stored procedure),
        and for a little anecdote of the “left hand doesn’t know what the right is
        doing” type: We were briefly in talks with a university IT department to
        possibly acquire (what we gathered was) their system for doing much the
        same. The head of residences assured us that it was dead simple for him:
        the IT guys had it automated. The IT guys revealed that it didn’t actually
        assign rooms or beds, but automated the assignment to buildings—the
        residence secretary did the rest, no big deal. The beleaguered secretary
        told us that it took up a few weeks at the beginning of every semester.
        The system I produced could do it in a couple of minutes, though I suspect
        that with the additional years of experience I’ve gathered since then,
        there’s probably another order of magnitude to squeeze out of there.
    </p>
    <p>
        In 2012, I was picked up by another small (though slightly larger) company,
        <a href="http://www.bamsas.com/">BAM Software and Services</a>, which is
        where I’m working today.<a class="popover-dynamic"
                                   data-toggle="popover"
                                   data-content="Not literally. This was written on a Sunday, when in fact I didn’t work at all.">⁽³⁾</a>
        My official title was Software Developer. Due to my own interests, inclinations,
        and extracurricular activities, I’ve also been given the semi-official
        title of Security Alarmist, and I’m also the primary resource for frontend
        technologies
        (<a href="http://angularjs.org/">AngularJS</a>,
        <a href="http://requirejs.org/">RequireJS</a>,
        <a href="http://gruntjs.com/">Grunt</a>,
        <a href="http://bower.io/">Bower</a>, and that sort of thing).
        I am also—in very concrete reality albeit not on my business
        card<a class="popover-dynamic"
               data-toggle="popover"
               data-content="Another metaphor: I don’t have a business card.">⁽⁴⁾</a>—the
        technical lead for <a href="https://www.fanex.com">FanEx</a>. The work is
        in Java (which is not my favourite but, on the bright side, is not PHP),
        JS, and a liberal sprinkling of SQL, where I’ve found that albeit that I
        am not a fan of Microsoft, they’ve cranked out a pretty decent product in
        SQL Server, especially in the fantastic dev tools. (If only we didn’t have
        to run it on a Windows VM…)
    </p>

    <p>
        My hobbies have at various times included karate, Brazilian jiu-jitsu,
        fantasy role playing games,
        <a href="/gallery">drawing</a>,
        writing fiction<a class="popover-dynamic"
                          data-toggle="popover"
                          data-content="I’ve completed two novel-length stories, both of which are terrible. You can’t read them.">⁽⁵⁾</a>,
        playing computer games, swordfighting, weight lifting, board games,
        and chess. My hobbies <em>at present</em> I shan’t go into, because I
        update this section of the website so rarely that any claims about the
        present time spend most of their time being wrong.
        The exception is reading, which I do
        <a href="/books" data-ui-sref="books.list">quite a lot</a>.
    </p>
</div>


<div>
    <h2 id="education">Education</h2>

    <table class="table table-striped">
        <caption>Schools</caption>
        <tbody>
        <tr>
            <td>
                <a href="http://www.ubc.ca">The University of British
                    Columbia</a><br/>
                <a class="text-muted" href="http://cs.ubc.ca">Department of Computer Science</a>
            </td>
            <td class="pres_table_c">2005–2007</td>

            <td>
                Graduate (M.Sc.):<br/>
                Master of Computer Science
            </td>
            <td>
                <a href="http://vancouver.ca/">Vancouver</a>, <a href="http://www.gov.bc.ca/bvprd/bc/home.do"><abbr title="British Columbia">BC</abbr></a>, <a href="http://canada.gc.ca/">Canada</a>
            </td>
        </tr>
        <tr>
            <td>
                <a href="http://www.ubishops.ca">Bishop’s University</a><br/>
                <a class="text-muted" href="http://cs.ubishops.ca">Department of Computer Science</a>
            </td>
            <td class="pres_table_c">2001–2005</td>

            <td>
                Undergraduate (B.Sc.):<br/>
                Honours in Computer Science,<br/>
                Minor in Mathematics
            </td>
            <td>
                <a href="https://en.wikipedia.org/wiki/Lennoxville,_Quebec">Lennoxville</a>, <a href="http://www.bonjourquebec.com/anglais/index.html">Québec</a>, <a href="http://canada.gc.ca/">Canada</a>
            </td>
        </tr>
        <tr class="text-muted">
            <td><a href="https://en.wikipedia.org/wiki/Finspång/bergska/start.htm">Bergska
                skolan</a></td>
            <td class="pres_table_c">1998–2001</td>

            <td>
                High school (Swedish <a href="https://en.wiktionary.org/wiki/gymnasieskola">gymnasium</a>;
                grades 10–12)</td>
            <td>
                <a href="https://en.wikipedia.org/wiki/Finspång">Finspång</a>, <a href="https://en.wikipedia.org/wiki/Östergötland_County">Östergötland</a>, <a href="https://en.wikipedia.org/wiki/Sweden">Sweden</a>
            </td>
        </tr>

        <tr class="text-muted">
            <td><a href="http://www.finspang.se/Utbildning/Grundskolor/Vara-grundskolor/Nyhemsskolan/">Nyhemsskolan</a>
            </td>
            <td class="pres_table_c">1995–1998</td>
            <td>Elementary (grades 7–9)</td>
            <td>
                <a href="https://en.wikipedia.org/wiki/Finspång">Finspång</a>, <a href="https://en.wikipedia.org/wiki/Östergötland_County">Östergötland</a>, <a href="https://en.wikipedia.org/wiki/Sweden">Sweden</a>
            </td>
        </tr>


        <tr class="text-muted">
            <td><a href="http://www.finspang.se/Utbildning/Grundskolor/Vara-grundskolor/Viggestorpsskolan/">Viggestorpsskolan</a>
            </td>
            <td class="pres_table_c">1989–1995</td>
            <td>Elementary (grades 1–6)</td>
            <td>
                <a href="https://en.wikipedia.org/wiki/Finspång">Finspång</a>, <a href="https://en.wikipedia.org/wiki/Östergötland_County">Östergötland</a>, <a href="https://en.wikipedia.org/wiki/Sweden">Sweden</a>
            </td>
        </tr>
        </tbody>
    </table>

    <br/>

    <table class="table table-striped">
        <caption>Awards and scholarships</caption>
        <tbody>
        <tr>
            <td>UBC International Student scholarship</td>
            <td>
                <a href="http://cs.ubc.ca">Department of Computer Science</a>, <a href="http://www.ubc.ca">UBC</a>
            </td>
            <td class="pres_table_c">2005–2006, 2006–2007</td>
            <td>{/*<!--$3,300 CDN -->Annual scholarship.*/}</td>
        </tr>
        <tr>
            <td>The University Prize in Computer Science</td>
            <td><a href="http://www.ubishops.ca">Bishop’s University</a></td>
            <td class="pres_table_c">2005</td>
            <td>{/*<!--$100 award.-->*/}</td>
        </tr>
        <tr>
            <td>Stephen St. Clair Memorial Scholarship</td>
            <td><a href="http://www.ubishops.ca">Bishop’s University</a></td>
            <td class="pres_table_c">2002–2003, 2003–2004, 2004–2005</td>
            <td>{/*<!--$4,000 CDN annual scholarship.-->*/}
                Awarded on basis of academic standing for 2002–2003. Renewed
                for 2003–2004 and again 2004–2005.
            </td>
        </tr>
        <tr>
            <td>The Albert Kwong Memorial Prize in Computer Science</td>
            <td><a href="http://www.ubishops.ca">Bishop’s University</a></td>
            <td class="pres_table_c">2002</td>
            <td>Awarded on basis of academic standing. {/*<!--$50 CDN award.-->*/}</td>
        </tr>
        <tr>
            <td>The U-1 Alumni Prize</td>
            <td><a href="http://www.ubishops.ca">Bishop’s University</a></td>
            <td class="pres_table_c">2002</td>
            <td>Highest academic standing among male first-year students at <a href="http://www.ubishops.ca">B.U.</a> {/*<!--; $50 CDN award.-->*/}</td>
        </tr>
        <tr>
            <td>Georg Leires fond (<em>The Georg Leire Fund</em>)</td>

            <td>
                Stiftelsen för Georg Leires fond
                (<i>The Foundation of the Georg Leire Fund</i>)
            </td>
            <td class="pres_table_c">2001</td>
            <td></td>
          {/*
            <!--td>Scholarship of <a
			href="http://finance.yahoo.com/currency/convert?amt=9000&amp;from=SEK&amp;to=CAD&amp;submit=Convert">9,000 SEK</a>. Bequeathed by committee through
			<a href="https://en.wikipedia.org/wiki/Finspång/bergska/start.htm">Bergska skolan</a>.</td-->
           */}
        </tr>
        </tbody>
    </table>
  </div>
</div>;
