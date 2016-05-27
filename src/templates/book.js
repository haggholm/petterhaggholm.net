<h2>
  {{~#if book.rating~}}
    {{~rating_link book.id book.rating~}}
    &nbsp;
  {{~/if~}}
  {{~book.english_title~}}
</h2>

{{~#each book.volumes~}}
<p>Book {{volume}} of <a href="/series/{{series.id}}">{{series.title}}</a>.</p>
{{~/each~}}

<table class="table table-striped">
  <tbody>
  <tr>
    <th>Author{{#if book.hasMultipleAuthors}}s{{/if}}</th>
    <td>
      {{~#if book.hasMultipleAuthors~}}
        <ul>
          {{~#each book.authors~}}
          <li><a href="/authors/{{author.id}}">{{author.full_name}}</a></li>
          {{~/each~}}
        </ul>
      {{^}}
        {{~#each book.authors~}}
        <a href="/authors/{{id}}">{{full_name}}</a>
        {{~/each~}}
      {{/if}}
    </td>
  </tr>

  {{#if book.translated}}
    <tr>
      <th>Original title</th>
      <td>{{book.title}}</td>
    </tr>
    <tr>
      <th>Original language</th>
      <td>{{book.language.name}}</td>
    </tr>
    {{#each book.translations}}
    <tr>
      <th>Translation</th>
      <td>
        <cite>{{title}}</cite> by
        {{~#each translation.translators~}}
          {{full_name}}
        {{~/each~}}
      </td>
    </tr>
    {{/each}}
  {{/if}}

  {{#if book.any_isbn}}
  <tr>
    <th>ISBN</th>
    <td>{{book.any_isbn}}</td>
  </tr>
  {{/if}}
  <tr>
    <th>Find&nbsp;it</th>
    <td>
      {{~worldcat_search book~}}<br/>
      {{~gutenberg_search book~}}
    </td>
  </tr>
  <tr>
    <th>Buy&nbsp;it</th>
    <td>
      {{~amazon_search book~}}<br/>
      {{~chapters_search book~}}<br/>
      {{~abe_search book~}}
    </td>
  </tr>



  <tr>
    <th>Notes</th>
    <td>
      {{#if book.notes}}
        {{#if book.has_series_notes}}
        <h5>
          On <cite>book.english_title</cite>
        </h5>
        {{/if}}
        {{{book.notes}}}
      {{/if}}
      {{#each volumes}}
        {{#if series.notes}}
        <h5>
          On
          <a href="/series/{{volume.series.id}}"><cite>{{volume.series.title}}</cite></a>
        </h5>
        {{{volume.series.notes}}}
        {{/if}}
      {{/each}}

      {{#if book.hasReview}}
        <tr>
          <th>Review</th>
          <td>
            {{#if book.review}}
              {{#if book.has_series_review}}
                <h5>
                  Of <cite>{{book.english_title}}</cite>
                </h5>
              {{/if}}
              {{{book.review}}}
            {{/if}}

            {{~#each book.volumes~}}
              {{~#if series.review~}}
                <h5>
                  Of
                  <a href="/series/{{series.id}}">
                    <cite>{{series.title}}</cite>
                  </a>
                </h5>
                {{{series.review}}}
              {{~/if~}}
            {{~/each~}}
          </td>
        </tr>
      {{/if}}

      {{~#if book.has_translation_notes~}}
      <h5>Miscellaneous</h5>
      <ul class="bullets">
        {{~#unless book.isEnglish}}{{#if book.translations~}}
          {{~#if book.read_original~}}
            <li>I’ve read the original {{book.language.name}}.</li>
          {{~^~}}
            <li>I haven’t read the original {{book.language.name}}.</li>
          {{~/if~}}
        {{~/if}}{{/unless~}}
        {{~#if book.isEnglish}}{{#if book.read_original~}}
          <li>I’ve read the original {{book.language.name}}.</li>
        {{~/if}}{{/if~}}
      </ul>
      {{~/if~}}
    </td>
  </tr>
  </tbody>
</table>
