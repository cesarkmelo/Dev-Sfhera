{* Gallery - Full view *}

<div class="row-fluid padding_top">
	<div class="span8">
		<div class="class-gallery">
			{def $children_count = fetch( 'content', 'list_count', hash( 'parent_node_id', $node.node_id,
			                                                             'class_filter_type', 'include',
			                                                             'class_filter_array', array( 'image' ) ) )
			     $children = array()
			     $first = false()
			     $image = false()
			     $big_image_class = 'galleryfull'}
			
			{if $children_count}
			<div class="camera_wrap" id="slide_details"> 
				{set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
				                                                 'class_filter_type', 'include',
				                                                 'class_filter_array', array( 'image' ),
				                                                 'sort_by', $node.sort_array ) )}
				
				{foreach $children as $k => $img}
					{set $image = $img.data_map.image.content[$big_image_class]}
				<div data-src={$image.url|ezroot}>
					<div class="camera_property fadeFromBottom"> <a href="#">
						<h4>{$img.name|wash()}</h4>
						</a>
						<h1><span class="counter"><span>{$k|inc()}</span>/{$children_count}</span></h1>
						{if $img.data_map.caption.has_content}
						{attribute_view_gui attribute=$img.data_map.caption}
						{/if} 
					</div>
				</div>
				{/foreach} 
			</div>
			{/if}
			{undef $children_count $children $first $big_image_class $image} 
		</div>
	</div>
	<div class="span4">
		<div class="description">
			<h4>{$node.name|wash()}</h4>
			{attribute_view_gui attribute=$node.data_map.short_description}
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<h3>Proyecto Inmobiliario</h3>	
			{attribute_view_gui attribute=$node.data_map.description}
		</div>
	</div>	 
</div>
