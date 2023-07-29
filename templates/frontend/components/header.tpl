{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
	{assign var="showingLogo" value=false}
{/if}

<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}



<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	<div class="pkp_structure_page">
		<div class="bg-info">
			<nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
				<ul>
				<li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
				<li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
				<li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
				</ul>
			</nav>

			{* Header *}

			<header id="header" class="site-header">
			{* User profile, login, etc, navigation menu*}
				<nav class="navbar navbar-defatult fluid-navbar">
					<div class="container-fluid">
						<div class="navbar-header">
							{* Logo or site title. Only use <h1> heading on the homepage.
							Otherwise that should go to the page title. *}
							{if $requestedOp == 'index'}
								<h1 class="site-name">
							{else}
								<div class="site-name">
							{/if}
								{capture assign="homeUrl"}
									{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
								{/capture}
								{if $displayPageHeaderLogo}
									<a href="{$homeUrl}" class="navbar-brand">
										<img class="logo-img" style="background-color: white; padding: 5px; border-radius: 10px; border-color: black; border: 2px solid #eee;" height="60px" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if}>
									</a>
								{elseif $displayPageHeaderTitle}
									<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
								{else}
									<a href="{$homeUrl}" class="navbar-brand">
										<img class="logo-img" style="background-color: white;" height="60px" src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
									</a>
								{/if}
							{if $requestedOp == 'index'}
								</h1>
							{else}
								</div>
							{/if}
							{* Mobile hamburger menu *}
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav" aria-expanded="false">
								<span class="sr-only">Toggle navigation</span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</button>
						</div>

							{* Primary site navigation *}
							{capture assign="primaryMenu"}
								{load_menu name="primary" id="main-navigation" ulClass="navbar-nav nav navbar-right"}
								{load_menu name="user" id="navigationUser" ulClass="navbar-nav nav navbar-right"}
							{/capture}



							{if !empty(trim($primaryMenu)) || $currentContext}
								<div id="main-nav" class="collapse navbar-collapse" aria-label="{translate|escape key="common.navigation.site"}">
									{* Search form *}
									{if $currentContext}
										<div class="pull-md-right">
											{include file="frontend/components/searchForm_simple.tpl"}
										</div>
									{/if}
									

									
									
									{* Primary navigation menu for current application *}
									{$primaryMenu}
									
								</div>
							{/if}

					</div>
				
				</nav>

				
				
				
			</header>
		</div> 

		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">
			<div align="center"><h3 align="center" class="text-danger">Welcome to JU Journal Mangement System</h3> </div>
