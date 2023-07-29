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

	</main>

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-sm-2 col-md-4" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{$sidebarCode}
			</aside><!-- pkp_sidebar.left -->
		{/if}
	{/if}
	</div><!-- pkp_structure_content -->

	<!--Footer-->
<footer id="footer" class="footer">
    <!--Footer Top-->
    
    <!--Footer Bottom-->
    <section class="row site-footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 widget-footer">
                    <h4 class="widget-title">Quick Links</h4>
                    <div class="row widget-content">
                        <ul class="menu">
                            <li><a href="/">Home Page</a></li>
                            <li><a href="#">Journals</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Quick Pages</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3 widget-footer">
                    <h4 class="widget-title"></h4>
                    <div class="row widget-content">
                        <p>Copyright &copy; Jahangirnagar University. All rights reserved.</p>
                        <!--
                        <ul class="list-unstyled fsocial">
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#"><i class="fa fa-youtube-play"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                        </ul>
                        -->
                    </div>
                </div>
				<!-- 
                <div class="col-sm-5 widget-footer">
                    <h4 class="widget-title">Sign Up for Our Newsletter</h4>
                    <div class="row widget-content">
                        <p>JU Journal Management Systems</p>
                        <form action="#" class="input-group footer-subscribe-form">
                            <input type="email" class="form-control">
                            <span class="input-group-addon"><button type="submit" class="btn btn-primary">subscribe</button></span>
                        </form>
                    </div>
                </div>
				-->
                {if $pageFooter}
                    <div class="col-md-10">
                        <div style="color: #fff">
                        {$pageFooter}
                        </div>
                    </div>
                            {/if}

                            <div class="col-md-2" role="complementary">
                                <a href="{url page="about" op="aboutThisPublishingSystem"}">
                                                           <!-- <img class="img-responsive" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}"> -->
                                                    </a>
                            </div>

                    </div> <!-- .row -->
              
            </div>
        </div>
    </section>
</footer>

</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
