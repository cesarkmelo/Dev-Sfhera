

{* Feedback form - Full view *}

<div class="row-fluid padding_top">
	<div class="span5">
    	<h2>{$node.name|wash()}</h2>
        
		{include name=Validation uri='design:content/collectedinfo_validation.tpl'
                 class='message-warning'
                 validation=$validation collection_attributes=$collection_attributes}

        <div class="attribute-short">
        	{attribute_view_gui attribute=$node.data_map.description}
        </div>
        <form method="post" action={"content/action"|ezurl} id="form" >
			{attribute_view_gui attribute=$node.data_map.sender_name css_class='span4' placeholder=$node.data_map.sender_name.contentclass_attribute.name}
            {attribute_view_gui attribute=$node.data_map.email css_class='span4' placeholder=$node.data_map.email.contentclass_attribute.name}
            {attribute_view_gui attribute=$node.data_map.subject css_class='span8' placeholder=$node.data_map.subject.contentclass_attribute.name}
            {attribute_view_gui attribute=$node.data_map.message css_class='span8' placeholder=$node.data_map.message.contentclass_attribute.name}
        
        <div class="content-action">
            <input type="submit" name="ActionCollectInformation" class="button" value="{"Send form"|i18n("design/ezdemo/full/feedback_form")}" />
            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
            <input type="hidden" name="ViewMode" value="full" />
        </div>
        </form>

    </div>
	<div class="span7">
		<h2>Dirección</h2>
		<div class="fbf_address">
		{attribute_view_gui attribute=$node.data_map.address}
		</div>
	
		<!-- Divisor-->
		<div class="divisor divisor_services">
			<div class="circle_left"></div>
			<div class="circle_right"></div>
		</div>
		<!-- End Divisor-->
		
		{def $asesores_class = fetch( 'content', 'class', hash( 'class_id', 'staff' ) )}
		
		<h2 class="padding_top_mini">Agentes de ventas</h2>
		
		<div class="row-fluid ">
		{foreach $asesores_class.object_list as $index => $item}
			{if $item.data_map.mostrar_en_contacto.data_int}
				<div class="span6 item_agent">
					<h4>{$item.name|wash()}</h4>
					<div class="span4 image_agent">
						{attribute_view_gui attribute=$item.data_map.image image_class=small}
					</div>
					<div class="span7 info_agent">                                
						<ul>
							<li><i class="icon-envelope"></i><a href="#">{attribute_view_gui attribute=$item.data_map.email}</a></li>
							<li><i class="icon-phone"></i><a href="#">{attribute_view_gui attribute=$item.data_map.phone}</a></li>
						</ul>                                        
					</div>
				</div>
				{if eq(inc($index)|mod(2),0)}
					</div><div class="row-fluid">
				{/if}	
			{/if}
		{/foreach}
		</div>
	</div>
</div>

