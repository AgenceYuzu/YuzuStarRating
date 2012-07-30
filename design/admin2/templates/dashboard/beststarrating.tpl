<h2>{'Best ratings'|i18n( 'yuzustarrating/dashboard' )}</h2>

{def $bestratings = fetch_by_starrating(hash('parent_node_path', '/1/2/',
                         'limit',$block.number_of_items))}


{if $bestratings}
<table class="list" cellpadding="0" cellspacing="0" border="0">
    <tr>
        <th>{'Name'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Type'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Published'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Author'|i18n( 'yuzustarrating/dashboard' )}</th>
        <th>{'Rating'|i18n( 'yuzustarrating/dashboard' )}</th>
    </tr>

    {foreach $bestratings as $item sequence array( 'bglight', 'bgdark' ) as $style}
       {*$rating|attribute(show)*}


            {def $userObj=fetch('content', 'object',hash('object_id', $item.user_id))}
            {def $content=fetch('content', 'object',hash('object_id', $item.contentobject_id))}

        <tr class="{$style}">
            <td>
                <a href={$item.url_alias|ezurl()} title="{$item.name|wash()}">{$item.name|shorten('30')|wash()}</a>
            </td>
            <td>
                {$item.class_name|wash()}
            </td>
            <td>
                {$item.object.published|l10n('shortdate')}
            </td>
            <td>
                <a href="{$item.object.owner.main_node.url_alias|ezurl('no')}" title="{$item.object.owner.name|wash()}">
                    {$item.object.owner.name|shorten('13')|wash()}
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