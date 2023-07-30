{**
* templates/frontend/pages/userRegister.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* User registration form.
*}
{include file="frontend/components/header.tpl" pageTitle="user.register"}

<div class="container">
{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.register"}
	<div id="main-content" class="page page_register">

		<form class="pkp_form register" id="register" method="post" action="{url op="register"}">
			{csrf}

			{if $source}
				<input type="hidden" name="source" value="{$source|escape}" />
			{/if}

			{include file="common/formErrors.tpl"}

			{include file="frontend/components/registrationForm.tpl"}

			{* When a user is registering with a specific journal *}
			{if $currentContext}

				<fieldset class="consent">
					{if $currentContext->getSetting('privacyStatement')}
					{* Require the user to agree to the terms of the privacy policy *}
						<div class="form-group form-check optin optin-privacy">
							<input type="checkbox" name="privacyConsent" class="form-check-input" id="privacyConsent" value="1"{if $privacyConsent} checked{/if}>
							<label class="form-check-label" for="privacyConsent">
								{capture assign="privacyUrl"}{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
							</label>
						</div>
					{/if}
					{* Ask the user to opt into public email notifications *}
					<div class="form-group form-check optin optin-email">
						<input type="checkbox" name="emailConsent" class="form-check-input" id="emailConsent" value="1"{if $emailConsent} checked{/if}>
						<label class="form-check-label" for="emailConsent">
							{translate key="user.register.form.emailConsent"}
						</label>
					</div>
				</fieldset>

				{* Allow the user to sign up as a reviewer *}
				{assign var=contextId value=$currentContext->getId()}
				{assign var=userCanRegisterReviewer value=0}
				{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
					{if $userGroup->getPermitSelfRegistration()}
						{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
					{/if}
				{/foreach}
				{if $userCanRegisterReviewer}
					<fieldset class="reviewer">
						<legend>
							{translate key="user.reviewerPrompt"}
						</legend>
						<div class="fields">
							<div id="reviewerOptinGroup" class="form-group optin">
								{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
									{if $userGroup->getPermitSelfRegistration()}
										<div class="form-check">
											<input type="checkbox" name="reviewerGroup[{$userGroup->getId()}]" class="form-check-input" id="reviewerGroup[{$userGroup->getId()}]" value="1"{if in_array($userGroup->getId(), $userGroupIds)} checked{/if}>
											<label class="form-check-label" for="reviewerGroup[{$userGroup->getId()}]">
												{translate key="user.reviewerPrompt.userGroup" userGroup=$userGroup->getLocalizedName()|escape}
											</label>
										</div>
									{/if}
								{/foreach}
							</div>
						</div>
					</fieldset>
				{/if}
			{/if}

			{include file="frontend/components/registrationFormContexts.tpl"}

			{if !$currentContext}
				{* Require the user to agree to the terms of the privacy policy *}
				<fieldset class="consent">
					{if $siteWidePrivacyStatement}
						<div class="form-group form-check optin optin-privacy">
							<input type="checkbox" name="privacyConsent[{\PKP\core\PKPApplication::CONTEXT_ID_NONE}]" id="privacyConsentNone" class="form-check-input" value="1"{if $privacyConsent[\PKP\core\PKPApplication::CONTEXT_ID_NONE]} checked{/if}>
							<label class="form-check-label" for="privacyConsentNone">
								{capture assign="privacyUrl"}{url router=\PKP\core\PKPApplication::ROUTE_PAGE page="about" op="privacy"}{/capture}
								{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
							</label>
						</div>
					{/if}
					{* Ask the user to opt into public email notifications *}
					<div class="form-group form-check optin optin-email">
						<input type="checkbox" name="emailConsent" class="form-check-input" id="emailConsentNone" value="1"{if $emailConsent} checked{/if}>
						<label class="form-check-label" for="emailConsentNone">
							{translate key="user.register.form.emailConsent"}
						</label>
					</div>
				</fieldset>
			{/if}

			{* recaptcha spam blocker *}
			{if $reCaptchaHtml}
				<fieldset class="recaptcha_wrapper">
					<div class="fields">
						<div class="form-group recaptcha">
							{$reCaptchaHtml}
						</div>
					</div>
				</fieldset>
			{/if}

			<div class="buttons">
				<button class="btn btn-primary submit" type="submit">
					{translate key="user.register"}
				</button>

				{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
				<a class="btn btn-default" href="{url page="login" source=$rolesProfileUrl}" class="login">
					{translate key="user.login"}
				</a>
			</div>
		</form>
	</div><!-- .page -->
</div><!-- .container -->


{include file="common/frontend/footer.tpl"}
