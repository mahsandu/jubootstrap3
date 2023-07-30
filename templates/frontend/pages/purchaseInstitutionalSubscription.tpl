{**
 * templates/subscriptions/userInstitutionalSubscriptionForm.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User purchase institutional subscription form
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.subscriptions.purchaseInstitutionalSubscription"}

<div class="container">
	<div id="main-content" class="page page-institutional-subscription">

		{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.subscriptions.purchaseInstitutionalSubscription"}

		<div class="page-header">
			<h1>{translate key="user.subscriptions.purchaseInstitutionalSubscription"}</h1>
		</div>

		{assign var="formPath" value="institutional"}
		{if $subscriptionId}
			{assign var="formPath" value="institutional"|to_array:$subscriptionId}
		{/if}
		<form class="cmp_form purchase-subscription" method="post" id="subscriptionForm" action="{url op="payPurchaseSubscription" path=$formPath}">
			{csrf}

			{include file="common/formErrors.tpl"}

			<div class="mb-3">
				<label for="subscription-type" class="form-label">
					{translate key="user.subscriptions.form.typeId"}
				</label>
				<select name="typeId" id="typeId" class="form-control" required>
					{foreach name=types from=$subscriptionTypes item=subscriptionType}
						<option value="{$subscriptionType->getId()}"{if $typeId == $subscriptionType->getId()} selected{/if}>{$subscriptionType->getSummaryString()|escape}</option>
					{/foreach}
				</select>
			</div>

			<div class="mb-3">
				<label for="subscription-membership" class="form-label">
					{translate key="user.subscriptions.form.membership"}
				</label>
				<input type="text" name="membership" class="form-control" id="membership" value="{$membership|escape}" aria-describedby="subscriptionMembershipDescription">
				<span class="form-text" id="subscriptionMembershipDescription">{translate key="user.subscriptions.form.membershipInstructions"}</span>
			</div>

			<div class="mb-3">
				<label for="subscription-institution" class="form-label">
					{translate key="user.subscriptions.form.institutionName"}
				</label>
				<input type="text" name="institutionName" class="form-control" id="institutionName" value="{$institutionName|escape}">
			</div>

			<div class="mb-3">
				<label for="subscription-address" class="form-label">
					{translate key="user.subscriptions.form.institutionMailingAddress"}
				</label>
				<textarea name="institutionMailingAddress" class="form-control" id="institutionMailingAddress">{$institutionMailingAddress|escape}</textarea>
			</div>

			<div class="mb-3">
				<label for="subscription-membership" class="form-label">
					{translate key="user.subscriptions.form.domain"}
				</label>
				<input type="text" name="domain" class="form-control" id="domain" value="{$domain|escape}" aria-describedby="subscriptionDomainDescription">
				<span class="form-text" id="subscriptionDomainDescription">{translate key="user.subscriptions.form.domainInstructions"}</span>
			</div>

			<div class="mb-3">
				<label for="subscription-ips" class="form-label">
					{translate key="user.subscriptions.form.ipRange"}
				</label>
				<input type="text" name="ipRanges" class="form-control" id="ipRanges" value="{$ipRanges|escape}" aria-describedby="subscriptionIPDescription">
				<span class="form-text" id="subscriptionIPDescription">{translate key="user.subscriptions.form.ipRangeInstructions"}</span>
			</div>

			<div class="buttons">
				<button class="btn btn-primary" type="submit">
					{translate key="common.continue"}
				</button>
				<a class="btn btn-link" href="{url page="user" op="subscriptions"}">
					{translate key="common.cancel"}
				</a>
			</div>

		</form>
	</div>
</div>


{include file="frontend/components/footer.tpl"}
