<div class="titles">
	<span>{$node.parent.name|wash()}</span>
	<br>
	<h1>{$node.name|wash()}</h1>
</div>
<!-- End Title-->

<div class="content-view-full">
    <div class="class-landing-page">

    <div class="attribute-page">
    {attribute_view_gui attribute=$node.object.data_map.page}
    </div>

    </div>
</div>
