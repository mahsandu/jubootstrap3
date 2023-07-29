{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}


{if empty($isFullWidth)}
    {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
    {if $sidebarCode}
        <aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
            {$sidebarCode}
        </aside><!-- pkp_sidebar.left -->
    {/if}
{/if}

<footer id="footer" class="footer">
    <!--Footer Top-->
    <!-- (Add your footer top content here if needed) -->
    
    <!--Footer Bottom-->
    <section class="site-footer-bottom bg-dark text-light">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-6 widget-footer">
                <p>Copyright &copy; Jahangirnagar University. All rights reserved.</p>
                </div>
                {if $pageFooter}
                <div class="col-md-12 col-lg-6 widget-footer">
                    <div class="row widget-content">
                        <div style="color: #fff">
                            {$pageFooter}
                        </div>
                    </div>
                </div>
                {/if}
                <div class="col-md-12 col-lg-3" role="complementary">
                    <a href="{url page="about" op="aboutThisPublishingSystem"}">
                        <!-- <img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}"> -->
                    </a>
                </div>
            </div> <!-- .row -->
        </div>
    </section>
</footer>


{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
