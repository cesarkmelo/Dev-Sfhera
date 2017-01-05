{def $lang_selector = array()
     $avail_translation = array()}
{if and( is_set( $DesignKeys:used.url_alias ), $DesignKeys:used.url_alias|count|ge( 1 ) )}
    {set $avail_translation = language_switcher( $DesignKeys:used.url_alias )}
{else}
    {set $avail_translation = language_switcher( $site.uri.original_uri )}
{/if}

<section class="container info_head">              
	<ul>  
		<li><i class="icon-headphones"></i> +(0571) 530 2628 - +(0571) 530 2645 </li>
		{if $avail_translation|count|gt( 1 )}
			{foreach $avail_translation as $siteaccess => $lang}
				{if $siteaccess|eq( $access_type.name )}
					<li><i class="icon-globe"></i><a href="#" style="background:url({$lang.locale|flag_icon()}) no-repeat 5px center">{$lang.text|wash}</a></li>
				{else}
					<li><i class="icon-globe"></i><a href={$lang.url|ezurl} style="background:url({$lang.locale|flag_icon()}) no-repeat 5px center">{$lang.text|wash}</a></li>
				{/if}
				{if $siteaccess|eq( $access_type.name )}
					<li><i class="icon-globe"></i><a href="#lang-selector" class="current-lang" style="background:url({$lang.locale|flag_icon()}) no-repeat 5px center">{$lang.text|wash()}</a></li>
				{/if}
			{/foreach}
		{/if}	
	</ul>               
</section>
{undef $lang_selector}