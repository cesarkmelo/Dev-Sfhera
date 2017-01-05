{* Article - Full view *}

{def $feedback_form_class = fetch( 'content', 'class', hash( 'class_id', 'feedback_form' ) )
     $feedback_form = $feedback_form_class.object_list[0] }
	 
<div class="row-fluid padding_top">
	<div class="span8">
		<div class="more_slide">
			<ul>
				<li title="Imprimir" class="tooltip_hover"><i class="icon-print"></i><a href="#">Print</a></li>
				{*<li title="Chat Online" class="tooltip_hover"><i class="icon-comment-alt"></i><a href="#">Live chat</a></li>*}
				<li title="Contáctenos" class="tooltip_hover"><i class="icon-envelope"></i><a href={'/Contáctenos'|ezurl}>Contáctenos</a></li>
				{*<li title="favorite propertie" class="tooltip_hover"><i class="icon-star-empty"></i><a href="#">Favorites</a></li>*}
				<li title="Publicado en" class="tooltip_hover"><i class="icon-calendar"></i><a href="#">Publicado en: {$node.object.published|datetime( 'custom', '%d %M %Y' )}</a></li>
			</ul>
		</div>
		
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
				<div class="camera_property fadeFromBottom"> 
					<a href="#"><h4>{$img.name|wash()}</h4></a>
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
		
		<div class="attribute-socialize">
			{include uri='design:parts/social_buttons.tpl'}
		</div>
		<!-- End Slide-->  
	</div>
	<div class="span4">
		<div class="description">
			<h4>DESCRIPCION GENERAL</h4>
			{attribute_view_gui attribute=$node.data_map.description}

			<h4>{$property.name|wash()}</h4>
			<ul class="info_details">                                    
				<li><strong>Precio</strong><span>{attribute_view_gui attribute=$node.data_map.price}</span></li>
				<li><strong>Habitaciones</strong><span>{attribute_view_gui attribute=$node.data_map.bedrooms}</span></li>
				<li><strong>Baños  </strong><span>{attribute_view_gui attribute=$node.data_map.bathrooms}</span></li>
				<li><strong>Area</strong><span>{attribute_view_gui attribute=$node.data_map.area} mt2</span></li>
				<li><strong>Pais</strong><span> {$node.parent.parent.name|wash()} </span></li>
				<li><strong>Ciudad </strong><span>{$node.parent.name|wash()}</span></li>
			</ul>                                    
		
		</div>
	</div> 
</div>

<div class="row-fluid padding_top">
	<!--NAV TABS-->
	<ul class="tabs"> 
		{if $node.data_map.location.has_content}
		<li><a href="#tab3">Mapa de Ubicacion</a></li>
		{/if}    
		<li><a href="#tab1">Más Detalles</a></li> 
		<li><a href="#tab2">Contacte al Agente</a></li> 
		{*<li><a href="#tab4">Comments</a></li>*}                                              
	</ul>                       
				
	<!--CONTAINER TABS-->   
	<div class="tab_container"> 
		
		{if $node.data_map.location.has_content}
        <div id="tab3" class="tab_content map_area">
			{attribute_view_gui attribute=$node.data_map.location}
		</div>
		{/if}

		
		<!--Tab1 Genral info-->      
		<div id="tab1" class="tab_content">
			<div class="row-fluid">
				<div class="span5">
				{attribute_view_gui attribute=$node.data_map.image image_class='large'}     
				</div>
				<div class="span7">
				{attribute_view_gui attribute=$node.data_map.details}
				</div>
			</div>                    
		</div>
		<!--End Tab1 Genral info-->      

		<!--Tab2 Contact Agent-->      
		<div id="tab2" class="tab_content">                                                             
		   <div class="row-fluid">
				<div class="span7">
					{include uri='design:properties/feedback_form.tpl' object=$feedback_form}
				</div>
				<div class="span5">                                
					{content_view_gui view=line content_object=$node.data_map.agent.content}
				</div>
		   </div>        
		</div>
		<!--End Tab2 Contact Agent-->      

	</div> 
	<!--END CONTAINER TABS-->
</div>



