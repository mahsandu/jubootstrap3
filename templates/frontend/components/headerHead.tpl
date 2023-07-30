{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site head css and js.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{assign var="themePath" value=$baseUrl|cat:"/plugins/themes/bootstrap3/"}

<head>

<!-- Favicons -->
  <link href="{$themePath}assets/img/favicon.ico" rel="icon">
  <link href="{$themePath}assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Muli:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">

<link href="{$themePath}assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="{$themePath}assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="{$themePath}assets/css/style.css" rel="stylesheet">
  <link href="{$themePath}assets/css/ju.css" rel="stylesheet">
  <link href="{$themePath}assets/css/custom.css" rel="stylesheet">

</head>