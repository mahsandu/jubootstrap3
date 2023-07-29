<?php

/**
 * @file plugins/themes/bootstrap3/BootstrapThreeThemePlugin.php
 *
 * Copyright (c) 2014-2023 Simon Fraser University
 * Copyright (c) 2003-2023 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @class BootstrapThreeThemePlugin
 * @brief Default theme
 */

namespace APP\plugins\themes\bootstrap3;

use APP\core\Application;
use APP\i18n\AppLocale;
use PKP\config\Config;
use PKP\facades\Locale;
use PKP\plugins\ThemePlugin;

class BootstrapThreeThemePlugin extends ThemePlugin {
	/**
	 * Initialize the theme
	 *
	 * @return null
	 */
	public function init() {
		// Add usage stats display options
		$this->addOption('displayStats', 'FieldOptions', [
			'type' => 'radio',
			'label' => __('plugins.themes.bootstrap3.option.displayStats.label'),
			'options' => [
				[
					'value' => 'none',
					'label' => __('plugins.themes.bootstrap3.option.displayStats.none'),
				],
				[
					'value' => 'bar',
					'label' => __('plugins.themes.bootstrap3.option.displayStats.bar'),
				],
				[
					'value' => 'line',
					'label' => __('plugins.themes.bootstrap3.option.displayStats.line'),
				],
			],
			'default' => 'none',
		]);

		// Determine the path to the glyphicons font in Bootstrap
		$iconFontPath = Application::get()->getRequest()->getBaseUrl() . '/' . $this->getPluginPath() . '/bootstrap/fonts/';

		$bootstrapTheme = $this->getOption('bootstrapTheme');
		if (empty($bootstrapTheme) || $bootstrapTheme === 'bootstrap3') {
			$this->addStyle('bootstrap', 'styles/bootstrap.less');
			$this->modifyStyle('bootstrap', ['addLessVariables' => '@icon-font-path:"' . $iconFontPath . '";']);
		} else {
			$this->addStyle('bootstrapTheme-' . $bootstrapTheme, 'styles/' . $bootstrapTheme . '.less');
			$this->modifyStyle('bootstrapTheme-' . $bootstrapTheme, ['addLessVariables' => '@icon-font-path:"' . $iconFontPath . '";']);
		}

		$locale = Locale::getLocale();
		$localeMetadata = Locale::getMetadata($locale);
		if ($localeMetadata->isRightToLeft() === 'rtl') {
			$this->addStyle('bootstrap-rtl', 'styles/bootstrap-rtl.min.css');
		}

		// Load jQuery from a CDN or, if CDNs are disabled, from a local copy.
		$min = Config::getVar('general', 'enable_minified') ? '.min' : '';
		$request = Application::get()->getRequest();
		// Use an empty `baseUrl` argument to prevent the theme from looking for
		// the files within the theme directory
		$jquery = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jquery/jquery' . $min . '.js';
		$jqueryUI = $request->getBaseUrl() . '/lib/pkp/lib/vendor/components/jqueryui/jquery-ui' . $min . '.js';
		$this->addScript('jQuery', $jquery, array('baseUrl' => ''));
		$this->addScript('jQueryUI', $jqueryUI, array('baseUrl' => ''));
		$this->addScript('jQueryTagIt', $request->getBaseUrl() . '/lib/pkp/js/lib/jquery/plugins/jquery.tag-it.js', array('baseUrl' => ''));

		// Load Bootstrap
		$this->addScript('bootstrap', 'bootstrap/js/bootstrap.min.js');

		// Add navigation menu areas for this theme
		$this->addMenuArea(array('primary', 'user'));
	}

	/**
	 * Get the display name of this plugin
	 * @return string
	 */
	function getDisplayName() {
		return __('plugins.themes.bootstrap3.name');
	}

	/**
	 * Get the description of this plugin
	 * @return string
	 */
	function getDescription() {
		return __('plugins.themes.bootstrap3.description');
	}
}

if (!PKP_STRICT_MODE) {
    class_alias('\APP\plugins\themes\bootstrap3\BootstrapThreeThemePlugin', '\BootstrapThreeThemePlugin');
}
