    {* Roles *}
    <li id="node-tab-starrating" class="{if $last}last{else}middle{/if}{if $node_tab_index|eq('starrating')} selected{/if}">
            <a href={concat( $node_url_alias, '/(tab)/starrating' )|ezurl} title="{'Show summary of ratings.'|i18n( 'design/admin/node/view/full' )}">{'Star rating'|i18n('design/admin/node/view/full')}</a>
    </li>
