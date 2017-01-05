<div class="span8">
	<h3>
		SFHERA GP
		<span>- Constructora e Inmobiliaria. Inmuebles en Colombia y USA.</span>
	</h3>                    
</div>
<div class="span4">
   <form method="get" action="{'/content/search'|ezurl( 'no' )}">
		{if $pagedata.is_edit}
			<input type="search" name="SearchText" placeholder="{'Search text'|i18n('design/alfamediaweb')}" disabled="disabled" />
		{else}
			<input type="search" name="SearchText" placeholder="{'Search text'|i18n('design/alfamediaweb')}" />
			{if eq( $ui_context, 'browse' )}
			 <input name="Mode" type="hidden" value="browse" />
			{/if}
		{/if}
	</form>
</div>

