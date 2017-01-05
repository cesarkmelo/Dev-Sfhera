{* Folder - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}

{def $rss_export = fetch( 'rss', 'export_by_node', hash( 'node_id', $node.node_id ) )}

<div class="titles">
	<span>{$node.parent.name|wash()}</span>
	<br>
	<h1>{$node.name|wash()}</h1>
</div>
<!-- End Title-->


<div class="row-fluid">
	<div class="span9">
	   
		
		{if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
			{if $node.data_map.short_description.content.is_empty|not}
				<div class="row-fluid">                            
					<p class="lead">
						{$node.data_map.short_description.data_text|strip_tags()}
					</p>                                 
				</div>
			{/if}
		{/if}
			
        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="row-fluid image_post">
					{attribute_view_gui attribute=$node.data_map.image image_class=articleimage}
					<ul>
						<li>{$node.name|wash()}</li>
						<li><a href="#"><i class="icon-picture"></i></a></li>
					</ul>
				</div>
			{/if}
        {/if}
		
		 <!-- Divisor-->
		<div class="divisor">
			<div class="circle_left"></div>
			<div class="circle_right"></div>
		</div>
		
		
		{if $node.object.data_map.description.has_content}
			{attribute_view_gui attribute=$node.data_map.description}
		{/if}

		{attribute_view_gui attribute=$node.data_map.tags}
		
		{if $node.object.data_map.show_children.data_int}
			{def $page_limit = 10
				 $classes = array('staff')
				 $children = array()
				 $children_count = ''}

			{set $children_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id,
																	  'class_filter_type', 'include',
																	  'class_filter_array', $classes ) )}

			
			{if $children_count}
				<div class="row-fluid padding_top_mini">
				{foreach fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
														'offset', $view_parameters.offset,
														'sort_by', $node.sort_array,
														'class_filter_type', 'include',
														'class_filter_array', $classes,
														'limit', $page_limit ) ) as $index => $child }
					{node_view_gui view='line' content_node=$child}
					{if  eq(inc($index)|mod(4),0)}
					</div><div class="row-fluid padding_top_mini">
					{/if}
				{/foreach}
				</div>
			{/if}
			
			{include name=navigator
					 uri='design:navigator/google.tpl'
					 page_uri=$node.url_alias
					 item_count=$children_count
					 view_parameters=$view_parameters
					 item_limit=$page_limit}

		{/if}
	</div>
	<div class="span3">
		{def $root_node = fetch( 'content', 'node', hash( 'node_id', $node.path_array[2] ) )
			 $menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
															   'sort_by', $root_node.sort_array,
															   'load_data_map', false(),
															   'class_filter_type', 'include',
															   'class_filter_array', ezini( 'MenuContentSettings', 'RightIdentifierList', 'menu.ini' ) ) )
			 $menu_items_count = $menu_items|count()}
			
		<aside>
			<h4>{$root_node.name|wash()}</h4>
			{if $menu_items_count}
			<ul class="check">
			{foreach $menu_items as $key => $item}
				{if eq( $item.class_identifier, 'link')}
				<li><i class="icon-ok"></i><a href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if} title="{$item.data_map.location.data_text|wash}" class="menu-item-link" rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a>
				{else}
				<li><i class="icon-ok"></i><a href="{$item.url_alias|ezurl('no')}">{$item.name|wash()}</a>
				{/if}
				{def $sub_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
																	   'sort_by', $item.sort_array,
																	   'load_data_map', false(),
																	   'class_filter_type', 'include',
																	   'class_filter_array', ezini( 'MenuContentSettings', 'RightIdentifierList', 'menu.ini' ) ) )
					 $sub_menu_items_count = $sub_menu_items|count}
				{if $sub_menu_items_count}
					<ul>
					{foreach $sub_menu_items as $subkey => $subitem}
						{if eq( $subitem.class_identifier, 'link')}
						<li><a href={$subitem.data_map.location.content|ezurl}{if and( is_set( $subitem.data_map.open_in_new_window ), $subitem.data_map.open_in_new_window.data_int )} target="_blank"{/if} title="{$subitem.data_map.location.data_text|wash}" class="menu-item-link" rel={$subitem.url_alias|ezurl}>{if $subitem.data_map.location.data_text}{$subitem.data_map.location.data_text|wash()}{else}{$subitem.name|wash()}{/if}</a></li>
					{else}
						<li><a href="{$subitem.url_alias|ezurl( 'no' )}">{$subitem.name|wash()}</a></li>
					{/if}
					{/foreach}
					</ul>
				{/if}
				{undef $sub_menu_items $sub_menu_items_count}
				</li>
			{/foreach}
			</ul>
			{/if}
			{undef $root_node $menu_items $menu_items_count}
		</aside>
		<aside>
			<div class="attribute-call-for-action">
				{attribute_view_gui attribute=$node.data_map.call_for_action}
			</div>
		</aside>
	</div>
</div>

