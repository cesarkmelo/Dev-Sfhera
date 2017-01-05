{* Article - Full view *}
{set scope=global persistent_variable=hash('left_menu', false(),
                                           'extra_menu', false())}


<div class="titles">
	<span>{$node.parent.name|wash()}</span>
	<br>
	<h1>{$node.data_map.title.content|wash()}</h1>
</div>
<!-- End Title-->

<div class="row-fluid">
	<div class="span9">
		{if eq( ezini( 'article', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
			{if $node.data_map.intro.content.is_empty|not}
				<div class="row-fluid">                            
					<p class="lead">
						{$node.data_map.intro.data_text|strip_tags()}
					</p>                                 
				</div>
			{/if}
		{/if}
			
        {if eq( ezini( 'article', 'ImageInFullView', 'content.ini' ), 'enabled' )}
            {if $node.data_map.image.has_content}
                <div class="row-fluid image_post">
					{attribute_view_gui attribute=$node.data_map.image image_class=articleimage}
					<ul>
						<li>{attribute_view_gui attribute=$node.data_map.caption}</li>
						<li><a href="#"><i class="icon-picture"></i></a></li>
					</ul>
				</div>
			{/if}
        {/if}

       
	    <!-- Divisor-->
		<div class="divisor">
			<div class="circle_left"></div>
			<div class="circle_right"></div>
		</div>
		
	   

        {if $node.data_map.body.content.is_empty|not}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.body}
            </div>
        {/if}

            <div class="attribute-tags">
                {attribute_view_gui attribute=$node.data_map.tags}
            </div>

            <div class="attribute-socialize">
                {include uri='design:parts/social_buttons.tpl'}
            </div>

        {def $tipafriend_access=fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'tipafriend' ) )}
        {if and( ezmodule( 'content/tipafriend' ), $tipafriend_access )}
            <div class="attribute-tipafriend">
                <p><a href={concat( "/content/tipafriend/", $node.node_id )|ezurl} title="{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}">{'Tip a friend'|i18n( 'design/ezdemo/full/article' )}</a></p>
            </div>
        {/if}
        </div>
        <div class="span3">
            <aside>
                <section class="content-view-aside">
                    {if $node.data_map.location.has_content}
                    <h2>{'Location'|i18n( 'design/ezdemo/full/article' )}</h2>
                    <article>
                        <div class="attribute-location">
                            {attribute_view_gui attribute=$node.data_map.location}
                        </div>
                    </article>
                    {/if}

                    {include uri='design:parts/related_content.tpl'}
                </section>
            </aside>
        </div>
</div>


