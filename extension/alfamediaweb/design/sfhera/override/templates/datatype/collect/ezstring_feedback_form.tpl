{if is_unset( $attribute_base )}
    {def $attribute_base = 'ContentObjectAttribute'}
{/if}
{def $data_text = ''}
{if $value}
	{set $data_text = $value}
{else}
	{set $data_text = cond( is_set( $#collection_attributes[$attribute.id] ), $#collection_attributes[$attribute.id].data_text, $attribute.content )}
{/if}
<label for="{$attribute_base}_ezstring_data_text_{$attribute.id}">{$label}</label>
<input class="box {$css_class}" type="text" size="70" name="{$attribute_base}_ezstring_data_text_{$attribute.id}" value="{$data_text|wash( xhtml )}" placeholder="{$placeholder}" {if $value}disabled{/if}/>
{undef $data_text}
