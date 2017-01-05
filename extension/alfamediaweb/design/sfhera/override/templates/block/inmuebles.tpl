{default $page_limit = 8
         $view = 0
         $subtree_id = 72 
         $properties_count = 0
		 $properties_list = ''
		 $proposeArray = hash( 0, 'rent', 1, 'sale' )}
		 
{set  $proposeArray = hash( 0, 'rent', 1, 'sale', 2, 'ganga', 3, 'remate', '4', 'turismo' )}	
{set $properties_count = fetch( 'content', 'tree_count', hash( 'parent_node_id',     $subtree_id,
														   'class_filter_type',  'include',
														   'class_filter_array', array( 'property' ) ))
 
	 $properties_list = fetch( 'content', 'tree', hash( 'parent_node_id',     $subtree_id,
													'class_filter_type',  'include',
													'class_filter_array', array( 'property' ),
													'limit',  $page_limit,
													'sort_by', $node.sort_array   )) }


<!-- Title-->
<div class="titles">
	<span>LO QUE OFRECEMOS</span>
	<br>
	<h1>CONOZCA NUESTRAS PROPIEDADES RECIENTES</h1>
</div>
<!-- End Title-->

<!-- Bar properties-->
<div class="bar_properties bar_properties_home">
	<div class="row-fluid">
		<div class="span4">
			<ul>
				<li class="active"><a href="#">{$properties_count} Anuncios</a></li>
			</ul>
		</div>
		<div class="span5">
			<strong>Ordenados por:</strong>
			<ul>                            
				<li>
					<a href="#">Anuncios recientes</a>
					{*<a href="#" title="Sort Ascending" class="tooltip_hover"><i class="icon-caret-up"></i></a>
					<a href="#" title="Sort Descending" class="tooltip_hover"><i class="icon-caret-down"></i></a>*}
				</li>
				{*<li>
				  <a href="#">Price</a>
				  <a href="#" title="Sort Ascending" class="tooltip_hover"><i class="icon-caret-up"></i></a>
				  <a href="#" title="Sort Descending" class="tooltip_hover"><i class="icon-caret-down"></i></a>
				</li>*}                            
			</ul>
		</div>
		<div class="span3">
			<ul class="text_right">
				<li title="Box" class="tooltip_hover active"><a href="#"><i class="icon-th-large"></i></a></li>
				{*<li title="List" class="tooltip_hover"><a href="#"><i class="icon-list"></i></a></li> 
				<li title="Location" class="tooltip_hover"><a href="#"><i class="icon-map-marker"></i></a></li>*}
			</ul>
		</div>
	</div>
</div>
<!-- End Bar properties-->




{if ne($properties_count,0)}
	<div class="row-fluid padding_top_mini">
	{foreach $properties_list as $k => $property}
		
		<!-- Item Property-->
		<div class="span3">
			<div class="item_property">
				<div class="head_property">
					<div class="title {$proposeArray[$property.data_map.propose.data_text]}"></div>
					<a href={$property.url_alias|ezurl}>{attribute_view_gui attribute=$property.data_map.image image_class=original}</a>
					<h5><a href={$property.url_alias|ezurl}>{$property.name|wash()}</a></h5>
				</div>                        
				<div class="info_property">                                    
					<ul>
						<li class="resalt"><strong>Ciudad </strong><span>{$property.parent.name|wash()}</span></li>
						<li><strong>Precio</strong><span>{attribute_view_gui attribute=$property.data_map.price}</span></li>
					</ul>                                    
				</div>
			</div>
		</div>
		<!-- Item Property-->
		{if  eq(inc($k)|mod(4),0)}
			 </div><div class="row-fluid">
		{/if}

	{/foreach}
	</div>	
{else}
	<h3>Lo sentimos</h3>
	<p>No encontramos tenemos en el momento inmuebles con las caracteristicas requieridas.<br/>
	   Por favor busque de nuevo cambiando los criterios o <a href={'Contáctenos'|ezurl}>contáctenos</a> para atenderlo personalmente.</p>
</div> 