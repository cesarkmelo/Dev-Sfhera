{def $imageSection = hash(109, 'about',
                          72,  'features',
						  87,  'properties',
						  233, 'contact') }
						  
{if ne(166,$module_result.path[1].node_id)} 
<div class="section_title {$imageSection[$module_result.path[1].node_id]}">
	<div class="container">
		<div class="row-fluid"> 
			<!-- Path area: START -->
			{if $pagedata.show_path}
				{include uri='design:page_toppath.tpl'}
			{/if}
			<!-- Path area: END -->
		</div>
	</div>            
</div>
<!-- End Section Title -->
{else}
<div class="map_area">            
   <iframe src="https://mapsengine.google.com/map/u/0/embed?mid=zEAJQv4cYtow.k-up8Eh8GwYQ"></iframe>
</div>
{/if}