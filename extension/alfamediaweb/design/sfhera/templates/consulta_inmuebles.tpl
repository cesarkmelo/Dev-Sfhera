{if and($type,$propose)}
	{set $filter = array('and' array( 337, '=', $propose ),
                               array( 352, '=', $type ))
		 $properties_count = fetch( 'content', 'tree_count', hash( 'parent_node_id',     $subtree_id,
              											            'attribute_filter',   $filter   ))
	 
		 $properties_list = fetch( 'content', 'tree', hash( 'parent_node_id',     $subtree_id,
															'attribute_filter',   $filter,
															'limit',  $page_limit,
															'offset', $view_parameters.offset,
															'sort_by', $node.sort_array   )) }
{elseif $type}
	 {set $filter = array( array( 352, '=', $type ))
	 	  $properties_count = fetch( 'content', 'tree_count', hash( 'parent_node_id',     $subtree_id,
              											            'attribute_filter',   $filter   ))
	 
		 $properties_list = fetch( 'content', 'tree', hash( 'parent_node_id',     $subtree_id,
															'attribute_filter',   $filter,
															'limit',  $page_limit,
															'offset', $view_parameters.offset,
															'sort_by', $node.sort_array   )) }
{elseif $propose}
    {set $filter = array(array( 337, '=', $propose ))
	     $properties_count = fetch( 'content', 'tree_count', hash( 'parent_node_id',     $subtree_id,
              											            'attribute_filter',   $filter   ))
	 
		 $properties_list = fetch( 'content', 'tree', hash( 'parent_node_id',     $subtree_id,
															'attribute_filter',   $filter,
															'limit',  $page_limit,
															'offset', $view_parameters.offset,
															'sort_by', $node.sort_array   )) }
{else}
   {set $properties_count = fetch( 'content', 'tree_count', hash( 'parent_node_id',     $subtree_id,
              											       'class_filter_type',  'include',
              											       'class_filter_array', array( 'property' ) ))
	 
	     $properties_list = fetch( 'content', 'tree', hash( 'parent_node_id',     $subtree_id,
              											'class_filter_type',  'include',
              											'class_filter_array', array( 'property' ),
														'limit',  $page_limit,
														'offset', $view_parameters.offset,
														'sort_by', $node.sort_array   )) }
{/if}