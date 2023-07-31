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

<footer id="footer" class="footer p-3">
  <div class="container">
    <div class="row">
      <div class="col-md-6">
        <div class="me-md-auto text-start mx-auto">
          <div class="copyright">
            &copy; Copyright <strong><span>Jahangirnagar University (JU)</span></strong>. All Rights Reserved.
          </div>
          <div class="credits">
            Developed & maintained by <a class="text-light" href="https://library.juniv.edu/">University Library, JU</a>
          </div>
        </div>
        {if $pageFooter}
        <div style="color: #fff">
          {$pageFooter}
        </div>
        {/if}
      </div>
      <div class="col-md-6">
        <!-- Contact address on the right top -->
        
        <div class="contact-address d-flex align-items-justify">
          <a class="text-light"> Contact: </a> &nbsp; &nbsp; <br>
          <i class="bi bi-envelope d-flex align-items-center"> <a class="text-white" href="mailto:library@juniv.edu"> library@juniv.edu</a></i>
          <i class="bi bi-phone d-flex align-items-center ms-4"> <a class="text-white" href="tel:02224491045-51"> 02224491045-51</a></i>
        </div>
      </div>
    </div>
  </div>
</footer>


{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
