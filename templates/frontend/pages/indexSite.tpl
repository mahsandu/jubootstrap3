{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}
<div class="container">
<div id="main-site" class="page_index_site">
	<!-- ======= Cta Section ======= -->
	 {if $about}
    <section id="cta" class="cta">
      <div class="container">

        <div class="row">
          <div class="col-lg-9 text-center text-lg-left">
            <p>{$about|strip_tags|nl2br}</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            <a class="cta-btn align-middle" href="#">Submit an Article</a>
          </div>
        </div>

      </div>
    </section><!-- End Cta Section -->
	{/if}


  <div class="journals row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
    <div class="page-header w-100 mb-4">
      <h2 style="font-size: 24px;">
        {translate key="context.contexts"}
      </h2>
    </div>

    {if !count($journals)}
      <div class="no_journals">
        {translate key="site.noJournals"}
      </div>
    {else}
      {foreach from=$journals item=journal}
        {capture assign="url"}{url journal=$journal->getPath()}{/capture}
        {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
        {assign var="description" value=$journal->getLocalizedDescription()}

        <div class="col mb-4">
          <div class="card h-100">
            <a href="{$url|escape}">
              {if $thumb}
                <img class="card-img-top img-thumbnail" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}" alt="{$thumb.altText|escape}" width="300" height="450">
              {else}
                <img class="card-img-top img-thumbnail" src="path/to/placeholder-image.jpg" alt="Placeholder" width="300" height="450">
              {/if}
            </a>
            <div class="card-body">
              <h3 class="card-title" style="font-size: 20px;">
                <a href="{$url|escape}" rel="bookmark">
                  {$journal->getLocalizedName()}
                </a>
              </h3>
              {if $description}
                <p class="card-text">
                  {if strlen($description) > 200}
                    {substr(strip_tags($description), 0, 200)|escape}...
                  {else}
                    {$description|strip_tags|escape}
                  {/if}
                </p>
              {/if}
            </div>
            <div class="card-footer d-flex justify-content-end">
              <a class="btn btn-light text-shadow" href="{$url|escape}">
                {translate key="site.journalView"}
              </a>
              <a class="btn btn-light text-shadow" href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
                {translate key="site.journalCurrent"}
              </a>
            </div>
          </div>
        </div>
      {/foreach}
    {/if}
  </div>
</div><!-- .page -->
</div>

{include file="frontend/components/footer.tpl"}
