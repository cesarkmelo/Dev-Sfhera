{default $locNode = 72
         $urlNode = '/Inmobiliaria'}
{if ne($module_result.node_id,2)}
	{set $locNode = $node.node_id
	     $urlNode = $node.url_alias}
{else}
	{set $locNode = 72
	     $urlNode = '/Inmobiliaria'}		 	
{/if}
{def $locations = fetch( 'content', 'tree', hash( 'parent_node_id',     $locNode,
              									  'class_filter_type',  'include',
              									  'class_filter_array', array( '43' ),
												  'sort_by', array('priority', true() ) ))
												  
	 $propertyTypes = fetch( 'content', 'tree', hash( 'parent_node_id',     163,
              									  'class_filter_type',  'include',
              									  'class_filter_array', array( '44' ),
												  'sort_by', array('priority', true() ) ))
                                                  
   }

												  
<form method="get" action="{$urlNode|ezurl( 'no' )}">
	<div class="">
		<label>{'Location'|i18n( 'design/alfamediaweb' )}</label>
		<select name="location">
			<option value="" selected="selected">Todas</option>
		{foreach $locations as $location}
			<option value="{$location.node_id}" >{$location.name}</option>
		{/foreach}                 
		 </select>
	</div>
	<div class="">
		<label>Tipo de inmueble</label>
		<select name="type">
			<option value="" selected="selected">-- Seleccione</option>
		{foreach $propertyTypes as $type}
			<option value="{$type.contentobject_id}" >{$type.name}</option>
		{/foreach}
		</select>
	</div>
	<div class="">
		<label>Inmueble para</label>
		<select name="propose">
			<option value="" selected="selected">-- Seleccione</option>
			<option value="0">Arriendo</option>
			<option value="1">Compra</option>
            <option value="2">Ganga</option>
            <option value="3">Remate Judicial</option>
            <option value="4">Turismo</option>
		</select>
	</div>
	<div class="">
		<input class="button" type="submit" name="SearchButton" value="{'Search'|i18n('design/ezdemo/content/advancedsearch')}" />
	</div> 
</form> 

