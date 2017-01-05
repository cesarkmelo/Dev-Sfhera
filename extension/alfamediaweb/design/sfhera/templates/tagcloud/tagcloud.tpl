{default $number = 0}
<h3>{'Tag Cloud'|i18n('design/alfamediaweb')}</h3>
<ul class="tags">
{foreach $tag_cloud as $index => $tag}
	<li><a href={concat( "/content/keyword/", $tag['tag']|rawurlencode )|ezurl()} style="font-size: {$tag['font_size']}%" title="{$tag['count']} objects tagged with '{$tag['tag']|wash()}'">{$tag['tag']|wash()}</a></li>
	{if and($number, eq($index,$number))}{break}{/if} 
{/foreach}
</ul>