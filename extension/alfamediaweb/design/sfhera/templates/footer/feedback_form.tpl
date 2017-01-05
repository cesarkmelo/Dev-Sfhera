<h4>Contacte al Agente</h4>
<form method="post" action={"content/action"|ezurl} class="contact-form" id="form">
	<div class="row-fluid">
		<div class="span6">
			{attribute_view_gui attribute=$object.data_map.sender_name placeholder=$object.data_map.sender_name.contentclass_attribute.name}
		</div>
		<div class="span6">
			{attribute_view_gui attribute=$object.data_map.email placeholder=$object.data_map.email.contentclass_attribute.name}
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			 {attribute_view_gui attribute=$object.data_map.subject placeholder=$object.data_map.subject.contentclass_attribute.name}
		</div>
	</div>	
	{attribute_view_gui attribute=$object.data_map.message placeholder=$object.data_map.message.contentclass_attribute.name}
	<button type="submit" class="button" name="ActionCollectInformation">{'Send'|i18n('design/ezdemo/footer/feedback_form')}</button>
	<input type="hidden" name="ContentNodeID" value="{$object.main_node.node_id}" />
	<input type="hidden" name="ContentObjectID" value="{$object.id}" />
	<input type="hidden" name="ViewMode" value="full" />
</form>  
<div class="result"></div>
