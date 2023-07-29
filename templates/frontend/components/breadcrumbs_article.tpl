{**
 * templates/frontend/components/breadcrumbs_article.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a breadcrumb nav item showing the current page. This basic
 *  version is for top-level pages which only need to show the Home link. For
 *  category- and series-specific breadcrumb generation, see
 *  templates/frontend/components/breadcrumbs_catalog.tpl.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 * @uses $issue Issue Issue this article was published in.
 *}

<nav class="cmp_breadcrumbs bg-light" role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
  <ol class="breadcrumb mb-0 py-1">
    <li class="breadcrumb-item">
      <a href="{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}" class="text-dark">
        {translate key="common.homepageNavigationLabel"}
      </a>
    </li>
    <li class="breadcrumb-item">
      <a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="text-dark">
        {translate key="navigation.archives"}
      </a>
    </li>
    <li class="breadcrumb-item">
      <a href="{url page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}" class="text-dark">
        {$issue->getIssueIdentification()|escape}
      </a>
    </li>
    <li class="breadcrumb-item active" aria-current="page">
      {if $currentTitleKey}
        {translate key=$currentTitleKey}
      {else}
        {$currentTitle|escape}
      {/if}
    </li>
  </ol>
</nav>

