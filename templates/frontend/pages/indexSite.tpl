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

<div id="main-site" class="page_index_site">

  {if $about}
    <div class="about_site">
      {$about|nl2br}
    </div>
  {/if}

  <div class="journals">
    <div class="page-header">
      <h2>
        {translate key="context.contexts"}
      </h2>
    </div>

    {if !count($journals)}
      <div class="no_journals">
        {translate key="site.noJournals"}
      </div>

    {else}
      <ul class="list-unstyled">
        {foreach from=$journals item=journal}
          {capture assign="url"}{url journal=$journal->getPath()}{/capture}
          {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
          {assign var="description" value=$journal->getLocalizedDescription()}
          <li class="media mb-4">
            {if $thumb}
              <a href="{$url|escape}">
                <img class="img-thumbnail mr-3" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}" alt="{$thumb.altText|escape}">
              </a>
            {/if}
            <div class="media-body">
              <h3 class="mt-0">
                <a href="{$url|escape}" rel="bookmark">
                  {$journal->getLocalizedName()}
                </a>
              </h3>
              {if $description}
                <div class="description">
                  {$description|nl2br}
                </div>
              {/if}
              <ul class="nav nav-pills">
                <li class="nav-item">
                  <a class="nav-link" href="{$url|escape}">
                    {translate key="site.journalView"}
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
                    {translate key="site.journalCurrent"}
                  </a>
                </li>
              </ul>
            </div>
          </li>
        {/foreach}
      </ul>
    {/if}
  </div>

</div><!-- .page -->


{include file="frontend/components/footer.tpl"}
