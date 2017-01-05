{* Gallery - Line view *}
{def $content_size = '12'}

<div class="content-view-line">
    <article class="class-gallery">
    {if $node.data_map.image.has_content}
    <div class="span3 image_post">
    	{attribute_view_gui image_class=medium href=$node.url_alias|ezurl attribute=$node.data_map.image.content.data_map.image}
    </div>
        {set $content_size = '8'}
    {/if}
    <div class="span{$content_size}">
       <h2><a href="{$node.url_alias|ezurl( 'no' )}" class="teaser-link">{$node.name|wash()}</a></h2>
       {if $node.data_map.short_description.has_content}
       	{attribute_view_gui attribute=$node.data_map.short_description}
       {/if}
	   <a href={$node.url_alias|ezurl} class="button">Ver imagenes del proyecto</a>
    </div>
    </article>
</div>

{undef $content_size}


