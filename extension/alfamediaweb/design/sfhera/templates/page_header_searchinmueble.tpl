<form method="get" action="{'/content/search'|ezurl( 'no' )}">
	<div class="">
		<label>Search</label>
		{if $pagedata.is_edit}
            <input class="search-query span3" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search text'|i18n('design/ezdemo/pagelayout')}" disabled="disabled" />
        {else}
            <input class="search-query span3" type="search" name="SearchText" id="site-wide-search-field" placeholder="{'Search text'|i18n('design/ezdemo/pagelayout')}" />
            {if eq( $ui_context, 'browse' )}
             <input name="Mode" type="hidden" value="browse" />
            {/if}
        {/if}
	</div>
	<div class="">
		<label>Location</label>
		<select name="location">
			<option value="">-- Select city --</option>
			<option value="0" selected="selected">New York</option>
			<option value="1">Los Angeles</option>
			<option value="2">Chicago</option>
			<option value="3">Miami</option>
			<option value="4">San Francisco</option>
			<option value="5">Boston</option>
			<option value="6">Philadelphia</option>
			<option value="7">Dallas</option>
		</select>
	</div>
	<div class="">
		<label>Price Range</label>
		<select name="pricing">
			<option>View all</option>
			<option value="info_price">0 - 300.000</option>
			<option value="info_price">300.000 - 500.000</option>
			<option value="info_price">500.000 - 800.000</option>
			<option value="info_price">800.000 - 1.000.000</option>
			<option value="info_price">10.000.000 +</option>
		</select>
	</div>
	<div class="">
		<label>Area</label>
		<select name="area">
			<option>View all</option>
			<option value="info_area">0 - 60 m²</option>
			<option value="info_area">60 m² - 90 m²</option>
			<option value="info_area">90 m² - 150 m²</option>
			<option value="info_area">150 m² - 240 m²</option>
			<option value="info_area">240 m² - 360 m²</option>
			<option value="info_area">360 m² - 480 m²</option>
			<option value="info_area">480 m² - 600 m²</option>
			<option value="info_area">More 600 m²</option>
		</select>
	</div>
	<div class="">
		<input class="button" name="SearchButton" type="submit" value="{'Search'|i18n('design/ezdemo/content/search')}" />
	</div>
</form>
