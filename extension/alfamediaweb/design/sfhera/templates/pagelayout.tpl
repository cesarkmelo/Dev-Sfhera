<!DOCTYPE html>
<html lang="{$site.http_equiv.Content-language|wash}">
<head>
{def $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}
{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}
{def $pagedata        = ezpagedata()
     $inner_column_size = $pagedata.inner_column_size
     $outer_column_size = $pagedata.outer_column_size}
{cache-block keys=array( $module_result.uri, $current_user.contentobject_id, $extra_cache_key )}
{def $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $current_node_id  = $pagedata.node_id}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body>
<!--Loader-->
{*<div class="loader">
  <div class="span">
    <div class="location_indicator"></div>
  </div>
</div>*}
<!--Loader--> 


<!-- Header area: START -->
{include uri='design:page_header.tpl'}
<!-- Header area: END -->

{cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}
<section class="container content_info">

	<!-- Newsletter Box -->
	<div class="row-fluid">
		<div class="newsletter_box">
			{include uri='design:page_header_searchbox.tpl'}
		</div>
	</div>
	<!-- End Newsletter Box -->

<!-- Columns area: START -->

	<!-- Side menu area: START -->
	{if $pagedata.left_menu}
		{include uri='design:page_leftmenu.tpl'}
	{/if}
	<!-- Side menu area: END -->
{/cache-block}
{/cache-block}
	<!-- Main area: START -->
	{include uri='design:page_mainarea.tpl'}
	<!-- Main area: END -->
	{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

	<!-- Extra area: START -->
	{if $pagedata.extra_menu}
		{include uri='design:page_extramenu.tpl'}
	{/if}
	<!-- Extra area: END -->
<!-- Columns area: END -->
</section>
<!-- Footer area: START -->
{include uri='design:page_footer.tpl'}
<!-- Footer area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
</body>
</html>
