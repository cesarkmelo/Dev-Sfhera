{default node_name=$object.main_node.name 
		 node_url=$object.main_node.url_alias
		 node = $object.main_node}

<div class="row-fluid item_agent">
	<div class="span4 image_agent"> 
		{if $node.data_map.image.has_content}
			{attribute_view_gui attribute=$node.data_map.image image_class=large}
		{else}
			<img src={"team/1.jpg"|ezimage} alt="Image">
		{/if}
	</div>
	<div class="span7 info_agent">
		<h5>{$node_name|wash}</h5>
		<ul>
			<li><i class="icon-envelope"></i>{attribute_view_gui attribute=$node.data_map.email}</li>
			<li><i class="icon-phone"></i><a href="#">{attribute_view_gui attribute=$node.data_map.phone}</a></li>
		</ul>
	</div>
</div>
{attribute_view_gui attribute=$node.data_map.horario}