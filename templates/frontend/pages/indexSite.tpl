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
  {assign var="themePath" value=$baseUrl|cat:"/plugins/themes/bootstrap3/"}
{include file="frontend/components/header.tpl"}
<div class="container-fluid">
  <!-- ======= Cta Section ======= -->
  {if $about}
    <section id="cta" class="cta">
      <div class="container">
          <div class="text-center text-lg-start text-justify">
            <p>{$about|strip_tags|nl2br}</p>
          </div>
      </div>
    </section><!-- End Cta Section -->
  {/if}
</div>
<!-- ======= Cta Section ======= -->
<!-- ======= journals display Section ======= -->
<div class="container">

    <div class="page-header w-100 my-4">
      <h2 class="d-flex align-items-center pb-2 border-bottom" style="font-family: 'Muli', sans-serif;">
        <span class="me-3">
          <i class="bi bi-bookmark-heart-fill"></i>
        </span>
        <strong>{translate key="context.contexts"}</strong>
      </h2>
    </div>

  	<div class="journals row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
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
                <img class="card-img-top img-fluid" src="{$themePath}assets/img/placeholder.png" alt="Placeholder" width="250" height="300">
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
<!-- ======= journals display Section ======= -->

{include file="frontend/components/footer.tpl"}
