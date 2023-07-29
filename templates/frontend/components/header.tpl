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
{assign var="themePath" value=$baseUrl|cat:"/plugins/themes/bootstrap3/"}
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
		{** <div class="bg-info">
			 <nav id="accessibility-nav" class="sr-only" role="navigation" aria-label="{translate|escape key="plugins.themes.bootstrap3.accessible_menu.label"}">
			// 	<ul>
			// 	<li><a href="#main-navigation">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_navigation"}</a></li>
			// 	<li><a href="#main-content">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.main_content"}</a></li>
			// 	<li><a href="#sidebar">{translate|escape key="plugins.themes.bootstrap3.accessible_menu.sidebar"}</a></li>
			// 	</ul>
			// </nav>
			*}
			{* Header *}

		<header id="header" class="d-flex align-items-center">
			<div class="container d-flex justify-content-between">
				{* Logo or site title. Only use <h1> heading on the homepage.
							Otherwise that should go to the page title. *}
				{capture assign="homeUrl"}
									{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
								{/capture}

				<div class="logo">
					<!-- <h1 class="text-light"><a href="index.html">Flattern</a></h1> -->
					<!-- Uncomment below if you prefer to use an image logo -->
					<a href="{$homeUrl}"><img src="{$themePath}assets/img/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" class="img-fluid"></a>
				</div>
			

				
				
				
		</header>
		

		{* Wrapper for page content and sidebars *}
		<div class="pkp_structure_content container">
			<main class="pkp_structure_main col-xs-12 col-sm-10 col-md-8" role="main">
			<div align="center"><h3 align="center" class="text-danger">Welcome to JU Journal Mangement System</h3> </div>
