<!--Header-->
<header class="white_header">
	<div class="topbar default_clr">
		{include uri='design:page_header_topbar.tpl'} 
	</div>
	<nav class="navbar navbar-default navbar-sticky bootsnav">
		<div class="container">
			<div class="attr-nav">
				<div class="upper-column info-box first">
					<div class="icons"><i class="icon-icons202"></i></div>
					<ul>
						<li><strong>Phone Number</strong></li>
						<li>+1 900 234 567 - 68</li>
					</ul>
				</div>
			</div>
			<!-- Start Header Navigation -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu"> <i class="fa fa-bars"></i> </button>
				<a class="navbar-brand" href="index9.html"><img src="images/logo.png" class="logo" alt=""></a> 
			</div>
			<!-- End Header Navigation -->
			{if $pagedata.top_menu}
			{include uri='design:menu/double_top.tpl'}
			{/if} 
		</div>
	</nav>
</header>
<!--Header Ends--> 

<!-- Login Client --> 
{*include uri='design:page_header_loginbox.tpl'*} 
<!-- End Login Client --> 

<!-- Info Head --> 
{include uri='design:page_header_languages.tpl'} 
<!-- Info Head --> 

<!-- Nav-->
<nav>
	<div class="container">
		<div class="row-fluid"> {include uri='design:page_header_logo.tpl'} 
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
<header> {if eq($module_result.node_id,2)}
	<div class="container">
		<div class="row-fluid">
			<div class="span4 bg_header">
				<div class="row-fluid">
					<ul class="tabs_services">
						<li><a id="4">Encuentra tu inmueble</a></li>
					</ul>
					
					<!-- 4-content -->
					<div class="search_box"> {include uri='design:page_searchbox.tpl'} </div>
					<!-- End 4-content --> 
				</div>
			</div>
		</div>
	</div>
	{include uri='design:page_header_slider.tpl'} 
	{else} 
	<!-- Section Title --> 
	{include uri='design:page_header_title.tpl'} 
	{/if} </header>
<!-- End Header--> 
