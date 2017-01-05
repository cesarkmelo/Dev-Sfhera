{* Article - Line view *}
{def $content_size = '12'}

    {if $node.data_map.image.has_content}
    <div class="span4 image_post">
    	{attribute_view_gui image_class=medium href=$node.url_alias|ezurl attribute=$node.data_map.image}
    </div>
        {set $content_size = '8'}
    {/if}

    <div class="span{$content_size}">
       <a href={$node.url_alias|ezurl}><h2><a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.data_map.title.content|wash()}</a></h2></a>
		{if $node.data_map.intro.content.is_empty|not}
			{attribute_view_gui attribute=$node.data_map.intro}
		{/if}
		<a href={$node.url_alias|ezurl} class="button">Lea más</a>
	</div>

  
{undef $content_size}
