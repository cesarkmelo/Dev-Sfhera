{set  $proposeArray = hash( 0, 'rent', 1, 'sale', 2, 'ganga', 3, 'remate', '4', 'turismo' )}	


<div class="row-fluid">
{if ne($properties_count,0)}
	{foreach $properties_list as $k => $property}
		{if eq($view,1)}
			
			<!-- item_property_h-->
			<article class="item_property_h">
				<div class="info_property_h">
					<h4><a href={$property.url_alias|ezurl}>{$property.name|wash()}</a><span> {$property.parent.name|wash()}</span></h4> 
					<div class="description_property">
					{attribute_view_gui attribute=$property.data_map.description}
					</div>
					<div class="break"></div>
					<div class="line_property"><span>{attribute_view_gui attribute=$property.data_map.price}</span>{$property.data_map.propose.class_content.options[$property.data_map.propose.data_text].name}</div>
				</div>
				<div class="image_property_h">                            
					<div class="hover_property_h">
						{attribute_view_gui attribute=$property.data_map.image image_class=large}
						<div class="info_hover_property_h">
							{attribute_view_gui attribute=$property.data_map.description}
						</div>
					</div>
				</div>
			</article>
			<!-- End item_property_h-->
		{else}
			<!-- Item Property-->
			<div class="span4">
				<div class="item_property">
					<div class="head_property">
						<div class="title {$proposeArray[$property.data_map.propose.data_text]}"></div>
						<a href={$property.url_alias|ezurl}>{attribute_view_gui attribute=$property.data_map.image image_class=large}</a>
						<h5><a href={$property.url_alias|ezurl}>{$property.name|wash()}</a></h5>
					</div>                        
					<div class="info_property">                                    
						<ul>
							<li class="resalt"><strong>Habitaciones</strong><span>{attribute_view_gui attribute=$property.data_map.bedrooms}</span></li>
							<li><strong>Baños  </strong><span>{attribute_view_gui attribute=$property.data_map.bathrooms}</span></li>
							<li class="resalt"><strong>Area</strong><span>{attribute_view_gui attribute=$property.data_map.area} mt2</span></li>
							<li><strong>Pais</strong><span> {$property.parent.parent.name|wash()} </span></li>
							<li class="resalt"><strong>Ciudad </strong><span>{$property.parent.name|wash()}</span></li>
							<li><strong>Precio</strong><span>{attribute_view_gui attribute=$property.data_map.price}</span></li>
						</ul>                                    
					</div>
				</div>
			</div>
            {if $k|inc()|mod(3)|eq(0)}
            	</div><div class="row-fluid">
            {/if}
			<!-- Item Property-->
		{/if}
		{/foreach}
		
		<div class="clearfix padding_top_mini"></div>
        
        {include name=navigator
				 uri='design:navigator/google.tpl'
				 page_uri= concat($node.url_alias,$get)
				 item_count=$properties_count
				 view_parameters=$view_parameters
                 offset=$offset
				 item_limit=$page_limit}
{else}
	<h3>Lo sentimos</h3>
	<p>No encontramos tenemos en el momento inmuebles con las caracteristicas requeridas.<br/>
	   Por favor busque de nuevo cambiando los criterios o <a href={'Contáctenos'|ezurl}>contáctenos</a> para atenderlo personalmente.</p>
</div>

		