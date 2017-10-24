{extends file="parent:frontend/detail/content/buy_container.tpl"}

{block name='frontend_detail_index_data'}
    <div class="product--configurator">
        {if $sArticle.sConfigurator}
            {if $sArticle.sConfiguratorSettings.type == 1}
                {include file="frontend/detail/config_step.tpl"}
            {elseif $sArticle.sConfiguratorSettings.type == 2}
                {include file="frontend/detail/config_variant.tpl"}
            {else}
                {include file="frontend/detail/config_upprice.tpl"}
            {/if}
        {/if}
    </div>
    {$smarty.block.parent}
{/block}

{block name="frontend_detail_index_configurator"}
{/block}