{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}

{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}


  <!-- ======= Cta Section ======= -->
  {if $journalDescription or $homepageImage}
  <div class="container-fluid">
    <section id="cta" class="cta">
      <div class="container">

        <div class="row">
          <div class="col-lg-9 text-center text-lg-start">
            <p class="text-justify">{$journalDescription|strip_tags|nl2br}</p>
          </div>
          <div class="col-lg-3 cta-btn-container text-center">
            {if $homepageImage}
			<div class="homepage-image">
				<img class="img-fluid" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
			</div>
			{/if}
          </div>
        </div>

      </div>
    </section><!-- End Cta Section -->
</div>
{/if}

<div class="container">
	<div id="main-content" class="page_index_journal">

		{call_hook name="Templates::Index::journal"}
		
		

		

		<!-- Announcements -->
		{if $numAnnouncementsHomepage && $announcements|count}
			<section class="cmp_announcements media">
				<header class="page-header">
					<h2>
						{translate key="announcement.announcements"}
					</h2>
				</header>
				<div class="media-list">
					{foreach name=announcements from=$announcements item=announcement}
						{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
							{break}
						{/if}
						{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					{/foreach}
				</div>
			</section>
		{/if}

		<!-- Latest issue -->
		{if $issue}
			<section class="current_issue">
				<header class="page-header">
					<h2>
						{translate key="journal.currentIssue"}
					</h2>
				</header>
				<p class="current_issue_title lead">
					{$issue->getIssueIdentification()|strip_unsafe_html}
				</p>
				{include file="frontend/objects/issue_toc.tpl"}
				<a href="{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary read-more">
					{translate key="journal.viewAllIssues"}
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</section>
		{/if}

		<!-- Additional Homepage Content -->
		{if $additionalHomeContent}
			<section class="additional_content">
				{$additionalHomeContent}
			</section>
		{/if}
	</div><!-- .page_index_journal -->
</div>

{include file="frontend/components/footer.tpl"}
