{**
 * templates/frontend/components/pagination.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common template for displaying pagination
 *
 * @uses $prevUrl string URL to the previous page
 * @uses $nextUrl string URL to the next page
 * @uses $showingStart int The number of the first item shown on this page
 * @uses $showingEnd int The number of the last item shown on this page
 * @uses $total int The total number of items available
 *}

 
{if $prevUrl || $nextUrl}
	<nav aria-label="{translate|escape key="common.pagination.label"}">
		<ul class="pagination justify-content-center">
			{if $prevUrl}
				<li class="page-item">
					<a class="page-link" href="{$prevUrl}" aria-label="{translate key="help.previous"}">
						<span aria-hidden="true">&larr;</span>
						{translate key="help.previous"}
					</a>
				</li>
			{/if}
			<li class="page-item disabled">
				<span class="page-link">
					{translate key="common.pagination" start=$showingStart end=$showingEnd total=$total}
				</span>
			</li>
			{if $nextUrl}
				<li class="page-item">
					<a class="page-link" href="{$nextUrl}" aria-label="{translate key="help.next"}">
						{translate key="help.next"}
						<span aria-hidden="true">&rarr;</span>
					</a>
				</li>
			{/if}
		</ul>
	</nav>
{/if}

