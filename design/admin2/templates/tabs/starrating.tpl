{foreach $node.object.contentobject_attributes as $attribute}
	{if eq($attribute.is_a,'ezsrrating')}
		{def $ratings = $node.data_map.[$attribute.contentclass_attribute_identifier].content.rating_data
			$attribute_rating= true}
	{/if}
{/foreach}

<table class="list" cellspacing="0" summary="{'Statistics.'|i18n( 'design/admin/node/view/full' )}">
	<tr>
	    <th>{'Rating count'|i18n( 'design/admin/node/view/full' )}</th>
	    <th>{'Rating average'|i18n( 'design/admin/node/view/full' )}</th>
	</tr>
	{if $attribute_rating}
	<tr>
		<td>{$node.data_map.star_rating.content.rating_count}</td>
		<td>{$node.data_map.star_rating.content.rating_average}</td>
	</tr>
	{else}
	<tr><td colspan="3">{'The item being viewed has not star rating attribute.'|i18n( 'design/admin/node/view/full' )}</td></tr>
	{/if}
</table>

<br />

<table class="list" cellspacing="0" summary="{'List of users who gave rating for this object.'|i18n( 'design/admin/node/view/full' )}">
	<tr>
	    <th>{'User'|i18n( 'design/admin/node/view/full' )}</th>
	    <th>{'Rating'|i18n( 'design/admin/node/view/full' )}</th>
	    <th>{'Date'|i18n( 'design/admin/node/view/full' )}</th>
	</tr>
	{if $attribute_rating}
	{foreach $ratings as $rating sequence array( 'bglight', 'bgdark' ) as $style}
		{def $user=fetch('content', 'object',hash('object_id', $rating.user_id))}
	<tr>
		<td>
		<a href="{$user.main_node.url_alias|ezurl('no')}" title="{$user.name|wash()}">{$user.name|wash()}</a>
        </td>
		<td>{$rating.rating}</td>
		<td>{$rating.created_at|l10n('shortdate')}</td>
	</tr>
	{/foreach}
	{else}
	<tr><td colspan="3">{'The item being viewed has not star rating attribute.'|i18n( 'design/admin/node/view/full' )}</td></tr>
	{/if}

</table>