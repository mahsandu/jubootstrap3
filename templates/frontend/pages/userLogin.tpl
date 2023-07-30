{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2000-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}

<div class="container">
	<div id="main-content" class="page page_login">

		<!-- A login message may be displayed if the user was redirected to the login page from another request. Examples include if login is required before downloading a file. -->
		{if $loginMessage}
			<div class="alert alert-info" role="alert">
				{translate key=$loginMessage}
			</div>
		{/if}

		<form class="pkp_form login" id="login" method="post" action="{$loginUrl}">
			{csrf}
			<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

			{if $error}
				<div class="alert alert-danger" role="alert">
					{translate key=$error reason=$reason}
				</div>
			{/if}

			<div class="form-group">
				<label for="login-username">
					{translate key="user.username"}
				</label>
				<input type="text" name="username" class="form-control" id="login-username" placeholder="{translate key='user.username'}" value="{$username|default:""|escape}" maxlength="32" required>
			</div>

			<div class="form-group">
				<label for="login-password">
					{translate key="user.password"}
				</label>
				<input type="password" name="password" class="form-control" id="login-password" placeholder="{translate key='user.password'}" password="true" maxlength="32" required="$passwordRequired">
			</div>

			<div class="form-group">
				<a href="{url page="login" op="lostPassword"}">
					{translate key="user.login.forgotPassword"}
				</a>
			</div>

			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="remember" id="remember" value="1" checked="$remember">
				<label class="form-check-label" for="remember">
					{translate key="user.login.rememberUsernameAndPassword"}
				</label>
			</div>

			<div class="buttons">
				<button type="submit" class="btn btn-primary">
					{translate key="user.login"}
				</button>

				{if !$disableUserReg}
					{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
					<a class="btn btn-default register-button" href="{$registerUrl}" role="button">
						{translate key="user.login.registerNewAccount"}
					</a>
				{/if}
			</div>
		</form>
	</div><!-- .page -->
</div><!-- .container -->


{include file="common/frontend/footer.tpl"}
