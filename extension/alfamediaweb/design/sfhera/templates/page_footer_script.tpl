{* Override this template and place javascript based statestics here (like Google Analytics) *}
{def $scripts = ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' )}

{foreach $scripts as $script}
<script type='text/javascript' src={concat('javascript/',$script)|ezdesign}></script>

{/foreach}
