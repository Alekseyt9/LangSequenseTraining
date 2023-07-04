select 
  (
	  (
	    select count(*)
		from "Sequences" s
		join "SequenceGroup" g
			on g."Id" = s."SequenceGroupId"
		left join (
			select * 
			   from public."UserSequenceProgress" 
			   where "UserId" = 'deeff302-d8e3-4730-bc8b-764d91522ad0'::uuid
		) p
			on p."SequenceId" = s."Id"
		where 
			g."IsHide" != true
	  		and g."Id" = gr."Id"
			and (p."Id" is null)),  
	  (
		select count(*)	
		from public."UserSequenceProgress" p
		join public."Sequences" g
			on g."Id" = p."SequenceId"
		where 
			"UserId" = 'deeff302-d8e3-4730-bc8b-764d91522ad0'::uuid
		    and g."SequenceGroupId" = gr."Id"
			and "Stage" not in (6)
		    and 
				case when p."LastSuccess" then now() - p."LastUpdateTime" >= (case p."Stage"
																				    when 1 then interval '1 day'
																				 	when 2 then interval '3 days'
																				 	when 3 then interval '7 days'
																				 	when 4 then interval '30 days'
																				    when 5 then interval '90 days'
																				 end) 																			 
				else now() - p."LastUpdateTime" > interval '1 day'
				end	
	  ),  
	  (
		select count(*)	
		from public."UserSequenceProgress" p
		join public."Sequences" g
			on g."Id" = p."SequenceId"
		where 
			"UserId" = 'deeff302-d8e3-4730-bc8b-764d91522ad0'::uuid
		    and g."SequenceGroupId" = gr."Id"
			and "Stage" not in (6)
		    and 
				not case when p."LastSuccess" then now() - p."LastUpdateTime" >= (case p."Stage"
																				    when 1 then interval '1 day'
																				 	when 2 then interval '3 days'
																				 	when 3 then interval '7 days'
																				 	when 4 then interval '30 days'
																				    when 5 then interval '90 days'
																				 end) 																			 
				else now() - p."LastUpdateTime" > interval '1 day'
				end	
	  ),  
	  (select count(*)
		from public."UserSequenceProgress" p
	    join public."Sequences" g
			on g."Id" = p."SequenceId"
		where 
			"UserId" = 'deeff302-d8e3-4730-bc8b-764d91522ad0'::uuid
	   		and g."SequenceGroupId" = gr."Id"
			and "Stage" = 6)
   )
from "SequenceGroup" gr