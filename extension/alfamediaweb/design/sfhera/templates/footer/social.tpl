{def $latest_news = fetch( 'content', 'list', hash( 'parent_node_id', 103,
                                                    'limit', '7',
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'social_network' ),
                                                    'main_node_only', true(),
                                                    'sort_by', array( 'published', false() ) ) )}

<ul class="social">
    {foreach $latest_news as $item}
        <li class="tooltip_hover" title="{$item.name|wash()}">
			<a href={$item.data_map.location.content|ezurl}><i class="{$item.data_map.icon_style.content}"></i></a>
		</li>
    {/foreach}
</ul>
{undef $latest_news}

