<!-- Top menu content: START -->
<ul id="menu" class="span9 sf-menu">
	<li><a href="/">Home</a></li>
	{def $root_node = fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node ) )
		 $top_menu_class_filter = ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' )
		 $top_menu_items = fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
														   'sort_by', $root_node.sort_array,
														   'class_filter_type', 'include',
														   'class_filter_array', $top_menu_class_filter ) )
		 $top_menu_items_count = $top_menu_items|count()
		 $item_class = array()
		 $level_2_items = 0
		 $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )
		 $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )}

	{if $top_menu_items_count}
	   {foreach $top_menu_items as $key => $item}
			{set $item_class = array("active")
				 $level_2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
																  'sort_by', $item.sort_array,
																  'class_filter_type', 'include',
																  'class_filter_array', $top_menu_class_filter ) )}
			{if eq( $item.class_identifier, 'link')}
				<li><a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a></li>
			{else}
				<li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a>
			{/if}
				{if $level_2_items|count()}
					<ul class="nav">
						{foreach $level_2_items as $key => $item}
							{if eq( $item.class_identifier, 'link')}
								<li><a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl}{if and( is_set( $item.data_map.open_in_new_window ), $item.data_map.open_in_new_window.data_int )} target="_blank"{/if}{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}" rel={$item.url_alias|ezurl}>{if $item.data_map.location.data_text}{$item.data_map.location.data_text|wash()}{else}{$item.name|wash()}{/if}</a></li>
							{else}
								<li><a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>{$item.name|wash()}</a></li>
							{/if}
						{/foreach}
					</ul>
				{/if}
			</li>
		{/foreach}
	{/if}
</ul>



{undef $level_2_items $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path $current_node_in_path_2}
<!-- Top menu content: END -->
