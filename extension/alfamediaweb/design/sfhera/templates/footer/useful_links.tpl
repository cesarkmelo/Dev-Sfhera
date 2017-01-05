{def $latest_news = fetch( 'content', 'list', hash( 'parent_node_id', 2,
                                                    'limit', '7',
                                                    'class_filter_type', 'include',
                                                    'class_filter_array', array( 'article','folder','landing_page' ),
                                                    'main_node_only', true(),
                                                    'sort_by', array( 'published', false() ) ) )}
<h3>{'Useful Links'|i18n('design/alfamediaweb')}</h3>
<ul>
    {foreach $latest_news as $news}
        <li><a href="{$news.url_alias|ezurl( 'no' )}">{$news.name|wash()}</a></li>
    {/foreach}
</ul>
{undef $latest_news}
