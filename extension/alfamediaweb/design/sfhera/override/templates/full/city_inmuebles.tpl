{set-block scope=root variable=cache_ttl}0{/set-block}

{default $view = 0
         $subtree_id = $node.node_id 
		 $type = 0
		 $propose = 0
		 $get = '?'
		 $filter = ''
		 $page_limit = 9
		 $proposeArray = hash( 0, 'rent', 1, 'sale' )
		 $properties_count = 0
		 $properties_list = ''}

{if ezhttp_hasvariable( 'location', 'get' )}
	{set $subtree_id = ezhttp( 'location', 'get' )}
	{if eq($subtree_id,0)}
		{set $subtree_id = 72}
	{/if}	
	{set $get = concat($get, 'location=', $subtree_id)}
{/if}
{if ezhttp_hasvariable( 'type', 'get' )}
	{set $type = ezhttp( 'type', 'get' )
	     $get  = concat($get, '&type=', $type)}
{/if}
{if ezhttp_hasvariable( 'propose', 'get' )}
	{set $propose = ezhttp( 'propose', 'get' )
	     $get     = concat($get, '&propose=', $propose)}
{/if}
{if ezhttp_hasvariable( 'view', 'get' )}
	{set $view = ezhttp( 'view', 'get' )
	     $get  = concat($get, '&view=', $view)}
{/if}

{include uri='design:consulta_inmuebles.tpl'}

<div class="row-fluid padding_top">
	<!-- Aside -->
	<aside class="span4">                    
		<!-- Search Advance -->
		<div class="search_advance">                                                 
				
				<div class="row-fluid">
					<ul class="tabs_services">
						<li><a id="2" class="switcher set2">Busqueda de inmuebles</a> </li>
					</ul>
					
					<!-- 2-content -->
				    <div class="search_box property_box">
					{include uri='design:page_searchbox.tpl'}                            
					</div>   
					<!-- End 1-content -->

				</div>
			</div>
			<!-- End Search Advance -->

		{*	<h2>Faq</h2>
		  
		  <div class="accordion-trigger">Accomplishment</div>     
		  <div class="accordion-container">       
			  <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>
		  </div>

		  <div class="clearfix"></div>

		  <div class="accordion-trigger">Honesty</div>    
		  <div class="accordion-container">                         
			   <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>                      
		  </div>
					
		  <div class="accordion-trigger">Responsibility</div>   
		  <div class="accordion-container">
			   <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.</p>                             
		  </div> *}

	</aside>
	<!-- End Aside -->

	<!-- property List-->
	<div class="span8 properties_two">

		<!-- Bar properties-->
		<div class="bar_properties">
		  <div class="row-fluid">                          
			  <div class="span8">
				  <ul>
					  <strong>Ordenado por:</strong>
					  <li>
						  <a href="#">Más reciente</a>
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
			  <div class="span4">
				  <ul class="text_right">
					  <li title="Box" class="tooltip_hover {if eq($view,0)}active{/if}"><a href={concat($node.url_alias,$get,'&view=0')|ezurl}><i class="icon-th-large"></i></a></li>
					  <li title="List" class="tooltip_hover {if eq($view,1)}active{/if}"><a href={concat($node.url_alias,$get,'&view=1')|ezurl}><i class="icon-list"></i></a></li> 
					  {*<li title="Location" class="tooltip_hover"><a href="#"><i class="icon-map-marker"></i></a></li>*}
				  </ul>
			  </div>
		  </div>
		</div>
		<!-- End Bar properties-->

		<div class="clearfix padding_top_mini"></div>
					  
		{include uri='design:mostrar_inmuebles.tpl'}
	</div>                       
	<!-- End property List-->
</div>
