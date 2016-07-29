'use strict';

const config = require('../../config');


exports.view = function(ctrl)  {return {tag: "div", attrs: {}, children: [
  {tag: "div", attrs: {class:"text-justify"}, children: [
    {tag: "p", attrs: {}, children: [
        {tag: "img", attrs: {src: config.staticRoot + 'img/grapplersinc150.jpg', 
             alt:"At Grapplers Inc", 
             title:"At Grapplers Inc", 
             id:"aboutme-portrait"}}, 
    {tag: "span", attrs: {class:"lead"}, children: ["Call me Petter. Some years ago—never mind how long" + ' ' +
    "precisely"]}, {tag: "a", attrs: {class:"popover-dynamic", 
                       "data-toggle":"popover", 
                       "data-content":"It was in 2001."}, children: [{tag: "span", attrs: {class:"lead"}, children: ["⁽¹⁾"]}]}, {tag: "span", attrs: {class:"lead"}, children: ["—having" + ' ' +
    "little or no money in my purse, and nothing particular to interest me in" + ' ' +
    "Sweden, I thought I would fly about a little and see the North American" + ' ' +
    "part of the world."]}, " So it is that (spleen or no spleen, grimness" + ' ' +
    "or no grimness about the mouth) I now live in Vancouver, British Columbia," + ' ' +
    "via a brief stint in ", {tag: "i", attrs: {}, children: [{tag: "abbr", attrs: {title:"Québec"}, children: ["la belle province"]}]}, ":" + ' ' +
    "Programmer, sesquipedalian, and general geek; possessor of slight" + ' ' +
    "alphabet soup (M.Sc., Hon.B.Sc.) in Computer Science; enthusiastically" + ' ' +
    "plying my trade, reading whatever falls into my lap, and refusing to" + ' ' +
    "accept that the personal website is", 
    {tag: "a", attrs: {href:"https://www.youtube.com/watch?v=D9tAKLTktY0#t=1m49s"}, children: ["all dead"]}, "."
    ]}, 

    {tag: "h2", attrs: {}, children: [
        {tag: "a", attrs: {href:"https://www.youtube.com/watch?v=kdrjzE1SE58#t=21s"}, children: ["Would you" + ' ' +
            "like to know more?"]}
    ]}, 

    {tag: "p", attrs: {}, children: [
        "I’m from ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Finspång"}, children: ["Finspång"]}, "," + ' ' +
        "Sweden, a town which earned its one-time wealth by manufacturing cannon" + ' ' +
        "and cannonballs and now produces large turbines and expatriates (much like" + ' ' +
        "Lancre, it is more a place to be ", {tag: "em", attrs: {}, children: ["from"]}, " than to live in). I grew up" + ' ' +
        "on a steady diet of Astrid Lindgren, Biggles," + ' ' +
        "J.R.R. Tolkien", {tag: "a", attrs: {class:"popover-dynamic", 
                         "data-toggle":"popover", 
                         "data-content":"<abbr title='The Lord of the Rings'>LotR</abbr> about 50 times by now, the Silmarillion about 30. Questions?"}, children: ["⁽²⁾"]}, "," + ' ' +
        "and fantasy fiction (both the good and the majority)."
    ]}, 

    {tag: "p", attrs: {}, children: [
        "In 2001, I cast my twenty-sided die and crossed my Rubicon to get out of" + ' ' +
        "Sweden and shake up my life. I got my B.Sc. at", 
        {tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}, " in a little" + ' ' +
        "town called ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Lennoxville,_Quebec"}, children: ["Lennoxville"]}, "," + ' ' +
        "Québec (legally, it’s not a town anymore). I also grew up a little. In" + ' ' +
        "retrospect, a bigger school (like a proper university) might have offered" + ' ' +
        "more academically—I liked most of my professors, but there weren’t enough" + ' ' +
        "of them to do much about the course selection—but I like to think that I" + ' ' +
        "needed a little university like that during my metamorphosis. On" + ' ' +
        "pupation or graduation, I moved on to a rather bigger town with a rather" + ' ' +
        "bigger university, ", {tag: "i", attrs: {}, children: ["viz."]}, " the ", {tag: "a", attrs: {href:"http://cs.ubc.ca"}, children: ["Department" + ' ' +
        "of Computer Science"]}, " at the ", {tag: "a", attrs: {href:"http://www.ubc.ca"}, children: ["University of" + ' ' +
        "British Columbia"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Vancouver"}, children: ["Vancouver"]}, "." + ' ' +
        "It was also a good experience, although I’m kind of glad I didn’t do my" + ' ' +
        "undergrad there. One might drown, while the scale of the graduate" + ' ' +
        "departments allowed for a more personal experience."
    ]}, 

    {tag: "p", attrs: {}, children: [
        "I sort of miss Lennoxville. The summers were dreadful, but the autumns" + ' ' +
        "were aflame with countless millions of maples, and the winters were" + ' ' +
        "crisp and fresh. Better thirty above than thirty below, I like to say;" + ' ' +
        "and at forty below, everything is great—it even solves communication" + ' ' +
        "problems, since the benighted Fahrenheit scale coincides with my" + ' ' +
        "compatriot Celsius scale at −40°C=−40°F. (For reference, what I like to" + ' ' +
        "say per the above translates to “better 22 below than 86 above”, which is" + ' ' +
        "not very catchy.) Also, Québec" + ' ' +
        "has ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Poutine"}, children: ["poutine"]}, " as a kind of" + ' ' +
        "artiosclerotic apology for the language laws."
    ]}, 

    {tag: "p", attrs: {}, children: [
        "In 2007, I finished up my master’s" + ' ' +
        "thesis", {tag: "a", attrs: {class:"popover-dynamic", 
                 "data-toggle":"popover", 
                 "data-content":"<cite>PyRemote: Object mobility in the Python programming language</cite>. …Honestly, I’m not proud of it."
        }, children: ["⁽²⁾"]}, " and got a real job as a Software Developer at ", {tag: "a", attrs: {href:"http://one45.com"}, children: ["one45 Software"]}, "; briefly, as my department" + ' ' +
        "was spun off as ", {tag: "a", attrs: {href:"http://erezlife.com"}, children: ["eRezLife"]}, "." + ' ' +

        "We were a very small shop, so everyone’s finger was in every pie. Hygiene" + ' ' +
        "aside, I think that’s an experience every developer should have, being" + ' ' +
        "forced to learn the entire software stack—not only was I working on the" + ' ' +
        "product itself from top (HTML, Javascript, AJAX) to bottom" + ' ' +
        "(", {tag: "a", attrs: {href:"http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/"}, children: ["PHP"]}, "," + ' ' +
        "MySQL), but since I had some experience with Linux from running my own" + ' ' +
        "boxen from time to time, I also did a bunch of work on deployment and" + ' ' +
        "backup scripts, &c."
    ]}, 
    {tag: "p", attrs: {}, children: [
        "Probably the most interesting thing I did at eRezLife was the residence" + ' ' +
        "assignment module—a subsystem that allowed university residence admins to" + ' ' +
        "automatically assign students to residence beds, with custom weights given" + ' ' +
        "to various qualifications and preferences. That was a lot of fun, both due" + ' ' +
        "to the complexity of the algorithm and the optimisation it took (I learned" + ' ' +
        "my first true lesson on the cost of DB roundtrips when I improved the speed" + ' ' +
        "by a factor of 600 by moving some logic from PHP to a stored procedure)," + ' ' +
        "and for a little anecdote of the “left hand doesn’t know what the right is" + ' ' +
        "doing” type: We were briefly in talks with a university IT department to" + ' ' +
        "possibly acquire (what we gathered was) their system for doing much the" + ' ' +
        "same. The head of residences assured us that it was dead simple for him:" + ' ' +
        "the IT guys had it automated. The IT guys revealed that it didn’t actually" + ' ' +
        "assign rooms or beds, but automated the assignment to buildings—the" + ' ' +
        "residence secretary did the rest, no big deal. The beleaguered secretary" + ' ' +
        "told us that it took up a few weeks at the beginning of every semester." + ' ' +
        "The system I produced could do it in a couple of minutes, though I suspect" + ' ' +
        "that with the additional years of experience I’ve gathered since then," + ' ' +
        "there’s probably another order of magnitude to squeeze out of there."
    ]}, 
    {tag: "p", attrs: {}, children: [
        "In 2012, I was picked up by another small (though slightly larger) company,", 
        {tag: "a", attrs: {href:"http://www.bamsas.com/"}, children: ["BAM Software and Services"]}, ", which is" + ' ' +
        "where I’m working today.", {tag: "a", attrs: {class:"popover-dynamic", 
                                   "data-toggle":"popover", 
                                   "data-content":"Not literally. This was written on a Sunday, when in fact I didn’t work at all."}, children: ["⁽³⁾"]}, 
        "My official title was Software Developer. Due to my own interests, inclinations," + ' ' +
        "and extracurricular activities, I’ve also been given the semi-official" + ' ' +
        "title of Security Alarmist, and I’m also the primary resource for frontend" + ' ' +
        "technologies" + ' ' +
        "(", {tag: "a", attrs: {href:"http://angularjs.org/"}, children: ["AngularJS"]}, ",", 
        {tag: "a", attrs: {href:"http://requirejs.org/"}, children: ["RequireJS"]}, ",", 
        {tag: "a", attrs: {href:"http://gruntjs.com/"}, children: ["Grunt"]}, ",", 
        {tag: "a", attrs: {href:"http://bower.io/"}, children: ["Bower"]}, ", and that sort of thing)." + ' ' +
        "I am also—in very concrete reality albeit not on my business" + ' ' +
        "card", {tag: "a", attrs: {class:"popover-dynamic", 
               "data-toggle":"popover", 
               "data-content":"Another metaphor: I don’t have a business card."}, children: ["⁽⁴⁾"]}, "—the" + ' ' +
        "technical lead for ", {tag: "a", attrs: {href:"https://www.fanex.com"}, children: ["FanEx"]}, ". The work is" + ' ' +
        "in Java (which is not my favourite but, on the bright side, is not PHP)," + ' ' +
        "JS, and a liberal sprinkling of SQL, where I’ve found that albeit that I" + ' ' +
        "am not a fan of Microsoft, they’ve cranked out a pretty decent product in" + ' ' +
        "SQL Server, especially in the fantastic dev tools. (If only we didn’t have" + ' ' +
        "to run it on a Windows VM…)"
    ]}, 

    {tag: "p", attrs: {}, children: [
        "My hobbies have at various times included karate, Brazilian jiu-jitsu," + ' ' +
        "fantasy role playing games,", 
        {tag: "a", attrs: {href:"/gallery"}, children: ["drawing"]}, "," + ' ' +
        "writing fiction", {tag: "a", attrs: {class:"popover-dynamic", 
                          "data-toggle":"popover", 
                          "data-content":"I’ve completed two novel-length stories, both of which are terrible. You can’t read them."}, children: ["⁽⁵⁾"]}, "," + ' ' +
        "playing computer games, swordfighting, weight lifting, board games," + ' ' +
        "and chess. My hobbies ", {tag: "em", attrs: {}, children: ["at present"]}, " I shan’t go into, because I" + ' ' +
        "update this section of the website so rarely that any claims about the" + ' ' +
        "present time spend most of their time being wrong." + ' ' +
        "The exception is reading, which I do", 
        {tag: "a", attrs: {href:"/books", "data-ui-sref":"books.list"}, children: ["quite a lot"]}, "."
    ]}
]}, 


{tag: "div", attrs: {}, children: [
    {tag: "h2", attrs: {id:"education"}, children: ["Education"]}, 

    {tag: "table", attrs: {class:"table table-striped"}, children: [
        {tag: "caption", attrs: {}, children: ["Schools"]}, 
        {tag: "tbody", attrs: {}, children: [
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"http://www.ubc.ca"}, children: ["The University of British" + ' ' +
                    "Columbia"]}, {tag: "br", attrs: {}}, 
                {tag: "a", attrs: {class:"text-muted", href:"http://cs.ubc.ca"}, children: ["Department of Computer Science"]}
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2005–2007"]}, 

            {tag: "td", attrs: {}, children: [
                "Graduate (M.Sc.):", {tag: "br", attrs: {}}, 
                "Master of Computer Science"
            ]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"http://vancouver.ca/"}, children: ["Vancouver"]}, ", ", {tag: "a", attrs: {href:"http://www.gov.bc.ca/bvprd/bc/home.do"}, children: [{tag: "abbr", attrs: {title:"British Columbia"}, children: ["BC"]}]}, ", ", {tag: "a", attrs: {href:"http://canada.gc.ca/"}, children: ["Canada"]}
            ]}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}, {tag: "br", attrs: {}}, 
                {tag: "a", attrs: {class:"text-muted", href:"http://cs.ubishops.ca"}, children: ["Department of Computer Science"]}
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2001–2005"]}, 

            {tag: "td", attrs: {}, children: [
                "Undergraduate (B.Sc.):", {tag: "br", attrs: {}}, 
                "Honours in Computer Science,", {tag: "br", attrs: {}}, 
                "Minor in Mathematics"
            ]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Lennoxville,_Quebec"}, children: ["Lennoxville"]}, ", ", {tag: "a", attrs: {href:"http://www.bonjourquebec.com/anglais/index.html"}, children: ["Québec"]}, ", ", {tag: "a", attrs: {href:"http://canada.gc.ca/"}, children: ["Canada"]}
            ]}
        ]}, 
        {tag: "tr", attrs: {class:"text-muted"}, children: [
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Finspång/bergska/start.htm"}, children: ["Bergska" + ' ' +
                "skolan"]}]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["1998–2001"]}, 

            {tag: "td", attrs: {}, children: [
                "High school (Swedish ", {tag: "a", attrs: {href:"https://en.wiktionary.org/wiki/gymnasieskola"}, children: ["gymnasium"]}, ";" + ' ' +
                "grades 10–12)"]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Finspång"}, children: ["Finspång"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Östergötland_County"}, children: ["Östergötland"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Sweden"}, children: ["Sweden"]}
            ]}
        ]}, 

        {tag: "tr", attrs: {class:"text-muted"}, children: [
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.finspang.se/Utbildning/Grundskolor/Vara-grundskolor/Nyhemsskolan/"}, children: ["Nyhemsskolan"]}
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["1995–1998"]}, 
            {tag: "td", attrs: {}, children: ["Elementary (grades 7–9)"]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Finspång"}, children: ["Finspång"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Östergötland_County"}, children: ["Östergötland"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Sweden"}, children: ["Sweden"]}
            ]}
        ]}, 


        {tag: "tr", attrs: {class:"text-muted"}, children: [
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.finspang.se/Utbildning/Grundskolor/Vara-grundskolor/Viggestorpsskolan/"}, children: ["Viggestorpsskolan"]}
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["1989–1995"]}, 
            {tag: "td", attrs: {}, children: ["Elementary (grades 1–6)"]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Finspång"}, children: ["Finspång"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Östergötland_County"}, children: ["Östergötland"]}, ", ", {tag: "a", attrs: {href:"https://en.wikipedia.org/wiki/Sweden"}, children: ["Sweden"]}
            ]}
        ]}
        ]}
    ]}, 

    {tag: "br", attrs: {}}, 

    {tag: "table", attrs: {class:"table table-striped"}, children: [
        {tag: "caption", attrs: {}, children: ["Awards and scholarships"]}, 
        {tag: "tbody", attrs: {}, children: [
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["UBC International Student scholarship"]}, 
            {tag: "td", attrs: {}, children: [
                {tag: "a", attrs: {href:"http://cs.ubc.ca"}, children: ["Department of Computer Science"]}, ", ", {tag: "a", attrs: {href:"http://www.ubc.ca"}, children: ["UBC"]}
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2005–2006, 2006–2007"]}, 
            {tag: "td", attrs: {}/*<!--$3,300 CDN -->Annual scholarship.*/}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["The University Prize in Computer Science"]}, 
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2005"]}, 
            {tag: "td", attrs: {}/*<!--$100 award.-->*/}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["Stephen St. Clair Memorial Scholarship"]}, 
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2002–2003, 2003–2004, 2004–2005"]}, 
            {tag: "td", attrs: {}, children: [/*<!--$4,000 CDN annual scholarship.-->*/
                "Awarded on basis of academic standing for 2002–2003. Renewed" + ' ' +
                "for 2003–2004 and again 2004–2005."
            ]}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["The Albert Kwong Memorial Prize in Computer Science"]}, 
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2002"]}, 
            {tag: "td", attrs: {}, children: ["Awarded on basis of academic standing. "/*<!--$50 CDN award.-->*/]}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["The U-1 Alumni Prize"]}, 
            {tag: "td", attrs: {}, children: [{tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["Bishop’s University"]}]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2002"]}, 
            {tag: "td", attrs: {}, children: ["Highest academic standing among male first-year students at ", {tag: "a", attrs: {href:"http://www.ubishops.ca"}, children: ["B.U."]}, " "/*<!--; $50 CDN award.-->*/]}
        ]}, 
        {tag: "tr", attrs: {}, children: [
            {tag: "td", attrs: {}, children: ["Georg Leires fond (", {tag: "em", attrs: {}, children: ["The Georg Leire Fund"]}, ")"]}, 

            {tag: "td", attrs: {}, children: [
                "Stiftelsen för Georg Leires fond" + ' ' +
                "(", {tag: "i", attrs: {}, children: ["The Foundation of the Georg Leire Fund"]}, ")"
            ]}, 
            {tag: "td", attrs: {class:"pres_table_c"}, children: ["2001"]}, 
            {tag: "td", attrs: {}}
          /*
            <!--td>Scholarship of <a
			href="http://finance.yahoo.com/currency/convert?amt=9000&amp;from=SEK&amp;to=CAD&amp;submit=Convert">9,000 SEK</a>. Bequeathed by committee through
			<a href="https://en.wikipedia.org/wiki/Finspång/bergska/start.htm">Bergska skolan</a>.</td-->
           */
        ]}
        ]}
    ]}
  ]}
]};};
