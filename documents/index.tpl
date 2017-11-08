{extends file='parent:documents/index.tpl'}

{block name="document_index_table_name_swag_custom_products_option"}
    <td align="left" width="48%" valign="top" style="padding-left: 10px">
        {s name="DocumentIndexPositionNameDefault"}{$position.name|nl2br}{/s}:&nbsp;
        {block name="document_index_table_name_swag_custom_products_option_values"}
            {if $customProductOptionValues[$position.id][$position.articleID]}
                {$customProductOptionValues[$position.id][$position.articleID]|strip_tags}
            {/if}
        {/block}
    </td>
{/block}