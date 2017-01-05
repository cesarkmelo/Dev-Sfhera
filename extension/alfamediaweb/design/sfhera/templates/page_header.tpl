<!-- Login Client -->
{*include uri='design:page_header_loginbox.tpl'*} 
<!-- End Login Client --> 

<!-- Info Head --> 
{include uri='design:page_header_languages.tpl'} 
<!-- Info Head --> 

<!-- Nav-->
<nav>
	<div class="container">
		<div class="row-fluid"> 
			{include uri='design:page_header_logo.tpl'} 
			<!-- Top menu area: START --> 
			{if $pagedata.top_menu}
				{include uri='design:menu/double_top.tpl'}
			{/if} 
			<!-- Top menu area: END --> 
		</div>
	</div>
</nav>
<!-- End Nav--> 

<!-- Header-->
<header>
	
{if eq($module_result.node_id,2)}
	<div class="container">
		<div class="row-fluid">
			<div class="span4 bg_header">
				<div class="row-fluid">
					<ul class="tabs_services">
						<li><a id="4">Encuentra tu inmueble</a></li>
					</ul>
					
					<!-- 4-content -->
					<div class="search_box">
					{include uri='design:page_searchbox.tpl'}   
					</div>
					<!-- End 4-content -->
				</div>
			</div>
		</div>
	</div>
	{include uri='design:page_header_slider.tpl'} 
{else}
	<!-- Section Title -->
	{include uri='design:page_header_title.tpl'} 
{/if}
</header>
<!-- End Header--> 
