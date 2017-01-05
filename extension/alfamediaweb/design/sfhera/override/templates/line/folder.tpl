<div class="span7">
	<a href={$node.url_alias|ezurl}><h2>{$node.name|wash()}</h2></a>
	{if $node.data_map.short_description.has_content}
	{attribute_view_gui attribute=$node.data_map.short_description}
    {/if}
	<a href={$node.url_alias|ezurl} class="button">Lea más</a>
</div>
<div class="span5 image_post">
	{if $node.data_map.image.has_content}
		{attribute_view_gui attribute=$node.data_map.image image_class=medium}
	{else}
		<img src={"blog/1.jpg"|ezimage} alt="Image">
	{/if}
	<ul>
		<li>{$node.name|wash()}</li>
		<li><a href={$node.url_alias|ezurl}><i class="icon-picture"></i></a></li>
	</ul>
</div>

