{extends file='parent:documents/index_ls.tpl'}

{block name="document_index_selectAdress"}
    {if $User.billing.zipcode != $User.shipping.zipcode or
    $User.billing.company != $User.shipping.company or
    $User.billing.department != $User.shipping.department or
    $User.billing.salutation != $User.shipping.salutation or
    $User.billing.firstname != $User.shipping.firstname or
    $User.billing.lastname != $User.shipping.lastname or
    $User.billing.street != $User.shipping.street or
    $User.billing.zipcode != $User.shipping.zipcode or
    $User.billing.city != $User.shipping.city or
    $User.billing.countryID != $User.shipping.countryID or
    $User.billing.stateID != $User.shipping.stateID or
    $User.billing.additional_address_line1 != $User.shipping.additional_address_line1 or
    $User.billing.additional_address_line2 != $User.shipping.additional_address_line2}
        {assign var="billingAddress" value="billing"}
        {assign var="shippingAddress" value="shipping"}
    {else}
        {assign var="billingAddress" value="billing"}
    {/if}
{/block}

{block name="document_index_table_head_price"}
    {if $Document.netto != true && $Document.nettoPositions != true}
        <td align="right" width="10%" class="head">
            <strong>{s name="DocumentIndexHeadPrice"}Brutto{/s}</strong>
        </td>
        <td align="right" width="12%" class="head">
            <strong>{s name="DocumentIndexHeadAmount"}Gesamt{/s}</strong>
        </td>
    {else}
        <td align="right" width="10%" class="head">
            <strong>{s name="DocumentIndexHeadNet"}Netto{/s}</strong>
        </td>
        <td align="right" width="12%" class="head">
            <strong>{s name="DocumentIndexHeadNetAmount"}Gesamt{/s}</strong>
        </td>
    {/if}
{/block}

{block name="document_index_address"}
    {block name="document_index_address_sender"}
        <p class="sender">{$Containers.Header_Sender.value}</p>
    {/block}
    <h2>Rechnungs- und Lieferadresse</h2>
                {if $User.$billingAddress}
                    {if $User.$shippingAddress}
                        <span>{s name="DocumentIndexTextBillingAddressHeader"}Rechnungsadresse{/s}</span>
                        <br/>
                    {/if}
                    {block name="document_index_billing_address_base"}
                        {$User.$billingAddress.company}
                        <br/>
                        {$User.$billingAddress.salutation|salutation}
                        {if {config name="displayprofiletitle"}}
                            {$User.$billingAddress.title}
                            <br/>
                        {/if}
                        {$User.$billingAddress.firstname} {$User.$billingAddress.lastname}
                        <br/>
                        {$User.$billingAddress.street}
                        <br/>
                    {/block}
                    {block name="document_index_billing_address_additionalAddressLines"}
                        {if {config name=showAdditionAddressLine1}}
                            {$User.$billingAddress.additional_address_line1}
                            <br/>
                        {/if}
                        {if {config name=showAdditionAddressLine2}}
                            {$User.$billingAddress.additional_address_line2}
                            <br/>
                        {/if}
                    {/block}
                    {block name="document_index_billing_address_cityZip"}
                        {if {config name=showZipBeforeCity}}
                            {$User.$billingAddress.zipcode} {$User.$billingAddress.city}
                            <br/>
                        {else}
                            {$User.$billingAddress.city} {$User.$billingAddress.zipcode}
                            <br/>
                        {/if}
                    {/block}
                    {block name="document_index_billing_address_countryData"}
                        {if $User.$billingAddress.state.shortcode}{$User.$billingAddress.state.shortcode} - {/if}{$User.$billingAddress.country.countryen}
                        <br/>
                    {/block}
                {/if}
                {if $User.$shippingAddress}
                    <br/>
                    <span>{s name="DocumentIndexTextShippingAddressHeader"}Lieferadresse{/s}</span>
                    <br/>
                    {block name="document_index_shipping_address_base"}
                        {$User.$shippingAddress.company}
                        <br/>
                        {$User.$shippingAddress.salutation|salutation}
                        {if {config name="displayprofiletitle"}}
                            {$User.$shippingAddress.title}
                            <br/>
                        {/if}
                        {$User.$shippingAddress.firstname} {$User.$shippingAddress.lastname}
                        <br/>
                        {$User.$shippingAddress.street}
                        <br/>
                    {/block}
                    {block name="document_index_shipping_address_additionalAddressLines"}
                        {if {config name=showAdditionAddressLine1}}
                            {$User.$shippingAddress.additional_address_line1}
                            <br/>
                        {/if}
                        {if {config name=showAdditionAddressLine2}}
                            {$User.$shippingAddress.additional_address_line2}
                            <br/>
                        {/if}
                    {/block}
                    {block name="document_index_shipping_address_cityZip"}
                        {if {config name=showZipBeforeCity}}
                            {$User.$shippingAddress.zipcode} {$User.$shippingAddress.city}
                            <br/>
                        {else}
                            {$User.$shippingAddress.city} {$User.$shippingAddress.zipcode}
                            <br/>
                        {/if}
                    {/block}
                    {block name="document_index_shipping_address_countryData"}
                        {if $User.$shippingAddress.state.shortcode}{$User.$shippingAddress.state.shortcode} - {/if}{$User.$shippingAddress.country.countryen}
                        <br/>
                    {/block}
                {/if}
{/block}

{block name="document_index_table_pos"}
    <td align="left" width="5%" valign="top">
        {if $position.articleordernumber}
            {if $countedPosition}
                {assign var="countedPosition" value=$countedPosition+1}
            {else}
                {assign var="countedPosition" value="1"}
            {/if}
            {$countedPosition}
        {/if}
    </td>
{/block}

{block name="document_index_table_nr"}
    <td align="left" width="10%" valign="top" style="padding-right: 10px">
        {$position.articleordernumber|truncate:14:""}
    </td>
{/block}

{block name="document_index_table_name_swag_custom_products_option"}
    <td align="left" width="26%" valign="top" style="padding-left: 10px; padding-bottom: 0px;">
        {$position.name|nl2br}&nbsp;:<br/>
        {block name="document_index_table_name_swag_custom_products_option_values"}
            {if $customProductOptionValues[$position.id][$position.articleID]}
                {$customProductOptionValues[$position.id][$position.articleID]|strip_tags}
            {/if}
        {/block}
    </td>
{/block}

{block name="document_index_table_name_swag_custom_products_value"}
    <td align="left" width="26%" valign="top" style="padding-left: 20px; ">
        {if $position.hasNoParent}
            {s name="DocumentIndexPositionNameDefault"}{$position.name|nl2br}{/s}
        {else}
            <i>{s name="DocumentIndexPositionNameDefault"}{$position.name|nl2br}{/s}</i>
        {/if}
    </td>
{/block}

{block name="document_index_table_price"}
    {if $Document.netto != true && $Document.nettoPositions != true}
        <td align="right" width="10%" valign="top">
            {if $position.price}
                {$position.price|currency}
            {/if}
        </td>
        <td align="right" width="12%" valign="top">
            {if $position.price}
                {$position.amount|currency}
            {/if}
        </td>
    {else}
        <td align="right" width="10%" valign="top">
            {if $position.price}
                {$position.netto|currency}
            {/if}
        </td>
        <td align="right" width="12%" valign="top">
            {if $position.price}
                {$position.amount_netto|currency}
            {/if}
        </td>
    {/if}
{/block}

{block name="document_index_table_quantity"}
    <td align="right" width="5%" valign="top">
        {if $position.articleordernumber}
            {$position.quantity}
        {/if}
    </td>
{/block}

{block name="document_index_amount"}
    <div id="amount">
        <table width="300px" cellpadding="0" cellspacing="0">
            <tbody>
            <tr>
                <td align="right" width="100px" class="head">{s name="DocumentIndexTotalNet"}{/s}</td>
                <td align="right" width="200px" class="head">{$Order._amountNetto|currency}</td>
            </tr>
            {if $Document.netto == false}
                {foreach from=$Order._tax key=key item=tax}
                    <tr>
                        <td align="right">{s name="DocumentIndexTax"}zzgl. {$key|tax} % MwSt:{/s}</td>
                        <td align="right">{$tax|currency}</td>
                    </tr>
                {/foreach}
            {/if}
            {if $Document.netto == false}
                <tr>
                    <td align="right"><b>{s name="DocumentIndexTotal"}{/s}</b></td>
                    <td align="right"><b>{$Order._amount|currency}</b></td>
                </tr>
            {else}
                <tr>
                    <td align="right"><b>{s name="DocumentIndexTotal"}{/s}</b></td>
                    <td align="right"><b>{$Order._amountNetto|currency}</b></td>
                </tr>
            {/if}
            </tbody>
        </table>
    </div>
{/block}