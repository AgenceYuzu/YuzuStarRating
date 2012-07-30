<h2>{'Latest ratings'|i18n( 'yuzustarrating/dashboard' )}</h2>

{def $latestratings = fetch_starrating_data(hash('sort_by', array('created_at', false()), 'limit', $block.number_of_items))}


{if $latestratings}
<table class="list" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <th>{'Name'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Type'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Date'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'User'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Rating'|i18n( 'yuzustarrating/dashboard' )}</th>
    </tr>

    {foreach $latestratings as $item sequence array( 'bglight', 'bgdark' ) as $style}

            {def $user=fetch('content', 'object',hash('object_id', $item.user_id))}
            {def $content=fetch('content', 'object',hash('object_id', $item.contentobject_id))}

        <tr class="{$style}">
            <td>
                <a href={$content.main_node.url_alias|ezurl()} title="{$content.name|wash()}">{$content.name|shorten('30')|wash()}</a>
            </td>
            <td>
                {$content.class_name|wash()}
            </td>
            <td>
                {$item.created_at|l10n('shortdate')}
            </td>
            <td>
                <a href="{$user.main_node.url_alias|ezurl('no')}" title="{$user.name|wash()}">
                    {$user.name|shorten('13')|wash()}
                </a>
            </td>
            <td>
            	{$item.rating}
            </td>
        </tr>
    {/foreach}
</table>

{else}

{"No rating now."|i18n( 'yuzustarrating/dashboard' )}

{/if}