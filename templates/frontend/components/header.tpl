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

		<div class="d-flex flex-column">
			<div class="top-section bg-light jblue py-2">
				<div class="container d-flex justify-content-between align-items-center">
				<!-- Image on the left -->
				<div>
					<a href="{$baseUrl}"><img src="{$themePath}assets/img/jujms.png" alt="{$siteTitle|escape}" title="{$siteTitle|escape}" class="img-fluid"></a>
				</div>

				{capture assign="searchUrl"}{url page="search"}{/capture}
				<div class="search-box-container">
					<form class="d-flex ms-auto" action="{url page="search"}" method="get">
					<div class="input-group">
						<input type="text" class="form-control bg-white border-primary" name="query" placeholder="{translate key="common.search"}" aria-label="{translate key="common.search"}">
						<button class="btn btn-outline-primary" type="submit">
						<i class="bi bi-search"></i>
						</button>
					</div>
					</form>
				</div>

				
				</div>
			</div>
		</div>
		<header id="header" class="d-flex align-items-center" style="background-color: #035BBC;">
		<div class="container d-flex justify-content-between">
		
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#headerNavbar" aria-controls="headerNavbar" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon">
				<svg class="bi" width="30" height="30" fill="white">
				<use xlink:href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.17.0/icons/list.svg#list"></use>
				</svg>
			</span>
			</button>



			<div class="logo">
			<h2><a class="text-light d-flex justify-content-start" href="{$homeUrl}">{$siteTitle|escape}</a></h2>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="{$homeUrl}"><img src="{$themePath}assets/img/logo.png" alt="{$siteName|escape}" title="{$siteTitle|escape}" class="img-fluid"></a> -->
			</div>

			{* User navigation *}
			<nav class="usernav navbar navbar-expand-lg navbar-light" aria-label="{translate|escape key="common.navigation.user"}">
			<div class="container-fluid">
				<ul class="navbar-nav">
				{* Custom "Home" link *}
				<li class="nav-item">
					<a class="nav-link" href="{$baseUrl}" title="{translate|escape key="navigation.home"}" style="color: #D8E6F6;">{translate key="navigation.home"}</a>
				</li>

				{* Custom "About" link *}
				{if $issueExists}
				<li class="nav-item">
					<a class="nav-link" href="{url page="about" op="index"}" title="{translate|escape key="navigation.about"}" style="color: #D8E6F6;">{translate key="navigation.about"}</a>
				</li>
				{/if}

				{load_menu name="user" id="navigationUser" liClass="nav-item profile"}
				</ul>
			</div>
			</nav>
		</div>
		</header>
