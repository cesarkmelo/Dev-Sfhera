{def $title = ''}
{foreach $pagedata.path_array as $path}
	{if $path.url|not()}
        {set $title =  $path.text|wash}
    {/if}
{/foreach}

<div class="span12">
	<h1>{$title|wash()}
		<span>
		{foreach $pagedata.path_array as $path}
		{if $path.url}
			<a href={cond( is_set( $path.url_alias ), $path.url_alias, $path.url )|ezurl}>{$path.text|wash}</a> /
		{else}
			{$path.text|wash}
		{/if}
		{/foreach}
		</span>
	</h1>
</div>     
