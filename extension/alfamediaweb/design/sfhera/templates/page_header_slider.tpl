{def $sliderItems = fetch(content, list, hash('parent_node_id', 115,
                                              'class_filter_type', 'include',
											  'class_filter_array', array('slide') )) }


<!-- Slide -->
<div class="camera_wrap" id="slide"> 
{foreach $sliderItems as $item}
	<div  data-src={$item.data_map.image.content.original.url|ezroot}>
		<div class="camera_caption fadeFromTop">
			<div class="container">
				<div class="span7 offset5">
					<h1 class="animated fadeInRight delay1">{$item.name|wash()}<span class="arrow_title_slide"></span> </h1>
					<p class="animated fadeInRight delay2">{$item.data_map.description.data_text|strip_tags()}</p>
					{if $item.data_map.show_info.data_int}
						<ul class="animated fadeInRight delay3">
						{foreach $item.data_map.settings.content.cells as $index => $value}
							<li class="{$item.data_map.settings.content.columns.sequential[$index].identifier}"><span>{if eq($item.data_map.settings.content.columns.sequential[$index].identifier,'price')}{$value|l10n( 'currency' )}{else}{$value}{/if}</span></li>
						{/foreach}
						</ul>
					{/if}
					<div class="more animated fadeInRight delay4"> <a href={$item.data_map.link.value|ezurl} class="button">Más Información</a> </div>
				</div>
			</div>
		</div>
	</div>
{/foreach}	
</div>
<!-- End Slide --> 
