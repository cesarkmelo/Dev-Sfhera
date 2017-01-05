<div class="span3 item_team">
	<div class="image_team">
		{if $node.data_map.image.has_content}
			{attribute_view_gui attribute=$node.data_map.image image_class=large}
		{else}
			<img src={"blog/1.jpg"|ezimage} alt="Image">
		{/if}
		<span class="arrow_team_white"></span>
	</div>
	<div class="info_team">
		<h4>{$node.name|wash()}<br/><span>{attribute_view_gui attribute=$node.data_map.position}</span></h4>                            
	</div>
	<span class="arrow_team_gray"></span>
</div>


